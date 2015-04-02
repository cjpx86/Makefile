#
# Makefile for Linux theread lib
#
# 
#这个例子有两个源文件和一个头文件
#跟上一个例子相比，这个例子定义了
#一些变量
CC=gcc
CFLAGS =  -g  -I ./
LDLIB = -lpthread -lrt
#将所有的OBJ都添加到该变量中，可以简化MAKEFILE的书写

.PHONY: $(PHONY)
SOURCES = $(wildcard *.c)
OBJS := $(patsubst %.c, %.o,$(SOURCES))
CC = gcc
CCFLAGS =  -g  
LDLIB = -lpthread -lrt

main: $(OBJS)
	@echo "source files:" $(SOURCES)
	@echo "object files:" $(OBJS)
	$(CC) $(OBJS)   $(CFLAGS) $(LDLIB) -o main  
sinclude $(SOURCES:.c=.d)
    
    
%d: %c
	@echo "create depend"
	$(CC) -M $(CFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ ,g' < $@.$$$$ > $@; \
	rm $@.$$$$        
  
clean:
	rm -rf $(OBJS)
	rm -f main
