(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 1: List Functions *)

(* Functions taking or producing lists *)

fun sum_list (xs : int list) =
    if null xs
    then 0
    else hd(xs) + sum_list(tl(xs))

fun list_product (xs : int list) =
    if null xs
    then 1
    else hd(xs) * list_product(tl(xs))

fun my_countdown (x : int) =
    if (x = 1)
    then [1]
    else x :: my_countdown(x-1)

fun my_append (x : int list, y : int list) =
    if null x
    then y
    else hd x :: my_append(tl x, y)

fun append (xs : int list, ys : int list) = (* part of the course logo :) *)
    if null xs
    then ys
    else hd(xs) :: append(tl(xs), ys)

(* More functions over lists, here lists of pairs of ints *)

fun sum_pair_list (xs : (int * int) list) =
    if null xs
    then 0
    else #1 (hd(xs)) + #2 (hd(xs)) + sum_pair_list(tl(xs))

fun firsts (xs : (int * int) list) =
    if null xs
    then []
    else (#1 (hd xs))::(firsts(tl xs))

fun seconds (xs : (int * int) list) =
    if null xs
    then []
    else (#2 (hd xs))::(seconds(tl xs))

fun sum_pair_list2 (xs : (int * int) list) =
    (sum_list (firsts xs)) + (sum_list (seconds xs))

