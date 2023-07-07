#!/usr/bin/env python
import urllib3

url = "http://httpbin.org/robots.txt"
resp = urllib3.request("GET", url)
print(resp.status)
print(resp.data)

