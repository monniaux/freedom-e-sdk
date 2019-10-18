PROGRAM ?= ntt

$(PROGRAM): ntt.S clock.c cycles.h clock.h
	$(CC) $(CFLAGS) $+ $(LDFLAGS) $(LOADLIBES) $(LDLIBS) -o $@

ntt.S : ntt.c
	$(CC) $(CFLAGS) -S -o $@ $<

clean:
	rm -f $(PROGRAM) $(PROGRAM).hex
