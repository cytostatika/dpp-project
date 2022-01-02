-- Test scanomap fusion and scan kernel generation with map-outs.
--
-- ==
-- input {
--   10
--   [0i32, 1i32, 2i32, 3i32, 4i32, 5i32, 6i32, 7i32, 8i32, 9i32, 10i32, 11i32,
--    12i32, 13i32, 14i32, 15i32, 16i32, 17i32, 18i32, 19i32, 20i32, 21i32, 22i32,
--    23i32, 24i32, 25i32, 26i32, 27i32, 28i32, 29i32, 30i32, 31i32, 32i32, 33i32,
--    34i32, 35i32, 36i32, 37i32, 38i32, 39i32, 40i32, 41i32, 42i32, 43i32, 44i32,
--    45i32, 46i32, 47i32, 48i32, 49i32, 50i32, 51i32, 52i32, 53i32, 54i32, 55i32,
--    56i32, 57i32, 58i32, 59i32, 60i32, 61i32, 62i32, 63i32, 64i32, 65i32, 66i32,
--    67i32, 68i32, 69i32, 70i32, 71i32, 72i32, 73i32, 74i32, 75i32, 76i32, 77i32,
--    78i32, 79i32, 80i32, 81i32, 82i32, 83i32, 84i32, 85i32, 86i32, 87i32, 88i32,
--    89i32, 90i32, 91i32, 92i32, 93i32, 94i32, 95i32, 96i32, 97i32, 98i32, 99i32]
-- }
-- output { 12 55 }
-- structure { Screma 1 }

let main(i: i32) (a: []i32): (i32, i32) =
  let b = map (+2) a
  let c = scan (+) 0 a
  in (b[i], c[i])