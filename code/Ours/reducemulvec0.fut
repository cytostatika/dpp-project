-- Simple reduce with multiplication
-- ==
-- entry: rev
-- compiled input { [[1,2,3],[4,5,6],[7,8,9]] [1,1,1] } output { [24.0f32, 12.0f32, 8.0f32, 6.0f32] 24.0f32 }

def red_mult [n] (xs: [n][n]f32, c: [n]f32) : [n]f32 =
  let mid = reduce (map2 (/)) (replicate n 1f32) xs 
  in map2 (*) mid c 

entry rev [n] (xs: [n][n]f32) (c: [n]f32) =
--  let xs = [[1f32,2f32,3f32],[4f32,5f32,6f32],[7f32,8f32,9f32]]
--  let ne = [1f32,1f32,1f32]
  vjp red_mult (xs,c) c
