cmake_minimum_required(VERSION 3.28)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_C_COMPILER /usr/bin/clang)
set(CMAKE_CXX_COMPILER /usr/bin/clang++)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(ECST VERSION 1.0
                  DESCRIPTION "ECma Sctipt Transpiler"
                  LANGUAGES CXX)

add_executable(main
  ./src/main.cpp
)

add_library(lexer
  STATIC
  ./src/lexer.h
  ./src/lexer.cpp
)

target_link_libraries(main
  lexer
)

include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
)
# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

enable_testing()

add_executable(
  lexer_test
  ./src/lexer_test.cpp
)
target_link_libraries(
  lexer_test
  GTest::gtest_main
  lexer
)

include(GoogleTest)
gtest_discover_tests(lexer_test)
