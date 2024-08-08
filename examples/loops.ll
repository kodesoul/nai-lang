; ModuleID = 'loops.c'
source_filename = "loops.c"
target triple = "x86_64-unknown-linux-musl"

@message = constant [22 x i8] c"%d day of Christmass\0A\00"

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define i32 @main() {
  %1 = alloca i32
  store i32 1, ptr %1
  br label %2

2:                                                ; preds = %15, %0
  %3 = load i32, ptr %1
  %4 = icmp sle i32 %3, 12
  br i1 %4, label %5, label %16

5:                                                ; preds = %3
  %6 = load i32, ptr %1
  %7 = call i32 (ptr, ...) @printf(ptr @message, i32 %6)
  br label %8

8:                                                ; preds = %6
  %9 = load i32, ptr %1
  %10 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %9, i32 1)
  %11 = extractvalue { i32, i1 } %10, 0
  %12 = extractvalue { i32, i1 } %10, 1
  %13 = xor i1 %12, true
  br i1 %13, label %15, label %14

14:                                               ; preds = %9
  unreachable

15:                                               ; preds = %9
  store i32 %11, ptr %1
  br label %2

16:                                               ; preds = %3
  ret i32 0
}

declare i32 @printf(ptr, ...)
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32)
