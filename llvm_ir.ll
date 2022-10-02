; ModuleID = 'src/graph.cpp'
source_filename = "src/graph.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"class.sf::RenderStates" = type { %"struct.sf::BlendMode", %"class.sf::Transform", %"class.sf::Texture"*, %"class.sf::Shader"* }
%"struct.sf::BlendMode" = type { i32, i32, i32, i32, i32, i32 }
%"class.sf::Transform" = type { [16 x float] }
%"class.sf::Texture" = type { %"class.sf::Vector2.0", %"class.sf::Vector2.0", i32, i8, i8, i8, i8, i8, i8, i64 }
%"class.sf::Vector2.0" = type { i32, i32 }
%"class.sf::Shader" = type { i32, i32, %"class.std::map", %"class.std::map.4" }
%"class.std::map" = type { %"class.std::_Rb_tree" }
%"class.std::_Rb_tree" = type { %"struct.std::_Rb_tree<int, std::pair<const int, const sf::Texture *>, std::_Select1st<std::pair<const int, const sf::Texture *> >, std::less<int>, std::allocator<std::pair<const int, const sf::Texture *> > >::_Rb_tree_impl" }
%"struct.std::_Rb_tree<int, std::pair<const int, const sf::Texture *>, std::_Select1st<std::pair<const int, const sf::Texture *> >, std::less<int>, std::allocator<std::pair<const int, const sf::Texture *> > >::_Rb_tree_impl" = type { %"struct.std::_Rb_tree_key_compare", %"struct.std::_Rb_tree_header" }
%"struct.std::_Rb_tree_key_compare" = type { %"struct.std::less" }
%"struct.std::less" = type { i8 }
%"struct.std::_Rb_tree_header" = type { %"struct.std::_Rb_tree_node_base", i64 }
%"struct.std::_Rb_tree_node_base" = type { i32, %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* }
%"class.std::map.4" = type { %"class.std::_Rb_tree.5" }
%"class.std::_Rb_tree.5" = type { %"struct.std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const std::__cxx11::basic_string<char>, int>, std::_Select1st<std::pair<const std::__cxx11::basic_string<char>, int> >, std::less<std::__cxx11::basic_string<char> >, std::allocator<std::pair<const std::__cxx11::basic_string<char>, int> > >::_Rb_tree_impl" }
%"struct.std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const std::__cxx11::basic_string<char>, int>, std::_Select1st<std::pair<const std::__cxx11::basic_string<char>, int> >, std::less<std::__cxx11::basic_string<char> >, std::allocator<std::pair<const std::__cxx11::basic_string<char>, int> > >::_Rb_tree_impl" = type { %"struct.std::_Rb_tree_key_compare.9", %"struct.std::_Rb_tree_header" }
%"struct.std::_Rb_tree_key_compare.9" = type { %"struct.std::less.10" }
%"struct.std::less.10" = type { i8 }
%class.Wrapper = type { i8**, i8**, %"class.sf::VertexArray" }
%"class.sf::VertexArray" = type <{ %"class.sf::Drawable", %"class.std::vector", i32, [4 x i8] }>
%"class.sf::Drawable" = type { i32 (...)** }
%"class.std::vector" = type { %"struct.std::_Vector_base" }
%"struct.std::_Vector_base" = type { %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl" }
%"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl" = type { %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl_data" }
%"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl_data" = type { %"class.sf::Vertex"*, %"class.sf::Vertex"*, %"class.sf::Vertex"* }
%"class.sf::Vertex" = type { %"class.sf::Vector2", %"class.sf::Color", %"class.sf::Vector2" }
%"class.sf::Color" = type { i8, i8, i8, i8 }
%"class.sf::Vector2" = type { float, float }
%"class.sf::RenderWindow" = type { %"class.sf::Window", %"class.sf::RenderTarget" }
%"class.sf::Window" = type { i32 (...)**, %"class.sf::priv::WindowImpl"*, %"class.sf::priv::GlContext"*, %"class.sf::Clock", %"class.sf::Time", %"class.sf::Vector2.0" }
%"class.sf::priv::WindowImpl" = type opaque
%"class.sf::priv::GlContext" = type opaque
%"class.sf::Clock" = type { %"class.sf::Time" }
%"class.sf::Time" = type { i64 }
%"class.sf::RenderTarget" = type { i32 (...)**, %"class.sf::View", %"class.sf::View", %"struct.sf::RenderTarget::StatesCache", i64 }
%"class.sf::View" = type <{ %"class.sf::Vector2", %"class.sf::Vector2", float, %"class.sf::Rect", %"class.sf::Transform", %"class.sf::Transform", i8, i8, [2 x i8] }>
%"class.sf::Rect" = type { float, float, float, float }
%"struct.sf::RenderTarget::StatesCache" = type <{ i8, i8, i8, i8, %"struct.sf::BlendMode", [4 x i8], i64, i8, i8, [2 x i8], [4 x %"class.sf::Vertex"], [4 x i8] }>
%"class.std::allocator" = type { i8 }
%"class.__gnu_cxx::new_allocator" = type { i8 }

$_ZN2sf11VertexArrayD2Ev = comdat any

$_ZN2sf7Vector2IfEC2Eff = comdat any

$_ZNSt6vectorIN2sf6VertexESaIS1_EED2Ev = comdat any

$_ZN2sf8DrawableD2Ev = comdat any

$_ZSt8_DestroyIPN2sf6VertexES1_EvT_S3_RSaIT0_E = comdat any

$_ZNSt12_Vector_baseIN2sf6VertexESaIS1_EE19_M_get_Tp_allocatorEv = comdat any

$_ZNSt12_Vector_baseIN2sf6VertexESaIS1_EED2Ev = comdat any

$__clang_call_terminate = comdat any

$_ZSt8_DestroyIPN2sf6VertexEEvT_S3_ = comdat any

$_ZNSt12_Destroy_auxILb1EE9__destroyIPN2sf6VertexEEEvT_S5_ = comdat any

$_ZNSt12_Vector_baseIN2sf6VertexESaIS1_EE13_M_deallocateEPS1_m = comdat any

$_ZNSt12_Vector_baseIN2sf6VertexESaIS1_EE12_Vector_implD2Ev = comdat any

$_ZNSt16allocator_traitsISaIN2sf6VertexEEE10deallocateERS2_PS1_m = comdat any

$_ZN9__gnu_cxx13new_allocatorIN2sf6VertexEE10deallocateEPS2_m = comdat any

$_ZNSaIN2sf6VertexEED2Ev = comdat any

$_ZN9__gnu_cxx13new_allocatorIN2sf6VertexEED2Ev = comdat any

@_ZN2sf12RenderStates7DefaultE = external dso_local global %"class.sf::RenderStates", align 8
@_ZTVN2sf11VertexArrayE = external dso_local unnamed_addr constant { [5 x i8*] }, align 8

@_ZN7WrapperC1ERN2sf12RenderWindowE = dso_local unnamed_addr alias void (%class.Wrapper*, %"class.sf::RenderWindow"*), void (%class.Wrapper*, %"class.sf::RenderWindow"*)* @_ZN7WrapperC2ERN2sf12RenderWindowE
@_ZN7WrapperD1Ev = dso_local unnamed_addr alias void (%class.Wrapper*), void (%class.Wrapper*)* @_ZN7WrapperD2Ev

; Function Attrs: noinline optnone uwtable
define dso_local void @_ZN7WrapperC2ERN2sf12RenderWindowE(%class.Wrapper* %0, %"class.sf::RenderWindow"* dereferenceable(528) %1) unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %class.Wrapper*, align 8
  %4 = alloca %"class.sf::RenderWindow"*, align 8
  %5 = alloca i8*
  %6 = alloca i32
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store %class.Wrapper* %0, %class.Wrapper** %3, align 8
  store %"class.sf::RenderWindow"* %1, %"class.sf::RenderWindow"** %4, align 8
  %9 = load %class.Wrapper*, %class.Wrapper** %3, align 8
  %10 = getelementptr inbounds %class.Wrapper, %class.Wrapper* %9, i32 0, i32 2
  call void @_ZN2sf11VertexArrayC1Ev(%"class.sf::VertexArray"* %10)
  %11 = invoke i8* @_Znam(i64 2400) #6
          to label %12 unwind label %29

12:                                               ; preds = %2
  %13 = bitcast i8* %11 to i8**
  %14 = getelementptr inbounds %class.Wrapper, %class.Wrapper* %9, i32 0, i32 0
  store i8** %13, i8*** %14, align 8
  store i32 0, i32* %7, align 4
  br label %15

15:                                               ; preds = %26, %12
  %16 = load i32, i32* %7, align 4
  %17 = icmp slt i32 %16, 300
  br i1 %17, label %18, label %33

18:                                               ; preds = %15
  %19 = invoke i8* @_Znam(i64 400) #6
          to label %20 unwind label %29

20:                                               ; preds = %18
  %21 = getelementptr inbounds %class.Wrapper, %class.Wrapper* %9, i32 0, i32 0
  %22 = load i8**, i8*** %21, align 8
  %23 = load i32, i32* %7, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i8*, i8** %22, i64 %24
  store i8* %19, i8** %25, align 8
  br label %26

26:                                               ; preds = %20
  %27 = load i32, i32* %7, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %7, align 4
  br label %15

29:                                               ; preds = %41, %33, %18, %2
  %30 = landingpad { i8*, i32 }
          cleanup
  %31 = extractvalue { i8*, i32 } %30, 0
  store i8* %31, i8** %5, align 8
  %32 = extractvalue { i8*, i32 } %30, 1
  store i32 %32, i32* %6, align 4
  call void @_ZN2sf11VertexArrayD2Ev(%"class.sf::VertexArray"* %10) #7
  br label %53

33:                                               ; preds = %15
  %34 = invoke i8* @_Znam(i64 2400) #6
          to label %35 unwind label %29

35:                                               ; preds = %33
  %36 = bitcast i8* %34 to i8**
  %37 = getelementptr inbounds %class.Wrapper, %class.Wrapper* %9, i32 0, i32 1
  store i8** %36, i8*** %37, align 8
  store i32 0, i32* %8, align 4
  br label %38

38:                                               ; preds = %49, %35
  %39 = load i32, i32* %8, align 4
  %40 = icmp slt i32 %39, 300
  br i1 %40, label %41, label %52

41:                                               ; preds = %38
  %42 = invoke i8* @_Znam(i64 400) #6
          to label %43 unwind label %29

43:                                               ; preds = %41
  %44 = getelementptr inbounds %class.Wrapper, %class.Wrapper* %9, i32 0, i32 1
  %45 = load i8**, i8*** %44, align 8
  %46 = load i32, i32* %8, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i8*, i8** %45, i64 %47
  store i8* %42, i8** %48, align 8
  br label %49

49:                                               ; preds = %43
  %50 = load i32, i32* %8, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %8, align 4
  br label %38

52:                                               ; preds = %38
  ret void

53:                                               ; preds = %29
  %54 = load i8*, i8** %5, align 8
  %55 = load i32, i32* %6, align 4
  %56 = insertvalue { i8*, i32 } undef, i8* %54, 0
  %57 = insertvalue { i8*, i32 } %56, i32 %55, 1
  resume { i8*, i32 } %57
}

declare dso_local void @_ZN2sf11VertexArrayC1Ev(%"class.sf::VertexArray"*) unnamed_addr #1

; Function Attrs: nobuiltin
declare dso_local noalias i8* @_Znam(i64) #2

declare dso_local i32 @__gxx_personality_v0(...)

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN2sf11VertexArrayD2Ev(%"class.sf::VertexArray"* %0) unnamed_addr #3 comdat align 2 {
  %2 = alloca %"class.sf::VertexArray"*, align 8
  store %"class.sf::VertexArray"* %0, %"class.sf::VertexArray"** %2, align 8
  %3 = load %"class.sf::VertexArray"*, %"class.sf::VertexArray"** %2, align 8
  %4 = bitcast %"class.sf::VertexArray"* %3 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVN2sf11VertexArrayE, i32 0, inrange i32 0, i32 2) to i32 (...)**), i32 (...)*** %4, align 8
  %5 = getelementptr inbounds %"class.sf::VertexArray", %"class.sf::VertexArray"* %3, i32 0, i32 1
  call void @_ZNSt6vectorIN2sf6VertexESaIS1_EED2Ev(%"class.std::vector"* %5) #7
  %6 = bitcast %"class.sf::VertexArray"* %3 to %"class.sf::Drawable"*
  call void @_ZN2sf8DrawableD2Ev(%"class.sf::Drawable"* %6) #7
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_ZN7WrapperD2Ev(%class.Wrapper* %0) unnamed_addr #3 align 2 {
  %2 = alloca %class.Wrapper*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store %class.Wrapper* %0, %class.Wrapper** %2, align 8
  %5 = load %class.Wrapper*, %class.Wrapper** %2, align 8
  store i32 0, i32* %3, align 4
  br label %6

6:                                                ; preds = %19, %1
  %7 = load i32, i32* %3, align 4
  %8 = icmp slt i32 %7, 300
  br i1 %8, label %9, label %22

9:                                                ; preds = %6
  %10 = getelementptr inbounds %class.Wrapper, %class.Wrapper* %5, i32 0, i32 0
  %11 = load i8**, i8*** %10, align 8
  %12 = load i32, i32* %3, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i8*, i8** %11, i64 %13
  %15 = load i8*, i8** %14, align 8
  %16 = icmp eq i8* %15, null
  br i1 %16, label %18, label %17

17:                                               ; preds = %9
  call void @_ZdaPv(i8* %15) #8
  br label %18

18:                                               ; preds = %17, %9
  br label %19

19:                                               ; preds = %18
  %20 = load i32, i32* %3, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %3, align 4
  br label %6

22:                                               ; preds = %6
  %23 = getelementptr inbounds %class.Wrapper, %class.Wrapper* %5, i32 0, i32 0
  %24 = load i8**, i8*** %23, align 8
  %25 = icmp eq i8** %24, null
  br i1 %25, label %28, label %26

26:                                               ; preds = %22
  %27 = bitcast i8** %24 to i8*
  call void @_ZdaPv(i8* %27) #8
  br label %28

28:                                               ; preds = %26, %22
  store i32 0, i32* %4, align 4
  br label %29

29:                                               ; preds = %42, %28
  %30 = load i32, i32* %4, align 4
  %31 = icmp slt i32 %30, 300
  br i1 %31, label %32, label %45

32:                                               ; preds = %29
  %33 = getelementptr inbounds %class.Wrapper, %class.Wrapper* %5, i32 0, i32 1
  %34 = load i8**, i8*** %33, align 8
  %35 = load i32, i32* %4, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i8*, i8** %34, i64 %36
  %38 = load i8*, i8** %37, align 8
  %39 = icmp eq i8* %38, null
  br i1 %39, label %41, label %40

40:                                               ; preds = %32
  call void @_ZdaPv(i8* %38) #8
  br label %41

41:                                               ; preds = %40, %32
  br label %42

42:                                               ; preds = %41
  %43 = load i32, i32* %4, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %4, align 4
  br label %29

45:                                               ; preds = %29
  %46 = getelementptr inbounds %class.Wrapper, %class.Wrapper* %5, i32 0, i32 1
  %47 = load i8**, i8*** %46, align 8
  %48 = icmp eq i8** %47, null
  br i1 %48, label %51, label %49

49:                                               ; preds = %45
  %50 = bitcast i8** %47 to i8*
  call void @_ZdaPv(i8* %50) #8
  br label %51

51:                                               ; preds = %49, %45
  %52 = getelementptr inbounds %class.Wrapper, %class.Wrapper* %5, i32 0, i32 2
  call void @_ZN2sf11VertexArrayD2Ev(%"class.sf::VertexArray"* %52) #7
  ret void
}

; Function Attrs: nobuiltin nounwind
declare dso_local void @_ZdaPv(i8*) #4

; Function Attrs: noinline optnone uwtable
define dso_local void @_ZN7Wrapper9put_pixelEmmN2sf5ColorE(%class.Wrapper* %0, i64 %1, i64 %2, i32 %3) #0 align 2 {
  %5 = alloca %"class.sf::Color", align 1
  %6 = alloca %class.Wrapper*, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca %"class.sf::Vertex", align 4
  %10 = alloca %"class.sf::Vector2", align 4
  %11 = bitcast %"class.sf::Color"* %5 to i32*
  store i32 %3, i32* %11, align 1
  store %class.Wrapper* %0, %class.Wrapper** %6, align 8
  store i64 %1, i64* %7, align 8
  store i64 %2, i64* %8, align 8
  %12 = load %class.Wrapper*, %class.Wrapper** %6, align 8
  %13 = getelementptr inbounds %class.Wrapper, %class.Wrapper* %12, i32 0, i32 2
  %14 = load i64, i64* %7, align 8
  %15 = uitofp i64 %14 to float
  %16 = load i64, i64* %8, align 8
  %17 = uitofp i64 %16 to float
  call void @_ZN2sf7Vector2IfEC2Eff(%"class.sf::Vector2"* %10, float %15, float %17)
  call void @_ZN2sf6VertexC1ERKNS_7Vector2IfEERKNS_5ColorE(%"class.sf::Vertex"* %9, %"class.sf::Vector2"* dereferenceable(8) %10, %"class.sf::Color"* dereferenceable(4) %5)
  call void @_ZN2sf11VertexArray6appendERKNS_6VertexE(%"class.sf::VertexArray"* %13, %"class.sf::Vertex"* dereferenceable(20) %9)
  ret void
}

declare dso_local void @_ZN2sf11VertexArray6appendERKNS_6VertexE(%"class.sf::VertexArray"*, %"class.sf::Vertex"* dereferenceable(20)) #1

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

declare dso_local void @_ZN2sf6VertexC1ERKNS_7Vector2IfEERKNS_5ColorE(%"class.sf::Vertex"*, %"class.sf::Vector2"* dereferenceable(8), %"class.sf::Color"* dereferenceable(4)) unnamed_addr #1

; Function Attrs: noinline optnone uwtable
define dso_local void @_ZN7Wrapper7displayERN2sf12RenderWindowE(%class.Wrapper* %0, %"class.sf::RenderWindow"* dereferenceable(528) %1) #0 align 2 {
  %3 = alloca %class.Wrapper*, align 8
  %4 = alloca %"class.sf::RenderWindow"*, align 8
  store %class.Wrapper* %0, %class.Wrapper** %3, align 8
  store %"class.sf::RenderWindow"* %1, %"class.sf::RenderWindow"** %4, align 8
  %5 = load %class.Wrapper*, %class.Wrapper** %3, align 8
  %6 = load %"class.sf::RenderWindow"*, %"class.sf::RenderWindow"** %4, align 8
  %7 = bitcast %"class.sf::RenderWindow"* %6 to i8*
  %8 = getelementptr inbounds i8, i8* %7, i64 48
  %9 = bitcast i8* %8 to %"class.sf::RenderTarget"*
  %10 = getelementptr inbounds %class.Wrapper, %class.Wrapper* %5, i32 0, i32 2
  %11 = bitcast %"class.sf::VertexArray"* %10 to %"class.sf::Drawable"*
  call void @_ZN2sf12RenderTarget4drawERKNS_8DrawableERKNS_12RenderStatesE(%"class.sf::RenderTarget"* %9, %"class.sf::Drawable"* dereferenceable(8) %11, %"class.sf::RenderStates"* dereferenceable(104) @_ZN2sf12RenderStates7DefaultE)
  %12 = load %"class.sf::RenderWindow"*, %"class.sf::RenderWindow"** %4, align 8
  %13 = bitcast %"class.sf::RenderWindow"* %12 to %"class.sf::Window"*
  call void @_ZN2sf6Window7displayEv(%"class.sf::Window"* %13)
  ret void
}

declare dso_local void @_ZN2sf12RenderTarget4drawERKNS_8DrawableERKNS_12RenderStatesE(%"class.sf::RenderTarget"*, %"class.sf::Drawable"* dereferenceable(8), %"class.sf::RenderStates"* dereferenceable(104)) #1

declare dso_local void @_ZN2sf6Window7displayEv(%"class.sf::Window"*) #1

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt6vectorIN2sf6VertexESaIS1_EED2Ev(%"class.std::vector"* %0) unnamed_addr #3 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %"class.std::vector"*, align 8
  %3 = alloca i8*
  %4 = alloca i32
  store %"class.std::vector"* %0, %"class.std::vector"** %2, align 8
  %5 = load %"class.std::vector"*, %"class.std::vector"** %2, align 8
  %6 = bitcast %"class.std::vector"* %5 to %"struct.std::_Vector_base"*
  %7 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %6, i32 0, i32 0
  %8 = bitcast %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl"* %7 to %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl_data"*
  %9 = getelementptr inbounds %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl_data", %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl_data"* %8, i32 0, i32 0
  %10 = load %"class.sf::Vertex"*, %"class.sf::Vertex"** %9, align 8
  %11 = bitcast %"class.std::vector"* %5 to %"struct.std::_Vector_base"*
  %12 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %11, i32 0, i32 0
  %13 = bitcast %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl"* %12 to %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl_data"*
  %14 = getelementptr inbounds %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl_data", %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl_data"* %13, i32 0, i32 1
  %15 = load %"class.sf::Vertex"*, %"class.sf::Vertex"** %14, align 8
  %16 = bitcast %"class.std::vector"* %5 to %"struct.std::_Vector_base"*
  %17 = call dereferenceable(1) %"class.std::allocator"* @_ZNSt12_Vector_baseIN2sf6VertexESaIS1_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %16) #7
  invoke void @_ZSt8_DestroyIPN2sf6VertexES1_EvT_S3_RSaIT0_E(%"class.sf::Vertex"* %10, %"class.sf::Vertex"* %15, %"class.std::allocator"* dereferenceable(1) %17)
          to label %18 unwind label %20

18:                                               ; preds = %1
  %19 = bitcast %"class.std::vector"* %5 to %"struct.std::_Vector_base"*
  call void @_ZNSt12_Vector_baseIN2sf6VertexESaIS1_EED2Ev(%"struct.std::_Vector_base"* %19) #7
  ret void

20:                                               ; preds = %1
  %21 = landingpad { i8*, i32 }
          catch i8* null
  %22 = extractvalue { i8*, i32 } %21, 0
  store i8* %22, i8** %3, align 8
  %23 = extractvalue { i8*, i32 } %21, 1
  store i32 %23, i32* %4, align 4
  %24 = bitcast %"class.std::vector"* %5 to %"struct.std::_Vector_base"*
  call void @_ZNSt12_Vector_baseIN2sf6VertexESaIS1_EED2Ev(%"struct.std::_Vector_base"* %24) #7
  br label %25

25:                                               ; preds = %20
  %26 = load i8*, i8** %3, align 8
  call void @__clang_call_terminate(i8* %26) #9
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN2sf8DrawableD2Ev(%"class.sf::Drawable"* %0) unnamed_addr #3 comdat align 2 {
  %2 = alloca %"class.sf::Drawable"*, align 8
  store %"class.sf::Drawable"* %0, %"class.sf::Drawable"** %2, align 8
  %3 = load %"class.sf::Drawable"*, %"class.sf::Drawable"** %2, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZSt8_DestroyIPN2sf6VertexES1_EvT_S3_RSaIT0_E(%"class.sf::Vertex"* %0, %"class.sf::Vertex"* %1, %"class.std::allocator"* dereferenceable(1) %2) #0 comdat {
  %4 = alloca %"class.sf::Vertex"*, align 8
  %5 = alloca %"class.sf::Vertex"*, align 8
  %6 = alloca %"class.std::allocator"*, align 8
  store %"class.sf::Vertex"* %0, %"class.sf::Vertex"** %4, align 8
  store %"class.sf::Vertex"* %1, %"class.sf::Vertex"** %5, align 8
  store %"class.std::allocator"* %2, %"class.std::allocator"** %6, align 8
  %7 = load %"class.sf::Vertex"*, %"class.sf::Vertex"** %4, align 8
  %8 = load %"class.sf::Vertex"*, %"class.sf::Vertex"** %5, align 8
  call void @_ZSt8_DestroyIPN2sf6VertexEEvT_S3_(%"class.sf::Vertex"* %7, %"class.sf::Vertex"* %8)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(1) %"class.std::allocator"* @_ZNSt12_Vector_baseIN2sf6VertexESaIS1_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %0) #3 comdat align 2 {
  %2 = alloca %"struct.std::_Vector_base"*, align 8
  store %"struct.std::_Vector_base"* %0, %"struct.std::_Vector_base"** %2, align 8
  %3 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %2, align 8
  %4 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %3, i32 0, i32 0
  %5 = bitcast %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl"* %4 to %"class.std::allocator"*
  ret %"class.std::allocator"* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseIN2sf6VertexESaIS1_EED2Ev(%"struct.std::_Vector_base"* %0) unnamed_addr #3 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %"struct.std::_Vector_base"*, align 8
  %3 = alloca i8*
  %4 = alloca i32
  store %"struct.std::_Vector_base"* %0, %"struct.std::_Vector_base"** %2, align 8
  %5 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %2, align 8
  %6 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %5, i32 0, i32 0
  %7 = bitcast %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl"* %6 to %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl_data"*
  %8 = getelementptr inbounds %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl_data", %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl_data"* %7, i32 0, i32 0
  %9 = load %"class.sf::Vertex"*, %"class.sf::Vertex"** %8, align 8
  %10 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %5, i32 0, i32 0
  %11 = bitcast %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl"* %10 to %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl_data"*
  %12 = getelementptr inbounds %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl_data", %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl_data"* %11, i32 0, i32 2
  %13 = load %"class.sf::Vertex"*, %"class.sf::Vertex"** %12, align 8
  %14 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %5, i32 0, i32 0
  %15 = bitcast %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl"* %14 to %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl_data"*
  %16 = getelementptr inbounds %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl_data", %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl_data"* %15, i32 0, i32 0
  %17 = load %"class.sf::Vertex"*, %"class.sf::Vertex"** %16, align 8
  %18 = ptrtoint %"class.sf::Vertex"* %13 to i64
  %19 = ptrtoint %"class.sf::Vertex"* %17 to i64
  %20 = sub i64 %18, %19
  %21 = sdiv exact i64 %20, 20
  invoke void @_ZNSt12_Vector_baseIN2sf6VertexESaIS1_EE13_M_deallocateEPS1_m(%"struct.std::_Vector_base"* %5, %"class.sf::Vertex"* %9, i64 %21)
          to label %22 unwind label %24

22:                                               ; preds = %1
  %23 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %5, i32 0, i32 0
  call void @_ZNSt12_Vector_baseIN2sf6VertexESaIS1_EE12_Vector_implD2Ev(%"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl"* %23) #7
  ret void

24:                                               ; preds = %1
  %25 = landingpad { i8*, i32 }
          catch i8* null
  %26 = extractvalue { i8*, i32 } %25, 0
  store i8* %26, i8** %3, align 8
  %27 = extractvalue { i8*, i32 } %25, 1
  store i32 %27, i32* %4, align 4
  %28 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %5, i32 0, i32 0
  call void @_ZNSt12_Vector_baseIN2sf6VertexESaIS1_EE12_Vector_implD2Ev(%"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl"* %28) #7
  br label %29

29:                                               ; preds = %24
  %30 = load i8*, i8** %3, align 8
  call void @__clang_call_terminate(i8* %30) #9
  unreachable
}

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) #5 comdat {
  %2 = call i8* @__cxa_begin_catch(i8* %0) #7
  call void @_ZSt9terminatev() #9
  unreachable
}

declare dso_local i8* @__cxa_begin_catch(i8*)

declare dso_local void @_ZSt9terminatev()

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZSt8_DestroyIPN2sf6VertexEEvT_S3_(%"class.sf::Vertex"* %0, %"class.sf::Vertex"* %1) #0 comdat {
  %3 = alloca %"class.sf::Vertex"*, align 8
  %4 = alloca %"class.sf::Vertex"*, align 8
  store %"class.sf::Vertex"* %0, %"class.sf::Vertex"** %3, align 8
  store %"class.sf::Vertex"* %1, %"class.sf::Vertex"** %4, align 8
  %5 = load %"class.sf::Vertex"*, %"class.sf::Vertex"** %3, align 8
  %6 = load %"class.sf::Vertex"*, %"class.sf::Vertex"** %4, align 8
  call void @_ZNSt12_Destroy_auxILb1EE9__destroyIPN2sf6VertexEEEvT_S5_(%"class.sf::Vertex"* %5, %"class.sf::Vertex"* %6)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt12_Destroy_auxILb1EE9__destroyIPN2sf6VertexEEEvT_S5_(%"class.sf::Vertex"* %0, %"class.sf::Vertex"* %1) #3 comdat align 2 {
  %3 = alloca %"class.sf::Vertex"*, align 8
  %4 = alloca %"class.sf::Vertex"*, align 8
  store %"class.sf::Vertex"* %0, %"class.sf::Vertex"** %3, align 8
  store %"class.sf::Vertex"* %1, %"class.sf::Vertex"** %4, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseIN2sf6VertexESaIS1_EE13_M_deallocateEPS1_m(%"struct.std::_Vector_base"* %0, %"class.sf::Vertex"* %1, i64 %2) #0 comdat align 2 {
  %4 = alloca %"struct.std::_Vector_base"*, align 8
  %5 = alloca %"class.sf::Vertex"*, align 8
  %6 = alloca i64, align 8
  store %"struct.std::_Vector_base"* %0, %"struct.std::_Vector_base"** %4, align 8
  store %"class.sf::Vertex"* %1, %"class.sf::Vertex"** %5, align 8
  store i64 %2, i64* %6, align 8
  %7 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %4, align 8
  %8 = load %"class.sf::Vertex"*, %"class.sf::Vertex"** %5, align 8
  %9 = icmp ne %"class.sf::Vertex"* %8, null
  br i1 %9, label %10, label %15

10:                                               ; preds = %3
  %11 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %7, i32 0, i32 0
  %12 = bitcast %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl"* %11 to %"class.std::allocator"*
  %13 = load %"class.sf::Vertex"*, %"class.sf::Vertex"** %5, align 8
  %14 = load i64, i64* %6, align 8
  call void @_ZNSt16allocator_traitsISaIN2sf6VertexEEE10deallocateERS2_PS1_m(%"class.std::allocator"* dereferenceable(1) %12, %"class.sf::Vertex"* %13, i64 %14)
  br label %15

15:                                               ; preds = %10, %3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseIN2sf6VertexESaIS1_EE12_Vector_implD2Ev(%"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl"* %0) unnamed_addr #3 comdat align 2 {
  %2 = alloca %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl"*, align 8
  store %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl"* %0, %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl"** %2, align 8
  %3 = load %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl"*, %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl"** %2, align 8
  %4 = bitcast %"struct.std::_Vector_base<sf::Vertex, std::allocator<sf::Vertex> >::_Vector_impl"* %3 to %"class.std::allocator"*
  call void @_ZNSaIN2sf6VertexEED2Ev(%"class.std::allocator"* %4) #7
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt16allocator_traitsISaIN2sf6VertexEEE10deallocateERS2_PS1_m(%"class.std::allocator"* dereferenceable(1) %0, %"class.sf::Vertex"* %1, i64 %2) #0 comdat align 2 {
  %4 = alloca %"class.std::allocator"*, align 8
  %5 = alloca %"class.sf::Vertex"*, align 8
  %6 = alloca i64, align 8
  store %"class.std::allocator"* %0, %"class.std::allocator"** %4, align 8
  store %"class.sf::Vertex"* %1, %"class.sf::Vertex"** %5, align 8
  store i64 %2, i64* %6, align 8
  %7 = load %"class.std::allocator"*, %"class.std::allocator"** %4, align 8
  %8 = bitcast %"class.std::allocator"* %7 to %"class.__gnu_cxx::new_allocator"*
  %9 = load %"class.sf::Vertex"*, %"class.sf::Vertex"** %5, align 8
  %10 = load i64, i64* %6, align 8
  call void @_ZN9__gnu_cxx13new_allocatorIN2sf6VertexEE10deallocateEPS2_m(%"class.__gnu_cxx::new_allocator"* %8, %"class.sf::Vertex"* %9, i64 %10)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorIN2sf6VertexEE10deallocateEPS2_m(%"class.__gnu_cxx::new_allocator"* %0, %"class.sf::Vertex"* %1, i64 %2) #3 comdat align 2 {
  %4 = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  %5 = alloca %"class.sf::Vertex"*, align 8
  %6 = alloca i64, align 8
  store %"class.__gnu_cxx::new_allocator"* %0, %"class.__gnu_cxx::new_allocator"** %4, align 8
  store %"class.sf::Vertex"* %1, %"class.sf::Vertex"** %5, align 8
  store i64 %2, i64* %6, align 8
  %7 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %4, align 8
  %8 = load %"class.sf::Vertex"*, %"class.sf::Vertex"** %5, align 8
  %9 = bitcast %"class.sf::Vertex"* %8 to i8*
  call void @_ZdlPv(i8* %9) #7
  ret void
}

; Function Attrs: nobuiltin nounwind
declare dso_local void @_ZdlPv(i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSaIN2sf6VertexEED2Ev(%"class.std::allocator"* %0) unnamed_addr #3 comdat align 2 {
  %2 = alloca %"class.std::allocator"*, align 8
  store %"class.std::allocator"* %0, %"class.std::allocator"** %2, align 8
  %3 = load %"class.std::allocator"*, %"class.std::allocator"** %2, align 8
  %4 = bitcast %"class.std::allocator"* %3 to %"class.__gnu_cxx::new_allocator"*
  call void @_ZN9__gnu_cxx13new_allocatorIN2sf6VertexEED2Ev(%"class.__gnu_cxx::new_allocator"* %4) #7
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorIN2sf6VertexEED2Ev(%"class.__gnu_cxx::new_allocator"* %0) unnamed_addr #3 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  store %"class.__gnu_cxx::new_allocator"* %0, %"class.__gnu_cxx::new_allocator"** %2, align 8
  %3 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %2, align 8
  ret void
}

attributes #0 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline noreturn nounwind }
attributes #6 = { builtin }
attributes #7 = { nounwind }
attributes #8 = { builtin nounwind }
attributes #9 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
