import flet as ft
import controller as ct


class ViewRegister(ft.UserControl):
    def __init__(self, page):
        super().__init__()
        self.page = page
        self.controller = ct.Controller()
        self.error_message = None

    def build(self):
        title = ft.Text("Register", size=32, weight="bold")
        self.username_field = ft.TextField(label="Username", autofocus=True)
        self.email_field = ft.TextField(label="Email", autofocus=True)
        self.password_field = ft.TextField(label="Password", password=True)
        self.confirm_password_field = ft.TextField(label="Confirm Password", password=True)
        register_button = ft.ElevatedButton("Register", on_click=self.register_action)
        back_button = ft.ElevatedButton("Back to Login", on_click=self.back_to_menu)
        button_row = ft.Row(controls=[register_button, back_button], alignment=ft.MainAxisAlignment.CENTER)
        return ft.Column(
            controls=[
                title,
                self.username_field,
                self.email_field,
                self.password_field,
                self.confirm_password_field,
                button_row,
            ]
        )

    def register_action(self, e):
        self.error_message = self.controller.user_register(self.username_field.value,
            self.email_field.value,
            self.password_field.value,
            self.confirm_password_field.value)
        print(self.error_message)
        self.error_message = ft.Text(self.error_message[0], color=self.error_message[1])
        self.page.add(self.error_message)
        self.page.update()
        self.page.controls.remove(self.error_message)
        self.error_message = None

    def back_to_menu(self, e):
        self.page.clean()
        from view_login import ViewLogin
        self.page.add(ViewLogin(self.page))
