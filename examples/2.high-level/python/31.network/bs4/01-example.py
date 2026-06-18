#!/usr/bin/env python
from bs4 import BeautifulSoup

# this is our HTML page:
html = """
<head>
  <title>Hello World!</title>
</head>
<body>
  <div id="product">
    <h1>Product Title</h1>
    <p>paragraph 1</p>
    <p>paragraph2</p>
    <span class="price">$10</span>
  </div>
</body>
"""

soup = BeautifulSoup(html, 'html.parser')

# we can iterate using dot notation:
print(soup.head.title)

# or use find method to recursively find matching elements:
print(soup.find(class_="price").text)

# the selected elements can be modified in place:
soup.find(class_="price").string = "$20"

# beautifulsoup also supports CSS selectors:
soup.select_one("#product .price").text

# bs4 also contains various utility functions like HTML formatting
print(soup.prettify())

