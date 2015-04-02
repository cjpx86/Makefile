#
# Makefile for Linux theread lib
#
# 
#这个例子有两个源文件和一个头文件
#跟上一个例子相比，这个例子定义了
#一些变量，并且展示了make调用子makefile
#的使用方法

PHONY = normal static depend
normal:
	make -f normal.mk all
static:
	make -f static.mk all
depend:
	make -f depend.mk all

clean:
	@rm -f *.o
	@rm -f *.so
	rm -f all
	rm -f *.d
	rm -f *.bak
	
.PHONY: $(PHONY)
