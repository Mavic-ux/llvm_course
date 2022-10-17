cmake_minimum_required(VERSION 3.16)
project(game_of_life)

add_executable(${CMAKE_PROJECT_NAME}  src/main.c src/graph.cc)

target_link_libraries(${CMAKE_PROJECT_NAME}  sfml-graphics sfml-window sfml-system )
