import requests
import mysql.connector
import re

def search_books_from_api(query, max_results=30):
    url = f"https://openlibrary.org/search.json?q={query}&sort=rating&limit={max_results}"
    response = requests.get(url)
    books_data = response.json()
    books = []
    for doc in books_data.get('docs', []):
        if 'isbn' in doc:
            isbn_list = doc['isbn']
            isbn = isbn_list[0]
            book_details = get_book_details_from_api(isbn)
            if book_details:
                books.append(book_details)
    return books

def get_book_details_from_api(isbn):
    url = f"https://openlibrary.org/api/books?bibkeys=ISBN:{isbn}&format=json&jscmd=data"
    response = requests.get(url)
    book_data = response.json()
    if not book_data:
        return None
    book_info = book_data.get(f"ISBN:{isbn}", {})
    title = book_info.get('title', 'Unknown Title')
    author = ', '.join([author['name'] for author in book_info.get('authors', [])]) if 'authors' in book_info else 'Unknown Author'
    publisher = ', '.join([publisher['name'] for publisher in book_info.get('publishers', [])]) if 'publishers' in book_info else 'Unknown Publisher'
    publish_date = book_info.get('publish_date', 'Unknown Date')
    if '-' in publish_date:
        publish_date = publish_date.split('-')[0]
    if len(publish_date) > 4:
        publish_date = publish_date[:4]
    synopsis = book_info.get('summary', 'No synopsis available')
    subjects = book_info.get('subjects', [])
    
    # Filter subjects to include only single-word genres
    single_word_genres = [subject['name'] if isinstance(subject, dict) else subject for subject in subjects if isinstance(subject, (dict, str)) and ' ' not in (subject['name'] if isinstance(subject, dict) else subject)]
    genre = ', '.join(single_word_genres[:5]) if single_word_genres else 'Unknown Genre'
    
    return {
        'title': title,
        'author': author,
        'publisher': publisher,
        'publish_date': publish_date,
        'synopsis': synopsis,
        'isbn': isbn,
        'genre': genre
    }

def clean_genre(genre):
    """
    Cleans and validates a genre.
    - Only allows single-word genres with alphabetic characters.
    """
    return re.match(r'^[a-zA-Z]+$', genre)

def insert_book_and_genres_into_db(book_details, cursor, connection):
    # Insert book into the books table
    book_query = """
        INSERT INTO books (title, author, publisher, publish_date, synopsis, isbn)
        VALUES (%s, %s, %s, %s, %s, %s)
    """
    book_data = (
        book_details['title'],
        book_details['author'],
        book_details['publisher'],
        book_details['publish_date'],
        book_details['synopsis'],
        book_details['isbn']
    )
    cursor.execute(book_query, book_data)
    book_id = cursor.lastrowid  # Get the last inserted book ID

    # Insert cleaned genres into the genres table if they don't exist
    genres = [genre.strip() for genre in book_details['genre'].split(',')]
    for genre in genres:
        # Clean and validate the genre
        if not clean_genre(genre):
            continue  # Skip invalid genres

        genre_query = """
            INSERT INTO genres (genre_name) 
            VALUES (%s)
            ON DUPLICATE KEY UPDATE id_genre=LAST_INSERT_ID(id_genre)
        """
        cursor.execute(genre_query, (genre,))
        genre_id = cursor.lastrowid  # Get the genre ID

        # Link book and genre in the book_genres table
        book_genres_query = """
            INSERT INTO book_genres (id_book, id_genre)
            VALUES (%s, %s)
        """
        cursor.execute(book_genres_query, (book_id, genre_id))
    
    connection.commit()

def populate_books_table(query='famous'):
    # Connect to the database
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="1234",
        database="library_db"
    )
    cursor = connection.cursor()
    books = search_books_from_api(query)
    for book_details in books:
        insert_book_and_genres_into_db(book_details, cursor, connection)
        print(f"Inserted {book_details['title']} into database.")
    cursor.close()
    connection.close()

populate_books_table('famous')
