; ModuleID = 'src/main.cpp'
source_filename = "src/main.cpp"

@board = common dso_local global [360000 x i8] zeroinitializer, align 16
@next_board = common dso_local global [360000 x i8] zeroinitializer, align 16

define dso_local i32 @count_cells(i32 %0, i32 %1) {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  store i32 0, i32* %5, align 4
  %8 = load i32, i32* %3, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %32

10:                                               ; preds = %2
  %11 = load i32, i32* %3, align 4
  %12 = icmp slt i32 %11, 599
  br i1 %12, label %13, label %32

13:                                               ; preds = %10
  %14 = load i32, i32* %4, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %32

16:                                               ; preds = %13
  %17 = load i32, i32* %4, align 4
  %18 = icmp slt i32 %17, 599
  br i1 %18, label %19, label %32

19:                                               ; preds = %16

20:                                               ; No predecessors!

21:                                               ; No predecessors!

22:                                               ; No predecessors!

23:                                               ; No predecessors!

24:                                               ; No predecessors!

25:                                               ; No predecessors!

26:                                               ; No predecessors!

27:                                               ; No predecessors!

28:                                               ; No predecessors!

29:                                               ; No predecessors!

30:                                               ; No predecessors!

31:                                               ; No predecessors!

32:                                               ; preds = %16, %13, %10, %2
}
