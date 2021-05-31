(* problem 1 - author: davidclevenger *)

let rec range a b =
	if a > b then []
	else a :: (range (a+1) b)

let filt i = 
	if i mod 3 = 0 || i mod 5 = 0 then i
	else 0 

let rec sum l = match l with
	[] -> 0
	| h :: t -> h + (sum t)

(* range function is inclusive and problems states the domain is below 1000 *)
let base = range 1 999

let filtered = List.map filt base
let solution = sum filtered

let () = print_endline(string_of_int(solution)); 
