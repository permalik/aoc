let create_input_path date =
	"/home/parallels/Docs/Git/adventofcode/aoc/aoc-ocaml/aoc/" ^ date ^ "/input.txt"

let read_file filename =
	let ic = open_in filename in
	let n = in_channel_length ic in
	let s = really_input_string ic n in
	close_in ic;
	s
;;
