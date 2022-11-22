#include "driver.h"

int main(int argc, char** argv) {

    std::ifstream in(argv[1], std::ifstream::in);
    yy::Driver driver(in, std::cout);
    driver.parse();
    driver.dumpIR(std::cout);
     
}