.PHONY: all nfa_engine copy

all: nfa_engine copy

nfa_engine:
	cd nfa_engine && $(MAKE)

copy:
	cp nfa_engine/nfa_engine bin/	

clean:
	rm -f bin/nfa_engine #bin/regex_memory
	cd generator && $(MAKE) clean
	cd nfa_engine && $(MAKE) clean
