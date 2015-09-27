#!/bin/bash
#
# Cross-platform C file functions library write offset testing script
#
# Copyright (c) 2008-2012, Joachim Metz <joachim.metz@gmail.com>
#
# Refer to AUTHORS for acknowledgements.
#
# This software is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This software is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this software.  If not, see <http://www.gnu.org/licenses/>.
#

EXIT_SUCCESS=0;
EXIT_FAILURE=1;
EXIT_IGNORE=77;

TMP="tmp";

test_write()
{ 
	mkdir ${TMP};
	cd ${TMP};

	echo "Testing write";

	../${BFIO_TEST_WRITE};

	RESULT=$?;

	echo "";

	cd ..;
	rm -rf ${TMP};

	return ${RESULT};
}

BFIO_TEST_WRITE="bfio_test_write";

if ! test -x ${BFIO_TEST_WRITE};
then
	BFIO_TEST_WRITE="bfio_test_write.exe";
fi

if ! test -x ${BFIO_TEST_WRITE};
then
	echo "Missing executable: ${BFIO_TEST_WRITE}";

	exit ${EXIT_FAILURE};
fi

if ! test_write
then
	exit ${EXIT_FAILURE};
fi

exit ${EXIT_SUCCESS};

