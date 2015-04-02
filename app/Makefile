#
# Makefile for Linux theread lib
#
# 
#ǰ������������Ȼ�Ѿ�ʵ�����Զ�����
#�Զ�����ļ����£��������������룬����
#ǰ���������ļ�Ŀ¼��һ����̫�ʺϴ�����Ŀ
#��Makefile��Ҫ�󣬶���һ��Ŀ¼�ṹһ���ӣ�
#���кܴ��ظ�����


#############################
##����Makefile����һЩ�������Ա㽫��ʹ��
##
####################################

###################
#������ʱ�ļ����Ŀ¼�����û�ж���
#�ñ��������Ŀ¼Ϊ��ǰĿ¼
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

#####�˴���������obj�ļ������Ŀ¼
OBJTREE		:= $(if $(BUILD_DIR),$(BUILD_DIR),$(CURDIR))
SRCTREE		:= $(CURDIR)
TOPDIR		:= $(SRCTREE)
LNDIR		:= $(OBJTREE)

#�������������Ա���makefile��������
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