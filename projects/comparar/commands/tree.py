#!/usr/bin/env python3
import pathlib
import sys

class TreeCommand:
    BLUE = "\033[94m"
    RESET = "\033[0m"

    def __init__(self):
        self.dir_count = 0
        self.file_count = 0

    def run(self, directory="."):
        root = pathlib.Path(directory)
        print(f"{self.BLUE}{root.name if root.name else directory}{self.RESET}")
        self._visualize(root, "")
        print(f"\n{self.dir_count} directories, {self.file_count} files")

    def _visualize(self, path, prefix):
        try:
            entries = sorted(path.iterdir(), key=lambda p: (not p.is_dir(), p.name.lower()))
        except PermissionError:
            print(f"{prefix}└── [Permiso denegado]")
            return

        for i, entry in enumerate(entries):
            is_last = (i == len(entries) - 1)
            connector = "└── " if is_last else "├── "
            
            name = f"{self.BLUE}{entry.name}{self.RESET}" if entry.is_dir() else entry.name
            print(f"{prefix}{connector}{name}")

            if entry.is_dir():
                self.dir_count += 1
                new_prefix = prefix + ("    " if is_last else "│   ")
                self._visualize(entry, new_prefix)
            else:
                self.file_count += 1

if __name__ == "__main__":
    target = sys.argv[1] if len(sys.argv) > 1 else "."
    TreeCommand().run(target)