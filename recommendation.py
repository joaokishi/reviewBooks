import mysql.connector
from sklearn.metrics.pairwise import cosine_similarity
from sklearn.feature_extraction.text import CountVectorizer


class Recommendation:
    def __init__(self):
        self.db_config = {
            'host': 'localhost',
            'user': 'root',
            'password': '1234',
            'database': 'library_db'
        }

    def connect_to_db(self):
        self.connection = mysql.connector.connect(**self.db_config)
        self.cursor = self.connection.cursor(dictionary=True)

    def disconnect_from_db(self):
        self.cursor.close()
        self.connection.close()
 

    def get_user_reviewed_books(self, username):
        self.connect_to_db()
        query = """
            SELECT DISTINCT b.id_book
            FROM reviewed_books rb
            JOIN users u ON rb.id_user = u.id_user
            JOIN books b ON rb.id_book = b.id_book
            WHERE u.username = %s
        """
        self.cursor.execute(query, (username,))
        reviewed_books = [row['id_book'] for row in self.cursor.fetchall()]
        self.disconnect_from_db()
        return reviewed_books


    def get_user_reviewed_genres(self, username):
        self.connect_to_db()
        query = """
            SELECT DISTINCT g.genre_name
            FROM reviewed_books rb
            JOIN users u ON rb.id_user = u.id_user
            JOIN books b ON rb.id_book = b.id_book
            JOIN book_genres bg ON b.id_book = bg.id_book
            JOIN genres g ON bg.id_genre = g.id_genre
            WHERE u.username = %s
        """
        self.cursor.execute(query, (username,))
        genres = [row['genre_name'] for row in self.cursor.fetchall()]
        self.disconnect_from_db()
        return genres


    def get_books_with_genres(self, username):
        self.connect_to_db()
        query = """
            SELECT b.id_book, b.title, b.author, b.publisher, b.publish_date, b.synopsis, b.isbn, GROUP_CONCAT(g.genre_name) AS genres
            FROM books b
            JOIN book_genres bg ON b.id_book = bg.id_book
            JOIN genres g ON bg.id_genre = g.id_genre
            WHERE NOT EXISTS (
                SELECT 1
                FROM reviewed_books rb
                JOIN users u ON rb.id_user = u.id_user
                WHERE u.username = %s AND rb.id_book = b.id_book
            )
            GROUP BY b.id_book
        """
        self.cursor.execute(query, (username,))
        books = self.cursor.fetchall()
        self.disconnect_from_db()
        return books

    def recommend_books(self, username, top_n=5):
        user_genres = self.get_user_reviewed_genres(username)
        reviewed_books = self.get_user_reviewed_books(username)
        books = self.get_books_with_genres(username)
        books_to_recommend = books[-5:]
        genres_list = [' '.join(user_genres)] + [book['genres'] for book in books_to_recommend]
        vectorizer = CountVectorizer()
        genre_vectors = vectorizer.fit_transform(genres_list)
        user_vector = genre_vectors[0]
        book_vectors = genre_vectors[1:]
        similarities = cosine_similarity(user_vector, book_vectors).flatten()
        book_recommendations = sorted(
            [(similarity, book) for similarity, book in zip(similarities, books_to_recommend) if book['id_book'] not in reviewed_books],
            key=lambda x: x[0],
            reverse=True
        )[:top_n]
        unique_books = set()
        recommendations = []
        for _, book in book_recommendations:
            if book['id_book'] not in unique_books:
                recommendations.append((book['id_book'], book['title'], book['author'], book['publisher'], book['publish_date'], book['synopsis'], book['isbn'], book['genres']))
                unique_books.add(book['id_book'])
        return recommendations
