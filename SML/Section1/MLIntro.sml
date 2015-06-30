(* Section 1. Lecture 3: Rules for Expressions *)

(* Every expression in a program has three features:
   1. Syntax -- how do you write the expression (well-formedness)
   2. Type-checking rules -- produces a type or fails
   3. Evaluation rules -- produces a value (only for expression that type check
*)

(* Q: what are the syntax, type-checking rules, and evaluation rules 
   for less-than comparisons? 

   A: 1. syntax: given expressions e1 and e2, 
                     e1 < e2 
                 is the syntax for less-than comparisons.
      2. type-checking rules: e1 and e2 must be of type int
      3. e1 < e2 evaluates to true if e1 is less than e2, false otherwise.
*)

(* Section 1. Lecture 4: REPL and Errors *)

(* Open the sml REPL by typing C-c C-s Enter in Emacs.
   Load the contents of "file.sml" by typing, at the sml REPL prompt,

       - use "file.sml";

   After that you may try other sml commands at the command line,
   then make some edits to file.sml, but then before reloading file.sml,
   you should first kill the existing REPL using C-d. *)

(* Section 1. Lecture 5: Shadowing  *)
