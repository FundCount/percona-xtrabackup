# Copyright (c) 2013 Percona LLC and/or its affiliates
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA 

MACRO (FIND_PTHREADS2)

  IF (NOT PTHREADS2_INCLUDE_PATH)
    SET(GCRYPT_INCLUDE_PATH /usr/include /usr/local/include /opt/local/include)
  ENDIF()

  FIND_PATH(PTHREADS2_INCLUDE_DIR pthread.h PATHS ${PTHREADS2_INCLUDE_PATH})

  IF (NOT PTHREADS2_INCLUDE_DIR)
    MESSAGE(SEND_ERROR "Cannot find pthread.h in ${PTHREADS2_INCLUDE_PATH}. You can use libgcrypt-config --cflags to get the necessary path and pass it to CMake with -DPTHREADS2_INCLUDE_PATH=<path>")
  ENDIF()

  IF (NOT PTHREADS2_LIB_PATH)
    SET(PTHREADS2_LIB_PATH /usr/lib /usr/local/lib /opt/local/lib)
  ENDIF()

  FIND_LIBRARY(PTHREADS2_LIB pthreadVC2 PATHS ${PTHREADS2_LIB_PATH})

  IF (NOT PTHREADS2_LIB)
	  MESSAGE(SEND_ERROR "Cannot find libpthreadVC2 shared library in ${PTHREADS2_LIB_PATH}. You can use libgcrypt-config --libs to get the necessary path and pass it to CMake with -DPTHREADS2_LIB_PATH=<path>")
  ENDIF()

  SET(PTHREADS2_LIBS ${PTHREADS2_LIB})

ENDMACRO()
