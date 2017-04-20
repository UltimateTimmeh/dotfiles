.PHONY: clean installgeneral installwork install

clean:
	./clean

installgeneral:
	./install_general

installwork:
	./install_work

install: installgeneral installwork clean
