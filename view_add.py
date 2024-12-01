import flet as ft
import controller as ct
from view_menu import ViewMenu


class ViewAddBook(ft.UserControl):
    def __init__(self, page, logged_user):
        super().__init__()
        self.user=logged_user
        self.page = page
        self.controller = ct.Controller()
        self.book={'title': '','author': '','publisher': '','publish_date':'','synopsis':'','isbn':'','genre':''}

    def build(self):
        title = ft.Text("Add New Book", size=32, weight="bold")
        title_field = ft.TextField(label="Title", autofocus=True)
        author_field = ft.TextField(label="Author")
        publisher_field = ft.TextField(label="Publisher", autofocus=True)
        publish_date_field = ft.TextField(label="Publish Date (YYYY)")
        synopsis_field = ft.TextField(label="Synopsis", autofocus=True)
        isbn_field = ft.TextField(label="ISBN", autofocus=True)
        genre_field = ft.TextField(label="Genre", autofocus=True)
        def submit_action(e):
            self.book={'title': title_field.value,'author': author_field.value,'publisher': publisher_field.value,
                       'publish_date':publish_date_field.value,'synopsis':synopsis_field.value,'isbn':isbn_field.value,'genre':genre_field.value}
            self.controller.add_book(self.book)
            self.page.clean()
            self.page.add(ViewMenu(self.page, self.user))
        submit_button = ft.ElevatedButton("Add Book", on_click=submit_action)
        back_button = ft.ElevatedButton("Back", on_click=self.back_to_menu)
        return ft.Column(
            controls=[
                title,
                title_field,
                author_field,
                publisher_field,
                publish_date_field,
                synopsis_field,
                isbn_field,
                genre_field,
                submit_button,
                back_button
            ]
        )

    def back_to_menu(self, e):
        self.page.clean()
        from view_login import ViewMenu
        self.page.add(ViewMenu(self.page, self.user)) 