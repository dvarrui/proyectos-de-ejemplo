#!/usr/bin/env python
from bs4 import BeautifulSoup

# this is our HTML page:
html = """
<head>
  <title>Hello World!</title>
</head>
<body>
  <p>Obiwan</p>
  <p>Kenobi</p>
  <p>Vader
    <strong>Darth Vader</strong>
  </p>
</body>
"""

soup = BeautifulSoup(html, 'html.parser')

# we can iterate using dot notation:
print(soup.head.title)

# or use find method to recursively find matching elements:
print(soup.p)

# beautifulsoup also supports CSS selectors:
items = soup.find_all('p')
print(len(items))
for item in items:
    if item.text.startswith('Vader'):
        print(item.find('strong').text)
