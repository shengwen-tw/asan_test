ELF=test_asan

#sudo apt install llvm clang lldb
#sudo ln -s /usr/bin/llvm-symbolizer-3.8 /usr/bin/llvm-symbolizer
ASAN_SYMBOLIZER_PATH=$(shell which llvm-symbolizer)

CFLAGS=-static-libstdc++ \
	-static-libasan \
	-O -g \
	-fsanitize=address \
	-fno-omit-frame-pointer 

build:
	g++ -o ${ELF} ${CFLAGS} main.cpp

test:
	export ASAN_OPTIONS=symbolize=1
	export ASAN_SYMBOLIZER_PATH=$(shell which llvm-symbolizer)
	./${ELF}

rm:
	rm ${ELF}
