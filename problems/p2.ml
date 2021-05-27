let solution =
    let a = ref 1
    and b = ref 1
    and tmp = ref 0
    and acc = ref 0 in
        while !a <= 4000000 do
            tmp := !a;
            a := !a + !b;
            b := !tmp;
            acc := if !a mod 2 = 0 then !acc + !a else !acc;
        done;
!acc
;;

let () = Stdio.print_endline(Int.to_string(solution))
