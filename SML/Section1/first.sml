(* This is a comment. This is our first program. *)
(* Created while watching Lecture 2 of Section 1
   "ML Variable Bindings and Expressions" *)

(* type C-c C-s and hit return to bring up the SML REPL. *)
(* In the REPL, type

       use "first.sml";

   This loads the contents of first.sml and evaluates 
   the variable bindings. Then you can use the variables.
   After playing around, you can stop the REPL and restart
   it with C-d and then C-c C-s again. *)

val x = 34;
(* static environment: x : int, read "x is an int" or "x has type int" *)
(* dynamic environment: x --> 34, read "x holds 34" *)

val y = 17;
(* static environment: x : int, y : int *)
(* dynamic environment: x --> 34, y --> 17 *)

val z = (x + y) + (y + 2);
(* static environment: x : int, y : int, z : int *)
(* dynamic environment: x --> 34, y --> 17, z --> 70 *)

val q = z + 1;
(* static environment: q : int *)
(* dynamic environment: x --> 34, y --> 17, z --> 70, q --> 71 *)

val abs_of_z = if z < 0 then 0 - z else z;
(* static environment: ..., abs_of_z : int *)
(* the two branches of the conditional if then else can have any type, 
   but they must both have same type *)
(* dynamic environment: ..., abs_of_z --> 70 *)
