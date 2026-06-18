# https://www.askpython.com/python/python-command-line-arguments

import sys

sentence = sys.argv[1]

def count_words(sentence):
    summary = {}
    words = sentence.split(' ')
    for word in words:
        if word in summary:
            summary[word] += 1
        else:
            summary[word] = 1
    return summary

if __name__ == '__main__':
    text = sys.argv[1] # Error?
    palabras = count_words(sentence)

for palabra, cantidad in palabras.items():
    print(f'{palabra}: {cantidad}')
