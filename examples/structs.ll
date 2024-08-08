; ModuleID = 'structs.c'
source_filename = "structs.c"
target triple = "x86_64-unknown-linux-musl"

%struct.Color = type { i8, i8, i8, i8 }

@red = constant %struct.Color { i8 -1, i8 0, i8 0, i8 -1 }
@msg = constant [32 x i8] c"red = %i, green = %i, blue = %i\00"

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define i32 @main() {
  %1 = alloca %struct.Color
  call void @llvm.memcpy.p0.p0.i64(ptr %1, ptr @red, i64 4, i1 false)
  %2 = getelementptr inbounds %struct.Color, ptr %1, i32 0, i32 0
  %3 = load i8, ptr %2
  %4 = zext i8 %3 to i32
  %5 = getelementptr inbounds %struct.Color, ptr %1, i32 0, i32 1
  %6 = load i8, ptr %5
  %7 = zext i8 %6 to i32
  %8 = getelementptr inbounds %struct.Color, ptr %1, i32 0, i32 2
  %9 = load i8, ptr %8
  %10 = zext i8 %9 to i32
  %11 = call i32 (ptr, ...) @printf(ptr @msg, i32 %4, i32 %7, i32 %10)
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr, ptr, i64, i1 immarg)

declare i32 @printf(ptr, ...)
