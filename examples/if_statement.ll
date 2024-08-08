; ModuleID = 'if_statement.c'
source_filename = "if_statement.c"
target triple = "x86_64-unknown-linux-musl"

@.str = private unnamed_addr constant [10 x i8] c"life = %d\00", align 1

; Function Attrs: noinline nounwind optnone sspstrong uwtable

define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 42, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = icmp eq i32 %3, 42
  br i1 %4, label %5, label %6

5:                                                ; preds = %0
  store i32 69, ptr %2, align 4
  br label %7

6:                                                ; preds = %0
  store i32 420, ptr %2, align 4
  br label %7

7:                                                ; preds = %6, %5
  %8 = load i32, ptr %2, align 4
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %8)
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata)

declare i32 @printf(ptr noundef, ...)
