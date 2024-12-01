# view_book_details.py
import flet as ft
import controller as ct


class ViewBookDetails(ft.UserControl):
    def __init__(self, page, logged_user, book):
        super().__init__()
        self.page = page
        self.user = logged_user
        self.controller = ct.Controller()
        self.book = book
        print(book)

    def build(self):
        controls = [
            ft.Text(f"Title: {self.book[1]}", size=32, weight="bold"),
            ft.Text(f"Author: {self.book[2]}"),
            ft.Text(f"Publisher: {self.book[3]}"),
            ft.Text(f"Published on: {self.book[4]}"),
            ft.Text(f"Synopsis: {self.book[5]}"),
            ft.Text(f"ISBN: {self.book[6]}"),
            ft.Text(f"Genre: {self.book[7]}")
        ]
        if self.user['user_type'] == 'admin':
            update_button = ft.ElevatedButton(
                text="Update Book",
                on_click=self.show_update_form
            )
            delete_button = ft.ElevatedButton(
                text="Delete Book",
                on_click=self.delete_book
            )
            back_button = ft.ElevatedButton(
                text="Back",
                on_click=self.back_to_menu
            )
            controls.extend([update_button, delete_button, back_button])
        else:
            review_button = ft.ElevatedButton(
                text="Review Book",
                on_click=self.review_book
            )
            back_button = ft.ElevatedButton(
                text="Back",
                on_click=self.back_to_menu
            )
            controls.append(review_button)
            controls.append(back_button)
        return ft.Row(
            controls=[
                ft.Column(
                    controls=controls,
                    expand=True,
                    spacing=10
                )
            ],
            expand=True
        )

    def show_update_form(self, e):
        self.page.add(self.update_book_form(self.book))
        self.page.update()

    def update_book_form(self, book):
        self.page.clean()
        self.title_input = ft.TextField(label="Title", value=book[1], autofocus=True)
        self.author_input = ft.TextField(label="Author", value=book[2])
        self.publisher_input = ft.TextField(label="Publisher", value=book[3])
        self.publish_date_input = ft.TextField(label="Publish Date", value=book[4])
        self.synopsis_input = ft.TextField(label="Synopsis", value=book[5])
        self.genre_input = ft.TextField(label="Genre", value=book[7])
        return ft.Column(
            controls=[
                self.title_input,
                self.author_input,
                self.publisher_input,
                self.publish_date_input,
                self.synopsis_input,
                self.genre_input,
                ft.ElevatedButton(text="Save Changes", on_click=self.save_changes),
                ft.TextButton("Cancel", on_click=self.cancel_update)
            ],
            spacing=10,
            expand=True
        )

    def save_changes(self, e):
        updated_book = {
            'isbn': self.book[6], 
            'title': self.title_input.value,
            'author': self.author_input.value,
            'publisher': self.publisher_input.value,
            'publish_date': self.publish_date_input.value,
            'synopsis': self.synopsis_input.value,
            'genre': self.genre_input.value
        }
        self.controller.update_book(updated_book)
        self.page.clean()
        self.back_to_menu(e)

    def cancel_update(self, e):
        self.page.clean()
        self.back_to_menu(e)
        
    def delete_book(self, e):
        id_book = self.book[0]
        self.controller.delete_book(id_book)
        self.page.add(ft.Text(f"The book '{self.book[0]}' has been deleted successfully."))
        self.back_to_menu(e)
        self.page.update()

    def review_book(self, e):
        self.page.clean()
        from view_review_section import ViewReviewSection
        review_section = ViewReviewSection(self.page, self.user, self.book)
        self.page.add(review_section)
        self.page.update()

    def back_to_menu(self, e):
        self.page.clean()
        from view_menu import ViewMenu
        self.page.add(ViewMenu(self.page, self.user))
