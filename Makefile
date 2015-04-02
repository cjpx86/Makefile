.PHONY: hello clean
hello: 
	make -C hello/ hello
clean:
	make -C hello/ clean
	make -C threadlib/ clean
thread_normal:
	make -C threadlib/ normal
thread_static:
	make -C threadlib/ static
thread_depend:
	make -C threadlib/ depend
