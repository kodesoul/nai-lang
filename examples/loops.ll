; ModuleID = 'loops.c'
source_filename = "loops.c"
target triple = "x86_64-unknown-linux-musl"

@message = constant [22 x i8] c"%d day of Christmass\0A\00"

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define i32 @main() {
  %1 = alloca i32
  %2 = alloca i32
  store i32 0, ptr %1
  store i32 1, ptr %2
  br label %3

3:                                                ; preds = %16, %0
  %4 = load i32, ptr %2
  %5 = icmp sle i32 %4, 12
  br i1 %5, label %6, label %17

6:                                                ; preds = %3
  %7 = load i32, ptr %2
  %8 = call i32 (ptr, ...) @printf(ptr @message, i32 %7)
  br label %9

9:                                                ; preds = %6
  %10 = load i32, ptr %2
  %11 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %10, i32 1)
  %12 = extractvalue { i32, i1 } %11, 0
  %13 = extractvalue { i32, i1 } %11, 1
  %14 = xor i1 %13, true
  br i1 %14, label %16, label %15

15:                                               ; preds = %9
  unreachable

16:                                               ; preds = %9
  store i32 %12, ptr %2
  br label %3

17:                                               ; preds = %3
  ret i32 0
}

declare i32 @printf(ptr, ...)
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32)
