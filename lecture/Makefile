all: c1

c1: init
	cd c1 && xelatex --shell-escape -output-directory=../build -synctex=1 -interaction=nonstopmode c1_get_started.tex > ../build/c1.log

init:
	[ -d "./build" ] || mkdir build
	
clean:
	rm -rf ./build
