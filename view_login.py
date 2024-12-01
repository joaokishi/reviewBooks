import flet as ft
from view_register import ViewRegister
from view_menu import ViewMenu
import controller as ct


class ViewLogin(ft.UserControl):
    def __init__(self, page):
        super().__init__()
        self.page = page
        self.controller = ct.Controller()

    def build(self):
        title = ft.Text("Login", size=32, weight="bold")
        username_or_email_field = ft.TextField(label="Username or Email", autofocus=True)
        password_field = ft.TextField(label="Password", password=True)
        def login_action(e):
            self.user = self.controller.user_login(username_or_email_field.value, password_field.value)
            if self.user:
                self.page.clean()
                self.page.add(ViewMenu(self.page, self.user))
            else:
                if self.error_message:
                    self.page.controls.remove(self.error_message)
                self.error_message = ft.Text("Username or password incorrect", color="red")
                self.page.add(self.error_message)
            self.page.update()
        def register_action(e):
            self.page.clean()
            self.page.add(ViewRegister(self.page))
        login_button = ft.ElevatedButton("Login", on_click=login_action)
        register_button = ft.ElevatedButton("Register", on_click=register_action)
        button_row = ft.Row(controls=[login_button, register_button], alignment=ft.MainAxisAlignment.CENTER)
        return ft.Column(
            controls=[
                title,
                username_or_email_field,
                password_field,
                button_row
            ]
        )
