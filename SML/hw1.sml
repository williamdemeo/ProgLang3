(* HW 1. Exercise 8. *)
(* 
   number_before_reaching_sum

    INPUT
        sum : int  (a positive integer)
        xs : int list (a list of positive integers)

    OUTPUT
        n : int (an integer such that the first n elements of xs 
                add to less than sum, but the first n + 1 elements 
                of xs sum or more. 

    NOTES
        Assume the entire list sums to more than the passed in value; 
        it is okay for an exception to occur if this is not the case.
*)
fun number_before_reaching_sum (sum: int, xs: int list) : int = 

    let fun number_before_reaching_sum_aux (my_sum: int, my_xs: int list, index: int) : int = 
	    case my_xs of
		[] => index
	      | y :: ys => 
		if (y >= my_sum) then index 
		else number_before_reaching_sum_aux (my_sum-y, ys, index+1)
						    
    in number_before_reaching_sum_aux (sum, xs, 0)

    end

fun sum(zs : int list) : int = 
    case zs of
	[] => 0
      | y :: ys => y + sum(ys)

fun what_month(day : int) : int = 
    number_before_reaching_sum(day, [31,28,31,30,31,30,31,31,30,31,30,31]) + 1;
