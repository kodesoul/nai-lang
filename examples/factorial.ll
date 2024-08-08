; ModuleID = 'factorial.c'
source_filename = "factorial.c"
target triple = "x86_64-unknown-linux-musl"

@msg = constant [3 x i8] c"%d\00"

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define i32 @factorial(i32 noundef %0) {
  %2 = alloca i32
  %3 = alloca i32
  store i32 %0, ptr %3
  %4 = load i32, ptr %3
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 0, ptr %2
  br label %27

7:                                                ; preds = %1
  %8 = load i32, ptr %3
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  store i32 1, ptr %2
  br label %27

11:                                               ; preds = %7
  %12 = load i32, ptr %3
  %13 = load i32, ptr %3
  %14 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %13, i32 1)
  %15 = extractvalue { i32, i1 } %14, 0
  %16 = extractvalue { i32, i1 } %14, 1
  %17 = xor i1 %16, true
  br i1 %17, label %19, label %18

18:                                               ; preds = %11
  unreachable

19:                                               ; preds = %11
  %20 = call i32 @factorial(i32 noundef %15)
  %21 = call { i32, i1 } @llvm.smul.with.overflow.i32(i32 %12, i32 %20)
  %22 = extractvalue { i32, i1 } %21, 0
  %23 = extractvalue { i32, i1 } %21, 1
  %24 = xor i1 %23, true
  br i1 %24, label %26, label %18

25:                                               ; preds = %19
  unreachable

26:                                               ; preds = %19
  store i32 %22, ptr %2
  br label %27

27:                                               ; preds = %26, %10, %6
  %28 = load i32, ptr %2
  ret i32 %28
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i32, i1 } @llvm.smul.with.overflow.i32(i32, i32)

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define i32 @main() {
  %1 = alloca i32
  %2 = alloca i32
  store i32 0, ptr %1
  %3 = call i32 @factorial(i32 7)
  store i32 %3, ptr %2
  %4 = load i32, ptr %2
  %5 = call i32 (ptr, ...) @printf(ptr @msg, i32 %4)
  ret i32 0
}

declare i32 @printf(ptr, ...)
