.PHONY: clean build sim waves all

# Simulation parameters
NPROC ?= 1
GUI ?= 0
UVM_TEST ?= mem_rand_test
NUM_REQUESTS ?= 100
UVM_VERBOSITY ?= UVM_NONE

# Directories
BUILD_DIR     ?= $(CURDIR)/build
SIM_DIR       ?= $(CURDIR)/sim
TB_ROOT       ?= $(CURDIR)/../mem-tb
UVM_ROOT      ?= $(CURDIR)/../uvm

# VCS build options
TB_TOP := tbench_top
TB_BIN := tbench_top

# Verilator build options
BUILD_ARGS = \
	-DUVM_NO_DPI \
	-fno-gate \
	--timescale 1ns/1ps \
	--error-limit 100 \
	-Wno-lint \
	-Wno-style \
	-Wno-SYMRSVDWORD \
	-Wno-IGNOREDRETURN \
	-Wno-CONSTRAINTIGN \
	-Wno-ZERODLY \
	--cc \
	--binary \
	--timing \
	-O3 \
	-j $(NPROC) \
	-o $(TB_BIN) \
	+incdir+${TB_ROOT}/hdl +incdir+${UVM_ROOT}/src \
	${UVM_ROOT}/src/uvm.sv ${TB_ROOT}/hdl/tbench_top.sv ${TB_ROOT}/hdl/design.sv

# Verilator simulation options
SIM_ARGS = +UVM_TESTNAME=$(UVM_TEST) +NUM_REQUESTS=$(NUM_REQUESTS) +UVM_VERBOSITY=$(UVM_VERBOSITY)

# Enable waves dumping
ifeq ($(WAVES), 1)
	BUILD_ARGS += -DWAVES=1 --trace --trace-structs --trace-params
endif

all: clean build sim

clean:
	rm -rf $(BUILD_DIR) $(SIM_DIR)

build:
	mkdir -p $(BUILD_DIR) && cd $(BUILD_DIR); \
	verilator $(BUILD_ARGS)

sim:
	mkdir -p $(SIM_DIR) && cd $(SIM_DIR); \
	$(BUILD_DIR)/obj_dir/$(TB_BIN) $(SIM_ARGS)

waves:
	gtkwave $(SIM_DIR)/dump.vcd
