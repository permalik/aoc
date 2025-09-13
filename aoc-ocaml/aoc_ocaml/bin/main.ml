module U = Aoc_ocaml.Utility
open U

let one input_path =
  let current_floor = ref 0 in
  let raw_data = read_file input_path |> String.trim in
  String.iter (fun char ->
    match char with
    | '(' -> incr current_floor
    | ')' -> decr current_floor
    | _ -> Printf.printf "Invalid floor counter.\n"
  ) raw_data;
  Printf.printf "Santa is on floor: %d\n" !current_floor

let two input_path =
  let current_floor = ref 0 in
  let raw_data = read_file input_path |> String.trim in
  let found = ref false in
  String.iteri (fun idx char ->
    if not !found then begin
      (match char with
      | '(' -> incr current_floor
      | ')' -> decr current_floor
      | _ -> Printf.printf "Invalid floor counter.\n");
      if !current_floor = -1 then begin
        Printf.printf "Santa is on basement floor -1 at position %d\n" (idx + 1);
        found := true
      end
    end
  ) raw_data

let () =
  let input_path = create_input_path "2015/001" in
  one input_path;
  two input_path
