import flet as ft
import controller as ct


class ViewReviewSection(ft.UserControl):
    def __init__(self, page, user, book):
        super().__init__()
        self.page = page
        self.user = user
        self.book = book
        self.controller = ct.Controller()
        self.review_text = ft.TextField(label="Your review", multiline=True)
        self.star_rating = 0
        self.star_controls = []

    def build(self):
        self.star_controls = [self.create_star_button(i) for i in range(1, 6)]
        star_row = ft.Row(
            controls=self.star_controls,
            spacing=5,
            alignment=ft.MainAxisAlignment.START
        )
        submit_review_button = ft.ElevatedButton(
            text="Submit Review",
            on_click=self.submit_review
        )
        return ft.Column(
            controls=[
                ft.Text(f"Leave a review for '{self.book[0]}'", size=24, weight="bold"),
                self.review_text,
                ft.Text("Rating:"),
                star_row,
                submit_review_button,
                ft.TextButton("Cancel", on_click=self.back_to_menu)
            ],
            spacing=10
        )

    def create_star_button(self, rating):
        return ft.TextButton(
            "★" if rating <= self.star_rating else "☆",
            on_click=lambda e, r=rating: self.set_star_rating(r)
        )

    def set_star_rating(self, rating):
        self.star_rating = rating
        for i in range(5):
            self.star_controls[i].text = "★" if i < self.star_rating else "☆"
        self.update()

    def submit_review(self, e):
        review = self.review_text.value
        rating = self.star_rating
        self.controller.submit_review(self.user['username'], self.book[0], review, rating)
        self.page.add(ft.Text("Thank you for your review!", color="green"))
        self.page.update()
        self.back_to_menu(e)
        
    def back_to_menu(self, e):
        self.page.clean()
        from view_menu import ViewMenu
        self.page.add(ViewMenu(self.page, self.user))

