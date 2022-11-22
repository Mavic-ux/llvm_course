cmake_minimum_required(VERSION 3.7)
project(glang)

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

find_package(FLEX REQUIRED)
find_package(BISON REQUIRED)
find_package(LLVM REQUIRED)

# Generate syntax files
BISON_TARGET(parser
    ${CMAKE_CURRENT_SOURCE_DIR}/src/parser.y
    ${CMAKE_CURRENT_SOURCE_DIR}/parser.cc
    COMPILE_FLAGS "-d --defines=${CMAKE_CURRENT_SOURCE_DIR}/src/parser.h")

FLEX_TARGET(lexer
    ${CMAKE_CURRENT_SOURCE_DIR}/src/lexer.l
    ${CMAKE_CURRENT_SOURCE_DIR}/lexer.cc)

ADD_FLEX_BISON_DEPENDENCY(lexer parser)

add_executable(${PROJECT_NAME}
    ${CMAKE_CURRENT_SOURCE_DIR}/src/main.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/src/nodes.h
    ${CMAKE_CURRENT_SOURCE_DIR}/src/llvm_codegen.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/src/llvm_codegen.h
    ${FLEX_lexer_OUTPUTS}
    ${BISON_parser_OUTPUTS})


target_link_libraries(${PROJECT_NAME} LLVM)

target_include_directories(${PROJECT_NAME}
    PRIVATE
      ${CMAKE_CURRENT_SOURCE_DIR}/src
      target_include_directories(${PROJECT_NAME} PRIVATE ${LLVM_INCLUDE_DIRS})
)

