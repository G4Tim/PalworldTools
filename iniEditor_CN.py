import tkinter as tk
from tkinter import ttk, filedialog
import re

def load_translation_file(filepath):
    translation = {}
    with open(filepath, 'r', encoding='utf-8') as file:
        for line in file:
            english, chinese = line.strip().split(', ')
            translation[english] = chinese
    return translation


# Load translation file
translation = load_translation_file(
    'Dic_EN-CN.txt')


def open_file():
    filepath = filedialog.askopenfilename(initialdir="C:/palworld", title="Select file",
                                          filetypes=(("ini files", "*.ini"), ("all files", "*.*")))
    if filepath:
        load_settings(filepath)


def load_settings(filepath):
    for widget in frame.winfo_children():
        widget.destroy()
    with open(filepath, 'r') as file:
        content = file.read()
        match = re.search(r'OptionSettings=\((.*?)\)', content, re.DOTALL)
        if match:
            options = match.group(1)
            for option in options.split(','):
                key, value = option.split('=')
                key = key.strip()
                value = value.strip()
                # Use Chinese name if available
                display_name = translation.get(key, key)
                if key not in settings_vars:
                    settings_vars[key] = tk.StringVar()
                settings_vars[key].set(value)
                # Pass both English and Chinese names
                create_setting_widget(frame, key, display_name)


def create_setting_widget(parent, setting_name, display_name):
    # Use display_name for label
    label = tk.Label(parent, text=display_name)
    label.pack()
    # Use setting_name for the textvariable key
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
        file.write(
            f'[/Script/Pal.PalGameWorldSettings]\nOptionSettings=({content[:-1]})\n')

    print("Settings saved!")


def on_mousewheel(event):
    # Scroll the canvas when mouse wheel is moved
    canvas.yview_scroll(int(-1*(event.delta/120)), "units")


def bind_to_mousewheel(widget):
    # Bind the mousewheel scroll event to widgets
    widget.bind("<MouseWheel>", on_mousewheel)


app = tk.Tk()
app.title("幻兽帕鲁配置文件编辑器")

settings_vars = {}

# Create the left panel for buttons
button_frame = ttk.Frame(app)
button_frame.pack(side="left", fill="y")

load_settings_button = tk.Button(
    button_frame, text="加载", command=open_file)
load_settings_button.pack()

save_button = tk.Button(button_frame, text="保存", command=save_file)
save_button.pack()

# Create the canvas and scrollbar for settings
canvas = tk.Canvas(app)
scrollbar = ttk.Scrollbar(app, orient="vertical", command=canvas.yview)
frame = ttk.Frame(canvas)

canvas.create_window((0, 0), window=frame, anchor="nw")
canvas.configure(yscrollcommand=scrollbar.set)

canvas.pack(side="left", fill="both", expand=True)
scrollbar.pack(side="right", fill="y")

frame.bind("<Configure>", lambda e: canvas.configure(
    scrollregion=canvas.bbox("all")))
bind_to_mousewheel(frame)
bind_to_mousewheel(canvas)

app.mainloop()
