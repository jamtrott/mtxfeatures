# mtxfeatures: program for computing sparse matrix features
#
# Copyright (C) 2023 James D. Trotter
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see
# <https://www.gnu.org/licenses/>.
#
# Authors: James D. Trotter <james@simula.no>
#
# Last modified: 2023-03-17

mtxfeatures = mtxfeatures

all: $(mtxfeatures)
clean:
	rm -f $(mtxfeatures_c_objects) $(mtxfeatures)
.PHONY: all clean

CFLAGS ?= -O2 -g -Wall
LDFLAGS ?= -lm

mtxfeatures_c_sources = mtxfeatures.c
mtxfeatures_c_headers =
mtxfeatures_c_objects := $(foreach x,$(mtxfeatures_c_sources),$(x:.c=.o))
$(mtxfeatures_c_objects): %.o: %.c $(mtxfeatures_c_headers)
	$(CC) -c $(CFLAGS) $< -o $@
$(mtxfeatures): $(mtxfeatures_c_objects)
	$(CC) $(CFLAGS) $^ $(LDFLAGS) -o $@
