set -e

# generate llvm ir
g++ ../generator/main.cpp `llvm-config --cxxflags --ldflags --libs` && ./a.out

# translate ir to object file
clang -c generated_llvm_ir.ll -fPIE -o main.o

# complile graph.cc 
g++ -c ../src/graph.cc -lsfml-graphics -lsfml-window -lsfml-system -o graph.o

# linking
g++ graph.o main.o -lsfml-graphics -lsfml-window -lsfml-system -o llvm_gfl

# run
./llvm_gfl
