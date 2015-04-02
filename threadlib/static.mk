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

PHONY = all
all: $(OBJS)
	$(CC) $(CCFLAGS)  $(OBJS) $(LDLIB) -o $@

#����make�ľ�̬ģʽ��
#�����е�.o�ļ��滻��.c�ļ�
$(OBJS):%.o:%.c
	$(CC) $(CCFLAGS) $(LDLIB) -c $< -o $@

PHONY += FORCE clean
FORCE:
	
clean:
	@rm -f *.o
	@rm -f all
	
.PHONY: $(PHONY)
