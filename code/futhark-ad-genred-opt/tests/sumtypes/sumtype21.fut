-- Sumtype aliasing.
-- ==
-- error: "xs".*consumed

type^ sum = #foo ([]i32) | #bar ([]i32)

let main (xs: *[]i32) =
  let v : sum = #foo xs
  let xs[0] = 0
  let v' = v
  in 0
