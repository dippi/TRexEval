CXXFLAGS=-Wall -std=c++11 -pthread -DNDBUG -O3

SOURCES=$(wildcard *.cpp)
INCLUDES=../repo/TRex2-lib/src
LIBS=../repo/TRex2-lib/src/.libs

.PHONY: default
default: main

main: $(SOURCES)
	$(CXX) $(CXXFLAGS) -o main $(SOURCES) -I$(INCLUDES) -L$(LIBS) -lTRex2
	
run:
	LD_LIBRARY_PATH=$(LD_LIBRARY_PATH):$(LIBS) ./main

.PHONY: clean
clean:
	rm -f main

