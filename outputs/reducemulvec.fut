entry("rev",
      {xs: direct, c: direct},
      {direct, direct})

  entry_rev (n : i64, xs : [n][n]f32, c : [n]f32): {[n][n]f32, [n]f32} = {
  let {neutral_element : [n]f32} = replicate([n], 1.0f32)
  let {redomap_res : [n]f32} =
    redomap(n,
            {xs},
            {\ {x_5552 : [n]f32, x_5553 : [n]f32}
               : {[n]f32} ->
               let {defunc_1_map_res_5554 : [n]f32} =
                 map(n,
                     {x_5552, x_5553},
                     \ {x_5555 : f32, x_5556 : f32}: {f32} ->
                       let {defunc_1_f_res_5557 : f32} = fmul32(x_5555, x_5556)
                       in {defunc_1_f_res_5557})
               in {defunc_1_map_res_5554},
             {neutral_element}
             },
            \ {x_5558 : [n]f32}: {[n]f32} -> {x_5558})
  let {iota_5559 : [n]i64} =
    iota64(n, 0i64, 1i64)
  let {left : [n][n]f32,
       right : [n][n]f32,
       as : [n]f32,
       result : [n]f32} =
    scanomap(n,
             {c, redomap_res, iota_5559},
             {\ {x_5564 : [n]f32, x_5565 : [n]f32}
                : {[n]f32} ->
                let {defunc_1_map_res_5566 : [n]f32} =
                  map(n,
                      {x_5564, x_5565},
                      \ {x_5567 : f32, x_5568 : f32}
                        : {f32} ->
                        let {defunc_1_f_res_5569 : f32} = fmul32(x_5567, x_5568)
                        in {defunc_1_f_res_5569})
                in {defunc_1_map_res_5566},
              {neutral_element},
              \ {x_5570 : [n]f32, x_5571 : [n]f32}
                : {[n]f32} ->
                let {defunc_1_map_res_5572 : [n]f32} =
                  map(n,
                      {x_5571, x_5570},
                      \ {x_5573 : f32, x_5574 : f32}
                        : {f32} ->
                        let {defunc_1_f_res_5575 : f32} = fmul32(x_5573, x_5574)
                        in {defunc_1_f_res_5575})
                in {defunc_1_map_res_5572},
              {neutral_element}},
             \ {map_adj_p_5576 : f32, x_5577 : f32, i_5578 : i64}: {[n]f32, [n]f32, f32, f32} ->
               let {binop_x_adj_5579 : f32} = fmul32(map_adj_p_5576, map_adj_p_5576)
               let {binop_y_adj_5580 : f32} = fmul32(map_adj_p_5576, x_5577)
               let {cond : bool} = slt64(0i64, i_5578)
               let {x_5582 : [n]f32, x_5583 : [n]f32} =
                 if cond then {
                   let {i_1_5584 : i64} = sub_nw64(i_5578, 1i64)
                   let {n_i_5585 : i64} = sub_nw64(n, i_5578)
                   let {x_elem_1_5586 : [n]f32} = xs[i_1_5584, 0i64 :+ n * 1i64]
                   let {x_elem_2_5587 : [n]f32} = xs[n_i_5585, 0i64 :+ n * 1i64]
                   in {x_elem_1_5586, x_elem_2_5587}
                 } else {neutral_element, neutral_element}: {[n]f32, [n]f32}
               in {x_5582, x_5583, binop_x_adj_5579, binop_y_adj_5580})
  let {jacobian : [n][n]f32} =
    map(n,
        {iota_5559, left},
        \ {i_5589 : i64, li : [n]f32} : {[n]f32} ->
          let {binop_y_5591 : i64} = add_nw64(1i64, i_5589)
          let {n_i_1_5592 : i64} = sub_nw64(n, binop_y_5591)
          let {ri : [n]f32} = right[n_i_1_5592, 0i64 :+ n * 1i64]
          let {map_adjs_5594 : [n]f32} =
            map(n,
                {as, ri, li},
                \ {map_adj_p_5595 : f32, x_5596 : f32, x_5597 : f32}: {f32} ->
                  let {binop_x_adj_5598 : f32} = fmul32(map_adj_p_5595, x_5596)
                  let {binop_y_adj_5599 : f32} = fmul32(x_5597, binop_x_adj_5598)
                  in {binop_y_adj_5599})
          in {map_adjs_5594})
  in {jacobian, result}
}