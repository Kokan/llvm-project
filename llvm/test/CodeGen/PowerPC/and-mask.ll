; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=powerpc64le-unknown-linux-gnu < %s | FileCheck %s

; mask 0xFFFFFFFE
define i32 @test1(i32 %a) {
; CHECK-LABEL: test1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lis 4, 32767
; CHECK-NEXT:    ori 4, 4, 65535
; CHECK-NEXT:    sldi 4, 4, 1
; CHECK-NEXT:    and 3, 3, 4
; CHECK-NEXT:    blr
  %and = and i32 %a, -2
  ret i32 %and
}

; mask 0xFFFFFFFFFFFFFFF9
define i64 @test2(i64 %a) {
; CHECK-LABEL: test2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li 4, -7
; CHECK-NEXT:    and 3, 3, 4
; CHECK-NEXT:    blr
  %and = and i64 %a, -7
  ret i64 %and
}

; mask: 0xFFFFFFC00000
define i64 @test3(i64 %a) {
; CHECK-LABEL: test3:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lis 4, 1023
; CHECK-NEXT:    ori 4, 4, 65535
; CHECK-NEXT:    sldi 4, 4, 22
; CHECK-NEXT:    and 3, 3, 4
; CHECK-NEXT:    blr
  %and = and i64 %a, 281474972516352
  ret i64 %and
}

; mask: 0xC000000FF
define i64 @test4(i64 %a) {
; CHECK-LABEL: test4:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li 4, 12
; CHECK-NEXT:    sldi 4, 4, 32
; CHECK-NEXT:    ori 4, 4, 255
; CHECK-NEXT:    and 3, 3, 4
; CHECK-NEXT:    blr
  %and = and i64 %a, 51539607807
  ret i64 %and
}

; mask: 0xFFC0FFFF
define i64 @test5(i64 %a) {
; CHECK-LABEL: test5:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li 4, 0
; CHECK-NEXT:    oris 4, 4, 65472
; CHECK-NEXT:    ori 4, 4, 65535
; CHECK-NEXT:    and 3, 3, 4
; CHECK-NEXT:    blr
  %and = and i64 %a, 4290838527
  ret i64 %and
}

; mask: 0x3FC0FFE0
define i64 @test6(i64 %a) {
; CHECK-LABEL: test6:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lis 4, 16320
; CHECK-NEXT:    ori 4, 4, 65504
; CHECK-NEXT:    and 3, 3, 4
; CHECK-NEXT:    blr
  %and = and i64 %a, 1069613024
  ret i64 %and
}

; mask: 0x3FC000001FFFF
define i64 @test7(i64 %a) {
; CHECK-LABEL: test7:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li 4, -32767
; CHECK-NEXT:    sldi 4, 4, 32
; CHECK-NEXT:    oris 4, 4, 65024
; CHECK-NEXT:    rldicr 4, 4, 17, 63
; CHECK-NEXT:    and 3, 3, 4
; CHECK-NEXT:    blr
  %and = and i64 %a, 1121501860462591
  ret i64 %and
}
