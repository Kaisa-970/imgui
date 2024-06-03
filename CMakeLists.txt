project(imgui)
message("Build project:" ${PROJECT_NAME})
set(CMAKE_CXX_STANDARD 14)

file(GLOB SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp ${CMAKE_CURRENT_SOURCE_DIR}/*.h)

add_library(${PROJECT_NAME} STATIC ${SOURCES})

set_target_properties(${PROJECT_NAME} PROPERTIES    
    ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin/${CMAKE_BUILD_TYPE}-${CMAKE_SYSTEM_NAME}-${ARCHITECTURE}/${PROJECT_NAME}    
    LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin/${CMAKE_BUILD_TYPE}-${CMAKE_SYSTEM_NAME}-${ARCHITECTURE}/${PROJECT_NAME}    
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin/${CMAKE_BUILD_TYPE}-${CMAKE_SYSTEM_NAME}-${ARCHITECTURE}/${PROJECT_NAME})
    
# if(CMAKE_BUILD_TYPE MATCHES Debug)    
#     message("Build:Debug!")
#     #target_compile_options(${PROJECT_NAME} PRIVATE /MTd /Zi /RTC /Od /Ob0 /D_DEBUG)    
# elseif(CMAKE_BUILD_TYPE MATCHES Release)  
#     message("Build:Release!")  
#     #target_compile_options(${PROJECT_NAME} PRIVATE /MT /O2)    
# endif()

if (MSVC)
    target_compile_options(${PROJECT_NAME} PRIVATE $<$<CONFIG:Debug>:/MTd /Zi /RTC1 /Od> $<$<CONFIG:Release>:/MT /O2>)
else()
    target_compile_options(${PROJECT_NAME} PRIVATE $<$<CONFIG:Debug>:-g> $<$<CONFIG:Release>:-O3>)
endif()