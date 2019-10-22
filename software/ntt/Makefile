PROGRAM ?= ntt

# MYCC=/opt/CompCert/2019-10-16/rv32/bin/ccomp
MYCC=$(CC) -O2 -I/home/monniaux/work/Risc-V/freed -imultilib rv32imac/ilp32 -iprefix /opt/riscv64-unknown-elf-gcc-8.3 -isysroot /opt/riscv64-unknown-elf-gcc-8.3 -isystem =/include/newlib-nano -march=rv32imac -mabi=ilp32 -mcmodel=medlow -ffunction-sections -fdata-sections -O2
# MYCC=/opt/CompCert/2019-10-21_sifive/bin/ccomp -frtlblock -fprepass= list

$(PROGRAM): ntt.S clock.c cycles.h clock.h
	$(CC) $(CFLAGS) $+ $(LDFLAGS) $(LOADLIBES) $(LDLIBS) -o $@

ntt.S : ntt.c
	$(MYCC) -S -o $@ $<

clean:
	rm -f $(PROGRAM) $(PROGRAM).hex *.S 
