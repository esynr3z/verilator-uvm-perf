.PHONY: clean build sim all

# Simulation parameters
GUI ?= 0
UVM_TEST ?= mem_rand_test
NUM_REQUESTS ?= 100
UVM_VERBOSITY ?= UVM_NONE

# Directories
BUILD_DIR     ?= $(CURDIR)/build
SIM_DIR       ?= $(CURDIR)/sim
TB_ROOT       ?= $(CURDIR)/../mem-tb

# VCS build options
TB_TOP := tbench_top

BUILD_ARGS = \
	-kdb \
	-lca \
	-LDFLAGS -Wl,--no-as-needed \
	-ntb_opts uvm-1.2 \
	-assert svaext \
	-full64 \
	-sverilog \
	+notimingcheck \
	-notice \
	-O4 \
	-timescale=1ns/1ps \
	-nc \
	-l build.log \
	-top $(TB_TOP) \
	+incdir+$(TB_ROOT)/hdl \
	$(TB_ROOT)/hdl/tbench_top.sv $(TB_ROOT)/hdl/design.sv

# VCS simulation options
SIM_ARGS = \
	-l sim.log \
	-assert nopostproc \
	-assert global_finish_maxfail=1 \
	+UVM_TESTNAME=$(UVM_TEST) \
	+NUM_REQUESTS=$(NUM_REQUESTS) \
	+UVM_VERBOSITY=$(UVM_VERBOSITY)

# Enable GUI
ifeq ($(GUI),1)
	BUILD_ARGS += -debug_acc+all+dmptf -debug_region+cell+encrypt
	SIM_ARGS += -gui
endif

all: clean build sim

clean:
	rm -rf $(BUILD_DIR) $(SIM_DIR)

build:
	mkdir -p $(BUILD_DIR) && cd $(BUILD_DIR); \
	vcs $(BUILD_ARGS)

sim:
	mkdir -p $(SIM_DIR) && cd $(SIM_DIR); \
	$(BUILD_DIR)/simv $(SIM_ARGS)
