# var
MODULE = $(notdir $(CURDIR))
REL    = $(shell git rev-parse --short=4    HEAD)
BRANCH = $(shell git rev-parse --abbrev-ref HEAD)
NOW    = $(shell date +%d%m%y)

# cross
HW = qemu386
include hw/$(HW).mk
include cpu/$(CPU).mk
include arch/$(ARCH).mk

# dir
CWD   = $(CURDIR)
TMP   = $(CWD)/tmp
REF   = $(CWD)/ref
GZ    = $(HOME)/gz

# tool
CURL   = curl -L -o
CF     = clang-format -style=file -i
GITREF = git clone --depth 1
OPAM   = opam

# src
MK += Makefile hw/$(HW).mk cpu/$(CPU).mk arch/$(ARCH).mk
C += $(wildcard src/*.c*)
H += $(wildcard inc/*.h*)
M += $(wildcard src/*.ml)

# cfg
CFLAGS += -Iinc -Itmp -ggdb -O0
TFLAGS += -ffreestanding -nostdlib

# all
.PHONY: all run
all: bin/$(MODULE)
run: lib/$(MODULE).ini bin/$(MODULE) bin/$(MODULE).$(HW).elf
	bin/$(MODULE) $<

.PHONY: qemu
qemu: bin/$(MODULE).$(HW).elf
	$(QEMU) $(QEMU_CFG) -s -S -kernel $<

# format
.PHONY: format
format: tmp/format_cpp tmp/format_ml
tmp/format_cpp: $(C) $(H) $(TC) $(TH)
	$(CF) $? && touch $@
tmp/format_ml: $(M)
	touch $@

# rule
bin/$(MODULE): $(C) $(H)
	$(CXX) $(CFLAGS) -o $@ $(C) $(L)
bin/$(MODULE).$(HW).elf: $(C) $(H) $(TC) $(TH) $(MK)
	$(TCC) $(CFLAGS) $(TFLAGS) -o $@ $(C)
	$(TSIZE) $@
	$(TOD) -x $@ > tmp/$(MODULE).objdump

# doc
.PHONY: doc
doc: \
	$(HOME)/doc/Cpp/bare_metal_cpp.pdf \
	$(HOME)/doc/Cpp/comms-protocols-cpp.pdf \
	$(HOME)/doc/OCaml/ru_Minsky_Madhavapeddy_Hickey_-_Real_World_OCaml_-_2013.pdf

$(HOME)/doc/OCaml/ru_Minsky_Madhavapeddy_Hickey_-_Real_World_OCaml_-_2013.pdf:

$(HOME)/doc/Cpp/bare_metal_cpp.pdf:
	$(CURL) $@ https://caxapa.ru/files/726395/bare_metal_cpp.pdf
$(HOME)/doc/Cpp/comms-protocols-cpp.pdf:
	$(CURL) $@ https://caxapa.ru/files/726398/comms-protocols-cpp.pdf

.PHONY: doxy
doxy: .doxygen
	rm -rf docs ; doxygen $< 1> /dev/null

# install
.PHONY: install update ref gz
install: doc ref gz
	$(MAKE) update
	opam init -y
update:
	sudo apt update
	sudo apt install -uy `cat apt.txt arch/$(ARCH).apt`
	$(OPAM) update
ref: \
	ref/embxx/README.md
gz:

ref/embxx/README.md:
	git clone -o gh -b master git@github.com:ponyatov/embxx.git ref/embxx

# merge
MERGE += Makefile README.md apt.txt LICENSE
MERGE += .clang-format .doxygen .gitignore
MERGE += .vscode bin doc lib inc src tmp ref
MERGE += hw cpu arch

.PHONY: dev
dev:
	git push -v
	git checkout $@
	git pull -v
	git checkout shadow -- $(MERGE)
	$(MAKE) doxy && git add -f docs

.PHONY: shadow
shadow:
	git push -v
	git checkout $@
	git pull -v

.PHONY: release
release:
	git tag $(NOW)-$(REL)
	git push -v --tags
	$(MAKE) shadow

.PHONY: zip
zip:
	git archive \
		--format zip \
		--output $(TMP)/$(MODULE)_$(NOW)_$(REL).src.zip \
	HEAD
