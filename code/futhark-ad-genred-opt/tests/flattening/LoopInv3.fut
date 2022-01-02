-- ==
-- input {
--   [ [ [ [1,2,3], [4,5,6] ]
--     ]
--   , [ [ [6,7,8], [9,10,11] ]
--     ]
--   , [ [ [3,2,1], [4,5,6] ]
--     ]
--   , [ [ [8,7,6], [11,10,9] ]
--     ]
--   ]
--   [1,2,3]
-- }
-- output {
--   [[[[2, 4, 6],
--      [5, 7, 9]]],
--    [[[7, 9, 11],
--      [10, 12, 14]]],
--    [[[4, 4, 4],
--      [5, 7, 9]]],
--    [[[9, 9, 9],
--      [12, 12, 12]]]]
-- }
let addRows [n] (xs: [n]i32, ys: [n]i32): [n]i32 =
  map2 (+) xs ys

let main (xssss: [][][][]i32) (ys: []i32): [][][][]i32 =
  map  (\(xsss: [][][]i32) ->
         map  (\(xss: [][]i32) ->
                map (\(xs: []i32) ->
                      addRows(xs,ys)
                   ) xss
            ) xsss
      ) xssss