# var
MODULE = $(notdir $(CURDIR))
REL    = $(shell git rev-parse --short=4    HEAD)
BRANCH = $(shell git rev-parse --abbrev-ref HEAD)
NOW    = $(shell date +%d%m%y)

# cross
TARGET = thumbv7m-none-eabi

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
C += $(wildcard src/*.c*)
H += $(wildcard inc/*.h*)
M += $(wildcard src/*.ml)

# cfg
CFLAGS += -Iinc -Itmp

# all
.PHONY: all run
all: bin/$(MODULE)
run: bin/$(MODULE) lib/$(MODULE).ini
	$^

# format
.PHONY: format
format: tmp/format_cpp tmp/format_ml
tmp/format_cpp: $(C) $(H)
	$(CF) $? && touch $@
tmp/format_ml: $(M)
	touch $@

# rule
bin/$(MODULE): $(C) $(H)
	$(CXX) $(CFLAGS) -o $@ $(C) $(L)

# doc
.PHONY: doc
doc: \
	$(HOME)/doc/OCaml/ru_Minsky_Madhavapeddy_Hickey_-_Real_World_OCaml_-_2013.pdf

$(HOME)/doc/OCaml/ru_Minsky_Madhavapeddy_Hickey_-_Real_World_OCaml_-_2013.pdf:

.PHONY: doxy
doxy: .doxygen
	rm -rf docs ; doxygen $< 1> /dev/null

# install
.PHONY: install update ref gz
install: doc ref gz
	$(MAKE) update
	opam init -y
update:
# sudo apt update
# sudo apt install -uy `cat apt.txt`
	$(OPAM) update
ref:
gz:

# merge
MERGE += Makefile README.md apt.txt LICENSE
MERGE += .clang-format .doxygen .gitignore
MERGE += .vscode bin doc lib inc src tmp ref

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
