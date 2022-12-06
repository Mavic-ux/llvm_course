set -e

# generate llvm ir
./build/glang test/graphics.cp > generated_llvm_ir.ll

# translate ir to object file
clang -c generated_llvm_ir.ll -fPIE -o main.o

# complile graph.cc 
g++ -c ../src/graph.cc -o graph.o

# linking
g++ graph.o main.o -lsfml-graphics -lsfml-window -lsfml-system -o graph_glang

# run
./graph_glang
