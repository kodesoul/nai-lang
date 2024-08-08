; ModuleID = 'hello.c'
source_filename = "hello.c"
target triple = "x86_64-unknown-linux-musl"

@message = constant [13 x i8] c"Hello Rafiki\00"

define i32 @main() {
  %1 = call i32 (ptr, ...) @printf(ptr @message)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...)
