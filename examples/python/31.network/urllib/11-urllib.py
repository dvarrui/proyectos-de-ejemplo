from urllib.request import urlopen

url = "https://www.habbo.es/gamedata/external_flash_texts/f4fb96c8ffd2db6c2b1b3a44624df510a5dcfef4"
data = urlopen(url).read().decode('utf-8')

for linea in data.split('\n'):
    if linea.startswith("badge_desc_ADM=") or linea.startswith("badge_name_ADM="):
        key, value = linea.split("=")
        print(f"{key} {value}")
