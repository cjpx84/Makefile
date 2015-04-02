#
# Makefile for Linux theread lib
#
# 
#�������������Դ�ļ���һ��ͷ�ļ�
#����һ��������ȣ�������Ӷ�����
#һЩ����
CC=gcc
CFLAGS =  -g  -I ./
LDLIB = -lpthread -lrt
#�����е�OBJ����ӵ��ñ����У����Լ�MAKEFILE����д

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
