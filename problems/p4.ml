(* problem 4 - author: davidclevenger *)

open Base;;

let is_palindrome s = String.equal s (String.rev s);;

let result = 
    let longest = ref 0 in
        (* Since we are looking for the longest, *
         * start with the largest indices        *)
        for i = 999 downto 900 do
            for j = 999 downto 900 do
                let prod = i * j in
                let s = Int.to_string(prod) in
                    longest := if is_palindrome s 
                            && String.length s > String.length (Int.to_string(!longest)) then 
                        prod
                    else 
                        !longest
            done;
        done;
!longest
;;

let () = Stdio.print_endline(Int.to_string(result));;
