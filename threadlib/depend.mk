#
# Makefile for Linux theread lib
#
# 
#�������������Դ�ļ���һ��ͷ�ļ�
#����һ��������ȣ�������Ӷ�����
#һЩ����
CC=gcc
CCFLAGS =  -g  -I ./
LDLIB = -lpthread -lrt

#�����е�OBJ����ӵ��ñ����У����Լ�MAKEFILE����д

OBJS = thread_wrapper.o main.o
SRC  =$(OBJS:.o=.c)

PHONY = all
all: $(OBJS)
	@echo $(OBJS)
	@echo $(SRC)
	$(CC) $(CCFLAGS)  $(OBJS) $(LDLIB) -o $@

#����make�ľ�̬ģʽ��
#�����е�.o�ļ��滻��.c�ļ�

#�ո�������static���Ǹ������з���thread_wrapper.h�����仯
#ʱ����������ʱ��Ȼû�б���⵽�����������Ŀ��˵�������Ե�

$(OBJS):%.o:%.c 
	$(CC) $(CCFLAGS) $(LDLIB) -c $< -o $@

PHONY += FORCE clean
FORCE:
##�����ͷ�ļ��Ķ���û�б�makefie��⵽����Ҫ��
##����ͨ�����ַ�ʽ���Ƕ�ʧ��c�ļ���ͷ�ļ�������
##������Ǳ��뽫��ص������ļ�����  
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
