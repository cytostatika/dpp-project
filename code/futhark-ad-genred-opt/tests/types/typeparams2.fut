-- Shadowing in type.
-- ==
-- input { 2.0 } output { 2.0 }

type t 'int = int

let main (x: f64): t f64 = x
