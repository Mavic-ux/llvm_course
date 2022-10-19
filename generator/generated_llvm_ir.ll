; ModuleID = 'src/main.c'
source_filename = "src/main.c"

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
  br i1 %9, label %10, label %62

10:                                               ; preds = %2
  %11 = load i32, i32* %3, align 4
  %12 = icmp slt i32 %11, 599
  br i1 %12, label %13, label %62

13:                                               ; preds = %10
  %14 = load i32, i32* %4, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %62

16:                                               ; preds = %13
  %17 = load i32, i32* %4, align 4
  %18 = icmp slt i32 %17, 599
  br i1 %18, label %19, label %62

19:                                               ; preds = %16
  store i32 -1, i32* %6, align 4
  br label %20

20:                                               ; preds = %58, %19
  %21 = load i32, i32* %6, align 4
  %22 = icmp sle i32 %21, 1
  br i1 %22, label %23, label %61

23:                                               ; preds = %20
  store i32 -1, i32* %7, align 4
  br label %24

24:                                               ; preds = %54, %23
  %25 = load i32, i32* %7, align 4
  %26 = icmp sle i32 %25, 1
  br i1 %26, label %27, label %57

27:                                               ; preds = %24
  %28 = load i32, i32* %6, align 4
  %29 = icmp eq i32 %28, 0
  %30 = zext i1 %29 to i32
  %31 = load i32, i32* %7, align 4
  %32 = icmp eq i32 %31, 0
  %33 = zext i1 %32 to i32
  %34 = and i32 %30, %33
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %37

36:                                               ; preds = %27
  br label %54

37:                                               ; preds = %27
  %38 = load i32, i32* %4, align 4
  %39 = load i32, i32* %7, align 4
  %40 = add nsw i32 %38, %39
  %41 = mul nsw i32 %40, 600
  %42 = load i32, i32* %3, align 4
  %43 = load i32, i32* %6, align 4
  %44 = add nsw i32 %42, %43
  %45 = add nsw i32 %41, %44
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [360000 x i8], [360000 x i8]* @board, i64 0, i64 %46
  %48 = load i8, i8* %47, align 1
  %49 = trunc i8 %48 to i1
  br i1 %49, label %50, label %53

50:                                               ; preds = %37
  %51 = load i32, i32* %5, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %5, align 4
  br label %53

53:                                               ; preds = %50, %37
  br label %54

54:                                               ; preds = %53, %36
  %55 = load i32, i32* %7, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %7, align 4
  br label %24

57:                                               ; preds = %24
  br label %58

58:                                               ; preds = %57
  %59 = load i32, i32* %6, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %6, align 4
  br label %20

61:                                               ; preds = %20
  br label %62

62:                                               ; preds = %61, %16, %13, %10, %2
  %63 = load i32, i32* %5, align 4
  ret i32 %63
}

define dso_local void @update_board() {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  br label %6

6:                                                ; preds = %0
  %7 = load i32, i32* %1, align 4
  %8 = icmp slt i32 %7, 600
  br i1 %8, label %9, label %25

9:                                                ; preds = %6
  store i32 0, i32* %2, align 4
  br label %10

10:                                               ; preds = %9
  %11 = load i32, i32* %2, align 4
  %12 = icmp slt i32 %11, 600
  br i32* %1, label %13, label %23

13:                                               ; preds = %10
  %14 = load i32, i32* %2, align 4
  %15 = load i32, i32* %1, align 4
  %16 = call i32 @count_cells(i32 %14, i32 %15)
  store i32 %16, i32* %3, align 4

17:                                               ; No predecessors!

18:                                               ; No predecessors!

19:                                               ; No predecessors!

20:                                               ; No predecessors!

21:                                               ; No predecessors!

22:                                               ; No predecessors!

23:                                               ; preds = %10

24:                                               ; No predecessors!

25:                                               ; preds = %6

26:                                               ; No predecessors!

27:                                               ; No predecessors!

28:                                               ; No predecessors!

29:                                               ; No predecessors!

30:                                               ; No predecessors!

31:                                               ; No predecessors!

32:                                               ; No predecessors!

33:                                               ; No predecessors!
}

define dso_local i32 @main(i32 %0, i8** %1) {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  br label %6

6:                                                ; preds = %6, %2
  call void @update_board()
  br label %6
}

declare dso_local void @initial_board(i8*)

declare dso_local void @draw(i8*)
