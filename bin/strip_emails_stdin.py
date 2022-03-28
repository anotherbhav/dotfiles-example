#!/usr/bin/env python3

# usage: pbpaste | strip_emails_stdin.py
# take input from stdin, such as a copied/pasted website 
# strip all emails and output that to stdout

import sys
import re

count = 0

for line in sys.stdin:
    # modified from :https://emailregex.com/,
    strsearch_email = r'([a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+)'

    emails = re.findall(strsearch_email,line)
    # emails.sort()

    for e in emails:
        count += 1
        print(e.lower())
