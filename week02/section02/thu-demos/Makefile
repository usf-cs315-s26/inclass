PROGS = countdown sum ifelse iseven

COUNTDOWN_OBJS = countdown.o countdown_c.o countdown_s.o
SUM_OBJS = sum.o sum_c.o sum_s.o
IFELSE_OBJS = ifelse.o ifelse_c.o ifelse_s.o
ISEVEN_OBJS = iseven.o iseven_c.o iseven_s.o

OBJS = $(COUNTDOWN_OBJS) $(SUM_OBJS) $(IFELSE_OBJS) $(ISEVEN_OBJS)

%.o: %.s
	as -g -o $@ $<

%.o: %.c
	gcc -c -g -o $@ $<

all: $(PROGS)

countdown: $(COUNTDOWN_OBJS)
	gcc -g -o $@ $^

sum: $(SUM_OBJS)
	gcc -g -o $@ $^

ifelse: $(IFELSE_OBJS)
	gcc -g -o $@ $^

iseven: $(ISEVEN_OBJS)
	gcc -g -o $@ $^

clean:
	rm -rf $(PROGS) $(OBJS)
