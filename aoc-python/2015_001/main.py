# main.py

from utility.path import create_input_path

input_path = create_input_path("2015/001")


def main():
    one()
    two()


def one():
    current_floor = 0
    with open(input_path, encoding="utf-8") as f:
        raw_data = f.read().replace("\n", "")

    chars = list(raw_data)
    for char in chars:
        if char == "(":
            current_floor += 1
        elif char == ")":
            current_floor -= 1
        else:
            print("Invalid floor counter.")

    print("Santa is on floor: ", current_floor)


def two():
    current_floor = 0
    position = 0
    with open(input_path, encoding="utf-8") as f:
        raw_data = f.read().replace("\n", "")

    chars = list(raw_data)
    for index, char in enumerate(chars):
        if current_floor == -1:
            print(f"Santa is on basement floor {current_floor} at position {index}")
            return
        if char == "(":
            current_floor += 1
        elif char == ")":
            current_floor -= 1
        else:
            print("Invalid floor counter.")


if __name__ == "__main__":
    main()
