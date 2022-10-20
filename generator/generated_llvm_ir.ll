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

6:                                                ; preds = %55, %0
  %7 = load i32, i32* %1, align 4
  %8 = icmp slt i32 %7, 600
  br i1 %8, label %9, label %58

9:                                                ; preds = %6
  store i32 0, i32* %2, align 4
  br label %10

10:                                               ; preds = %51, %9
  %11 = load i32, i32* %2, align 4
  %12 = icmp slt i32 %11, 600
  br i1 %12, label %13, label %54

13:                                               ; preds = %10
  %14 = load i32, i32* %2, align 4
  %15 = load i32, i32* %1, align 4
  %16 = call i32 @count_cells(i32 %14, i32 %15)
  store i32 %16, i32* %3, align 4
  %17 = load i32, i32* %1, align 4
  %18 = mul nsw i32 %17, 600
  %19 = load i32, i32* %2, align 4
  %20 = add nsw i32 %18, %19
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [360000 x i8], [360000 x i8]* @board, i64 0, i64 %21
  %23 = load i8, i8* %22, align 1
  %24 = trunc i8 %23 to i1
  br i1 %24, label %25, label %40

25:                                               ; preds = %13
  %26 = load i32, i32* %3, align 4
  %27 = icmp eq i32 %26, 2
  br i1 %27, label %31, label %28

28:                                               ; preds = %25
  %29 = load i32, i32* %3, align 4
  %30 = icmp eq i32 %29, 3
  br label %31

31:                                               ; preds = %28, %25
  %32 = phi i1 [ true, %25 ], [ %30, %28 ]
  %33 = load i32, i32* %1, align 4
  %34 = mul nsw i32 %33, 600
  %35 = load i32, i32* %2, align 4
  %36 = add nsw i32 %34, %35
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [360000 x i8], [360000 x i8]* @next_board, i64 0, i64 %37
  %39 = zext i1 %32 to i8
  store i8 %39, i8* %38, align 1
  br label %50

40:                                               ; preds = %13
  %41 = load i32, i32* %3, align 4
  %42 = icmp eq i32 %41, 3
  %43 = load i32, i32* %1, align 4
  %44 = mul nsw i32 %43, 600
  %45 = load i32, i32* %2, align 4
  %46 = add nsw i32 %44, %45
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [360000 x i8], [360000 x i8]* @next_board, i64 0, i64 %47
  %49 = zext i1 %42 to i8
  store i8 %49, i8* %48, align 1
  br label %50

50:                                               ; preds = %40, %31
  br label %51

51:                                               ; preds = %50
  %52 = load i32, i32* %2, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %2, align 4
  br label %10

54:                                               ; preds = %10
  br label %55

55:                                               ; preds = %54
  %56 = load i32, i32* %1, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %1, align 4
  br label %6

58:                                               ; preds = %6
  store i32 0, i32* %4, align 4
  br label %59

59:                                               ; preds = %86, %58
  %60 = load i32, i32* %4, align 4
  %61 = icmp slt i32 %60, 600
  br i1 %61, label %62, label %89

62:                                               ; preds = %59
  store i32 0, i32* %5, align 4
  br label %63

63:                                               ; preds = %82, %62
  %64 = load i32, i32* %5, align 4
  %65 = icmp slt i32 %64, 600
  br i1 %65, label %66, label %85

66:                                               ; preds = %63
  %67 = load i32, i32* %4, align 4
  %68 = mul nsw i32 %67, 600
  %69 = load i32, i32* %5, align 4
  %70 = add nsw i32 %68, %69
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [360000 x i8], [360000 x i8]* @next_board, i64 0, i64 %71
  %73 = load i8, i8* %72, align 1
  %74 = trunc i8 %73 to i1
  %75 = load i32, i32* %4, align 4
  %76 = mul nsw i32 %75, 600
  %77 = load i32, i32* %5, align 4
  %78 = add nsw i32 %76, %77
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [360000 x i8], [360000 x i8]* @board, i64 0, i64 %79
  %81 = zext i1 %74 to i8
  store i8 %81, i8* %80, align 1
  br label %82

82:                                               ; preds = %66
  %83 = load i32, i32* %5, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, i32* %5, align 4
  br label %63

85:                                               ; preds = %63
  br label %86

86:                                               ; preds = %85
  %87 = load i32, i32* %4, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, i32* %4, align 4
  br label %59

89:                                               ; preds = %59
  ret void
}

define dso_local i32 @main(i32 %0, i8** %1) {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  call void @init_board(i8* getelementptr inbounds ([360000 x i8], [360000 x i8]* @board, i64 0, i64 0))
  br label %6

6:                                                ; preds = %6, %2
  call void @update_board()
  call void @draw(i8* getelementptr inbounds ([360000 x i8], [360000 x i8]* @board, i64 0, i64 0))
  br label %6
}

declare dso_local void @init_board(i8*)

declare dso_local void @draw(i8*)
