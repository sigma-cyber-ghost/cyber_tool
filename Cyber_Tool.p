import subprocess
import customtkinter as ctk
import tkinter as tk
from tkinter import Canvas
import threading
import random

ctk.set_appearance_mode("dark")
ctk.set_default_color_theme("green")

class MatrixScanner(ctk.CTk):
    def __init__(self):
        super().__init__()
        self.title("Black Hat Web Scanner")
        self.geometry("980x700")
        self.configure(bg='black')

        self.target_url = ctk.StringVar()

        self.matrix_canvas = Canvas(self, bg="black", highlightthickness=0)
        self.matrix_canvas.place(x=0, y=0, relwidth=1, relheight=1)
        self.chars = "01"
        self.drops = [0 for _ in range(120)]
        self.animate_matrix()

        self.build_banner()
        self.build_creator()
        self.build_input()
        self.build_output()

    def build_banner(self):
        banner = """
  /$$$$$$  /$$$$$$  /$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$   /$$  /$$$$$$   /$$$$$$  /$$$$$$$$
 /$$__  $$|_  $$_/ /$$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$| $$  | $$ /$$__  $$ /$$__  $$|__  $$__/
/ $$  \\__/  | $$  | $$  \\__/| $$$$  /$$$$| $$  \\ $$      | $$  \\__/| $$  | $$| $$  \\ $$| $$  \\__/   | $$   
|  $$$$$$   | $$  | $$ /$$$$| $$ $$/$$ $$| $$$$$$$$      | $$ /$$$$| $$$$$$$$| $$  | $$|  $$$$$$    | $$   
 \\____  $$  | $$  | $$|_  $$| $$  $$$| $$| $$__  $$      | $$|_  $$| $$__  $$| $$  | $$ \\____  $$   | $$   
 /$$  \\ $$  | $$  | $$  \\ $$| $$\\  $ | $$| $$  | $$      | $$  \\ $$| $$  | $$| $$  | $$ /$$  \\ $$   | $$   
|  $$$$$$/ /$$$$$$|  $$$$$$/| $$ \\/  | $$| $$  | $$      |  $$$$$$/| $$  | $$|  $$$$$$/|  $$$$$$/   | $$   
 \\______/ |______/ \\______/ |__/     |__/|__/  |__/       \\______/ |__/  |__/ \\______/  \\______/    |__/   
"""
        tk.Label(self, text=banner, fg="lime", bg="black", font=("Courier", 9), justify="left").pack(pady=5)

    def build_creator(self):
        ctk.CTkLabel(self, text="Created by: SIGMA_GHOST (Black Hat Edition)", text_color="lime").pack()

    def build_input(self):
        frame = ctk.CTkFrame(self)
        frame.pack(pady=10)

        ctk.CTkLabel(frame, text="Target URL (include http:// or https://):").grid(row=0, column=0, padx=5, pady=5)
        ctk.CTkEntry(frame, textvariable=self.target_url, width=400).grid(row=0, column=1, padx=5, pady=5)
        ctk.CTkButton(frame, text="Start Scan", command=lambda: threading.Thread(target=self.run_wapiti).start(), fg_color="red").grid(row=1, column=0, columnspan=2, pady=10)

    def build_output(self):
        self.output_box = ctk.CTkTextbox(self, width=920, height=280)
        self.output_box.pack(pady=10)

    def run_wapiti(self):
        url = self.target_url.get().strip()
        if not url:
            self.output_box.insert("end", "[-] Please enter a target URL.\n")
            return
        if not url.startswith("http"):
            url = "http://" + url

        self.output_box.insert("end", f"[+] Starting Wapiti scan on: {url}\n")
        self.output_box.insert("end", "[*] Scanning (please wait)...\n")
        self.output_box.update()

        def read_output(process):
            for line in iter(process.stdout.readline, ''):
                self.output_box.insert("end", line)
                self.output_box.update()
            process.stdout.close()
            process.wait()

        try:
            process = subprocess.Popen(
                ["wapiti", "-u", url, "-v", "2"],
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                text=True,
                bufsize=1
            )
            threading.Thread(target=read_output, args=(process,)).start()
        except FileNotFoundError:
            self.output_box.insert("end", "[!] Wapiti not found. Install it with: pip install wapiti3\n")
        except Exception as e:
            self.output_box.insert("end", f"[!] Unexpected error: {e}\n")

    def animate_matrix(self):
        self.matrix_canvas.delete("all")
        width = self.winfo_width()
        height = self.winfo_height()
        cols = int(width / 10)
        for i in range(cols):
            char = random.choice(self.chars)
            x = i * 10
            y = self.drops[i % len(self.drops)] * 10
            self.matrix_canvas.create_text(x, y, text=char, fill="lime", font=("Courier", 10))
            if y > height or random.random() > 0.975:
                self.drops[i % len(self.drops)] = 0
            else:
                self.drops[i % len(self.drops)] += 1
        self.after(50, self.animate_matrix)

if __name__ == "__main__":
    app = MatrixScanner()
    app.mainloop()
