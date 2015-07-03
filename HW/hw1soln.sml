(* Homework 1 Solutions  for Programming Languages Course

   Author: williamdemeo@gmail.com
   Date: 2015.07.03
*)

(* ---- Exercise 1.1 ----------------------------------------
   is_older

    INPUT
        x : int*int*int  a date in (year, month, day) format
        y : int*int*int  a date in (year, month, day) format
    OUTPUT
        true if x is older (i.e. occurs before) y
        false otherwise
    EXAMPLE: is_older((1,2,3),(2,3,4)) results in true
*)
fun is_older(x : int*int*int, y : int*int*int): bool = 
    ((#1 x) < (#1 y)) 
    orelse ( ((#1 x) = (#1 y)) andalso ((#2 x) < (#2 y)) )
    orelse ( ((#1 x) = (#1 y)) andalso ((#2 x) = (#2 y)) andalso ((#3 x) < (#3 y)) )


(* ---- Exercise 1.2 ----------------------------------------
   number_in_month

    INPUT
        xs : int*int*int list   (dates, each in (year, month, day) format)
        m : int  a month 
    OUTPUT
        number of dates in the list that fall in the given month m

    EXAMPLE: number_in_month([(2012,2,28),(2013,12,1)],2) is 1
*)
fun number_in_month(xs : (int*int*int) list, m : int) : int = 
    let fun number_in_month_aux(dates : (int*int*int) list, n : int, acc : int) : int=
	    if (null dates) then acc
	    else if ((#2 (hd dates)) = n) 
	    then number_in_month_aux(tl dates, n, acc+1) 
	    else number_in_month_aux(tl dates, n, acc) 
	      (* 			    case zs of *)
	      (* 	[] => acc *)
	      (* | (a,b,c)::tail => if (b = n) *)
	      (* 		 then number_in_month_aux(tail, n, (acc+1)) *)
	      (* 		 else number_in_month_aux(tail, n, acc) *)
    in
	number_in_month_aux(xs, m, 0)
    end

		  
(* ---- Exercise 1.3 ----------------------------------------
   number_in_months

    INPUT
        xs : int*int*int list    (dates, each in (year, month, day) format)
        ms : int list            (months)
    OUTPUT
        number of elements in the first list (of dates) that fall in any 
        of the elements of the second list (of months)

    EXAMPLE: number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
*)
fun number_in_months(xs : (int*int*int) list, ms : int list) : int = 
    let fun number_in_months_aux(zs : (int*int*int) list, ns : int list, acc : int) : int =
	    case ns of
		[] => acc
	      | m::ms => number_in_months_aux(zs, ms, acc + number_in_month(zs, m)) 
    in
	number_in_months_aux(xs, ms, 0)
    end

		  
(* ---- Exercise 1.4 ----------------------------------------
   dates_in_month

    INPUT
        xs : int*int*int list    (dates, each in (year, month, day) format)
        m : int                  (a month)
    OUTPUT
        list of dates from first argument that fall in the given month

    EXAMPLE: dates_in_month([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
*)
fun dates_in_month(xs : (int*int*int) list, m : int) : (int*int*int) list = 
    case xs of
	[] => []
      | y::ys => if ((#2 y) = m) 
		 then y::dates_in_month(ys, m)
		 else dates_in_month(ys, m)


(* ---- Exercise 1.5 ----------------------------------------
   dates_in_months

    INPUT
        xs : int*int*int list    (dates, each in (year, month, day) format)
        ms : int list            (months)
    OUTPUT
        list of dates from first argument that are in any of the months in the second argument

    EXAMPLE: dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
*)
fun dates_in_months(xs : (int*int*int) list, ms : int list) : (int*int*int) list = 
    case ms of
	[] => []
      | n::ns => dates_in_month(xs, n) @ dates_in_months(xs, ns)



(* ---- Exercise 1.6 ----------------------------------------
   get_nth
        get the nth string in the given list of strings (the first string in the list is at n=1)

    EXAMPLE: get_nth(["hi", "there", "how", "are", "you"], 2) = "there"
*)
fun get_nth(xs : string list, n : int): string = if (n = 1) then hd xs else get_nth(tl xs, n-1)



(* ---- Exercise 1.7 ----------------------------------------
    date_to_string 
        takes a date and returns a string of the form January 20, 2013 (for example). 

    EXAMPLE: date_to_string((2013, 6, 1)) = "June 1, 2013"
    NOTES: Uses ^ for concatenating strings and Int.toString for converting an int to a string. 
*)
fun date_to_string(date : int*int*int): string = 
    let val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    in get_nth(months, (#2 date)) ^ Int.toString((#3 date)) ^ ", " ^ Int.toString(#1 date)
    end


(* ---- Exercise 1.8 ----------------------------------------
   number_before_reaching_sum 
    INPUT
        sum : int  (a positive integer)
        xs : int list (a list of positive integers)

    OUTPUT
        n : int (an integer such that the first n elements of xs 
                add to less than sum, but the first n + 1 elements 
                of xs sum or more. 

    EXAMPLE: number_before_reaching_sum(10, [1,2,3,4,5]) = 3
    NOTES: Assumes the entire list sums to more than the passed in value; 
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


(* ---- Exercise 1.9 ----------------------------------------
   what_month  
        takes a day of year (i.e., an int between 1 and 365) and returns
        what month that day is in (1 for January, 2 for February, etc.)

    INPUT
        day : int  (between 1 and 365, inclusive)

    OUTPUT
        month : int (the month that the given day falls in)

    EXAMPLE: what_month(70) = 3 
*)
fun what_month (day: int) : int = 
    let val month_lengths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31] in
	number_before_reaching_sum(day, month_lengths) + 1
    end


(* ---- Exercise 1.10 ----------------------------------------
    month_range 
        takes two days of the year day1 and day2 and returns an int list
        [m1,m2,...,mn] where m1 is the month of day1, m2 is the month of day1+1, 
        ..., and mn is the month of day day2. 

    EXAMPLE: month_range(31, 34) = [1,2,2,2]
    NOTES: result will have length day2 - day1 + 1 or length 0 if day1>day2.
*)
fun month_range(day1: int, day2: int): int list = 
    if (day1 > day2) then [] 
    else what_month(day1)::month_range(day1+1, day2)

(* ---- Exercise 1.11 ----------------------------------------
    oldest 
        takes a list of dates and returns an (int*int*int) option:
            NONE if the list has no dates and 
            SOME d if the date d is the oldest date in the list.

    EXAMPLE: oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
*)
fun oldest(dates: (int*int*int) list) : (int*int*int) option = 
    let fun oldest_aux(ds: (int*int*int) list, oldie: int*int*int) : int*int*int =
	    case ds of
		[] => oldie
	      | x::xs => if (is_older(x, oldie)) 
			 then oldest_aux(xs, x)
			 else oldest_aux(xs, oldie)
    in
	case dates of
	    [] => NONE
	  | y::ys => SOME (oldest_aux(ys, y))
    end



(* fun sum(zs : int list) : int =  *)
(*     case zs of *)
(* 	[] => 0 *)
(*       | y :: ys => y + sum(ys) *)

(* fun what_month(day : int) : int =  *)
(*     number_before_reaching_sum(day, [31,28,31,30,31,30,31,31,30,31,30,31]) + 1; *)

