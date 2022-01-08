

entry("fwd_J",
      {a: direct},
      {*direct})
  entry_fwd_J (n_6068 : i64, a_6069 : [n_6068]f32)
  : {*[n_6068][n_6068]f32} = {
  let {iota_res_6070 : [n_6068]i64} =
    iota64(n_6068, 0i64, 1i64)
  let {defunc_2_map_res_6071 : [n_6068][n_6068]f32} =
    map(n_6068,
        {iota_res_6070},
        \ {x_6072 : i64}
          : {[n_6068]f32} ->
          let {defunc_1_map_res_6073 : [n_6068]f32} =
            replicate([n_6068], 0.0f32)
          let {x_6074 : bool} = sle64(0i64, x_6072)
          let {y_6075 : bool} = slt64(x_6072, n_6068)
          let {bounds_check_6076 : bool} = logand(x_6074, y_6075)
          let {index_certs_6077 : unit} =
            assert(bounds_check_6076, {"Index [", x_6072 : i64,
                                       "] out of bounds for array of shape [",
                                       n_6068 : i64, "]."},
                   ".\\tests\\ad\\scan0.fut:13:41-66")
          let {defunc_4_jvp_arg_6078 : [n_6068]f32} =
            #{index_certs_6077}
            defunc_1_map_res_6073 with [x_6072] = 1.0f32
          let {defunc_0_f_res_6079 : [n_6068]f32,
               defunc_0_f_res_tan_6080 : [n_6068]f32} =
            scanomap(n_6068,
                     {a_6069, defunc_4_jvp_arg_6078},
                     {\ {x_6081 : f32, x_tan_6082 : f32, x_6083 : f32,
                         x_tan_6084 : f32}
                        : {f32,
                           f32} ->
                        let {defunc_1_op_res_6085 : f32} =
                          fmul32(x_6081, x_6083)
                        let {binop_x_6086 : f32} = fmul32(x_tan_6082, x_6083)
                        let {binop_y_6087 : f32} = fmul32(x_6081, x_tan_6084)
                        let {defunc_1_op_res_tan_6088 : f32} =
                          fadd32(binop_x_6086, binop_y_6087)
                        in {defunc_1_op_res_6085, defunc_1_op_res_tan_6088},
                      {1.0f32, 0.0f32}},
                     \ {x_6089 : f32, x_tan_6090 : f32}
                       : {f32,
                          f32} ->
                       {x_6089, x_tan_6090})
          in {defunc_0_f_res_tan_6080})
  let {defunc_0_f_res_6091 : [n_6068][n_6068]f32} =
    rearrange((1, 0), defunc_2_map_res_6071)
  in {defunc_0_f_res_6091}
}

entry("rev_J",
      {a: direct},
      {*direct})
  entry_rev_J (n_6092 : i64, a_6093 : [n_6092]f32)
  : {*[n_6092][n_6092]f32} = {
  let {iota_res_6094 : [n_6092]i64} =
    iota64(n_6092, 0i64, 1i64)
  let {defunc_0_f_res_6095 : [n_6092]f32} =
    scanomap(n_6092,
             {a_6093},
             {\ {x_6096 : f32, x_6097 : f32}
                : {f32} ->
                let {defunc_1_op_res_6098 : f32} = fmul32(x_6096, x_6097)
                in {defunc_1_op_res_6098},
              {1.0f32}},
             \ {x_6099 : f32}
               : {f32} ->
               {x_6099})
  let {nm1_6100 : i64} = sub_nw64(n_6092, 1i64)
  let {defunc_2_map_res_6101 : [n_6092][n_6092]f32} =
    map(n_6092,
        {iota_res_6094},
        \ {x_6102 : i64}
          : {[n_6092]f32} ->
          let {defunc_1_map_res_6103 : [n_6092]f32} =
            replicate([n_6092], 0.0f32)
          let {x_6104 : bool} = sle64(0i64, x_6102)
          let {y_6105 : bool} = slt64(x_6102, n_6092)
          let {bounds_check_6106 : bool} = logand(x_6104, y_6105)
          let {index_certs_6107 : unit} =
            assert(bounds_check_6106, {"Index [", x_6102 : i64,
                                       "] out of bounds for array of shape [",
                                       n_6092 : i64, "]."},
                   ".\\tests\\ad\\scan0.fut:17:41-66")
          let {defunc_4_vjp_arg_6108 : [n_6092]f32} =
            #{index_certs_6107}
            defunc_1_map_res_6103 with [x_6102] = 1.0f32
          let {adj_ctrb_scan_6109 : [n_6092]f32,
               adj_ctrb_scan_6110 : [n_6092]f32} =
            scanomap(n_6092,
                     {iota_res_6094},
                     {\ {a1_6111 : f32, b1_6112 : f32, a2_6113 : f32,
                         b2_6114 : f32}
                        : {f32,
                           f32} ->
                        let {binop_y_6115 : f32} = fmul32(a1_6111, b2_6114)
                        let {x_6116 : f32} = fadd32(a2_6113, binop_y_6115)
                        let {y_6117 : f32} = fmul32(b1_6112, b2_6114)
                        in {x_6116, y_6117},
                      {0.0f32, 1.0f32}},
                     \ {i_6118 : i64}
                       : {f32,
                          f32} ->
                       let {cond_6119 : bool} = eq_i64(i_6118, 0i64)
                       let {x_6120 : f32,
                            x_6121 : f32} =
                         if cond_6119
                         then {0.0f32, 1.0f32} else {
                           let {binop_y_6122 : i64} = add_nw64(1i64, i_6118)
                           let {j_6123 : i64} = sub_nw64(n_6092, binop_y_6122)
                           let {j1_6124 : i64} = sub_nw64(n_6092, i_6118)
                           let {defunc_0_f_res_adj_j_6125 : f32} =
                             defunc_4_vjp_arg_6108[j_6123]
                           let {x_6126 : f32} =
                             a_6093[j1_6124]
                           in {defunc_0_f_res_adj_j_6125, x_6126}
                         }
                         : {f32, f32}
                       in {x_6120, x_6121})
          let {defunc_0_f_res_adj_last_6127 : f32} =
            defunc_4_vjp_arg_6108[nm1_6100]
          let {scan_contribs_6128 : [n_6092]f32} =
            map(n_6092,
                {iota_res_6094},
                \ {i_6129 : i64}
                  : {f32} ->
                  let {binop_y_6130 : i64} = add_nw64(1i64, i_6129)
                  let {j_6131 : i64} = sub_nw64(n_6092, binop_y_6130)
                  let {adj_ctrb_scan_dj_6132 : f32} =
                    adj_ctrb_scan_6109[j_6131]
                  let {adj_ctrb_scan_cj_6133 : f32} =
                    adj_ctrb_scan_6110[j_6131]
                  let {binop_y_6134 : f32} =
                    fmul32(defunc_0_f_res_adj_last_6127, adj_ctrb_scan_cj_6133)
                  let {res_6135 : f32} =
                    fadd32(adj_ctrb_scan_dj_6132, binop_y_6134)
                  let {cond_6136 : bool} = eq_i64(i_6129, 0i64)
                  let {scan_contribs_6137 : f32} =
                    if cond_6136
                    then {res_6135} else {
                      let {im1_6138 : i64} = sub_nw64(i_6129, 1i64)
                      let {defunc_0_f_res_last_6139 : f32} =
                        defunc_0_f_res_6095[im1_6138]
                      let {res_6140 : f32} =
                        fmul32(res_6135, defunc_0_f_res_last_6139)
                      in {res_6140}
                    }
                    : {f32}
                  in {scan_contribs_6137})
          in {scan_contribs_6128})
  in {defunc_2_map_res_6101}
}