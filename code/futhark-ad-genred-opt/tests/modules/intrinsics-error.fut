-- You are not allowed to use the intrinsics module in module expressions.
-- ==
-- error: The 'intrinsics' module may not be used in module expressions.

module M = intrinsics

let main() = 0
