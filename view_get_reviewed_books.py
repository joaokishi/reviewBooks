import flet as ft
import controller as ct


class ViewReviewedBooks(ft.UserControl):
    def __init__(self, page, logged_user):
        super().__init__()
        self.page = page
        self.user = logged_user
        self.controller = ct.Controller()

    def build(self):
        back_button = ft.TextButton("Back", on_click=self.back_to_menu)
        reviews = self.controller.get_reviewed_books(self.user['username'])
        
        content = ft.Column(
            controls=[
                ft.Text("Your Reviewed Books", size=32, weight="bold"),
            ],
            spacing=20,
            alignment=ft.MainAxisAlignment.START,
            scroll=ft.ScrollMode.AUTO,
            expand=True,
            width=self.page.width
        )

        if not reviews:
            content.controls.append(ft.Text("No reviews found for this user.", size=18))
        else:
            review_list_controls = [
                ft.Container(
                    content=ft.Column(
                        controls=[
                            ft.Text(f"{review[1]}", size=18, weight="bold"),
                            ft.Text(f"Review: {review[2][:100]}..." if len(review[2]) > 100 else review[2], size=14),
                            ft.Text(f"Rating: {review[3]}/5", size=12),
                        ],
                        spacing=5
                    ),
                    padding=10,
                    border_radius=10,
                    margin=2,
                    ink=True,
                    on_click=lambda e, review=review: self.show_review_details(e, review),
                    bgcolor=ft.colors.BLACK  # Add this line to set the background color
                )
                for review in reviews
            ]
            content.controls.append(
                ft.Container(
                    content=ft.Column(
                        controls=review_list_controls,
                        spacing=10,
                    ),
                    expand=True,
                    width=self.page.width
                )
            )

        return ft.Column(
            controls=[
                content,
                ft.Container(
                    content=back_button,
                    padding=10,
                    alignment=ft.alignment.center
                )
            ],
            spacing=20,
            expand=True,
            height=600,
            width=self.page.width
        )

    def back_to_menu(self, e):
        self.page.clean()
        from view_menu import ViewMenu
        self.page.add(ViewMenu(self.page, self.user))

    def show_review_details(self, e, review):
        self.page.clean()
        from view_review_details import ViewReviewDetails
        self.page.add(ViewReviewDetails(self.page, self.user, review))

