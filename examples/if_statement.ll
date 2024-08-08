; ModuleID = 'if_statement.c'
source_filename = "if_statement.c"
target triple = "x86_64-unknown-linux-musl"

@message = constant [10 x i8] c"life = %d\00"

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define i32 @main() {
  %1 = alloca i32
  %2 = alloca i32
  store i32 0, ptr %1
  store i32 42, ptr %2
  %3 = load i32, ptr %2
  %4 = icmp eq i32 %3, 42
  br i1 %4, label %5, label %6

5:                                                ; preds = %0
  store i32 69, ptr %2
  br label %7

6:                                                ; preds = %0
  store i32 420, ptr %2
  br label %7

7:                                                ; preds = %6, %5
  %8 = load i32, ptr %2
  %9 = call i32 (ptr, ...) @printf(ptr @message, i32 %8)
  ret i32 0
}

declare i32 @printf(ptr, ...)
