LLVM_VERSION=$(notdir $(shell pwd))

all: llvm-$(LLVM_VERSION).src.tar.xz cfe-$(LLVM_VERSION).src.tar.xz polly-$(LLVM_VERSION).src.tar.xz clang-tools-extra-$(LLVM_VERSION).src.tar.xz compiler-rt-$(LLVM_VERSION).src.tar.xz openmp-$(LLVM_VERSION).src.tar.xz
	./scripts/build.sh $(LLVM_VERSION)

llvm-$(LLVM_VERSION).src.tar.xz:
	wget http://releases.llvm.org/$(LLVM_VERSION)/$@

cfe-$(LLVM_VERSION).src.tar.xz:
	wget http://releases.llvm.org/$(LLVM_VERSION)/$@

polly-$(LLVM_VERSION).src.tar.xz:
	wget http://releases.llvm.org/$(LLVM_VERSION)/$@

clang-tools-extra-$(LLVM_VERSION).src.tar.xz:
	wget http://releases.llvm.org/$(LLVM_VERSION)/$@

compiler-rt-$(LLVM_VERSION).src.tar.xz:
	wget http://releases.llvm.org/$(LLVM_VERSION)/$@

openmp-$(LLVM_VERSION).src.tar.xz:
	wget http://releases.llvm.org/$(LLVM_VERSION)/$@

print:
	echo $(LLVM_VERSION)

unpack:
	./scripts/unpack.sh $(LLVM_VERSION)

debug:
	./scripts/build.sh $(LLVM_VERSION) $@

clean_build:
	rm -rf `find ./ -name build`

clean: clean_build
	./scripts/clean.sh $(LLVM_VERSION)

uninstall:
	rm -rf release enable *.xz

.PHONY: clean clean_build debug unpack print release
