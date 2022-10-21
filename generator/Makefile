CC=clang
CXX=clang++

all: llvm_gfl

llvm_gfl: graph.o main.o
	${CXX}  graph.o main.o -lsfml-graphics -lsfml-window -lsfml-system -o llvm_gfl

graph.o: ../src/graph.cc 
	${CXX} -c ../src/graph.cc -o graph.o

main.o: generated_llvm_ir.ll
	${CC} -c generated_llvm_ir.ll -fPIE -o main.o

clean:
	rm -rf *.o
