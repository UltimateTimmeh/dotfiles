.PHONY: clean software config install

clean:
	scripts/clean

software:
	scripts/software

config:
	scripts/config

install: software config clean
