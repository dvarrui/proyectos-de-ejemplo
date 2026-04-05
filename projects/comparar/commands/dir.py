#!/usr/bin/env python3

import os
import datetime

def simulate_dir():
    print(" El volumen de la unidad no tiene etiqueta.")
    print(" El número de serie del volumen es: 1A2B-3C4D")
    print(f"\n Directorio de {os.getcwd()}\n")

    total_files = 0
    total_dirs = 0
    total_size = 0

    try:
        entries = os.listdir('.')
        entries = ['.', '..'] + entries

        for entry in entries:
            stats = os.stat(entry)
            dt = datetime.datetime.fromtimestamp(stats.st_mtime)
            formatted_time = dt.strftime("%d/%m/%Y  %H:%M")

            if os.path.isdir(entry):
                type_or_size = "<DIR>         "
                total_dirs += 1
            else:
                size_str = f"{stats.st_size:,}".replace(",", ".")
                type_or_size = size_str.rjust(14)
                total_files += 1
                total_size += stats.st_size

            print(f"{formatted_time}    {type_or_size} {entry}")

        # Resumen final
        formatted_total_size = f"{total_size:,}".replace(",", ".")
        print(f"{' ' * 15} {total_files} archivos {formatted_total_size.rjust(14)} bytes")
        print(f"{' ' * 15} {total_dirs} dirs   1.234.567.890 bytes libres")

    except Exception as e:
        print(f"Error al leer el directorio: {e}")

if __name__ == "__main__":
    simulate_dir()
