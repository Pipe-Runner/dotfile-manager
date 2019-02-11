#cmake version to be used
cmake_minimum_required( VERSION 3.0 )

#project name
project( i3_manager )

#target
include_directories( ./src/ )
set( SOURCES ./src/main.cpp ./src/util.cpp )
add_executable( binary ${SOURCES} )

# ===================================================================================
#                              i3ipc library
# ===================================================================================

add_subdirectory( ./i3ipc++ )

include_directories(${I3IPCpp_INCLUDE_DIRS})
link_directories(${I3IPCpp_LIBRARY_DIRS})

target_link_libraries( binary ${I3IPCpp_LIBRARIES} )

# ===================================================================================
#                              
# ===================================================================================