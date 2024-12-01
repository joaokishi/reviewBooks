import flet as ft
from view_login import ViewLogin


class Main:
    def __init__(self):
        pass
    
    def run(self, page: ft.Page):
        self.view = ViewLogin(page)
        page.add(self.view)
        
def main(page: ft.Page):
    app = Main()
    app.run(page)
ft.app(target=main)
