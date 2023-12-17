cmake_minimum_required(VERSION 3.16.3)

project(docker-cpp
        DESCRIPTION "Learning to Dockerized a cpp program"
        LANGUAGES CXX
        VERSION 1.0.0
)

file(GLOB SOURCES CONFIGURATE_DEPENDS "${CMAKE_SOURCE_DIR}/*cpp")
add_executable(${PROJECT_NAME} ${SOURCES})
target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_20)
set_target_properties(${PROJECT_NAME} PROPERTIES CXX_EXTENSIONS OFF)

target_compile_options(${PROJECT_NAME} PRIVATE 
        -Wall
        -pedantic
        -Werror 
)

target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_SOURCE_DIR})
set(Boost_USE_STATIC_LIBS ON)# only find static libs
set(Boost_USE_MULTUTHREADED ON)
set(Boost_USE_STATIC_RUNTIME OFF)# do no look for boost libraries linked against

find_package(Boost 1.81.0 REQUIRED COMPONENTS filesystem)

target_link_libraries(${PROJECT_NAME}
    Boost::filesystem
)  