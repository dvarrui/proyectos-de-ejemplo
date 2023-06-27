import yaml

class Settings:
    def __init__(self, filepath = "settings.yaml"):
        with open(filepath) as f:
            self.data = yaml.load(f, Loader=yaml.FullLoader)

    def get(self, key):
        return self.data[key]

settings = Settings()
