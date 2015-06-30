(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 1: Examples to Demonstrate Shadowing *)

val a = 10

(* a : int  (static env) 
   a -> 10  (dynamic env) *)

val b = a * 2

(* a -> 10
   b -> 20 *)

val a = 5 

(* a -> 5, b -> 20 *)
(* N.B. this is not a (re)assignment statement. 
   There is no way to mutate the original variable a.
   Instead, we have a new variable a (in a new environment)
   that shadows the old. *)

val c = b

(* c : int
   c -> 20 *)

val d = a

val a = a + 1
(* a -> 6
   Again, this is not assigning a new value to the old variable a.
   Rather, we get a new variable a defined in terms of the old one. *)

(* next line does not type-check, f not in environment *)
(* val g = f - 3  *)
(* no forward references allowed *)

val f = a * 2

