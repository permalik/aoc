# main.py

import os

from utility.path import create_input_path

input_path = create_input_path("2015/002")


def main():
    one()
    two()


def one():
    square_feet = 0
    with open(input_path, encoding="utf-8") as f:
        raw_data = f.read().replace("\n", "")

    print("RAW: ", raw_data)
    print("Santa is on floor: ", square_feet)


def two():
    square_feet = 0
    with open(input_path, encoding="utf-8") as f:
        raw_data = f.read().replace("\n", "")

    print("RAW: ", raw_data)
    print(f"The elves need {square_feet} of wrapping paper")


if __name__ == "__main__":
    main()
