#
# Author: Bharath Kumaran
# Licensing: GNU General Public License (http://www.gnu.org/copyleft/gpl.html)
# Description: Makefile for Project
#

# Unfortunately I was lazy and didn't install swig in windows. Used Unix to build the swig wrappers.
# Please modify Makefile based on the csharp/examples in swig source code repository.

EXTRACFLAGS=
EXTRALDFLAGS=
INCDIR=-I/usr/include -I.
LIBDIR=/usr/lib64
LIBS=-L$(LIBDIR) $(EXTRALDFLAGS)
OPTFLAGS=-g
CFLAGS=$(OPTFLAGS) $(INCDIR) $(EXTRACFLAGS)
CC=gcc
all: example.o
	$(CC) --std=c99  -o example example.o $(LIBS)
example.o: example.c
	$(CC) $(INCDIR) -g -O -c example.c
clean:
	/bin/rm -Rf $(PROGS) *.o *.so *.out SWIG*.cs example*.cs container*.cs myservice.cs example core example_wrap.c build
dos2unix:
	/usr/bin/dos2unix *.c *.h Makefile
build:
	swig -I. -csharp example.i
