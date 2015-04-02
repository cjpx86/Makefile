#
# Makefile for Linux theread lib
#
# 
#前面两个例子虽然已经实现了自动编译
#自动检测文件更新，做到了增量编译，但是
#前两个例子文件目录单一，不太适合大型项目
#对Makefile的要求，而且一旦目录结构一复杂，
#会有很大重复工作


#############################
##顶层Makefile设置一些变量，以便将来使用
##
####################################

###################
#定义临时文件输出目录，如果没有定义
#该变量，输出目录为当前目录
ifdef O
ifeq ("$(origin O)", "command line")
BUILD_DIR := $(O)
endif
endif

ifneq ($(BUILD_DIR),)
saved-output := $(BUILD_DIR)

# Attempt to create a output directory.
$(shell [ -d ${BUILD_DIR} ] || mkdir -p ${BUILD_DIR})

# Verify if it was successful.
BUILD_DIR := $(shell cd $(BUILD_DIR) && /bin/pwd)
$(if $(BUILD_DIR),,$(error output directory "$(saved-output)" does not exist))
endif # ifneq ($(BUILD_DIR),)

#####此处就是设置obj文件的输出目录
OBJTREE		:= $(if $(BUILD_DIR),$(BUILD_DIR),$(CURDIR))
SRCTREE		:= $(CURDIR)
TOPDIR		:= $(SRCTREE)
LNDIR		:= $(OBJTREE)

#将变量导出，以便子makefile可以引用
export	TOPDIR SRCTREE OBJTREE 

include $(TOPDIR)/config.mk

LIBS-y += print/libprint.o
LIBS-y += list/liblist.o
LIBS-y += main/main.o

LIBS := $(addprefix $(obj),$(sort $(LIBS-y)))
.PHONY : $(LIBS)

app:$(LIBS)
	$(CC) -Wl,--start-group  $(LIBS) -Wl,--end-group -o $(obj)$@
	


$(LIBS):	
		$(MAKE) -C $(dir $(subst $(obj),,$@))
clean:
	@rm -f $(obj)*.o
	@rm -f $(obj)*.so
	rm -f $(obj)all
	rm -f $(obj)*.d
	rm -f *.bak
	rm -f app
	$(MAKE) -C print clean
	$(MAKE) -C main clean
	$(MAKE) -C list clean
	
.PHONY: $(PHONY)
