# main.py

import os
import sys
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parent.parent))

from utility.path import create_input_path

input_path = create_input_path("2015/002")


def main():
    one()
    # two()


def area_and_slack(b: list[tuple[int, int, int]]) -> int:
    l, w, h = b
    area = 2 * l * w + 2 * w * h + 2 * h * l
    slack = min(l * w, w * h, h * l)
    return area + slack


def one():
    with open(input_path, encoding="utf-8") as f:
        raw_boxes: list[str] = [line for line in f.read().splitlines() if line.strip()]

    boxes: list[tuple[int, int, int]] = []
    for b in raw_boxes:
        (l, w, h) = map(int, b.split("x"))
        boxes.append((l, w, h))

    square_feet: int = sum(area_and_slack(b) for b in boxes)
    print("Santa is on floor: ", square_feet)


def two():
    square_feet = 0
    with open(input_path, encoding="utf-8") as f:
        raw_data = f.read().replace("\n", "")

    print("RAW: ", raw_data)
    print(f"The elves need {square_feet} of wrapping paper")


if __name__ == "__main__":
    main()
