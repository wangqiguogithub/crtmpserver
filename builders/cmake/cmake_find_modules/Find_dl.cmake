MESSAGE(STATUS "Looking for dl")
FIND_PATH(DL_INCLUDE_PATH 
	NAMES
		dlfcn.h
	PATHS
		/usr/include
		/usr/local/include
		/sw/include
		/opt/local/include
		NO_DEFAULT_PATH)

IF($ENV{COMPILE_STATIC} MATCHES "1")
	SET(CMAKE_FIND_LIBRARY_SUFFIXES_OLD ${CMAKE_FIND_LIBRARY_SUFFIXES})
	SET(CMAKE_FIND_LIBRARY_SUFFIXES .a .so .dylib ${CMAKE_FIND_LIBRARY_SUFFIXES})
ENDIF($ENV{COMPILE_STATIC} MATCHES "1")

FIND_LIBRARY(DL_LIBRARY_PATH
	NAMES
		dl
	PATHS
		/usr/lib64
		/usr/lib
		/usr/local/lib64
		/usr/local/lib
		/sw/lib
		/opt/local/lib
		NO_DEFAULT_PATH)

IF($ENV{COMPILE_STATIC} MATCHES "1")
	SET(CMAKE_FIND_LIBRARY_SUFFIXES ${CMAKE_FIND_LIBRARY_SUFFIXES_OLD})
ENDIF($ENV{COMPILE_STATIC} MATCHES "1")

#MESSAGE("DL_LIBRARY_PATH: ${DL_LIBRARY_PATH}")

IF(DL_INCLUDE_PATH)
	SET(DL_FOUND 1 CACHE STRING "Set to 1 if dl is found, 0 otherwise")
	MESSAGE(STATUS "Looking for libdl headers - found")
ELSE(DL_INCLUDE_PATH)
	SET(DL_FOUND 0 CACHE STRING "Set to 1 if dl is found, 0 otherwise")
	MESSAGE(FATAL_ERROR "Looking for libdl headers - not found")
ENDIF(DL_INCLUDE_PATH)

IF(DL_LIBRARY_PATH)
	SET(DL_FOUND 1 CACHE STRING "Set to 1 if dl is found, 0 otherwise")
	MESSAGE(STATUS "Looking for libdl library - found")
ELSE(DL_LIBRddARY_PATH)
	SET(DL_LIBRARY_PATH "")
ENDIF(DL_LIBRARY_PATH)

MARK_AS_ADVANCED(DL_FOUND)

