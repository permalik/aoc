package main

import (
	"fmt"
	"os"
	"log"
)

func main() {
	one()
	two()
}

func one() {
	fmt.Println("Starting one..")

	file, err := os.Open("/home/parallels/Docs/Git/adventofcode/aoc/aoc-go/aoc/2015/001/input.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	contents, err := os.ReadFile(file.Name())
	if err != nil {
		log.Fatal(err)
	}

	var floor int = 0
	for _, c := range contents {
		if c == '(' {
			floor++;
		} else if c == ')' {
			floor--;
		}
	}

	fmt.Printf("Santa is on floor %d\n\n", floor);
}

func two() {
	fmt.Println("Starting two..")

	file, err := os.Open("/home/parallels/Docs/Git/adventofcode/aoc/aoc-go/aoc/2015/001/input.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	contents, err := os.ReadFile(file.Name())
	if err != nil {
		log.Fatal(err)
	}

	var floor int = 0
	for index, char := range contents {
		if floor == -1 {
			fmt.Printf("Santa is on basement floor %d at position %d\n", floor, index);
			break;
		}
		if char == '(' {
			floor++;
			index++;
		} else if char == ')' {
			floor--;
			index++;
		}
	}
}
