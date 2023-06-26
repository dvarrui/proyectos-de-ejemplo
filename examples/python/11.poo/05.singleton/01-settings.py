#!/usr/bin/env python

import yaml

class Settings:
    def __init__(self, filepath = "settings.yaml"):
        with open(filepath) as f:
            self.config = yaml.load(f, Loader=yaml.FullLoader)

settings = Settings()
print(settings.config)
