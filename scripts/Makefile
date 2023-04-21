PACKAGES:="$(shell mktemp)"

all: manifest install

install: manifest
	./install-manifest.sh <(cat $(PACKAGES))

manifest:
	./user-manifest.sh >$(PACKAGES)

.PHONY: all install manifest
