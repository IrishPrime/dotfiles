CC=
CFLAGS=-Wall -Wstrict-prototypes -g -I.
DEFS=-DDEBUG
DEPS=
LDFLAGS=
SOURCES=
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=

.c.o:
	$(CC) $(CFLAGS) $< -c -o $@

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

all: $(EXECUTABLE)

test: $(EXECUTABLE)

clean:
	rm -rf *.o $(EXECUTABLE)

debug:
	make clean
	$(CC) $(CFLAGS) $(DEFS) $< -c $(SOURCES)
	make all
