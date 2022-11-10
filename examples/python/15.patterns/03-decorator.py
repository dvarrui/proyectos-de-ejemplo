#!/usr/bin/env python3

def title_decorator(func):
    def decorated_func(*args, **kwargs):
        print("="*40)
        func(*args, **kwargs)
        print("="*40)

    return decorated_func


@title_decorator
def starwars():
    print("StarWars")


starwars()
