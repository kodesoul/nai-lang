; ModuleID = 'if_statement.c'
source_filename = "if_statement.c"
target triple = "x86_64-unknown-linux-musl"

@message = constant [10 x i8] c"life = %d\00"

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define i32 @main() {
  %1 = alloca i32
  store i32 42, ptr %1
  %2 = load i32, ptr %1
  %3 = icmp eq i32 %2, 42
  br i1 %3, label %4, label %5

4:                                                ; preds = %0
  store i32 69, ptr %1
  br label %6

5:                                                ; preds = %0
  store i32 420, ptr %1
  br label %6

6:                                                ; preds = %5, %4
  %7 = load i32, ptr %1
  %8 = call i32 (ptr, ...) @printf(ptr @message, i32 %7)
  ret i32 0
}

declare i32 @printf(ptr, ...)
