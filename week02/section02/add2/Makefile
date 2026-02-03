PROG = add2
OBJS = add2.o add2_c.o add2_s.o

%.o: %.s
	as -g -o $@ $<

%.o: %.c
	gcc -c -g -o $@ $<

$(PROG): $(OBJS)
	gcc -g -o $@ $^

clean:
	$(PROG) $(OBJS)
