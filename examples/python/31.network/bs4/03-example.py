#!/usr/bin/env python
from bs4 import BeautifulSoup

# this is our HTML page:
html = """
<head>
  <title>Hello World!</title>
</head>
<body>
  <div>
    <div>
      <div>Número de licencia: <strong>66</strong></div>
      nivel 2
    </div>
    nivel 1
  </div>
  <p>
    <p>
      <p>Número de licencia: <strong>67</strong</p>
      nivel 2
    </p>
    nivel 1
  </p>
</body>
"""

soup = BeautifulSoup(html, 'html.parser')

# beautifulsoup also supports CSS selectors:
items = soup.find_all('div')
print(len(items))
for item in items:
    t = item.getText()
    print('---')
    print(t.split("\n"))
    if t.startswith('Número'):
        print(item.find('strong').text)


