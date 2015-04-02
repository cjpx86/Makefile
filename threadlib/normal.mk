#
# Makefile for Linux theread lib
#
# 
#这个例子有两个源文件和一个头文件
#跟上一个例子相比，这个例子定义了
#一些变量
CC=gcc
CCFLAGS =  -g  -I ./
LDLIB = -lpthread -lrt
#将所有的OBJ都添加到该变量中，可以简化MAKEFILE的书写
OBJS = thread_wrapper.o main.o

PHONY = all
all: $(OBJS)
	$(CC) $(CCFLAGS)  $(OBJS) $(LDLIB) -o $@

#这里每一个.o文件都要对应一个目标，工作比较重复
#可以利用make的静态模式简化
thread_wrapper.o:thread_wrapper.c thread_wrapper.h
	$(CC) $(CCFLAGS) $(LDLIB) -c $< -o $@

main.o:main.c thread_wrapper.h
	$(CC)  $(LDLIB) -c -I . $< -o $@
PHONY += FORCE clean
FORCE:
	
clean:
	@rm -f *.o
	@rm -f *.so
	
.PHONY: $(PHONY)
