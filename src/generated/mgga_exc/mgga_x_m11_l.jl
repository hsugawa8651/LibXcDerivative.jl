# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_m11_l.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, cam_omega, dens_threshold, params_a_a_0, params_a_a_1, params_a_a_2, params_a_a_3, params_a_a_4, params_a_a_5, params_a_a_6, params_a_a_7, params_a_a_8, params_a_a_9, params_a_a_10, params_a_a_11, params_a_b_0, params_a_b_1, params_a_b_2, params_a_b_3, params_a_b_4, params_a_b_5, params_a_b_6, params_a_b_7, params_a_b_8, params_a_b_9, params_a_b_10, params_a_b_11, params_a_c_0, params_a_c_1, params_a_c_2, params_a_c_3, params_a_c_4, params_a_c_5, params_a_c_6, params_a_c_7, params_a_c_8, params_a_c_9, params_a_c_10, params_a_c_11, params_a_d_0, params_a_d_1, params_a_d_2, params_a_d_3, params_a_d_4, params_a_d_5, params_a_d_6, params_a_d_7, params_a_d_8, params_a_d_9, params_a_d_10, params_a_d_11, zeta_threshold
const mgga_x_m11_l_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, cam_omega, dens_threshold, params_a_a_0, params_a_a_1, params_a_a_2, params_a_a_3, params_a_a_4, params_a_a_5, params_a_a_6, params_a_a_7, params_a_a_8, params_a_a_9, params_a_a_10, params_a_a_11, params_a_b_0, params_a_b_1, params_a_b_2, params_a_b_3, params_a_b_4, params_a_b_5, params_a_b_6, params_a_b_7, params_a_b_8, params_a_b_9, params_a_b_10, params_a_b_11, params_a_c_0, params_a_c_1, params_a_c_2, params_a_c_3, params_a_c_4, params_a_c_5, params_a_c_6, params_a_c_7, params_a_c_8, params_a_c_9, params_a_c_10, params_a_c_11, params_a_d_0, params_a_d_1, params_a_d_2, params_a_d_3, params_a_d_4, params_a_d_5, params_a_d_6, params_a_d_7, params_a_d_8, params_a_d_9, params_a_d_10, params_a_d_11, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = 1.8171205928321397
        cse_tmp_3 = 4.60115111447049
        cse_tmp_4 = cse_tmp_2 / cse_tmp_3
        cse_tmp_5 = cse_tmp_4 * xs0 ^ 2
        cse_tmp_6 = 1 - 0.552 * xc_expm1(-0.00931890022067156 * cse_tmp_5)
        cse_tmp_7 = -120 * params_a_d_10
        cse_tmp_8 = 165 * params_a_d_11
        cse_tmp_9 = -4 * params_a_d_4
        cse_tmp_10 = 10 * params_a_d_5
        cse_tmp_11 = 35 * params_a_d_7
        cse_tmp_12 = -56 * params_a_d_8
        cse_tmp_13 = 84 * params_a_d_9
        cse_tmp_14 = cse_tmp_10 + cse_tmp_11 + cse_tmp_12 + cse_tmp_13 + cse_tmp_7 + cse_tmp_8 + cse_tmp_9 + params_a_d_3 - 20 * params_a_d_6
        cse_tmp_15 = 3.3019272488946267
        cse_tmp_16 = cse_tmp_15 * cse_tmp_3
        cse_tmp_17 = (3 // 10) * cse_tmp_16
        cse_tmp_18 = cse_tmp_17 + t0
        cse_tmp_19 = (972 // 125) * 97.40909103400244
        cse_tmp_20 = cse_tmp_19 / cse_tmp_18 ^ 3
        cse_tmp_21 = 210 * params_a_d_10
        cse_tmp_22 = 462 * params_a_d_11
        cse_tmp_23 = 7 * params_a_d_7
        cse_tmp_24 = 28 * params_a_d_8
        cse_tmp_25 = -cse_tmp_13 + cse_tmp_21 - cse_tmp_22 - cse_tmp_23 + cse_tmp_24 + params_a_d_6
        cse_tmp_26 = (944784 // 15625) * 9488.531016070574
        cse_tmp_27 = cse_tmp_26 / cse_tmp_18 ^ 6
        cse_tmp_28 = -10 * params_a_d_10
        cse_tmp_29 = 55 * params_a_d_11
        cse_tmp_30 = cse_tmp_28 + cse_tmp_29 + params_a_d_9
        cse_tmp_31 = (918330048 // 1953125) * 924269.1815233742
        cse_tmp_32 = cse_tmp_31 / cse_tmp_18 ^ 9
        cse_tmp_33 = 11 * params_a_d_11
        cse_tmp_34 = 3 * params_a_d_3
        cse_tmp_35 = 5 * params_a_d_5
        cse_tmp_36 = -6 * params_a_d_6
        cse_tmp_37 = -8 * params_a_d_8
        cse_tmp_38 = 9 * params_a_d_9
        cse_tmp_39 = cse_tmp_23 + cse_tmp_28 + cse_tmp_33 + cse_tmp_34 + cse_tmp_35 + cse_tmp_36 + cse_tmp_37 + cse_tmp_38 + cse_tmp_9 + params_a_d_1 - 2 * params_a_d_2
        cse_tmp_40 = (3 // 5) * cse_tmp_16
        cse_tmp_41 = cse_tmp_40 / cse_tmp_18
        cse_tmp_42 = 45 * params_a_d_10
        cse_tmp_43 = 15 * params_a_d_6
        cse_tmp_44 = 21 * params_a_d_7
        cse_tmp_45 = 36 * params_a_d_9
        cse_tmp_46 = -cse_tmp_10 + cse_tmp_24 - cse_tmp_29 - cse_tmp_34 + cse_tmp_42 + cse_tmp_43 - cse_tmp_44 - cse_tmp_45 + params_a_d_2 + 6 * params_a_d_4
        cse_tmp_47 = (54 // 25) * 21.170591578193033 * cse_tmp_2
        cse_tmp_48 = cse_tmp_47 / cse_tmp_18 ^ 2
        cse_tmp_49 = 330 * params_a_d_11
        cse_tmp_50 = 126 * params_a_d_9
        cse_tmp_51 = -cse_tmp_11 + cse_tmp_21 - cse_tmp_35 + cse_tmp_43 - cse_tmp_49 - cse_tmp_50 + params_a_d_4 + 70 * params_a_d_8
        cse_tmp_52 = (2916 // 625) * 448.1939477706577 * cse_tmp_15
        cse_tmp_53 = cse_tmp_52 / cse_tmp_18 ^ 4
        cse_tmp_54 = cse_tmp_12 + cse_tmp_22 + cse_tmp_36 + cse_tmp_44 + cse_tmp_50 - 252 * params_a_d_10 + params_a_d_5
        cse_tmp_55 = (52488 // 3125) * 2062.2080822838902 * cse_tmp_2
        cse_tmp_56 = cse_tmp_55 / cse_tmp_18 ^ 5
        cse_tmp_57 = cse_tmp_37 + cse_tmp_45 + cse_tmp_49 + cse_tmp_7 + params_a_d_7
        cse_tmp_58 = (2834352 // 78125) * 43658.16505928093 * cse_tmp_15
        cse_tmp_59 = cse_tmp_58 / cse_tmp_18 ^ 7
        cse_tmp_60 = -cse_tmp_38 + cse_tmp_42 - cse_tmp_8 + params_a_d_8
        cse_tmp_61 = (51018336 // 390625) * 200877.81481824708 * cse_tmp_2
        cse_tmp_62 = cse_tmp_61 / cse_tmp_18 ^ 8
        cse_tmp_63 = -cse_tmp_33 + params_a_d_10
        cse_tmp_64 = (2754990144 // 9765625) * 4252702.174637001 * cse_tmp_15
        cse_tmp_65 = cse_tmp_64 / cse_tmp_18 ^ 10
        cse_tmp_66 = (49589822592 // 48828125) * 19567325.350342114 * cse_tmp_2
        cse_tmp_67 = cse_tmp_66 / cse_tmp_18 ^ 11
        cse_tmp_68 = params_a_d_0 - params_a_d_1 + params_a_d_10 - params_a_d_11 + params_a_d_2 - params_a_d_3 + params_a_d_4 - params_a_d_5 + params_a_d_6 - params_a_d_7 + params_a_d_8 - params_a_d_9
        cse_tmp_69 = 0.007353585 * cse_tmp_5 / (0.00914625 * cse_tmp_5 + 0.804) + 1
        cse_tmp_70 = -120 * params_a_c_10
        cse_tmp_71 = 165 * params_a_c_11
        cse_tmp_72 = -4 * params_a_c_4
        cse_tmp_73 = 10 * params_a_c_5
        cse_tmp_74 = 35 * params_a_c_7
        cse_tmp_75 = -56 * params_a_c_8
        cse_tmp_76 = 84 * params_a_c_9
        cse_tmp_77 = cse_tmp_70 + cse_tmp_71 + cse_tmp_72 + cse_tmp_73 + cse_tmp_74 + cse_tmp_75 + cse_tmp_76 + params_a_c_3 - 20 * params_a_c_6
        cse_tmp_78 = 210 * params_a_c_10
        cse_tmp_79 = 462 * params_a_c_11
        cse_tmp_80 = 7 * params_a_c_7
        cse_tmp_81 = 28 * params_a_c_8
        cse_tmp_82 = -cse_tmp_76 + cse_tmp_78 - cse_tmp_79 - cse_tmp_80 + cse_tmp_81 + params_a_c_6
        cse_tmp_83 = -10 * params_a_c_10
        cse_tmp_84 = 55 * params_a_c_11
        cse_tmp_85 = cse_tmp_83 + cse_tmp_84 + params_a_c_9
        cse_tmp_86 = 11 * params_a_c_11
        cse_tmp_87 = 3 * params_a_c_3
        cse_tmp_88 = 5 * params_a_c_5
        cse_tmp_89 = -6 * params_a_c_6
        cse_tmp_90 = -8 * params_a_c_8
        cse_tmp_91 = 9 * params_a_c_9
        cse_tmp_92 = cse_tmp_72 + cse_tmp_80 + cse_tmp_83 + cse_tmp_86 + cse_tmp_87 + cse_tmp_88 + cse_tmp_89 + cse_tmp_90 + cse_tmp_91 + params_a_c_1 - 2 * params_a_c_2
        cse_tmp_93 = 45 * params_a_c_10
        cse_tmp_94 = 15 * params_a_c_6
        cse_tmp_95 = 21 * params_a_c_7
        cse_tmp_96 = 36 * params_a_c_9
        cse_tmp_97 = -cse_tmp_73 + cse_tmp_81 - cse_tmp_84 - cse_tmp_87 + cse_tmp_93 + cse_tmp_94 - cse_tmp_95 - cse_tmp_96 + params_a_c_2 + 6 * params_a_c_4
        cse_tmp_98 = 330 * params_a_c_11
        cse_tmp_99 = 126 * params_a_c_9
        cse_tmp_100 = -cse_tmp_74 + cse_tmp_78 - cse_tmp_88 + cse_tmp_94 - cse_tmp_98 - cse_tmp_99 + params_a_c_4 + 70 * params_a_c_8
        cse_tmp_101 = cse_tmp_75 + cse_tmp_79 + cse_tmp_89 + cse_tmp_95 + cse_tmp_99 - 252 * params_a_c_10 + params_a_c_5
        cse_tmp_102 = cse_tmp_70 + cse_tmp_90 + cse_tmp_96 + cse_tmp_98 + params_a_c_7
        cse_tmp_103 = -cse_tmp_71 - cse_tmp_91 + cse_tmp_93 + params_a_c_8
        cse_tmp_104 = -cse_tmp_86 + params_a_c_10
        cse_tmp_105 = params_a_c_0 - params_a_c_1 + params_a_c_10 - params_a_c_11 + params_a_c_2 - params_a_c_3 + params_a_c_4 - params_a_c_5 + params_a_c_6 - params_a_c_7 + params_a_c_8 - params_a_c_9
        cse_tmp_106 = cse_tmp_0 <= zeta_threshold
        cse_tmp_107 = zeta_threshold - 1
        cse_tmp_108 = 1 - z
        cse_tmp_109 = cse_tmp_108 <= zeta_threshold
        cse_tmp_110 = -cse_tmp_107
        cse_tmp_111 = my_piecewise5(cse_tmp_106, cse_tmp_107, cse_tmp_109, cse_tmp_110, z)
        cse_tmp_112 = cse_tmp_111 + 1
        cse_tmp_113 = cse_tmp_112 <= zeta_threshold
        cse_tmp_114 = NaNMath.pow(zeta_threshold, 0.3333333333333333) - 1
        cse_tmp_115 = 0.6827840632552957
        cse_tmp_116 = 1.5874010519681994 * 1.4422495703074083 * cam_omega * cse_tmp_115 * rs / 6
        cse_tmp_117 = cse_tmp_116 / (my_piecewise3(cse_tmp_113, cse_tmp_114, xc_expm1(xc_log1p(my_piecewise3(cse_tmp_111 > cse_tmp_107, cse_tmp_111, cse_tmp_107)) / 3)) + 1)
        cse_tmp_118 = cse_tmp_117 >= 1.35
        cse_tmp_119 = cse_tmp_117 > 1.35
        cse_tmp_120 = my_piecewise3(cse_tmp_119, cse_tmp_117, 1.35)
        cse_tmp_121 = 1 / (44590694400 * cse_tmp_120 ^ 14)
        cse_tmp_122 = 1 / (1073479680 * cse_tmp_120 ^ 12)
        cse_tmp_123 = 1 / (28385280 * cse_tmp_120 ^ 10)
        cse_tmp_124 = 1 / (829440 * cse_tmp_120 ^ 8)
        cse_tmp_125 = 1 / (26880 * cse_tmp_120 ^ 6)
        cse_tmp_126 = 1 / (960 * cse_tmp_120 ^ 4)
        cse_tmp_127 = 1 / (36 * cse_tmp_120 ^ 2)
        cse_tmp_128 = my_piecewise3(cse_tmp_119, 1.35, cse_tmp_117)
        cse_tmp_129 = 1.772453850905516
        cse_tmp_130 = cse_tmp_128 ^ 2
        cse_tmp_131 = xc_expm1(-1 / (4 * cse_tmp_130))
        cse_tmp_132 = (8 // 3) * cse_tmp_128 * (2 * cse_tmp_128 * (-2 * cse_tmp_130 * cse_tmp_131 + cse_tmp_131 - 1 // 2) + cse_tmp_129 * erf(1 / (2 * cse_tmp_128)))
        cse_tmp_133 = -120 * params_a_b_10
        cse_tmp_134 = 165 * params_a_b_11
        cse_tmp_135 = -4 * params_a_b_4
        cse_tmp_136 = 10 * params_a_b_5
        cse_tmp_137 = 35 * params_a_b_7
        cse_tmp_138 = -56 * params_a_b_8
        cse_tmp_139 = 84 * params_a_b_9
        cse_tmp_140 = cse_tmp_133 + cse_tmp_134 + cse_tmp_135 + cse_tmp_136 + cse_tmp_137 + cse_tmp_138 + cse_tmp_139 + params_a_b_3 - 20 * params_a_b_6
        cse_tmp_141 = 210 * params_a_b_10
        cse_tmp_142 = 462 * params_a_b_11
        cse_tmp_143 = 7 * params_a_b_7
        cse_tmp_144 = 28 * params_a_b_8
        cse_tmp_145 = -cse_tmp_139 + cse_tmp_141 - cse_tmp_142 - cse_tmp_143 + cse_tmp_144 + params_a_b_6
        cse_tmp_146 = -10 * params_a_b_10
        cse_tmp_147 = 55 * params_a_b_11
        cse_tmp_148 = cse_tmp_146 + cse_tmp_147 + params_a_b_9
        cse_tmp_149 = 11 * params_a_b_11
        cse_tmp_150 = 3 * params_a_b_3
        cse_tmp_151 = 5 * params_a_b_5
        cse_tmp_152 = -6 * params_a_b_6
        cse_tmp_153 = -8 * params_a_b_8
        cse_tmp_154 = 9 * params_a_b_9
        cse_tmp_155 = cse_tmp_135 + cse_tmp_143 + cse_tmp_146 + cse_tmp_149 + cse_tmp_150 + cse_tmp_151 + cse_tmp_152 + cse_tmp_153 + cse_tmp_154 + params_a_b_1 - 2 * params_a_b_2
        cse_tmp_156 = 45 * params_a_b_10
        cse_tmp_157 = 15 * params_a_b_6
        cse_tmp_158 = 21 * params_a_b_7
        cse_tmp_159 = 36 * params_a_b_9
        cse_tmp_160 = -cse_tmp_136 + cse_tmp_144 - cse_tmp_147 - cse_tmp_150 + cse_tmp_156 + cse_tmp_157 - cse_tmp_158 - cse_tmp_159 + params_a_b_2 + 6 * params_a_b_4
        cse_tmp_161 = 330 * params_a_b_11
        cse_tmp_162 = 126 * params_a_b_9
        cse_tmp_163 = -cse_tmp_137 + cse_tmp_141 - cse_tmp_151 + cse_tmp_157 - cse_tmp_161 - cse_tmp_162 + params_a_b_4 + 70 * params_a_b_8
        cse_tmp_164 = cse_tmp_138 + cse_tmp_142 + cse_tmp_152 + cse_tmp_158 + cse_tmp_162 - 252 * params_a_b_10 + params_a_b_5
        cse_tmp_165 = cse_tmp_133 + cse_tmp_153 + cse_tmp_159 + cse_tmp_161 + params_a_b_7
        cse_tmp_166 = -cse_tmp_134 - cse_tmp_154 + cse_tmp_156 + params_a_b_8
        cse_tmp_167 = -cse_tmp_149 + params_a_b_10
        cse_tmp_168 = params_a_b_0 - params_a_b_1 + params_a_b_10 - params_a_b_11 + params_a_b_2 - params_a_b_3 + params_a_b_4 - params_a_b_5 + params_a_b_6 - params_a_b_7 + params_a_b_8 - params_a_b_9
        cse_tmp_169 = -120 * params_a_a_10
        cse_tmp_170 = 165 * params_a_a_11
        cse_tmp_171 = -4 * params_a_a_4
        cse_tmp_172 = 10 * params_a_a_5
        cse_tmp_173 = 35 * params_a_a_7
        cse_tmp_174 = -56 * params_a_a_8
        cse_tmp_175 = 84 * params_a_a_9
        cse_tmp_176 = cse_tmp_169 + cse_tmp_170 + cse_tmp_171 + cse_tmp_172 + cse_tmp_173 + cse_tmp_174 + cse_tmp_175 + params_a_a_3 - 20 * params_a_a_6
        cse_tmp_177 = 210 * params_a_a_10
        cse_tmp_178 = 462 * params_a_a_11
        cse_tmp_179 = 7 * params_a_a_7
        cse_tmp_180 = 28 * params_a_a_8
        cse_tmp_181 = -cse_tmp_175 + cse_tmp_177 - cse_tmp_178 - cse_tmp_179 + cse_tmp_180 + params_a_a_6
        cse_tmp_182 = -10 * params_a_a_10
        cse_tmp_183 = 55 * params_a_a_11
        cse_tmp_184 = cse_tmp_182 + cse_tmp_183 + params_a_a_9
        cse_tmp_185 = 11 * params_a_a_11
        cse_tmp_186 = 3 * params_a_a_3
        cse_tmp_187 = 5 * params_a_a_5
        cse_tmp_188 = -6 * params_a_a_6
        cse_tmp_189 = -8 * params_a_a_8
        cse_tmp_190 = 9 * params_a_a_9
        cse_tmp_191 = cse_tmp_171 + cse_tmp_179 + cse_tmp_182 + cse_tmp_185 + cse_tmp_186 + cse_tmp_187 + cse_tmp_188 + cse_tmp_189 + cse_tmp_190 + params_a_a_1 - 2 * params_a_a_2
        cse_tmp_192 = 45 * params_a_a_10
        cse_tmp_193 = 15 * params_a_a_6
        cse_tmp_194 = 21 * params_a_a_7
        cse_tmp_195 = 36 * params_a_a_9
        cse_tmp_196 = -cse_tmp_172 + cse_tmp_180 - cse_tmp_183 - cse_tmp_186 + cse_tmp_192 + cse_tmp_193 - cse_tmp_194 - cse_tmp_195 + params_a_a_2 + 6 * params_a_a_4
        cse_tmp_197 = 330 * params_a_a_11
        cse_tmp_198 = 126 * params_a_a_9
        cse_tmp_199 = -cse_tmp_173 + cse_tmp_177 - cse_tmp_187 + cse_tmp_193 - cse_tmp_197 - cse_tmp_198 + params_a_a_4 + 70 * params_a_a_8
        cse_tmp_200 = cse_tmp_174 + cse_tmp_178 + cse_tmp_188 + cse_tmp_194 + cse_tmp_198 - 252 * params_a_a_10 + params_a_a_5
        cse_tmp_201 = cse_tmp_169 + cse_tmp_189 + cse_tmp_195 + cse_tmp_197 + params_a_a_7
        cse_tmp_202 = -cse_tmp_170 - cse_tmp_190 + cse_tmp_192 + params_a_a_8
        cse_tmp_203 = -cse_tmp_185 + params_a_a_10
        cse_tmp_204 = params_a_a_0 - params_a_a_1 + params_a_a_10 - params_a_a_11 + params_a_a_2 - params_a_a_3 + params_a_a_4 - params_a_a_5 + params_a_a_6 - params_a_a_7 + params_a_a_8 - params_a_a_9
        cse_tmp_205 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_206 = 0.184639691595506 * cse_tmp_115 * cse_tmp_2 / rs
        cse_tmp_207 = cse_tmp_4 * xs1 ^ 2
        cse_tmp_208 = 1 - 0.552 * xc_expm1(-0.00931890022067156 * cse_tmp_207)
        cse_tmp_209 = cse_tmp_17 + t1
        cse_tmp_210 = cse_tmp_19 / cse_tmp_209 ^ 3
        cse_tmp_211 = cse_tmp_26 / cse_tmp_209 ^ 6
        cse_tmp_212 = cse_tmp_31 / cse_tmp_209 ^ 9
        cse_tmp_213 = cse_tmp_40 / cse_tmp_209
        cse_tmp_214 = cse_tmp_47 / cse_tmp_209 ^ 2
        cse_tmp_215 = cse_tmp_52 / cse_tmp_209 ^ 4
        cse_tmp_216 = cse_tmp_55 / cse_tmp_209 ^ 5
        cse_tmp_217 = cse_tmp_58 / cse_tmp_209 ^ 7
        cse_tmp_218 = cse_tmp_61 / cse_tmp_209 ^ 8
        cse_tmp_219 = cse_tmp_64 / cse_tmp_209 ^ 10
        cse_tmp_220 = cse_tmp_66 / cse_tmp_209 ^ 11
        cse_tmp_221 = 0.007353585 * cse_tmp_207 / (0.00914625 * cse_tmp_207 + 0.804) + 1
        cse_tmp_222 = my_piecewise5(cse_tmp_109, cse_tmp_107, cse_tmp_106, cse_tmp_110, -z)
        cse_tmp_223 = cse_tmp_222 + 1
        cse_tmp_224 = cse_tmp_223 <= zeta_threshold
        cse_tmp_225 = cse_tmp_116 / (my_piecewise3(cse_tmp_224, cse_tmp_114, xc_expm1(xc_log1p(my_piecewise3(cse_tmp_222 > cse_tmp_107, cse_tmp_222, cse_tmp_107)) / 3)) + 1)
        cse_tmp_226 = cse_tmp_225 >= 1.35
        cse_tmp_227 = cse_tmp_225 > 1.35
        cse_tmp_228 = my_piecewise3(cse_tmp_227, cse_tmp_225, 1.35)
        cse_tmp_229 = 1 / (44590694400 * cse_tmp_228 ^ 14)
        cse_tmp_230 = 1 / (1073479680 * cse_tmp_228 ^ 12)
        cse_tmp_231 = 1 / (28385280 * cse_tmp_228 ^ 10)
        cse_tmp_232 = 1 / (829440 * cse_tmp_228 ^ 8)
        cse_tmp_233 = 1 / (26880 * cse_tmp_228 ^ 6)
        cse_tmp_234 = 1 / (960 * cse_tmp_228 ^ 4)
        cse_tmp_235 = 1 / (36 * cse_tmp_228 ^ 2)
        cse_tmp_236 = my_piecewise3(cse_tmp_227, 1.35, cse_tmp_225)
        cse_tmp_237 = cse_tmp_236 ^ 2
        cse_tmp_238 = xc_expm1(-1 / (4 * cse_tmp_237))
        cse_tmp_239 = (8 // 3) * cse_tmp_236 * (cse_tmp_129 * erf(1 / (2 * cse_tmp_236)) + 2 * cse_tmp_236 * (-2 * cse_tmp_237 * cse_tmp_238 + cse_tmp_238 - 1 // 2))
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_206 * ((cse_tmp_6 * (cse_tmp_14 * cse_tmp_20 + cse_tmp_25 * cse_tmp_27 + cse_tmp_30 * cse_tmp_32 + cse_tmp_39 * cse_tmp_41 + cse_tmp_46 * cse_tmp_48 + cse_tmp_51 * cse_tmp_53 + cse_tmp_54 * cse_tmp_56 + cse_tmp_57 * cse_tmp_59 + cse_tmp_60 * cse_tmp_62 + cse_tmp_63 * cse_tmp_65 + cse_tmp_67 * params_a_d_11 + cse_tmp_68) + cse_tmp_69 * (cse_tmp_100 * cse_tmp_53 + cse_tmp_101 * cse_tmp_56 + cse_tmp_102 * cse_tmp_59 + cse_tmp_103 * cse_tmp_62 + cse_tmp_104 * cse_tmp_65 + cse_tmp_105 + cse_tmp_20 * cse_tmp_77 + cse_tmp_27 * cse_tmp_82 + cse_tmp_32 * cse_tmp_85 + cse_tmp_41 * cse_tmp_92 + cse_tmp_48 * cse_tmp_97 + cse_tmp_67 * params_a_c_11)) * my_piecewise3(cse_tmp_118, -cse_tmp_121 + cse_tmp_122 - cse_tmp_123 + cse_tmp_124 - cse_tmp_125 + cse_tmp_126 - cse_tmp_127 + 1, cse_tmp_132) + (cse_tmp_6 * (cse_tmp_140 * cse_tmp_20 + cse_tmp_145 * cse_tmp_27 + cse_tmp_148 * cse_tmp_32 + cse_tmp_155 * cse_tmp_41 + cse_tmp_160 * cse_tmp_48 + cse_tmp_163 * cse_tmp_53 + cse_tmp_164 * cse_tmp_56 + cse_tmp_165 * cse_tmp_59 + cse_tmp_166 * cse_tmp_62 + cse_tmp_167 * cse_tmp_65 + cse_tmp_168 + cse_tmp_67 * params_a_b_11) + cse_tmp_69 * (cse_tmp_176 * cse_tmp_20 + cse_tmp_181 * cse_tmp_27 + cse_tmp_184 * cse_tmp_32 + cse_tmp_191 * cse_tmp_41 + cse_tmp_196 * cse_tmp_48 + cse_tmp_199 * cse_tmp_53 + cse_tmp_200 * cse_tmp_56 + cse_tmp_201 * cse_tmp_59 + cse_tmp_202 * cse_tmp_62 + cse_tmp_203 * cse_tmp_65 + cse_tmp_204 + cse_tmp_67 * params_a_a_11)) * my_piecewise3(cse_tmp_118, cse_tmp_121 - cse_tmp_122 + cse_tmp_123 - cse_tmp_124 + cse_tmp_125 - cse_tmp_126 + cse_tmp_127, 1 - cse_tmp_132)) * my_piecewise3(cse_tmp_113, cse_tmp_205, NaNMath.pow(cse_tmp_112, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_108 <= dens_threshold, 0, -cse_tmp_206 * ((cse_tmp_208 * (cse_tmp_14 * cse_tmp_210 + cse_tmp_211 * cse_tmp_25 + cse_tmp_212 * cse_tmp_30 + cse_tmp_213 * cse_tmp_39 + cse_tmp_214 * cse_tmp_46 + cse_tmp_215 * cse_tmp_51 + cse_tmp_216 * cse_tmp_54 + cse_tmp_217 * cse_tmp_57 + cse_tmp_218 * cse_tmp_60 + cse_tmp_219 * cse_tmp_63 + cse_tmp_220 * params_a_d_11 + cse_tmp_68) + cse_tmp_221 * (cse_tmp_100 * cse_tmp_215 + cse_tmp_101 * cse_tmp_216 + cse_tmp_102 * cse_tmp_217 + cse_tmp_103 * cse_tmp_218 + cse_tmp_104 * cse_tmp_219 + cse_tmp_105 + cse_tmp_210 * cse_tmp_77 + cse_tmp_211 * cse_tmp_82 + cse_tmp_212 * cse_tmp_85 + cse_tmp_213 * cse_tmp_92 + cse_tmp_214 * cse_tmp_97 + cse_tmp_220 * params_a_c_11)) * my_piecewise3(cse_tmp_226, -cse_tmp_229 + cse_tmp_230 - cse_tmp_231 + cse_tmp_232 - cse_tmp_233 + cse_tmp_234 - cse_tmp_235 + 1, cse_tmp_239) + (cse_tmp_208 * (cse_tmp_140 * cse_tmp_210 + cse_tmp_145 * cse_tmp_211 + cse_tmp_148 * cse_tmp_212 + cse_tmp_155 * cse_tmp_213 + cse_tmp_160 * cse_tmp_214 + cse_tmp_163 * cse_tmp_215 + cse_tmp_164 * cse_tmp_216 + cse_tmp_165 * cse_tmp_217 + cse_tmp_166 * cse_tmp_218 + cse_tmp_167 * cse_tmp_219 + cse_tmp_168 + cse_tmp_220 * params_a_b_11) + cse_tmp_221 * (cse_tmp_176 * cse_tmp_210 + cse_tmp_181 * cse_tmp_211 + cse_tmp_184 * cse_tmp_212 + cse_tmp_191 * cse_tmp_213 + cse_tmp_196 * cse_tmp_214 + cse_tmp_199 * cse_tmp_215 + cse_tmp_200 * cse_tmp_216 + cse_tmp_201 * cse_tmp_217 + cse_tmp_202 * cse_tmp_218 + cse_tmp_203 * cse_tmp_219 + cse_tmp_204 + cse_tmp_220 * params_a_a_11)) * my_piecewise3(cse_tmp_226, cse_tmp_229 - cse_tmp_230 + cse_tmp_231 - cse_tmp_232 + cse_tmp_233 - cse_tmp_234 + cse_tmp_235, 1 - cse_tmp_239)) * my_piecewise3(cse_tmp_224, cse_tmp_205, NaNMath.pow(cse_tmp_223, 1.3333333333333333)))
    end
end
export mgga_x_m11_l_energy

const mgga_x_m11_l_defaults = (cam_omega = 0.25, dens_threshold = 1.0e-13, params_a_a_0 = 0.8121131, params_a_a_1 = 17.38124, params_a_a_2 = 1.154007, params_a_a_3 = 68.69556, params_a_a_4 = 101.6864, params_a_a_5 = -5.887467, params_a_a_6 = 45.17409, params_a_a_7 = -2.773149, params_a_a_8 = -26.17211, params_a_a_9 = 0.0, params_a_a_10 = 0.0, params_a_a_11 = 0.0, params_a_b_0 = 0.1878869, params_a_b_1 = -16.53877, params_a_b_2 = 0.6755753, params_a_b_3 = -75.67572, params_a_b_4 = -104.0272, params_a_b_5 = 18.31853, params_a_b_6 = -55.73352, params_a_b_7 = -3.52021, params_a_b_8 = 37.24276, params_a_b_9 = 0.0, params_a_b_10 = 0.0, params_a_b_11 = 0.0, params_a_c_0 = -0.4386615, params_a_c_1 = -121.4016, params_a_c_2 = -139.3573, params_a_c_3 = -2.046649, params_a_c_4 = 28.04098, params_a_c_5 = -13.12258, params_a_c_6 = -6.361819, params_a_c_7 = -0.8055758, params_a_c_8 = 3.736551, params_a_c_9 = 0.0, params_a_c_10 = 0.0, params_a_c_11 = 0.0, params_a_d_0 = 1.438662, params_a_d_1 = 120.9465, params_a_d_2 = 132.8252, params_a_d_3 = 12.96355, params_a_d_4 = 5.854866, params_a_d_5 = -3.378162, params_a_d_6 = -44.23393, params_a_d_7 = 6.844475, params_a_d_8 = 19.49541, params_a_d_9 = 0.0, params_a_d_10 = 0.0, params_a_d_11 = 0.0, zeta_threshold = 2.220446049250313e-16)
const mgga_x_m11_l_required = ()

function mgga_x_m11_l(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_m11_l_defaults, mgga_x_m11_l_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_m11_l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.cam_omega, p.dens_threshold, p.params_a_a_0, p.params_a_a_1, p.params_a_a_2, p.params_a_a_3, p.params_a_a_4, p.params_a_a_5, p.params_a_a_6, p.params_a_a_7, p.params_a_a_8, p.params_a_a_9, p.params_a_a_10, p.params_a_a_11, p.params_a_b_0, p.params_a_b_1, p.params_a_b_2, p.params_a_b_3, p.params_a_b_4, p.params_a_b_5, p.params_a_b_6, p.params_a_b_7, p.params_a_b_8, p.params_a_b_9, p.params_a_b_10, p.params_a_b_11, p.params_a_c_0, p.params_a_c_1, p.params_a_c_2, p.params_a_c_3, p.params_a_c_4, p.params_a_c_5, p.params_a_c_6, p.params_a_c_7, p.params_a_c_8, p.params_a_c_9, p.params_a_c_10, p.params_a_c_11, p.params_a_d_0, p.params_a_d_1, p.params_a_d_2, p.params_a_d_3, p.params_a_d_4, p.params_a_d_5, p.params_a_d_6, p.params_a_d_7, p.params_a_d_8, p.params_a_d_9, p.params_a_d_10, p.params_a_d_11, p.zeta_threshold)
end

function mgga_x_m11_l(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_m11_l_defaults, mgga_x_m11_l_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_m11_l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.cam_omega, p.dens_threshold, p.params_a_a_0, p.params_a_a_1, p.params_a_a_2, p.params_a_a_3, p.params_a_a_4, p.params_a_a_5, p.params_a_a_6, p.params_a_a_7, p.params_a_a_8, p.params_a_a_9, p.params_a_a_10, p.params_a_a_11, p.params_a_b_0, p.params_a_b_1, p.params_a_b_2, p.params_a_b_3, p.params_a_b_4, p.params_a_b_5, p.params_a_b_6, p.params_a_b_7, p.params_a_b_8, p.params_a_b_9, p.params_a_b_10, p.params_a_b_11, p.params_a_c_0, p.params_a_c_1, p.params_a_c_2, p.params_a_c_3, p.params_a_c_4, p.params_a_c_5, p.params_a_c_6, p.params_a_c_7, p.params_a_c_8, p.params_a_c_9, p.params_a_c_10, p.params_a_c_11, p.params_a_d_0, p.params_a_d_1, p.params_a_d_2, p.params_a_d_3, p.params_a_d_4, p.params_a_d_5, p.params_a_d_6, p.params_a_d_7, p.params_a_d_8, p.params_a_d_9, p.params_a_d_10, p.params_a_d_11, p.zeta_threshold)
end

export mgga_x_m11_l, mgga_x_m11_l_defaults, mgga_x_m11_l_required
