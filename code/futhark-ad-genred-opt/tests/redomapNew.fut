-- ==
-- input {
--   [1,2,3,4,5]
-- }
-- output {
--     [0, 30, 60]
--     [[[0, 0, 0, 0, 0],
--       [2, 2, 2, 2, 2],
--       [4, 4, 4, 4, 4]],
--      [[0, 0, 0, 0, 0],
--       [4, 4, 4, 4, 4],
--       [8, 8, 8, 8, 8]],
--      [[0, 0, 0, 0, 0],
--       [6, 6, 6, 6, 6],
--       [12, 12, 12, 12, 12]],
--      [[0, 0, 0, 0, 0],
--       [8, 8, 8, 8, 8],
--       [16, 16, 16, 16, 16]],
--      [[0, 0, 0, 0, 0],
--       [10, 10, 10, 10, 10],
--       [20, 20, 20, 20, 20]]]
-- }

let main(arr: []i32): ([]i32,[][][]i32) =
  let vs = map (\(a: i32) ->
                  map (\x: i32  -> 2*i32.i64 x*a
                     ) (iota(3) )
              ) arr
  in (reduce (\a b -> map2 (+) a b) (
             replicate 3 0) vs,
      map (\(r: []i32)  ->
             transpose (replicate 5 r)) vs)


let main0(arr: []i32): i32 =
  reduce (+) 0 (map (2*) arr)