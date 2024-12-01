import flet as ft
import controller as ct


class ViewReviewDetails(ft.UserControl):
    def __init__(self, page, logged_user, review):
        super().__init__()
        self.page = page
        self.user = logged_user
        self.review = review
        self.controller = ct.Controller()
        self.review_text_ref = ft.Ref[ft.TextField]()
        self.rating_ref = ft.Ref[ft.Dropdown]()

    def build(self):
        review_text = ft.TextField(
            ref=self.review_text_ref,
            label="Review",
            value=self.review[2],
            multiline=True,
            min_lines=3,
            max_lines=5
        )
        rating_dropdown = ft.Dropdown(
            ref=self.rating_ref,
            label="Rating",
            value=str(self.review[3]),
            options=[
                ft.dropdown.Option(str(i)) for i in range(1, 6)
            ]
        )
        return ft.Column(
            controls=[
                ft.Text(f"Review Details for {self.review[1]}", size=32, weight="bold"),
                ft.Container(
                    content=ft.Column(
                        controls=[
                            review_text,
                            rating_dropdown,
                            ft.Row(
                                controls=[
                                    ft.ElevatedButton("Update Review", on_click=self.update_review),
                                    ft.ElevatedButton("Delete Review",on_click=self.delete_review),
                                    ft.TextButton("Back", on_click=self.back_to_reviewed_books)
                                ],
                                alignment=ft.MainAxisAlignment.START
                            )
                        ],
                        spacing=20
                    ),
                    padding=20,
                    border_radius=10,
                )
            ],
            spacing=20
        )

    def update_review(self, e):
        new_review_text = self.review_text_ref.current.value
        new_rating = int(self.rating_ref.current.value)
        self.controller.update_review(self.user['username'], self.review[0],new_review_text,new_rating)
        self.back_to_reviewed_books(e)

    def delete_review(self, e):
        def confirm_delete(e):
            self.controller.delete_review(self.user['username'], self.review[0])
            dialog.open = False
            self.page.update()
            self.back_to_reviewed_books(e)
        dialog = ft.AlertDialog(
            title=ft.Text("Confirm Delete"),
            content=ft.Text("Are you sure you want to delete this review?"),
            actions=[
                ft.TextButton("Yes", on_click=confirm_delete),
                ft.TextButton("No", on_click=lambda e: self.close_dialog(dialog))
            ]
        )
        self.page.dialog = dialog
        dialog.open = True
        self.page.update()

    def close_dialog(self, dialog):
        dialog.open = False
        self.page.update()

    def back_to_reviewed_books(self, e):
        self.page.clean()
        from view_get_reviewed_books import ViewReviewedBooks
        self.page.add(ViewReviewedBooks(self.page, self.user))