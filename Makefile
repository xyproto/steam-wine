.PHONY: clean

PREFIX ?= /usr

steam-wine-setup: steam-wine-setup.in
	sed "s,PREFIX=/usr,PREFIX=${PREFIX}," steam-wine-setup.in > steam-wine-setup

install: steam-wine-setup
	install -Dm644 steam-wine.desktop "${PREFIX}/share/applications/steam-wine.desktop"
	install -Dm644 steam-wine.png "${PREFIX}/share/pixmaps/steam-wine.png"
	install -Dm755 steam-wine "${PREFIX}/bin/steam-wine"
	install -Dm644 steam-wine.dockitem "${PREFIX}/share/steam-wine/steam-wine.dockitem"
	install -Dm755 steam-wine-setup "${PREFIX}/bin/steam-wine-setup"

clean:
	rm -f steam-wine-setup
