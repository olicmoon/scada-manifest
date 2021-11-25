default_target: build

.PHONY: default_target

workdir := scada

ifneq ("$(wildcard scada/container.mk)","")
include scada/container.mk
endif

all:
	@echo "all from root makefile"

init:
	@repo init -u . -m manifest.xml

sync:
	@repo sync
	@make setup

clean:
	@rm -rf .repo || true
	@rm -rf scada || true
