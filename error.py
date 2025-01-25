import os
import tkinter as tk
from tkinter import messagebox
from PIL import Image, ImageTk
error_message = "Sorry, Devine IDE encountered an issue!"
error_image = Image.open("error.svg")
error_image = error_image.convert("RGBA")
error_image_tk = ImageTk.PhotoImage(error_image)

error_window = tk.Toplevel()
error_window.title("Error")

tk.Label(error_window, image=error_image_tk).pack()
tk.Label(error_window, text=error_message).pack()
tk.Button(error_window, text="Press any key to exit...", command=exit_program).pack()

root.wait_window(error_window)
