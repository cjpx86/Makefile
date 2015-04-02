#
# Makefile for Linux theread lib
#
# 
CC=gcc
CCFLAGS = -fPIC -shared -g  -I ./
LDLIB = -lpthread -lrt
LIBS = libthread.so

PHONY = all
all: $(LIBS)
$(LIBS):
	$(CC) $(CCFLAGS) $(LDLIB) thread_wrapper.c -o $@

PHONY += FORCE clean
FORCE:
	
clean:
	@rm -f *.o
	@rm -f *.so
	
.PHONY: $(PHONY)
