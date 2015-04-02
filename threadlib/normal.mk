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

#����ÿһ��.o�ļ���Ҫ��Ӧһ��Ŀ�꣬�����Ƚ��ظ�
#��������make�ľ�̬ģʽ��
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
