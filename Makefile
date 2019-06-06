CXXFLAGS= -std=c++14 -Wall -pedantic

TEMPLATECPP=templates/template.cpp
PROGRAMCPP=program.cpp
TARGET=program

.PHONY: all build clean new remove run setup

all: run

setup:
	./scripts/precompile-headers.sh
	touch input.txt

build: $(TARGET)

run: build
	./$(TARGET) <input.txt

clean:
	-rm $(TARGET)

remove: clean
	-rm $(PROGRAMCPP)

new: clean
	cp $(TEMPLATECPP) $(PROGRAMCPP)
	-rm input.txt
	touch input.txt
