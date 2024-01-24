import tkinter as tk
from tkinter import ttk, filedialog
import re

def open_file():
    # Open file dialog to select an INI file
    filepath = filedialog.askopenfilename(initialdir="C:/palworld", title="Select file", 
                                          filetypes=(("ini files", "*.ini"), ("all files", "*.*")))
    if filepath:
        load_settings(filepath)

def load_settings(filepath):
    # Clear existing widgets in frame
    for widget in frame.winfo_children():
        widget.destroy()
    # Read and parse the INI file
    with open(filepath, 'r') as file:
        content = file.read()
        match = re.search(r'OptionSettings=\((.*?)\)', content, re.DOTALL)
        if match:
            options = match.group(1)
            for option in options.split(','):
                key, value = option.split('=')
                key = key.strip()
                value = value.strip()
                if key not in settings_vars:
                    settings_vars[key] = tk.StringVar()
                settings_vars[key].set(value)
                create_setting_widget(frame, key)

def create_setting_widget(parent, setting_name):
    # Create label and entry widget for each setting
    label = tk.Label(parent, text=setting_name)
    label.pack()
    entry = tk.Entry(parent, textvariable=settings_vars[setting_name])
    entry.pack()

def save_file():
    # Open file dialog to save the modified INI file
    filepath = filedialog.asksaveasfilename(defaultextension=".ini",
                                            filetypes=[("INI files", "*.ini")])
    if filepath:
        save_settings(filepath)

def save_settings(filepath):
    # Write modified settings back to the INI file
    with open(filepath, 'w') as file:
        content = ''
        for key, var in settings_vars.items():
            content += f'{key}={var.get()},'
        file.write(f'[/Script/Pal.PalGameWorldSettings]\nOptionSettings=({content[:-1]})\n')

    print("Settings saved!")

def on_mousewheel(event):
    # Scroll the canvas when mouse wheel is moved
    canvas.yview_scroll(int(-1*(event.delta/120)), "units")

def bind_to_mousewheel(widget):
    # Bind the mousewheel scroll event to widgets
    widget.bind("<MouseWheel>", on_mousewheel)

app = tk.Tk()
app.title("Game Configuration Editor")

settings_vars = {}

# Create the left panel for buttons
button_frame = ttk.Frame(app)
button_frame.pack(side="left", fill="y")

load_settings_button = tk.Button(button_frame, text="Load Settings", command=open_file)
load_settings_button.pack()

save_button = tk.Button(button_frame, text="Save", command=save_file)
save_button.pack()

# Create the canvas and scrollbar for settings
canvas = tk.Canvas(app)
scrollbar = ttk.Scrollbar(app, orient="vertical", command=canvas.yview)
frame = ttk.Frame(canvas)

canvas.create_window((0, 0), window=frame, anchor="nw")
canvas.configure(yscrollcommand=scrollbar.set)

canvas.pack(side="left", fill="both", expand=True)
scrollbar.pack(side="right", fill="y")

frame.bind("<Configure>", lambda e: canvas.configure(scrollregion=canvas.bbox("all")))
bind_to_mousewheel(frame)
bind_to_mousewheel(canvas)

app.mainloop()
