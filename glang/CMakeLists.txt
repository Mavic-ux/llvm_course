cmake_minimum_required(VERSION 3.10)
project(glang)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()

message("Build Type: ${CMAKE_BUILD_TYPE}")

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_FLAGS_RELEASE "-O2")
set(CMAKE_CXX_FLAGS_DEBUG "-g -O0")

find_package(BISON 3.5 REQUIRED)
find_package(FLEX REQUIRED)
find_package(LLVM REQUIRED)

BISON_TARGET(parser ${CMAKE_CURRENT_SOURCE_DIR}/src/parser.y ${CMAKE_CURRENT_SOURCE_DIR}/src/parser.cc
             DEFINES_FILE ${CMAKE_CURRENT_SOURCE_DIR}/src/parser.h)


FLEX_TARGET(lexer ${CMAKE_CURRENT_SOURCE_DIR}/src/lexer.l  ${CMAKE_CURRENT_SOURCE_DIR}/src/lexer.cc)

add_flex_bison_dependency(lexer parser)

add_executable(${PROJECT_NAME}
    ${CMAKE_CURRENT_SOURCE_DIR}/src/library.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/src/main.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/src/driver.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/src/ast.cc
    ${FLEX_lexer_OUTPUTS}  
    ${BISON_parser_OUTPUTS}
)

target_link_libraries(${PROJECT_NAME} LLVM)

target_link_libraries(${PROJECT_NAME}  sfml-graphics sfml-window sfml-system )

target_include_directories(${PROJECT_NAME}
    PRIVATE       
    ${CMAKE_CURRENT_SOURCE_DIR}/src
    target_include_directories(${PROJECT_NAME} PRIVATE ${LLVM_INCLUDE_DIRS})
)
