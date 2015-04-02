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
SRC  =$(OBJS:.o=.c)

PHONY = all
all: $(OBJS)
	@echo $(OBJS)
	@echo $(SRC)
	$(CC) $(CCFLAGS)  $(OBJS) $(LDLIB) -o $@

#利用make的静态模式简化
#将所有的.o文件替换成.c文件

#刚刚我们在static的那个例子中发现thread_wrapper.h发生变化
#时，增量编译时竟然没有被检测到，这对整个项目来说是灾难性的

$(OBJS):%.o:%.c 
	$(CC) $(CCFLAGS) $(LDLIB) -c $< -o $@

PHONY += FORCE clean
FORCE:
##上面的头文件改动，没有被makefie检测到，主要是
##由于通过这种方式我们丢失了c文件对头文件的依赖
##因此我们必须将相关的依赖文件加上  
sinclude $(SRC:.c=.d)
    
    
%d: %c
	@echo "create depend"
	$(CC) -M $(CCFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ ,g' < $@.$$$$ > $@; \
	rm $@.$$$$        
  
clean:
	rm -rf $(OBJS)
	rm -f all
.PHONY: $(PHONY)
