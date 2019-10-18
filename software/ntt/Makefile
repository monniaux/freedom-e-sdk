PROGRAM ?= ntt

MYCC=/opt/CompCert/2019-10-16/rv32/bin/ccomp
# MYCC=$(CC) $(CFLAGS) -O3

$(PROGRAM): ntt.S clock.c cycles.h clock.h
	$(CC) $(CFLAGS) $+ $(LDFLAGS) $(LOADLIBES) $(LDLIBS) -o $@

ntt.S : ntt.c
	$(MYCC) -S -o $@ $<

clean:
	rm -f $(PROGRAM) $(PROGRAM).hex *.S 
