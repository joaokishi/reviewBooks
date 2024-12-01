import model as md


class Controller():
    def __init__(self)->None:
        self.model = md.Model()

    def user_register(self, username, email, password, confirm_password):
        return self.model.user_register(username, email, password, confirm_password)
    
    def user_login(self, username, password):
        return self.model.user_login(username, password)
        
    def user_logout(self):
        self.model.user_logout()
        
    def get_books(self):
        return self.model.get_books()

    def add_book(self, book):
        self.model.add_book(book)
        
    def get_recommended_books(self, username):
        return self.model.get_recommended_books(username)
    
    def submit_review(self, username, book_title, review_text, rating):
        self.model.submit_review(username, book_title, review_text, rating)
        
    def update_review(self, username, id_review, review_text, rating):
        self.model.update_review(username, id_review, review_text, rating)

    def delete_review(self, username, id_review):
        self.model.delete_review(username, id_review)

    def get_reviewed_books(self, username):
        return self.model.get_reviewed_books(username)
        
    def delete_book(self, isbn):
        return self.model.delete_book(isbn)
    
    def update_book(self, updated_book):
        return self.model.update_book(updated_book)
