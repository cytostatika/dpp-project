entry("rev",
      {xs: direct, c: direct},
      {direct, direct})
  entry_rev (n : i64, xs : [n]f32, c_4964 : f32): {[n]f32, f32} = {
  let {iota_n : [n]i64} =
    iota64(n, 0i64, 1i64)
  let {ls : [n]f32,
       rs : [n]f32,
       res : f32} =
    screma(n,
           {xs, iota_n},

            {\ {x_4969 : f32, x_4970 : f32} : {f32} ->
                let {defunc_1_op_res_4971 : f32} = fmul32(x_4969, x_4970)
                in {defunc_1_op_res_4971},
                {1.0f32},
                \ {x_4972 : f32, x_4973 : f32}: {f32} ->
                let {defunc_1_op_res_4974 : f32} = fmul32(x_4972, x_4973)
                in {defunc_1_op_res_4974},
                {1.0f32}
            },

           {\ {x_4975 : f32, x_4976 : f32}: {f32} ->
                let {defunc_1_op_res_4977 : f32} = fmul32(x_4975, x_4976)
                in {defunc_1_op_res_4977},
                {1.0f32}
            },

           \ {ai : f32, i_4979 : i64}: {f32, f32, f32} ->
                let {cond_4980 : bool} = slt64(0i64, i_4979)
                let {li : f32,
                    ri : f32} =
                if cond_4980
                then {
                    let {i_1_4983 : i64} = sub_nw64(i_4979, 1i64)
                    let {n_i_4984 : i64} = sub_nw64(n, i_4979)
                    let {li_in : f32} = xs[i_1_4983]
                    let {ri_in : f32} = xs[n_i_4984]
                    in {li_in, ri_in}
                } else {1.0f32, 1.0f32}
                : {f32, f32}
             in {li, ri, ai}
             )
  let {adj_res : [n]f32} =
    map(n,
        {iota_n, ls},
        \ {i_4988 : i64, x_4989 : f32}
          : {f32} ->
          let {binop_y_4990 : i64} = add_nw64(1i64, i_4988)
          let {n_i_1_4991 : i64} = sub_nw64(n, binop_y_4990)
          let {x_4992 : f32} =
            rs[n_i_1_4991]
          let {binop_x_adj_4993 : f32} = fmul32(c_4964, x_4992)
          let {inner_adj_res : f32} = fmul32(x_4989, binop_x_adj_4993)
          in {inner_adj_res})
  in {adj_res, res}
}