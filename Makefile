NAME = SimplePaint

CC = gcc
PKG-CONFIG = $(shell which pkg-config)
RM = rm -f

CFLAGS = -Wall -Wextra -Werror
CFLAGS_GLUT = $(shell $(PKG-CONFIG) --cflags glut)

LIBS = -lGL
LIBS_GLUT = $(shell $(PKG-CONFIG) --libs glut)

$(NAME): simple_paint.o
	$(CC) $? -o $@ $(LIBS) $(LIBS_GLUT)

simple_paint.o: simple_paint.c
	$(CC) $(CFLAGS) $(CFLAGS_GLUT) -c $@ $?

clean:
	$(RM) *.o
	$(RM) $(NAME)

.PHONY: clean
