; ModuleID = 'src/logic.cpp'
source_filename = "src/logic.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"class.sf::Color" = type { i8, i8, i8, i8 }
%"class.sf::VertexArray" = type <{ %"class.sf::Drawable", %"class.std::vector", i32, [4 x i8] }>
%"class.sf::Drawable" = type { i32 (...)** }
%"class.std::vector" = type { %"struct.std::_Vector_base" }
%"struct.std::_Vector_base" = type { %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl" }
%"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl" = type { %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl_data" }
%"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl_data" = type { %"class.sf::Vertex"*, %"class.sf::Vertex"*, %"class.sf::Vertex"* }
%"class.sf::Vertex" = type { %"class.sf::Vector2", %"class.sf::Color", %"class.sf::Vector2" }
%"class.sf::Vector2" = type { float, float }

$_ZN2sf7Vector2IfEC2Eff = comdat any

@_ZN2sf5Color5GreenE = external dso_local global %"class.sf::Color", align 1
@_ZN2sf5Color5BlackE = external dso_local global %"class.sf::Color", align 1

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z10put_pixelsRN2sf11VertexArrayEPPb(%"class.sf::VertexArray"* dereferenceable(40) %0, i8** %1) #0 {
  %3 = alloca %"class.sf::VertexArray"*, align 8
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %"class.sf::Color", align 1
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca %"class.sf::Vertex", align 4
  %13 = alloca %"class.sf::Vector2", align 4
  store %"class.sf::VertexArray"* %0, %"class.sf::VertexArray"** %3, align 8
  store i8** %1, i8*** %4, align 8
  store i32 0, i32* %5, align 4
  br label %14

14:                                               ; preds = %71, %2
  %15 = load i32, i32* %5, align 4
  %16 = icmp slt i32 %15, 800
  br i1 %16, label %17, label %74

17:                                               ; preds = %14
  store i32 0, i32* %6, align 4
  br label %18

18:                                               ; preds = %67, %17
  %19 = load i32, i32* %6, align 4
  %20 = icmp slt i32 %19, 600
  br i1 %20, label %21, label %70

21:                                               ; preds = %18
  %22 = load i32, i32* %5, align 4
  %23 = sdiv i32 %22, 2
  store i32 %23, i32* %7, align 4
  %24 = load i32, i32* %6, align 4
  %25 = sdiv i32 %24, 2
  store i32 %25, i32* %8, align 4
  %26 = load i8**, i8*** %4, align 8
  %27 = load i32, i32* %8, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i8*, i8** %26, i64 %28
  %30 = load i8*, i8** %29, align 8
  %31 = load i32, i32* %7, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8, i8* %30, i64 %32
  %34 = load i8, i8* %33, align 1
  %35 = trunc i8 %34 to i1
  br i1 %35, label %36, label %37

36:                                               ; preds = %21
  br label %38

37:                                               ; preds = %21
  br label %38

38:                                               ; preds = %37, %36
  %39 = phi %"class.sf::Color"* [ @_ZN2sf5Color5GreenE, %36 ], [ @_ZN2sf5Color5BlackE, %37 ]
  %40 = bitcast %"class.sf::Color"* %9 to i8*
  %41 = bitcast %"class.sf::Color"* %39 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %40, i8* align 1 %41, i64 4, i1 false)
  store i32 0, i32* %10, align 4
  br label %42

42:                                               ; preds = %63, %38
  %43 = load i32, i32* %10, align 4
  %44 = icmp slt i32 %43, 2
  br i1 %44, label %45, label %66

45:                                               ; preds = %42
  store i32 0, i32* %11, align 4
  br label %46

46:                                               ; preds = %59, %45
  %47 = load i32, i32* %11, align 4
  %48 = icmp slt i32 %47, 2
  br i1 %48, label %49, label %62

49:                                               ; preds = %46
  %50 = load %"class.sf::VertexArray"*, %"class.sf::VertexArray"** %3, align 8
  %51 = load i32, i32* %5, align 4
  %52 = load i32, i32* %11, align 4
  %53 = add nsw i32 %51, %52
  %54 = sitofp i32 %53 to float
  %55 = load i32, i32* %6, align 4
  %56 = load i32, i32* %10, align 4
  %57 = add nsw i32 %55, %56
  %58 = sitofp i32 %57 to float
  call void @_ZN2sf7Vector2IfEC2Eff(%"class.sf::Vector2"* %13, float %54, float %58)
  call void @_ZN2sf6VertexC1ERKNS_7Vector2IfEERKNS_5ColorE(%"class.sf::Vertex"* %12, %"class.sf::Vector2"* dereferenceable(8) %13, %"class.sf::Color"* dereferenceable(4) %9)
  call void @_ZN2sf11VertexArray6appendERKNS_6VertexE(%"class.sf::VertexArray"* %50, %"class.sf::Vertex"* dereferenceable(20) %12)
  br label %59

59:                                               ; preds = %49
  %60 = load i32, i32* %11, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, i32* %11, align 4
  br label %46

62:                                               ; preds = %46
  br label %63

63:                                               ; preds = %62
  %64 = load i32, i32* %10, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %10, align 4
  br label %42

66:                                               ; preds = %42
  br label %67

67:                                               ; preds = %66
  %68 = load i32, i32* %6, align 4
  %69 = add nsw i32 %68, 2
  store i32 %69, i32* %6, align 4
  br label %18

70:                                               ; preds = %18
  br label %71

71:                                               ; preds = %70
  %72 = load i32, i32* %5, align 4
  %73 = add nsw i32 %72, 2
  store i32 %73, i32* %5, align 4
  br label %14

74:                                               ; preds = %14
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

declare dso_local void @_ZN2sf11VertexArray6appendERKNS_6VertexE(%"class.sf::VertexArray"*, %"class.sf::Vertex"* dereferenceable(20)) #2

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN2sf7Vector2IfEC2Eff(%"class.sf::Vector2"* %0, float %1, float %2) unnamed_addr #3 comdat align 2 {
  %4 = alloca %"class.sf::Vector2"*, align 8
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  store %"class.sf::Vector2"* %0, %"class.sf::Vector2"** %4, align 8
  store float %1, float* %5, align 4
  store float %2, float* %6, align 4
  %7 = load %"class.sf::Vector2"*, %"class.sf::Vector2"** %4, align 8
  %8 = getelementptr inbounds %"class.sf::Vector2", %"class.sf::Vector2"* %7, i32 0, i32 0
  %9 = load float, float* %5, align 4
  store float %9, float* %8, align 4
  %10 = getelementptr inbounds %"class.sf::Vector2", %"class.sf::Vector2"* %7, i32 0, i32 1
  %11 = load float, float* %6, align 4
  store float %11, float* %10, align 4
  ret void
}

declare dso_local void @_ZN2sf6VertexC1ERKNS_7Vector2IfEERKNS_5ColorE(%"class.sf::Vertex"*, %"class.sf::Vector2"* dereferenceable(8), %"class.sf::Color"* dereferenceable(4)) unnamed_addr #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_Z13initial_boardPPb(i8** %0) #3 {
  %2 = alloca i8**, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i8** %0, i8*** %2, align 8
  store i32 0, i32* %3, align 4
  br label %5

5:                                                ; preds = %29, %1
  %6 = load i32, i32* %3, align 4
  %7 = icmp slt i32 %6, 300
  br i1 %7, label %8, label %32

8:                                                ; preds = %5
  store i32 0, i32* %4, align 4
  br label %9

9:                                                ; preds = %25, %8
  %10 = load i32, i32* %4, align 4
  %11 = icmp slt i32 %10, 400
  br i1 %11, label %12, label %28

12:                                               ; preds = %9
  %13 = call i32 @rand() #5
  %14 = srem i32 %13, 2
  %15 = icmp eq i32 %14, 0
  %16 = load i8**, i8*** %2, align 8
  %17 = load i32, i32* %3, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i8*, i8** %16, i64 %18
  %20 = load i8*, i8** %19, align 8
  %21 = load i32, i32* %4, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i8, i8* %20, i64 %22
  %24 = zext i1 %15 to i8
  store i8 %24, i8* %23, align 1
  br label %25

25:                                               ; preds = %12
  %26 = load i32, i32* %4, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %4, align 4
  br label %9

28:                                               ; preds = %9
  br label %29

29:                                               ; preds = %28
  %30 = load i32, i32* %3, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %3, align 4
  br label %5

32:                                               ; preds = %5
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @rand() #4

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z12update_boardRPPbS1_(i8*** dereferenceable(8) %0, i8*** dereferenceable(8) %1) #0 {
  %3 = alloca i8***, align 8
  %4 = alloca i8***, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i8*** %0, i8**** %3, align 8
  store i8*** %1, i8**** %4, align 8
  store i32 0, i32* %5, align 4
  br label %10

10:                                               ; preds = %70, %2
  %11 = load i32, i32* %5, align 4
  %12 = icmp slt i32 %11, 300
  br i1 %12, label %13, label %73

13:                                               ; preds = %10
  store i32 0, i32* %6, align 4
  br label %14

14:                                               ; preds = %66, %13
  %15 = load i32, i32* %6, align 4
  %16 = icmp slt i32 %15, 400
  br i1 %16, label %17, label %69

17:                                               ; preds = %14
  %18 = load i8***, i8**** %3, align 8
  %19 = load i8**, i8*** %18, align 8
  %20 = load i32, i32* %6, align 4
  %21 = load i32, i32* %5, align 4
  %22 = call i32 @_Z11count_cellsPPbii(i8** %19, i32 %20, i32 %21)
  store i32 %22, i32* %7, align 4
  %23 = load i8***, i8**** %3, align 8
  %24 = load i8**, i8*** %23, align 8
  %25 = load i32, i32* %5, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8*, i8** %24, i64 %26
  %28 = load i8*, i8** %27, align 8
  %29 = load i32, i32* %6, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i8, i8* %28, i64 %30
  %32 = load i8, i8* %31, align 1
  %33 = trunc i8 %32 to i1
  br i1 %33, label %34, label %52

34:                                               ; preds = %17
  %35 = load i32, i32* %7, align 4
  %36 = icmp eq i32 %35, 2
  br i1 %36, label %40, label %37

37:                                               ; preds = %34
  %38 = load i32, i32* %7, align 4
  %39 = icmp eq i32 %38, 3
  br label %40

40:                                               ; preds = %37, %34
  %41 = phi i1 [ true, %34 ], [ %39, %37 ]
  %42 = load i8***, i8**** %4, align 8
  %43 = load i8**, i8*** %42, align 8
  %44 = load i32, i32* %5, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i8*, i8** %43, i64 %45
  %47 = load i8*, i8** %46, align 8
  %48 = load i32, i32* %6, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i8, i8* %47, i64 %49
  %51 = zext i1 %41 to i8
  store i8 %51, i8* %50, align 1
  br label %65

52:                                               ; preds = %17
  %53 = load i32, i32* %7, align 4
  %54 = icmp eq i32 %53, 3
  %55 = load i8***, i8**** %4, align 8
  %56 = load i8**, i8*** %55, align 8
  %57 = load i32, i32* %5, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i8*, i8** %56, i64 %58
  %60 = load i8*, i8** %59, align 8
  %61 = load i32, i32* %6, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8, i8* %60, i64 %62
  %64 = zext i1 %54 to i8
  store i8 %64, i8* %63, align 1
  br label %65

65:                                               ; preds = %52, %40
  br label %66

66:                                               ; preds = %65
  %67 = load i32, i32* %6, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, i32* %6, align 4
  br label %14

69:                                               ; preds = %14
  br label %70

70:                                               ; preds = %69
  %71 = load i32, i32* %5, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, i32* %5, align 4
  br label %10

73:                                               ; preds = %10
  store i32 0, i32* %8, align 4
  br label %74

74:                                               ; preds = %107, %73
  %75 = load i32, i32* %8, align 4
  %76 = icmp slt i32 %75, 300
  br i1 %76, label %77, label %110

77:                                               ; preds = %74
  store i32 0, i32* %9, align 4
  br label %78

78:                                               ; preds = %103, %77
  %79 = load i32, i32* %9, align 4
  %80 = icmp slt i32 %79, 400
  br i1 %80, label %81, label %106

81:                                               ; preds = %78
  %82 = load i8***, i8**** %4, align 8
  %83 = load i8**, i8*** %82, align 8
  %84 = load i32, i32* %8, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i8*, i8** %83, i64 %85
  %87 = load i8*, i8** %86, align 8
  %88 = load i32, i32* %9, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i8, i8* %87, i64 %89
  %91 = load i8, i8* %90, align 1
  %92 = trunc i8 %91 to i1
  %93 = load i8***, i8**** %3, align 8
  %94 = load i8**, i8*** %93, align 8
  %95 = load i32, i32* %8, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i8*, i8** %94, i64 %96
  %98 = load i8*, i8** %97, align 8
  %99 = load i32, i32* %9, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i8, i8* %98, i64 %100
  %102 = zext i1 %92 to i8
  store i8 %102, i8* %101, align 1
  br label %103

103:                                              ; preds = %81
  %104 = load i32, i32* %9, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* %9, align 4
  br label %78

106:                                              ; preds = %78
  br label %107

107:                                              ; preds = %106
  %108 = load i32, i32* %8, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, i32* %8, align 4
  br label %74

110:                                              ; preds = %74
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_Z11count_cellsPPbii(i8** %0, i32 %1, i32 %2) #3 {
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i8** %0, i8*** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  store i32 0, i32* %7, align 4
  %10 = load i32, i32* %5, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %66

12:                                               ; preds = %3
  %13 = load i32, i32* %5, align 4
  %14 = icmp slt i32 %13, 399
  br i1 %14, label %15, label %66

15:                                               ; preds = %12
  %16 = load i32, i32* %6, align 4
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %18, label %66

18:                                               ; preds = %15
  %19 = load i32, i32* %6, align 4
  %20 = icmp slt i32 %19, 299
  br i1 %20, label %21, label %66

21:                                               ; preds = %18
  store i32 -1, i32* %8, align 4
  br label %22

22:                                               ; preds = %62, %21
  %23 = load i32, i32* %8, align 4
  %24 = icmp sle i32 %23, 1
  br i1 %24, label %25, label %65

25:                                               ; preds = %22
  store i32 -1, i32* %9, align 4
  br label %26

26:                                               ; preds = %58, %25
  %27 = load i32, i32* %9, align 4
  %28 = icmp sle i32 %27, 1
  br i1 %28, label %29, label %61

29:                                               ; preds = %26
  %30 = load i32, i32* %8, align 4
  %31 = icmp eq i32 %30, 0
  %32 = zext i1 %31 to i32
  %33 = load i32, i32* %9, align 4
  %34 = icmp eq i32 %33, 0
  %35 = zext i1 %34 to i32
  %36 = and i32 %32, %35
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %39

38:                                               ; preds = %29
  br label %58

39:                                               ; preds = %29
  %40 = load i8**, i8*** %4, align 8
  %41 = load i32, i32* %6, align 4
  %42 = load i32, i32* %9, align 4
  %43 = add nsw i32 %41, %42
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i8*, i8** %40, i64 %44
  %46 = load i8*, i8** %45, align 8
  %47 = load i32, i32* %5, align 4
  %48 = load i32, i32* %8, align 4
  %49 = add nsw i32 %47, %48
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8, i8* %46, i64 %50
  %52 = load i8, i8* %51, align 1
  %53 = trunc i8 %52 to i1
  br i1 %53, label %54, label %57

54:                                               ; preds = %39
  %55 = load i32, i32* %7, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %7, align 4
  br label %57

57:                                               ; preds = %54, %39
  br label %58

58:                                               ; preds = %57, %38
  %59 = load i32, i32* %9, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %9, align 4
  br label %26

61:                                               ; preds = %26
  br label %62

62:                                               ; preds = %61
  %63 = load i32, i32* %8, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %8, align 4
  br label %22

65:                                               ; preds = %22
  br label %66

66:                                               ; preds = %65, %18, %15, %12, %3
  %67 = load i32, i32* %7, align 4
  ret i32 %67
}

attributes #0 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
