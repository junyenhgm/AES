CC = gcc
CFLAGS = -O2 -g -Wall -Werror -std=gnu99

OBJS := aes.o gmult.o main.o

VECHO = @printf
Q = @

all: aes

aes: $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $^ -lm

%.o: %.c
	$(VECHO) "  CC\t$@\n"
	$(Q)$(CC) -o $@ $(CFLAGS) -c -MMD -MF .$@.d $<

clean:
	rm -f $(OBJS) aes

.PHONY: all clean
