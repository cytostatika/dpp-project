-- Yet another case of aliasing that can result in incorrect code
-- generation.

let main (w: i64) (h: i64) =
  [1,2,3] |> unflatten w h