import mysql.connector
import recommendation as rec


class Model():
    def __init__(self):
        self.rec=rec.Recommendation()

    def connect_to_db(self):
        self.connection = mysql.connector.connect(
            host="localhost",     
            user="root",   
            password="1234",  
            database="library_db" 
        )
        if self.connection.is_connected():
            self.cursor = self.connection.cursor()

    def disconnect_from_db(self):
        if self.connection.is_connected():
            self.cursor.close()
            self.connection.close()
    
    def user_register(self, username, email, password, confirm_password):
        self.connect_to_db()
        query = """
            SELECT * FROM users 
            WHERE (username=%s OR email=%s)
        """
        self.cursor.execute(query, (username, email))
        self.user = self.cursor.fetchall()
        if (self.user):
            self.disconnect_from_db()
            return "Username or email already registered", "red"
        elif (password != confirm_password):
            self.disconnect_from_db()
            return "Passwords do not match", "red"
        else:
            query = """INSERT INTO users (username, email, password) 
                    VALUES (%s, %s, %s)"""
            self.cursor.execute(query, (username, email, password))
            self.connection.commit()
            self.disconnect_from_db()
            return "Registration successful", "green"
            
    def user_login(self, username_or_email, password):
        self.connect_to_db()
        query = """
            SELECT * FROM users 
            WHERE (username=%s OR email=%s) AND password=%s
        """
        self.cursor.execute(query, (username_or_email, username_or_email, password))
        user = self.cursor.fetchone()
        if user:
            self.logged_user = {
                'username': user[0],
                'password': user[1],
                'id_user': user[2],
                'user_type': user[3],
                'email': user[4]
            }
            self.disconnect_from_db()
            return self.logged_user
        else:
            self.disconnect_from_db()
            return False

    def user_logout(self):
        self.logged_user = {'username': "", 'password': "", 'email': "", 'address': "", 'id_user':"", 'user_type': ""}

    def get_books(self):
        self.connect_to_db()
        query = """SELECT b.id_book, b.title, b.author, b.publisher, b.publish_date, b.synopsis, b.isbn, 
                        GROUP_CONCAT(g.genre_name ORDER BY g.genre_name ASC) AS genres
                FROM books b
                LEFT JOIN book_genres bg ON b.id_book = bg.id_book
                LEFT JOIN genres g ON bg.id_genre = g.id_genre
                GROUP BY b.id_book"""
        self.cursor.execute(query)
        books = self.cursor.fetchall()
        self.disconnect_from_db()
        if books is None:
            return []
        return books
    
    def add_book(self, book):
        self.connect_to_db()
        self.book = book
        genres = [genre.strip() for genre in book['genre'].split(',')]
        book_query = """INSERT INTO books (title, author, publisher, publish_date, synopsis, isbn)
                        VALUES (%s, %s, %s, %s, %s, %s)"""
        self.cursor.execute(book_query, (
            self.book['title'], self.book['author'], self.book['publisher'], 
            self.book['publish_date'], self.book['synopsis'], self.book['isbn']
        ))
        book_id = self.cursor.lastrowid
        for genre in genres:
            genre_query = """INSERT INTO genres (genre_name) 
                             VALUES (%s) ON DUPLICATE KEY UPDATE genre_name = genre_name"""
            self.cursor.execute(genre_query, (genre,))
            genre_id_query = "SELECT id_genre FROM genres WHERE genre_name = %s"
            self.cursor.execute(genre_id_query, (genre,))
            genre_id = self.cursor.fetchone()[0]
            book_genre_query = """INSERT INTO book_genres (id_book, id_genre)
                                  VALUES (%s, %s)"""
            self.cursor.execute(book_genre_query, (book_id, genre_id))
        self.connection.commit()
        
    def submit_review(self, username, id_book, review_text, rating):
        self.connect_to_db()
        query_user_id = "SELECT id_user FROM users WHERE username = %s"
        self.cursor.execute(query_user_id, (username,))
        user_result = self.cursor.fetchone()
        if not user_result:
            self.disconnect_from_db()
            return False
        id_user = user_result[0]
        self.cursor.fetchall()
        query_insert_review = """
            INSERT INTO reviewed_books (id_user, id_book, review_date, review_text, rating)
            SELECT %s, id_book, CURDATE(), %s, %s FROM books WHERE id_book = %s
        """
        self.cursor.execute(query_insert_review, (id_user, review_text, rating, id_book))
        self.connection.commit()
        self.disconnect_from_db()
    
    def get_reviewed_books(self, username):
        self.connect_to_db()
        query = """
            SELECT r.id_review, b.title, r.review_text, r.rating
            FROM books b
            JOIN reviewed_books r ON b.id_book = r.id_book
            JOIN users u ON r.id_user = u.id_user
            WHERE u.username = %s
        """
        self.cursor.execute(query, (username,))
        reviewed_books = self.cursor.fetchall()
        self.disconnect_from_db()
        print(f"Reviewed Books: {reviewed_books}") 
        return reviewed_books

    def update_review(self, username, id_review, review_text, rating):
        self.connect_to_db()
        query = """
            UPDATE reviewed_books r
            JOIN users u ON u.id_user = r.id_user
            SET r.review_text = %s, r.rating = %s
            WHERE u.username = %s AND r.id_review = %s
        """
        self.cursor.execute(query, (review_text, rating, username, id_review))
        self.connection.commit()
        self.disconnect_from_db()
        
    def delete_review(self, username, id_review):
        self.connect_to_db()
        query = """
            DELETE r
            FROM reviewed_books r
            JOIN users u ON u.id_user = r.id_user
            WHERE r.id_review = %s AND u.username = %s
        """
        self.cursor.execute(query, (id_review, username))
        self.connection.commit()
        self.disconnect_from_db()

    def delete_book(self, id_book):
        self.connect_to_db()
        query = """DELETE FROM reviewed_books WHERE id_book = %s"""
        self.cursor.execute(query, (id_book,))
        self.connection.commit()
        query = """DELETE FROM books WHERE id_book = %s"""
        self.cursor.execute(query, (id_book,))
        self.connection.commit()
        self.disconnect_from_db()
        
    def update_book(self, updated_book):
        self.connect_to_db()
        query = """DELETE FROM book_genres WHERE id_book = (
                                    SELECT id_book FROM books WHERE isbn = %s
                                )"""
        self.cursor.execute(query, (updated_book['isbn'],))
        query = """UPDATE books
                            SET title = %s, author = %s, publisher = %s, publish_date = %s, synopsis = %s
                            WHERE isbn = %s"""
        self.cursor.execute(query, (
            updated_book['title'],
            updated_book['author'],
            updated_book['publisher'],
            updated_book['publish_date'],
            updated_book['synopsis'],
            updated_book['isbn']
        ))
        genres = [genre.strip() for genre in updated_book['genre'].split(',')]
        for genre in genres:
            query = """INSERT INTO genres (genre_name) 
                            VALUES (%s) ON DUPLICATE KEY UPDATE genre_name = genre_name"""
            self.cursor.execute(query, (genre,))
            query = "SELECT id_genre FROM genres WHERE genre_name = %s"
            self.cursor.execute(query, (genre,))
            genre_id = self.cursor.fetchone()[0]
            query = "SELECT id_book FROM books WHERE isbn = %s"
            self.cursor.execute(query, (updated_book['isbn'],))
            book_id = self.cursor.fetchone()[0]
            query = """INSERT INTO book_genres (id_book, id_genre)
                                VALUES (%s, %s)"""
            self.cursor.execute(query, (book_id, genre_id))
        self.connection.commit()
        self.disconnect_from_db()

    def get_user_reviewed_genres(self, username):
        self.connect_to_db()
        query = """
            SELECT DISTINCT b.genre
            FROM books b
            JOIN reviewed_books r ON b.id_book = r.id_book
            JOIN users u ON r.id_user = u.id_user
            WHERE u.username = %s
        """
        self.cursor.execute(query, (username,))
        genres = self.cursor.fetchall()
        self.disconnect_from_db()
        unique_genres = set()
        for genre_entry in genres:
            genre_list = genre_entry[0].split(',')
            unique_genres.update(genre.strip() for genre in genre_list)
        return list(unique_genres)

    def get_recommended_books(self, username):
        return self.rec.recommend_books(username)