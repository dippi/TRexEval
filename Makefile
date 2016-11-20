CXXFLAGS=-Wall -std=c++11 -pthread -DNDBUG -O3

SOURCES=$(wildcard *.cpp)
TREX_PATH?=./TRex
INCLUDES=$(TREX_PATH)/TRex2-lib/src
LIBS=$(TREX_PATH)/TRex2-lib/src/.libs

.PHONY: default
default: main

main: $(SOURCES)
	$(CXX) $(CXXFLAGS) -o main $(SOURCES) -I$(INCLUDES) -L$(LIBS) -lTRex2
	
run:
	LD_LIBRARY_PATH=$(LD_LIBRARY_PATH):$(LIBS) ./main

.PHONY: clean
clean:
	rm -f main

