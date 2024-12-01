import flet as ft
import controller as ct
import view_login as vw


class ViewMenu(ft.UserControl):
    def __init__(self, page, logged_user):
        super().__init__()
        self.page = page
        self.user = logged_user
        self.controller = ct.Controller()
        self.view = vw.ViewLogin(page)

    def build(self):
        books = self.controller.get_books()
        nav_bar = ft.Container(
            content=ft.Column(
                controls=[
                    ft.TextButton("Reviewed Books", on_click=self.show_reviewed_books),
                    ft.TextButton("Recommendation", on_click=self.view_recommendations),
                    ft.TextButton("Logout", on_click=self.user_logout),
                ] + ([ft.TextButton("Add Book", on_click=self.add_book)] if self.user['user_type'] == 'admin' else []),
                alignment=ft.MainAxisAlignment.START
            ),
            width=200,
            height=self.page.height,
            padding=10,
            alignment=ft.alignment.top_left
        )
        book_list_controls = [
            ft.TextButton(
                f"Title: {book[1]}, Author: {book[2]}, Publish Date: {book[4]}",    
                on_click=lambda e, book=book: self.show_book_details(book)
            )
            for book in books
        ]
        
        book_list_container = ft.Container(
            content=ft.Column(
                controls=[
                    ft.Text("Books", size=32, weight="bold"),
                    ft.Container(
                        content=ft.ListView(
                            controls=book_list_controls,
                            spacing=10,
                            height=self.page.height - 100,
                            expand=True
                        ),
                        padding=10,
                        border_radius=10,
                        bgcolor="#000114",
                        height=self.page.height - 100
                    )
                ],
                spacing=10,
                alignment=ft.MainAxisAlignment.START
            ),
            padding=10,
            height=self.page.height,
            expand=True
        )
        return ft.Row(
            controls=[
                nav_bar,
                book_list_container
            ],
            alignment=ft.MainAxisAlignment.START,
            spacing=0,
            height=self.page.height
        )

    def user_logout(self, e):
        self.controller.user_logout()
        self.page.clean()
        from view_login import ViewLogin
        self.page.add(ViewLogin(self.page))

    def add_book(self, e):
        self.page.clean()
        from view_add import ViewAddBook
        self.page.add(ViewAddBook(self.page, self.user))

    def show_reviewed_books(self, e):
        self.page.clean()
        from view_get_reviewed_books import ViewReviewedBooks
        self.page.add(ViewReviewedBooks(self.page, self.user))

    def show_book_details(self, book):
        self.page.clean()
        from view_book_details import ViewBookDetails
        self.page.add(ViewBookDetails(self.page, self.user, book))

    def view_recommendations(self, e):
        self.page.clean()
        from view_recommendations import ViewRecommendations
        self.page.add(ViewRecommendations(self.page, self.user))