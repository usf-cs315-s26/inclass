PROG = sra
OBJS = sra.o sra_s.o

%.o: %.s
	as -g -o $@ $<

%.o: %.c
	gcc -g -c -o $@ $<

$(PROG): $(OBJS)
	gcc -g -o $@ $^

clean:
	rm -rf $(PROG) $(OBJS)
