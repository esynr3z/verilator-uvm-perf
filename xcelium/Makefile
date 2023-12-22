.PHONY: clean build sim all

# Parameters
GUI ?= 0
UVM_TEST ?= mem_rand_test
NUM_REQUESTS ?= 100
UVM_VERBOSITY ?= UVM_NONE

# Directories
BUILD_DIR     ?= $(CURDIR)/build
SIM_DIR       ?= $(CURDIR)/sim
TB_ROOT       ?= $(CURDIR)/../mem-tb

# Xcelium build options
TB_TOP := tbench_top

BUILD_ARGS = \
	-64bit\
	-elaborate \
	-l build.log \
	-sv \
	-uvmhome CDNS-1.2 \
	-disable_sem2009 \
	+timescale=1ns/1ps \
	-nospecify \
	-notimingcheck \
	+incdir+${TB_ROOT}/hdl \
	${TB_ROOT}/hdl/tbench_top.sv ${TB_ROOT}/hdl/design.sv

# Xcelium simulation options
SIM_ARGS = \
	-status \
	+UVM_TESTNAME=${UVM_TEST} \
	+NUM_REQUESTS=$(NUM_REQUESTS) \
	+UVM_VERBOSITY=$(UVM_VERBOSITY)

# Enable GUI
ifeq ($(GUI),1)
	BUILD_ARGS += -access +rwc
	SIM_ARGS += -gui
endif

all: clean build sim

clean:
	rm -rf $(BUILD_DIR) $(SIM_DIR)

build:
	mkdir -p $(BUILD_DIR) && cd $(BUILD_DIR); \
	xrun $(BUILD_ARGS)

sim:
	mkdir -p $(SIM_DIR) && cd $(SIM_DIR); \
	ln -sf $(BUILD_DIR)/xcelium.d xcelium.d; \
	xrun -R $(SIM_ARGS)
