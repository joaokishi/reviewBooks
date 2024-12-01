import flet as ft
import controller as ct


class ViewRecommendations(ft.UserControl):
    def __init__(self, page, logged_user):
        super().__init__()
        self.page = page
        self.user = logged_user
        self.controller = ct.Controller()

    def build(self):
        back_button = ft.TextButton("Back", on_click=self.back_to_menu)
        recommendations = self.controller.get_recommended_books(self.user['username'])
        if not recommendations:
            return ft.Column(
                controls=[
                    ft.Text("Recommended Books", size=32, weight="bold"),
                    ft.Text("No recommendations available at the moment.", size=18),
                    back_button
                ],
                spacing=20,
                alignment=ft.MainAxisAlignment.START,
                expand=True,
                width=self.page.width
            )
        limited_recommendations = recommendations[:5]
        recommended_books_controls = [
            ft.Container(
                content=ft.Column(
                    controls=[
                        ft.Text(f"Title: {book[1]}", size=18, weight="bold"),
                        ft.Text(f"Genres: {book[7]}", size=14),
                    ],
                    spacing=5
                ),
                padding=10,
                border_radius=10,
                margin=10,
                ink=True,
                on_click=lambda e, book=book: self.show_book_details(e, book)
            )
            for book in limited_recommendations
        ]
        return ft.Column(
            controls=[
                ft.Text("Recommended Books", size=32, weight="bold"),
                ft.ListView(
                    controls=recommended_books_controls,
                    expand=True,
                    spacing=10,
                    padding=10,
                    width=self.page.width
                ),
                back_button
            ],
            spacing=20,
            expand=True,
            width=self.page.width
        )

    def back_to_menu(self, e):
        self.page.clean()
        from view_menu import ViewMenu
        self.page.add(ViewMenu(self.page, self.user))

    def show_book_details(self, e, book):
        self.page.clean()
        from view_book_details import ViewBookDetails
        self.page.add(ViewBookDetails(self.page, self.user, book))
