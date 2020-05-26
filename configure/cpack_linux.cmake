find_program(DPKG_CMD dpkg)
execute_process(COMMAND ${DPKG_CMD} --print-architecture
        OUTPUT_VARIABLE CPACK_DEBIAN_PACKAGE_ARCHITECTURE OUTPUT_STRIP_TRAILING_WHITESPACE)

set(CPACK_GENERATOR "DEB")
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(CPACK_PACKAGE_NAME libtango9lts-dbg)
    set(CPACK_DEBIAN_PACKAGE_DEPENDS "libcos4-dev, libzmq5-dev | libzmq3-dev")
    set(CPACK_DEBIAN_PACKAGE_CONFLICTS "libtango7-dev, libtango8-dev, libtango9-dev, libtango-dev, liblog4tango-dev, libtango9lts-dev")
elseif(CMAKE_BUILD_TYPE STREQUAL "Release")
    set(CPACK_PACKAGE_NAME libtango9lts-dev)
    set(CPACK_DEBIAN_PACKAGE_DEPENDS "libcos4-1 | libcos4-2, libzmq5 | libzmq3")
    set(CPACK_DEBIAN_PACKAGE_CONFLICTS "libtango7-dev, libtango8-dev, libtango9-dev, libtango-dev, liblog4tango-dev, libtango9lts-dbg")
endif(CMAKE_BUILD_TYPE STREQUAL "Debug")
set(CPACK_PACKAGE_VERSION "${LIBRARY_VERSION}")
set(CPACK_PACKAGE_VERSION_MAJOR ${MAJOR_VERSION})
set(CPACK_PACKAGE_VERSION_MINOR ${MINOR_VERSION})
set(CPACK_PACKAGE_VERSION_PATCH ${PATCH_VERSION})
set(CPACK_SYSTEM_NAME "${CPACK_DEBIAN_PACKAGE_ARCHITECTURE}")
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}_${CPACK_PACKAGE_VERSION}_${CPACK_DEBIAN_PACKAGE_ARCHITECTURE}")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Tango Controls team <info@tango-controls.org>") #required
set(CPACK_DEBIAN_PACKAGE_DEBUG TRUE)

add_custom_command(OUTPUT ${CPACK_PACKAGE_FILE_NAME}.deb
        COMMAND cpack -V)


