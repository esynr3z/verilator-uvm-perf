# Verilator UVM performance testbench

Experimental repo to compare Verilator performance in UVM simulation.

## Logbook

- Start from this repo

```
repo: https://github.com/antmicro/verilator-verification-features-tests.git
branch: main
commit: 038c9966586cfca7eb926535c8135cc2c3da0c59
```

- Add UVM as submodule

```
repo: https://github.com/antmicro/uvm-verilator.git
branch:
commit: 2e667ac506c12e91d81bde62fe2c08d992731bd4
```

- Copy UVM testbench `verilator-verification-features-tests/tests/uvm-testbenches/mem-tb` to `mem-tb`
- Add `mem_rand_test` and support of configurable number of transsactions in `mem_sequence`
- Increase DUT address and data width
- Rework scoreboard with associative array

