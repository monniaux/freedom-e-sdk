PROGRAM ?= quicksort

# MYCC=/opt/CompCert/mppa-forwardmoves/rv32/bin/ccomp
MYCC=$(CC) -I/home/monniaux/work/Risc-V/freed -imultilib rv32imac/ilp32 -iprefix /opt/riscv64-unknown-elf-gcc-8.3 -isysroot /opt/riscv64-unknown-elf-gcc-8.3 -isystem =/include/newlib-nano -march=rv32imac -mabi=ilp32 -mcmodel=medlow -ffunction-sections -fdata-sections -O2
#MYCC=$(CC) -I/home/monniaux/work/Risc-V/freed -imultilib rv32imac/ilp32 -iprefix /opt/riscv64-unknown-elf-gcc-8.3 -isysroot /opt/riscv64-unknown-elf-gcc-8.3 -isystem =/include/newlib-nano -march=rv32imac -mabi=ilp32 -mcmodel=medlow -ffunction-sections -fdata-sections -O1
# MYCC=/opt/CompCert/2019-10-21_sifive/bin/ccomp -frtlblock -fprepass= list

$(PROGRAM): quicksort.S quicksort_run.c clock.c cycles.h clock.h
	$(CC) $(CFLAGS) $+ $(LDFLAGS) $(LOADLIBES) $(LDLIBS) -o $@

quicksort.S : quicksort.c
	$(MYCC) -S -o $@ $<

clean:
	rm -f $(PROGRAM) $(PROGRAM).hex *.S 
