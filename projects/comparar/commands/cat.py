#!/usr/bin/env python3
import sys
import os

def simulate_cat():
    args = sys.argv[1:]
    
    if not args:
        print("Uso: python simulador_cat.py [-n | -b] archivo1 [archivo2 ...]")
        return

    options = [a for a in args if a.startswith("-")]
    files = [a for a in args if not a.startswith("-")]

    line_count = 1

    for file_path in files:
        if not os.path.exists(file_path):
            print(f"cat: {file_path}: No existe el archivo o el directorio")
            continue

        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                for line in f:
                    display_line = line
                    
                    if "-n" in options:
                        display_line = f"{str(line_count).rjust(6)}  {line}"
                        line_count += 1
                    elif "-b" in options:
                        if line.strip():
                            display_line = f"{str(line_count).rjust(6)}  {line}"
                            line_count += 1
                    
                    print(display_line, end='')
        except Exception as e:
            print(f"Error al leer {file_path}: {e}")

if __name__ == "__main__":
    simulate_cat()
