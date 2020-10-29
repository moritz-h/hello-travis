cmake_minimum_required(VERSION 3.12 FATAL_ERROR)

project(hello)

add_executable(${PROJECT_NAME} hello.cpp)
target_compile_features(${PROJECT_NAME} PUBLIC cxx_std_17)
set_target_properties(${PROJECT_NAME} PROPERTIES CXX_EXTENSIONS OFF)
