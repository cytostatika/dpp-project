-- Missing pattern warning 6 (floats).
-- ==
-- error:

let f : f32 =
  match (1.5 : f32)
    case 1.1 -> 1
    case 2   -> 2
