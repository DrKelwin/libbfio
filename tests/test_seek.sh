#!/bin/bash
#
# Cross-platform C file functions library seek offset testing script
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

INPUT="input";
TMP="tmp";

test_seek()
{ 
	echo "Testing seek offset of input:" $*;

	./${BFIO_TEST_SEEK} $*;

	RESULT=$?;

	echo "";

	return ${RESULT};
}

BFIO_TEST_SEEK="bfio_test_seek";

if ! test -x ${BFIO_TEST_SEEK};
then
	BFIO_TEST_SEEK="bfio_test_seek.exe";
fi

if ! test -x ${BFIO_TEST_SEEK};
then
	echo "Missing executable: ${BFIO_TEST_SEEK}";

	exit ${EXIT_FAILURE};
fi

if ! test -d ${INPUT};
then
	echo "No input directory found, to test seek create input directory and place test files in directory.";

	exit ${EXIT_IGNORE};
fi

for FILENAME in ${INPUT}/*;
do
	if ! test_seek ${FILENAME};
	then
		exit ${EXIT_FAILURE};
	fi
done

exit ${EXIT_SUCCESS};

