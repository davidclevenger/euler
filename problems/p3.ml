(* problem 3 - author: davidclevenger *)

let is_prime x = 
    let rec no_divisors arg =
        arg * arg > x || (x mod arg != 0 && no_divisors(arg+1))
    in
        x >= 2 && no_divisors 2

let is_divisor x d = x mod d = 0

let haystack = 600851475143
let bgn =  int_of_float ((float_of_int haystack) ** (0.5)) (* ceil sqrt haystack *)

let needle =
    let largest = ref 0 in
        for g = bgn downto 0 do
            largest := if is_prime g && is_divisor haystack g && g > !largest then
                g 
            else 
                !largest 
        done;;
!largest
;;
