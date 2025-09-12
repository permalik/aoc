#include <iostream>
#include <fstream>
#include <string>

int one() {
    std::cout << "Started one.." << std::endl;

	std::string fname = "/home/parallels/Docs/Git/adventofcode/aoc/aoc-cpp/aoc/2015/001/input.txt";
	std::ifstream file(fname);
	if (!file) {
		std::cerr << "Failed to open file\n";
		return 1;
	}

	char c;
	int floor = 0;
	while (file.get(c)) {
		if (c == '(') {
			floor++;
		} else if (c == ')') {
			floor--;
		}
	}

	std::cout << "Santa is on floor " << floor << std::endl << std::endl;

	return 0;
}

int two() {
    std::cout << "Started two.." << std::endl;

	std::string fname = "/home/parallels/Docs/Git/adventofcode/aoc/aoc-cpp/aoc/2015/001/input.txt";
	std::ifstream file(fname);
	if (!file) {
		std::cerr << "Failed to open file\n";
		return 1;
	}

	char c;
	int floor = 0;
	std::size_t index = 0;
	while (file.get(c)) {
		if (floor == -1) {
			std::cout << "Santa is on basement floor " << floor << " at position " << index << std::endl;
			break;
		}
		if (c == '(') {
			floor++;
			index++;
		} else if (c == ')') {
			floor--;
			index++;
		}
	}

	return 0;
}

int main() {
	one();
	two();
    return 0;
}
