.PHONY: clean installgeneral installwork install

clean:
	scripts/clean

installgeneral:
	scripts/install_general

installwork:
	scripts/install_work

install: installgeneral installwork clean
