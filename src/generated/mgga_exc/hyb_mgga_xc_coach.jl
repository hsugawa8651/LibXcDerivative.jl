# Auto-generated from the Libxc sources
# python/mgga_exc/hyb_mgga_xc_coach.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, XC_EPSILON, cam_omega, dens_threshold, zeta_threshold
const hyb_mgga_xc_coach_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, XC_EPSILON, cam_omega, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_2 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_5 = xs0 ^ 2
        cse_tmp_6 = 0.01 * cse_tmp_5
        cse_tmp_7 = cse_tmp_6 + 1
        cse_tmp_8 = cse_tmp_7 ^ (-1)
        cse_tmp_9 = cse_tmp_5 * cse_tmp_8
        cse_tmp_10 = xs0 ^ 8
        cse_tmp_11 = cse_tmp_10 / cse_tmp_7 ^ 4
        cse_tmp_12 = xs0 ^ 14
        cse_tmp_13 = 3.3019272488946267
        cse_tmp_14 = 4.60115111447049
        cse_tmp_15 = (3 // 10) * cse_tmp_13 * cse_tmp_14
        cse_tmp_16 = (cse_tmp_15 + t0) ^ (-1)
        cse_tmp_17 = cse_tmp_5 / 8
        cse_tmp_18 = -cse_tmp_17 + t0
        cse_tmp_19 = cse_tmp_16 * cse_tmp_18
        cse_tmp_20 = 2 * cse_tmp_19
        cse_tmp_21 = cse_tmp_20 - 1
        cse_tmp_22 = cse_tmp_21 ^ 2
        cse_tmp_23 = cse_tmp_21 ^ 3
        cse_tmp_24 = cse_tmp_21 ^ 4
        cse_tmp_25 = cse_tmp_21 ^ 5
        cse_tmp_26 = cse_tmp_21 ^ 6
        cse_tmp_27 = cse_tmp_21 ^ 7
        cse_tmp_28 = cse_tmp_21 ^ 8
        cse_tmp_29 = xs0 ^ 4
        cse_tmp_30 = cse_tmp_29 / cse_tmp_7 ^ 2
        cse_tmp_31 = cse_tmp_6 * cse_tmp_8
        cse_tmp_32 = 1.0e-8 * cse_tmp_11
        cse_tmp_33 = 0.0001 * cse_tmp_30
        cse_tmp_34 = xs0 ^ 6
        cse_tmp_35 = 1.0e-6 * cse_tmp_34 / cse_tmp_7 ^ 3
        cse_tmp_36 = cse_tmp_21 ^ 9
        cse_tmp_37 = cse_tmp_21 ^ 11
        cse_tmp_38 = zeta_threshold - 1
        cse_tmp_39 = xc_log1p(my_piecewise3(z > cse_tmp_38, z, cse_tmp_38))
        cse_tmp_40 = 0.01328816518 * rs
        cse_tmp_41 = 1.2599210498948732
        cse_tmp_42 = NaNMath.pow(zeta_threshold, 0.3333333333333333)
        cse_tmp_43 = -1 + cse_tmp_42 ^ (-1)
        cse_tmp_44 = my_piecewise3(cse_tmp_0 <= zeta_threshold, cse_tmp_43, xc_expm1(-cse_tmp_39 / 3)) + 1
        cse_tmp_45 = cse_tmp_41 * cse_tmp_44
        cse_tmp_46 = 0.22308199064 * rs
        cse_tmp_47 = NaNMath.sqrt(rs)
        cse_tmp_48 = 0.47231125998 * cse_tmp_47
        cse_tmp_49 = 1.122462048309373
        cse_tmp_50 = NaNMath.sqrt(cse_tmp_44) * cse_tmp_49
        cse_tmp_51 = NaNMath.pow(rs, 1.5)
        cse_tmp_52 = 0.10186556948 * cse_tmp_51
        cse_tmp_53 = 1.4142135623730951
        cse_tmp_54 = NaNMath.pow(cse_tmp_44, 1.5) * cse_tmp_53
        cse_tmp_55 = rs ^ 2
        cse_tmp_56 = 0.030651699316 * cse_tmp_55
        cse_tmp_57 = 1.5874010519681994
        cse_tmp_58 = cse_tmp_44 ^ 2 * cse_tmp_57
        cse_tmp_59 = (-cse_tmp_40 * cse_tmp_45 - 0.0621814) * xc_log1p((cse_tmp_45 * cse_tmp_46 + cse_tmp_48 * cse_tmp_50 + cse_tmp_52 * cse_tmp_54 + cse_tmp_56 * cse_tmp_58) ^ (-1))
        cse_tmp_60 = 0.00375733525 * rs
        cse_tmp_61 = 0.12236585478 * rs
        cse_tmp_62 = 0.3497952466 * cse_tmp_47
        cse_tmp_63 = 0.029729725188 * cse_tmp_51
        cse_tmp_64 = 0.016775784198 * cse_tmp_55
        cse_tmp_65 = 0.5848223622634646207262238663759 * (-cse_tmp_45 * cse_tmp_60 - 0.0337738) * xc_log1p((cse_tmp_45 * cse_tmp_61 + cse_tmp_50 * cse_tmp_62 + cse_tmp_54 * cse_tmp_63 + cse_tmp_58 * cse_tmp_64) ^ (-1))
        cse_tmp_66 = (2 * cse_tmp_41 - 2) ^ (-1)
        cse_tmp_67 = 2 <= zeta_threshold
        cse_tmp_68 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_69 = cse_tmp_68 - 1
        cse_tmp_70 = xc_log1p(my_piecewise3(1 > cse_tmp_38, 1, cse_tmp_38))
        cse_tmp_71 = cse_tmp_66 * (cse_tmp_69 + my_piecewise3(cse_tmp_67, cse_tmp_69, xc_expm1((4 // 3) * cse_tmp_70)))
        cse_tmp_72 = 0.006388517036 * rs
        cse_tmp_73 = 0.19269083139 * rs
        cse_tmp_74 = 0.43896648423 * cse_tmp_47
        cse_tmp_75 = 0.10465751434 * cse_tmp_51
        cse_tmp_76 = 0.019436972919 * cse_tmp_55
        cse_tmp_77 = NaNMath.pow(zeta_threshold, 0.6666666666666666)
        cse_tmp_78 = cse_tmp_77 - 1
        cse_tmp_79 = cse_tmp_77 / 2 + my_piecewise3(cse_tmp_67, cse_tmp_78, xc_expm1((2 // 3) * cse_tmp_70)) / 2 + 1 // 2
        cse_tmp_80 = cse_tmp_79 ^ 3
        cse_tmp_81 = 9.869604401089358
        cse_tmp_82 = 1 - NaNMath.log(2)
        cse_tmp_83 = cse_tmp_81 / cse_tmp_82
        cse_tmp_84 = cse_tmp_83 / cse_tmp_80
        cse_tmp_85 = cse_tmp_84 * (cse_tmp_59 - cse_tmp_65 * cse_tmp_71 + cse_tmp_71 * (-cse_tmp_59 + cse_tmp_65 + (-cse_tmp_45 * cse_tmp_72 - 0.0310907) * xc_log1p((cse_tmp_45 * cse_tmp_73 + cse_tmp_50 * cse_tmp_74 + cse_tmp_54 * cse_tmp_75 + cse_tmp_58 * cse_tmp_76) ^ (-1))))
        cse_tmp_86 = 0.1778 * rs
        cse_tmp_87 = 0.0066724550603149224 * rs
        cse_tmp_88 = rs ^ (-1)
        cse_tmp_89 = cse_tmp_83 * cse_tmp_88
        cse_tmp_90 = cse_tmp_89 / cse_tmp_79 ^ 2
        cse_tmp_91 = cse_tmp_81 ^ (-1)
        cse_tmp_92 = cse_tmp_80 * cse_tmp_82 * cse_tmp_91 / 2
        cse_tmp_93 = my_piecewise3(cse_tmp_0 <= zeta_threshold || cse_tmp_0 * cse_tmp_2 <= dens_threshold, 0, cse_tmp_92 * (my_piecewise3(cse_tmp_0 <= zeta_threshold, cse_tmp_38, xc_expm1(cse_tmp_39)) + 1) * xc_log1p(xc_expm1(cse_tmp_85) / NaNMath.pow(cse_tmp_17 * cse_tmp_90 * (cse_tmp_45 * cse_tmp_87 + 0.06672455060314922) / (cse_tmp_44 * (cse_tmp_45 * cse_tmp_86 + 1) * xc_expm1(-cse_tmp_85)) + 1, 0.25)))
        cse_tmp_94 = 1 - z
        cse_tmp_98 = xs1 ^ 2
        cse_tmp_99 = 0.01 * cse_tmp_98
        cse_tmp_100 = cse_tmp_99 + 1
        cse_tmp_101 = cse_tmp_100 ^ (-1)
        cse_tmp_102 = cse_tmp_101 * cse_tmp_98
        cse_tmp_103 = xs1 ^ 8
        cse_tmp_104 = cse_tmp_103 / cse_tmp_100 ^ 4
        cse_tmp_105 = xs1 ^ 14
        cse_tmp_106 = (cse_tmp_15 + t1) ^ (-1)
        cse_tmp_107 = cse_tmp_98 / 8
        cse_tmp_108 = -cse_tmp_107 + t1
        cse_tmp_109 = cse_tmp_106 * cse_tmp_108
        cse_tmp_110 = 2 * cse_tmp_109
        cse_tmp_111 = cse_tmp_110 - 1
        cse_tmp_112 = cse_tmp_111 ^ 2
        cse_tmp_113 = cse_tmp_111 ^ 3
        cse_tmp_114 = cse_tmp_111 ^ 4
        cse_tmp_115 = cse_tmp_111 ^ 5
        cse_tmp_116 = cse_tmp_111 ^ 6
        cse_tmp_117 = cse_tmp_111 ^ 7
        cse_tmp_118 = cse_tmp_111 ^ 8
        cse_tmp_119 = xs1 ^ 4
        cse_tmp_120 = cse_tmp_119 / cse_tmp_100 ^ 2
        cse_tmp_121 = cse_tmp_101 * cse_tmp_99
        cse_tmp_122 = 1.0e-8 * cse_tmp_104
        cse_tmp_123 = 0.0001 * cse_tmp_120
        cse_tmp_124 = xs1 ^ 6
        cse_tmp_125 = 1.0e-6 * cse_tmp_124 / cse_tmp_100 ^ 3
        cse_tmp_126 = cse_tmp_111 ^ 9
        cse_tmp_127 = cse_tmp_111 ^ 11
        cse_tmp_128 = -z
        cse_tmp_129 = xc_log1p(my_piecewise3(cse_tmp_128 > cse_tmp_38, cse_tmp_128, cse_tmp_38))
        cse_tmp_130 = my_piecewise3(cse_tmp_94 <= zeta_threshold, cse_tmp_43, xc_expm1(-cse_tmp_129 / 3)) + 1
        cse_tmp_131 = cse_tmp_130 * cse_tmp_41
        cse_tmp_132 = NaNMath.sqrt(cse_tmp_130) * cse_tmp_49
        cse_tmp_133 = NaNMath.pow(cse_tmp_130, 1.5) * cse_tmp_53
        cse_tmp_134 = cse_tmp_130 ^ 2 * cse_tmp_57
        cse_tmp_135 = (-cse_tmp_131 * cse_tmp_40 - 0.0621814) * xc_log1p((cse_tmp_131 * cse_tmp_46 + cse_tmp_132 * cse_tmp_48 + cse_tmp_133 * cse_tmp_52 + cse_tmp_134 * cse_tmp_56) ^ (-1))
        cse_tmp_136 = 0.5848223622634646207262238663759 * (-cse_tmp_131 * cse_tmp_60 - 0.0337738) * xc_log1p((cse_tmp_131 * cse_tmp_61 + cse_tmp_132 * cse_tmp_62 + cse_tmp_133 * cse_tmp_63 + cse_tmp_134 * cse_tmp_64) ^ (-1))
        cse_tmp_137 = cse_tmp_84 * (cse_tmp_135 - cse_tmp_136 * cse_tmp_71 + cse_tmp_71 * (-cse_tmp_135 + cse_tmp_136 + (-cse_tmp_131 * cse_tmp_72 - 0.0310907) * xc_log1p((cse_tmp_131 * cse_tmp_73 + cse_tmp_132 * cse_tmp_74 + cse_tmp_133 * cse_tmp_75 + cse_tmp_134 * cse_tmp_76) ^ (-1))))
        cse_tmp_138 = my_piecewise3(cse_tmp_94 <= zeta_threshold || cse_tmp_2 * cse_tmp_94 <= dens_threshold, 0, cse_tmp_92 * (my_piecewise3(cse_tmp_94 <= zeta_threshold, cse_tmp_38, xc_expm1(cse_tmp_129)) + 1) * xc_log1p(xc_expm1(cse_tmp_137) / NaNMath.pow(cse_tmp_107 * cse_tmp_90 * (cse_tmp_131 * cse_tmp_87 + 0.06672455060314922) / (cse_tmp_130 * (cse_tmp_131 * cse_tmp_86 + 1) * xc_expm1(-cse_tmp_137)) + 1, 0.25)))
        cse_tmp_139 = 0.004 * cse_tmp_5
        cse_tmp_140 = cse_tmp_139 + 1
        cse_tmp_141 = cse_tmp_29 / cse_tmp_140 ^ 2
        cse_tmp_142 = cse_tmp_34 / cse_tmp_140 ^ 3
        cse_tmp_143 = 1.6e-5 * cse_tmp_141
        cse_tmp_144 = 6.4e-8 * cse_tmp_142
        cse_tmp_145 = cse_tmp_139 / cse_tmp_140
        cse_tmp_146 = 2.56e-10 * cse_tmp_10 / cse_tmp_140 ^ 4
        cse_tmp_147 = -cse_tmp_38
        cse_tmp_148 = my_piecewise5(cse_tmp_0 <= zeta_threshold, cse_tmp_38, cse_tmp_94 <= zeta_threshold, cse_tmp_147, z)
        cse_tmp_149 = cse_tmp_148 + 1
        cse_tmp_150 = cse_tmp_149 <= zeta_threshold
        cse_tmp_151 = cse_tmp_42 - 1
        cse_tmp_152 = 0.6827840632552957
        cse_tmp_153 = 1.4422495703074083 * cam_omega * cse_tmp_152 * cse_tmp_57 * rs / 6
        cse_tmp_154 = cse_tmp_153 / (my_piecewise3(cse_tmp_150, cse_tmp_151, xc_expm1(xc_log1p(my_piecewise3(cse_tmp_148 > cse_tmp_38, cse_tmp_148, cse_tmp_38)) / 3)) + 1)
        cse_tmp_155 = cse_tmp_154 > 1.35
        cse_tmp_156 = my_piecewise3(cse_tmp_155, cse_tmp_154, 1.35)
        cse_tmp_157 = my_piecewise3(cse_tmp_155, 1.35, cse_tmp_154)
        cse_tmp_158 = 1.772453850905516
        cse_tmp_159 = cse_tmp_157 ^ 2
        cse_tmp_160 = xc_expm1(-1 / (4 * cse_tmp_159))
        cse_tmp_161 = NaNMath.pow(XC_EPSILON, 1.3333333333333333)
        cse_tmp_162 = 0.0723850886717336 * NaNMath.pow(my_piecewise3(cse_tmp_5 > cse_tmp_161, cse_tmp_5, cse_tmp_161), 0.25)
        cse_tmp_163 = -1 / NaNMath.log(XC_EPSILON)
        cse_tmp_164 = 0.184639691595506 * 1.8171205928321397 * cse_tmp_152 * cse_tmp_88
        cse_tmp_165 = 0.004 * cse_tmp_98
        cse_tmp_166 = cse_tmp_165 + 1
        cse_tmp_167 = cse_tmp_119 / cse_tmp_166 ^ 2
        cse_tmp_168 = cse_tmp_124 / cse_tmp_166 ^ 3
        cse_tmp_169 = 1.6e-5 * cse_tmp_167
        cse_tmp_170 = 6.4e-8 * cse_tmp_168
        cse_tmp_171 = cse_tmp_165 / cse_tmp_166
        cse_tmp_172 = 2.56e-10 * cse_tmp_103 / cse_tmp_166 ^ 4
        cse_tmp_173 = my_piecewise5(cse_tmp_94 <= zeta_threshold, cse_tmp_38, cse_tmp_0 <= zeta_threshold, cse_tmp_147, cse_tmp_128)
        cse_tmp_174 = cse_tmp_173 + 1
        cse_tmp_175 = cse_tmp_174 <= zeta_threshold
        cse_tmp_176 = cse_tmp_153 / (my_piecewise3(cse_tmp_175, cse_tmp_151, xc_expm1(xc_log1p(my_piecewise3(cse_tmp_173 > cse_tmp_38, cse_tmp_173, cse_tmp_38)) / 3)) + 1)
        cse_tmp_177 = cse_tmp_176 > 1.35
        cse_tmp_178 = my_piecewise3(cse_tmp_177, cse_tmp_176, 1.35)
        cse_tmp_179 = my_piecewise3(cse_tmp_177, 1.35, cse_tmp_176)
        cse_tmp_180 = cse_tmp_179 ^ 2
        cse_tmp_181 = xc_expm1(-1 / (4 * cse_tmp_180))
        cse_tmp_182 = 0.0723850886717336 * NaNMath.pow(my_piecewise3(cse_tmp_98 > cse_tmp_161, cse_tmp_98, cse_tmp_161), 0.25)
        cse_tmp_183 = my_piecewise3(cse_tmp_0 <= zeta_threshold, cse_tmp_78, xc_expm1((2 // 3) * cse_tmp_39)) / 2 + my_piecewise3(cse_tmp_94 <= zeta_threshold, cse_tmp_78, xc_expm1((2 // 3) * cse_tmp_129)) / 2 + 1
        cse_tmp_184 = cse_tmp_183 ^ 3
        cse_tmp_185 = (-cse_tmp_40 - 0.0621814) * xc_log1p((cse_tmp_46 + cse_tmp_48 + cse_tmp_52 + cse_tmp_56) ^ (-1))
        cse_tmp_186 = 0.5848223622634646207262238663759 * (-cse_tmp_60 - 0.0337738) * xc_log1p((cse_tmp_61 + cse_tmp_62 + cse_tmp_63 + cse_tmp_64) ^ (-1))
        cse_tmp_187 = cse_tmp_66 * (my_piecewise3(cse_tmp_0 <= zeta_threshold, cse_tmp_69, xc_expm1((4 // 3) * cse_tmp_39)) + my_piecewise3(cse_tmp_94 <= zeta_threshold, cse_tmp_69, xc_expm1((4 // 3) * cse_tmp_129)))
        cse_tmp_188 = cse_tmp_83 * (cse_tmp_185 - cse_tmp_186 * cse_tmp_187 + cse_tmp_187 * z ^ 4 * (-cse_tmp_185 + cse_tmp_186 + (-cse_tmp_72 - 0.0310907) * xc_log1p((cse_tmp_73 + cse_tmp_74 + cse_tmp_75 + cse_tmp_76) ^ (-1)))) / cse_tmp_184
        cse_tmp_189 = 0.003 * cse_tmp_5 + 0.003 * cse_tmp_98
        cse_tmp_190 = cse_tmp_189 + 1
        cse_tmp_191 = cse_tmp_189 / cse_tmp_190
        cse_tmp_192 = cse_tmp_189 ^ 3 / cse_tmp_190 ^ 3
        cse_tmp_193 = cse_tmp_189 ^ 5 / cse_tmp_190 ^ 5
        cse_tmp_194 = cse_tmp_189 ^ 7 / cse_tmp_190 ^ 7
        cse_tmp_195 = cse_tmp_16 * t0
        cse_tmp_196 = cse_tmp_106 * t1
        cse_tmp_197 = cse_tmp_195 + cse_tmp_196
        cse_tmp_198 = -3 // 10 * cse_tmp_13 * cse_tmp_14
        cse_tmp_199 = cse_tmp_106 * cse_tmp_195 * (-cse_tmp_198 - t1) + cse_tmp_16 * cse_tmp_196 * (-cse_tmp_198 - t0)
        cse_tmp_200 = cse_tmp_199 / cse_tmp_197
        cse_tmp_201 = cse_tmp_199 ^ 10 / cse_tmp_197 ^ 10
        cse_tmp_202 = cse_tmp_199 ^ 8 / cse_tmp_197 ^ 8
        cse_tmp_203 = cse_tmp_197 ^ (-6)
        cse_tmp_204 = cse_tmp_199 ^ 6
        cse_tmp_205 = cse_tmp_203 * cse_tmp_204
        cse_tmp_206 = cse_tmp_199 ^ 4 / cse_tmp_197 ^ 4
        cse_tmp_207 = cse_tmp_197 ^ (-2)
        cse_tmp_208 = cse_tmp_199 ^ 2
        cse_tmp_209 = cse_tmp_207 * cse_tmp_208
        cse_tmp_210 = cse_tmp_189 ^ 2 / cse_tmp_190 ^ 2
        cse_tmp_211 = cse_tmp_189 ^ 4 / cse_tmp_190 ^ 4
        cse_tmp_212 = -15 // 4 * cse_tmp_210 + (35 // 8) * cse_tmp_211 + 3 // 8
        cse_tmp_213 = -35 // 16 * cse_tmp_191 + (315 // 16) * cse_tmp_192 - 693 // 16 * cse_tmp_193 + (429 // 16) * cse_tmp_194
        cse_tmp_214 = cse_tmp_197 ^ (-3)
        cse_tmp_215 = cse_tmp_199 ^ 3
        cse_tmp_216 = cse_tmp_199 ^ 5 / cse_tmp_197 ^ 5
        cse_tmp_217 = cse_tmp_214 * cse_tmp_215
        cse_tmp_218 = (231 // 16) * cse_tmp_189 ^ 6 / cse_tmp_190 ^ 6 + (105 // 16) * cse_tmp_210 - 315 // 16 * cse_tmp_211 - 5 // 16
        cse_tmp_219 = cse_tmp_199 ^ 9 / cse_tmp_197 ^ 9
        cse_tmp_220 = cse_tmp_197 ^ (-7)
        cse_tmp_221 = cse_tmp_199 ^ 7
        cse_tmp_222 = cse_tmp_220 * cse_tmp_221
        cse_tmp_223 = cse_tmp_197 ^ (-11)
        cse_tmp_224 = cse_tmp_199 ^ 11
        (-cse_tmp_138 + cse_tmp_184 * cse_tmp_82 * cse_tmp_91 * xc_log1p(xc_expm1(cse_tmp_188) / NaNMath.pow(1 + cse_tmp_41 * cse_tmp_89 * xt ^ 2 * (cse_tmp_87 + 0.06672455060314922) / (8 * cse_tmp_183 ^ 2 * (cse_tmp_86 + 1) * xc_expm1(-cse_tmp_188)), 0.25)) - cse_tmp_93) * (7.594716450411337 * cse_tmp_191 * cse_tmp_200 + cse_tmp_191 * (-2.6811654095303747 * cse_tmp_200 + 12.512105244475082 * cse_tmp_214 * cse_tmp_215 - 11.260894720027574 * cse_tmp_216) + cse_tmp_191 * (-6.034813497828577 * cse_tmp_200 + 130.7542924529525 * cse_tmp_214 * cse_tmp_215 - 784.525754717715 * cse_tmp_216 - 2011.125545823984 * cse_tmp_219 + 1905.276832885879 * cse_tmp_220 * cse_tmp_221 + 767.884299314612 * cse_tmp_223 * cse_tmp_224) - 1.4558183619333305 * cse_tmp_191 - 11.853352035741417 * cse_tmp_192 + 61.015378689029065 * cse_tmp_193 - 52.744855278617113 * cse_tmp_194 - 3.124170248419258 * cse_tmp_200 + 142.4710550433672 * cse_tmp_201 - 337.4314461553435 * cse_tmp_202 + 277.884720363224 * cse_tmp_205 - 92.62824012107467 * cse_tmp_206 + 10.687873860124 * cse_tmp_209 + cse_tmp_212 * (6.928011135095336 * cse_tmp_207 * cse_tmp_208 - 2.309337045031779) + cse_tmp_212 * (-38.94083208320436 * cse_tmp_200 + 181.7238830549537 * cse_tmp_214 * cse_tmp_215 - 163.5514947494583 * cse_tmp_216) + cse_tmp_212 * (-4.900242209791145 * cse_tmp_206 + 4.20020760839241 * cse_tmp_207 * cse_tmp_208 - 0.420020760839241) + cse_tmp_212 * (63.797127823327241 * cse_tmp_203 * cse_tmp_204 - 86.996083395446237 * cse_tmp_206 + 28.998694465148746 * cse_tmp_207 * cse_tmp_208 - 1.3808902126261307) + cse_tmp_212 * (215.8477356596886 * cse_tmp_202 - 402.9157732314187 * cse_tmp_205 + 232.4514076335108 * cse_tmp_206 - 42.26389229700196 * cse_tmp_209 + 1.173997008250055) + cse_tmp_213 * (-3.858647399263539 * cse_tmp_200 + 6.431078998772565 * cse_tmp_214 * cse_tmp_215) + cse_tmp_213 * (17.9821263545669 * cse_tmp_200 + 75.52493068918097 * cse_tmp_216 - 83.91658965464552 * cse_tmp_217) + cse_tmp_213 * (-11.270998716141178 * cse_tmp_206 + 9.660856042406724 * cse_tmp_207 * cse_tmp_208 - 0.9660856042406724) + cse_tmp_213 * (5.796842375841618 * cse_tmp_200 + 331.57938389814055 * cse_tmp_216 - 85.020354845677063 * cse_tmp_217 + 223.68450501065037 * cse_tmp_219 - 473.68483414020078 * cse_tmp_222) + cse_tmp_213 * (-3.1012336435524401 * cse_tmp_200 + 67.193395610302868 * cse_tmp_214 * cse_tmp_215 - 403.16037366181721 * cse_tmp_216 - 1033.4984181965632 * cse_tmp_219 + 979.10376460727036 * cse_tmp_220 * cse_tmp_221 + 394.60848694777866 * cse_tmp_223 * cse_tmp_224) + cse_tmp_218 * (-42.251039117276074 * cse_tmp_200 + 197.17151588062168 * cse_tmp_214 * cse_tmp_215 - 177.45436429255951 * cse_tmp_216) + cse_tmp_218 * (4.2800880073874869 * cse_tmp_200 + 556.4114409603733 * cse_tmp_216 - 92.735240160062216 * cse_tmp_217 + 1426.3563129380998 * cse_tmp_219 - 1351.2849280466209 * cse_tmp_222 - 544.60877403091084 * cse_tmp_223 * cse_tmp_224) + (-3 // 2 * cse_tmp_191 + (5 // 2) * cse_tmp_192) * (-346.88328541223793 * cse_tmp_201 + 821.565675976353 * cse_tmp_202 - 676.58349786287894 * cse_tmp_205 + 225.52783262095965 * cse_tmp_206 - 26.022442225495344 * cse_tmp_209 + 0.47313531319082443) + ((3 // 2) * cse_tmp_210 - 1 // 2) * (-3.7619070942359352 * cse_tmp_200 + 55.17463738212705 * cse_tmp_214 * cse_tmp_215 - 215.1810857902955 * cse_tmp_216 - 145.16184358869141 * cse_tmp_219 + 307.40155112899356 * cse_tmp_220 * cse_tmp_221) + ((15 // 8) * cse_tmp_191 - 35 // 4 * cse_tmp_192 + (63 // 8) * cse_tmp_193) * ((375 // 8) * cse_tmp_200 + (1575 // 8) * cse_tmp_216 - 875 // 4 * cse_tmp_217) + 1.8387583778241587) + my_piecewise3(cse_tmp_0 * cse_tmp_2 <= dens_threshold, 0, -cse_tmp_164 * (-2.1796015058012847e-16 * cse_tmp_12 / cse_tmp_140 ^ 7 + 9.557477687790355e-5 * cse_tmp_141 - 1.109425367155457e-6 * cse_tmp_142 + cse_tmp_143 * (8.236975506159063 * cse_tmp_22 - 2.745658502053021) + cse_tmp_143 * (22.52856399262817 * cse_tmp_16 * cse_tmp_18 - 18.77380332719014 * cse_tmp_23 - 11.26428199631409) + cse_tmp_143 * (-12.98773968602022 * cse_tmp_19 + 30.30472593404718 * cse_tmp_23 - 27.27425334064246 * cse_tmp_25 + 6.49386984301011) + cse_tmp_143 * (-3.529741801416329 * cse_tmp_19 + 25.88477321038641 * cse_tmp_23 - 100.950615520507 * cse_tmp_25 + 144.2151650292957 * cse_tmp_27 - 68.10160570827854 * cse_tmp_36 + 1.764870900708164) + cse_tmp_143 * (2.042982001993095 * cse_tmp_16 * cse_tmp_18 - 22.13230502159186 * cse_tmp_23 + 132.7938301295512 * cse_tmp_25 - 322.4993017431957 * cse_tmp_27 + 340.4159296178176 * cse_tmp_36 - 129.9769913086213 * cse_tmp_37 - 1.021491000996547) + cse_tmp_144 * (3.329257758305679 - 9.987773274917038 * cse_tmp_22) + cse_tmp_144 * (-55.963540767592338 * cse_tmp_19 + 46.636283972993615 * cse_tmp_23 + 27.981770383796169) + cse_tmp_144 * (14.0818009150029 * cse_tmp_19 - 32.85753546834 * cse_tmp_23 + 29.571781921506 * cse_tmp_25 - 7.04090045750143) + cse_tmp_145 * (-5.519391721700772 * cse_tmp_19 + 4.59949310141731 * cse_tmp_23 + 2.759695860850386) + cse_tmp_145 * (-5.683684188082495 * cse_tmp_22 + 17.05105256424749 * cse_tmp_24 - 12.50410521378149 * cse_tmp_26 + 0.2706516280039283) + cse_tmp_145 * (4.2905777857098854 * cse_tmp_22 - 23.59817782140437 * cse_tmp_24 + 40.903508223767574 * cse_tmp_26 - 21.912593691304058 * cse_tmp_28 - 0.11918271626971904) + cse_tmp_145 * (2.475253791800773 * cse_tmp_16 * cse_tmp_18 - 11.13864206310348 * cse_tmp_23 + 24.50501253882765 * cse_tmp_25 - 15.16976966689331 * cse_tmp_27 - 1.237626895900386) + cse_tmp_145 * (1.258659394045205 * cse_tmp_19 - 9.23016888966484 * cse_tmp_23 + 35.99765866969287 * cse_tmp_25 - 51.42522667098982 * cse_tmp_27 + 24.2841348168563 * cse_tmp_36 - 0.6293296970226027) + cse_tmp_145 * (-1.0855733081228937 * cse_tmp_19 + 11.760377504664682 * cse_tmp_23 - 70.56226502798809 * cse_tmp_25 + 171.36550078225679 * cse_tmp_27 - 180.88580638127106 * cse_tmp_36 + 69.065489709212585 * cse_tmp_37 + 0.54278665406144685) + cse_tmp_146 * (36.417087058520061 * cse_tmp_16 * cse_tmp_18 - 30.347572548766718 * cse_tmp_23 - 18.208543529260031) + cse_tmp_146 * (-9.736924103380859 * cse_tmp_22 + 53.55308256859472 * cse_tmp_24 - 92.82534311889752 * cse_tmp_26 + 49.72786238512367 * cse_tmp_28 + 0.2704701139828016) - 0.16745080852640867 * cse_tmp_19 - 6.3055898962845124 * cse_tmp_21 ^ 10 + 0.18477675582276122 * cse_tmp_22 + 1.130722092451671 * cse_tmp_23 + 0.25262986567455487 * cse_tmp_24 - 3.4621272450216218 * cse_tmp_25 - 8.8297561412729178 * cse_tmp_26 - 7.9943090890088975 * cse_tmp_27 + 14.934291859621213 * cse_tmp_28 + 22.37318637924528 * cse_tmp_36 - 11.93279679996215 * cse_tmp_37 + 0.85493559709679734 + 2.56e-11 * xs0 ^ 10 / cse_tmp_140 ^ 5) * my_piecewise3(cse_tmp_150, cse_tmp_68, NaNMath.pow(cse_tmp_149, 1.3333333333333333)) * my_piecewise3(cse_tmp_154 >= 1.35, 1 / (36 * cse_tmp_156 ^ 2) - 1 / (960 * cse_tmp_156 ^ 4) + 1 / (26880 * cse_tmp_156 ^ 6) - 1 / (829440 * cse_tmp_156 ^ 8) + 1 / (28385280 * cse_tmp_156 ^ 10) - 1 / (1073479680 * cse_tmp_156 ^ 12) + 1 / (44590694400 * cse_tmp_156 ^ 14), -8 // 3 * cse_tmp_157 * (2 * cse_tmp_157 * (-2 * cse_tmp_159 * cse_tmp_160 + cse_tmp_160 - 1 // 2) + cse_tmp_158 * erf(1 / (2 * cse_tmp_157))) + 1) * my_piecewise3(cse_tmp_162 <= cse_tmp_163, 1, -xc_expm1(-1 / my_piecewise3(cse_tmp_163 > cse_tmp_162, cse_tmp_163, cse_tmp_162)))) + my_piecewise3(cse_tmp_2 * cse_tmp_94 <= dens_threshold, 0, -cse_tmp_164 * (-2.1796015058012847e-16 * cse_tmp_105 / cse_tmp_166 ^ 7 - 0.16745080852640867 * cse_tmp_109 - 6.3055898962845124 * cse_tmp_111 ^ 10 + 0.18477675582276122 * cse_tmp_112 + 1.130722092451671 * cse_tmp_113 + 0.25262986567455487 * cse_tmp_114 - 3.4621272450216218 * cse_tmp_115 - 8.8297561412729178 * cse_tmp_116 - 7.9943090890088975 * cse_tmp_117 + 14.934291859621213 * cse_tmp_118 + 22.37318637924528 * cse_tmp_126 - 11.93279679996215 * cse_tmp_127 + 9.557477687790355e-5 * cse_tmp_167 - 1.109425367155457e-6 * cse_tmp_168 + cse_tmp_169 * (8.236975506159063 * cse_tmp_112 - 2.745658502053021) + cse_tmp_169 * (22.52856399262817 * cse_tmp_106 * cse_tmp_108 - 18.77380332719014 * cse_tmp_113 - 11.26428199631409) + cse_tmp_169 * (-12.98773968602022 * cse_tmp_109 + 30.30472593404718 * cse_tmp_113 - 27.27425334064246 * cse_tmp_115 + 6.49386984301011) + cse_tmp_169 * (-3.529741801416329 * cse_tmp_109 + 25.88477321038641 * cse_tmp_113 - 100.950615520507 * cse_tmp_115 + 144.2151650292957 * cse_tmp_117 - 68.10160570827854 * cse_tmp_126 + 1.764870900708164) + cse_tmp_169 * (2.042982001993095 * cse_tmp_106 * cse_tmp_108 - 22.13230502159186 * cse_tmp_113 + 132.7938301295512 * cse_tmp_115 - 322.4993017431957 * cse_tmp_117 + 340.4159296178176 * cse_tmp_126 - 129.9769913086213 * cse_tmp_127 - 1.021491000996547) + cse_tmp_170 * (3.329257758305679 - 9.987773274917038 * cse_tmp_112) + cse_tmp_170 * (-55.963540767592338 * cse_tmp_109 + 46.636283972993615 * cse_tmp_113 + 27.981770383796169) + cse_tmp_170 * (14.0818009150029 * cse_tmp_109 - 32.85753546834 * cse_tmp_113 + 29.571781921506 * cse_tmp_115 - 7.04090045750143) + cse_tmp_171 * (-5.519391721700772 * cse_tmp_109 + 4.59949310141731 * cse_tmp_113 + 2.759695860850386) + cse_tmp_171 * (-5.683684188082495 * cse_tmp_112 + 17.05105256424749 * cse_tmp_114 - 12.50410521378149 * cse_tmp_116 + 0.2706516280039283) + cse_tmp_171 * (4.2905777857098854 * cse_tmp_112 - 23.59817782140437 * cse_tmp_114 + 40.903508223767574 * cse_tmp_116 - 21.912593691304058 * cse_tmp_118 - 0.11918271626971904) + cse_tmp_171 * (2.475253791800773 * cse_tmp_106 * cse_tmp_108 - 11.13864206310348 * cse_tmp_113 + 24.50501253882765 * cse_tmp_115 - 15.16976966689331 * cse_tmp_117 - 1.237626895900386) + cse_tmp_171 * (1.258659394045205 * cse_tmp_109 - 9.23016888966484 * cse_tmp_113 + 35.99765866969287 * cse_tmp_115 - 51.42522667098982 * cse_tmp_117 + 24.2841348168563 * cse_tmp_126 - 0.6293296970226027) + cse_tmp_171 * (-1.0855733081228937 * cse_tmp_109 + 11.760377504664682 * cse_tmp_113 - 70.56226502798809 * cse_tmp_115 + 171.36550078225679 * cse_tmp_117 - 180.88580638127106 * cse_tmp_126 + 69.065489709212585 * cse_tmp_127 + 0.54278665406144685) + cse_tmp_172 * (36.417087058520061 * cse_tmp_106 * cse_tmp_108 - 30.347572548766718 * cse_tmp_113 - 18.208543529260031) + cse_tmp_172 * (-9.736924103380859 * cse_tmp_112 + 53.55308256859472 * cse_tmp_114 - 92.82534311889752 * cse_tmp_116 + 49.72786238512367 * cse_tmp_118 + 0.2704701139828016) + 0.85493559709679734 + 2.56e-11 * xs1 ^ 10 / cse_tmp_166 ^ 5) * my_piecewise3(cse_tmp_175, cse_tmp_68, NaNMath.pow(cse_tmp_174, 1.3333333333333333)) * my_piecewise3(cse_tmp_176 >= 1.35, 1 / (36 * cse_tmp_178 ^ 2) - 1 / (960 * cse_tmp_178 ^ 4) + 1 / (26880 * cse_tmp_178 ^ 6) - 1 / (829440 * cse_tmp_178 ^ 8) + 1 / (28385280 * cse_tmp_178 ^ 10) - 1 / (1073479680 * cse_tmp_178 ^ 12) + 1 / (44590694400 * cse_tmp_178 ^ 14), -8 // 3 * cse_tmp_179 * (cse_tmp_158 * erf(1 / (2 * cse_tmp_179)) + 2 * cse_tmp_179 * (-2 * cse_tmp_180 * cse_tmp_181 + cse_tmp_181 - 1 // 2)) + 1) * my_piecewise3(cse_tmp_182 <= cse_tmp_163, 1, -xc_expm1(-1 / my_piecewise3(cse_tmp_163 > cse_tmp_182, cse_tmp_163, cse_tmp_182)))) + my_piecewise3(cse_tmp_0 <= zeta_threshold || cse_tmp_0 * cse_tmp_2 <= dens_threshold, 0, cse_tmp_20 * cse_tmp_93 * (1.7715459474491766e-7 * cse_tmp_11 - 1.392908002887266e-13 * cse_tmp_12 / cse_tmp_7 ^ 7 - 5.5775607268603812 * cse_tmp_19 + 0.002205988705553151 * cse_tmp_21 * cse_tmp_30 - 0.10122833804966692 * cse_tmp_21 * cse_tmp_9 - 7.4846539418692013 * cse_tmp_22 - 3.6312631853467784 * cse_tmp_23 + 26.08578753439677 * cse_tmp_24 + 24.634519446776477 * cse_tmp_25 - 45.21536505962106 * cse_tmp_26 - 22.38382936948649 * cse_tmp_27 + 24.22251699622557 * cse_tmp_28 + cse_tmp_31 * (10.49249702786804 * cse_tmp_22 - 3.497499009289348) + cse_tmp_31 * (6.680030193007806 * cse_tmp_16 * cse_tmp_18 - 5.566691827506505 * cse_tmp_23 - 3.340015096503903) + cse_tmp_31 * (32.921665064702127 * cse_tmp_22 - 181.0691578558617 * cse_tmp_24 + 313.85320695016028 * cse_tmp_26 - 168.13564658044301 * cse_tmp_28 - 0.91449069624172575) + cse_tmp_32 * (4.174570503849972 - 12.52371151154991 * cse_tmp_22) + cse_tmp_32 * ((7875 // 32) * cse_tmp_22 - 86625 // 64 * cse_tmp_24 + (75075 // 32) * cse_tmp_26 - 160875 // 128 * cse_tmp_28 - 875 // 128) + cse_tmp_33 * (8.1933510145770588 * cse_tmp_16 * cse_tmp_18 - 6.827792512147549 * cse_tmp_23 - 4.0966755072885294) + cse_tmp_33 * (-68.77179765786019 * cse_tmp_22 + 378.244887118231 * cse_tmp_24 - 655.6244710049338 * cse_tmp_26 + 351.2273951812145 * cse_tmp_28 + 1.910327712718339) + cse_tmp_35 * (-147.46906693688943 * cse_tmp_22 + 811.07986815289189 * cse_tmp_24 - 1405.8717714650126 * cse_tmp_26 + 753.14559185625675 * cse_tmp_28 + 4.0963629704691509) + cse_tmp_35 * (-8.4874307306338897 * cse_tmp_19 + 91.947166248533805 * cse_tmp_23 - 551.68299749120283 * cse_tmp_25 + 1339.8015653357783 * cse_tmp_27 - 1414.2349856322104 * cse_tmp_36 + 539.98063087775307 * cse_tmp_37 + 4.2437153653169449) - 0.012900096158738523 * cse_tmp_9 + 3.5305140266172796)) + my_piecewise3(cse_tmp_94 <= zeta_threshold || cse_tmp_2 * cse_tmp_94 <= dens_threshold, 0, cse_tmp_110 * cse_tmp_138 * (-0.10122833804966692 * cse_tmp_102 * cse_tmp_111 - 0.012900096158738523 * cse_tmp_102 + 1.7715459474491766e-7 * cse_tmp_104 - 5.5775607268603812 * cse_tmp_109 + 0.002205988705553151 * cse_tmp_111 * cse_tmp_120 - 7.4846539418692013 * cse_tmp_112 - 3.6312631853467784 * cse_tmp_113 + 26.08578753439677 * cse_tmp_114 + 24.634519446776477 * cse_tmp_115 - 45.21536505962106 * cse_tmp_116 - 22.38382936948649 * cse_tmp_117 + 24.22251699622557 * cse_tmp_118 + cse_tmp_121 * (10.49249702786804 * cse_tmp_112 - 3.497499009289348) + cse_tmp_121 * (6.680030193007806 * cse_tmp_106 * cse_tmp_108 - 5.566691827506505 * cse_tmp_113 - 3.340015096503903) + cse_tmp_121 * (32.921665064702127 * cse_tmp_112 - 181.0691578558617 * cse_tmp_114 + 313.85320695016028 * cse_tmp_116 - 168.13564658044301 * cse_tmp_118 - 0.91449069624172575) + cse_tmp_122 * (4.174570503849972 - 12.52371151154991 * cse_tmp_112) + cse_tmp_122 * ((7875 // 32) * cse_tmp_112 - 86625 // 64 * cse_tmp_114 + (75075 // 32) * cse_tmp_116 - 160875 // 128 * cse_tmp_118 - 875 // 128) + cse_tmp_123 * (8.1933510145770588 * cse_tmp_106 * cse_tmp_108 - 6.827792512147549 * cse_tmp_113 - 4.0966755072885294) + cse_tmp_123 * (-68.77179765786019 * cse_tmp_112 + 378.244887118231 * cse_tmp_114 - 655.6244710049338 * cse_tmp_116 + 351.2273951812145 * cse_tmp_118 + 1.910327712718339) + cse_tmp_125 * (-147.46906693688943 * cse_tmp_112 + 811.07986815289189 * cse_tmp_114 - 1405.8717714650126 * cse_tmp_116 + 753.14559185625675 * cse_tmp_118 + 4.0963629704691509) + cse_tmp_125 * (-8.4874307306338897 * cse_tmp_109 + 91.947166248533805 * cse_tmp_113 - 551.68299749120283 * cse_tmp_115 + 1339.8015653357783 * cse_tmp_117 - 1414.2349856322104 * cse_tmp_126 + 539.98063087775307 * cse_tmp_127 + 4.2437153653169449) + 3.5305140266172796 - 1.392908002887266e-13 * cse_tmp_105 / cse_tmp_100 ^ 7))
    end
end
export hyb_mgga_xc_coach_energy

const hyb_mgga_xc_coach_defaults = (XC_EPSILON = 2.220446049250313e-16, cam_omega = 0.27, dens_threshold = 1.0e-13, zeta_threshold = 2.220446049250313e-16)
const hyb_mgga_xc_coach_required = ()

function hyb_mgga_xc_coach(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(hyb_mgga_xc_coach_defaults, hyb_mgga_xc_coach_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return hyb_mgga_xc_coach_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.cam_omega, p.dens_threshold, p.zeta_threshold)
end

function hyb_mgga_xc_coach(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(hyb_mgga_xc_coach_defaults, hyb_mgga_xc_coach_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return hyb_mgga_xc_coach_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.cam_omega, p.dens_threshold, p.zeta_threshold)
end

export hyb_mgga_xc_coach, hyb_mgga_xc_coach_defaults, hyb_mgga_xc_coach_required
