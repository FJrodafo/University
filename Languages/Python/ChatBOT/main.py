import config
import typer
from rich import print
from rich.table import Table

"""
Webs:
- Typer: https://typer.tiangolo.com
- Rich: https://rich.readthedocs.io/en/stable/
"""


def main():

    print("[bold green]  ChatBOT   Python[/bold green]")

    table = Table("Command", "Description")
    table.add_row("/help", "Table of commands")
    table.add_row("/exit", "Close the app")
    print(table)

    while True:

        prompt = typer.prompt("Type a command")

        if prompt == "/help":
            table = Table("Command", "Description")
            table.add_row("/help", "Table of commands")
            table.add_row("/hi", "Greetings")
            table.add_row("/fact", "Show a fact")
            table.add_row("/exit", "Close the app")
            print(table)

        if prompt == "/hi":
            print("[bold green]> [/bold green] [green]Nice to meet you![/green]")

        if prompt == "/fact":
            print("[bold green]> [/bold green] [green]I'm a chat bot![/green]")

        if prompt == "/exit":
            exit = typer.confirm("Are you sure?")
            if exit:
                raise typer.Abort()


if __name__ == "__main__":
    typer.run(main)
