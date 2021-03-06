EXE = Keystone.exe
EXE-LAP = Keystone-laptop.exe
ICON = icon.png
LCOMP = wine Ahk2exe.exe
WCOMP = Ahk2exe.exe
SRC = keystone.ahk
ALL-SRC = *.ahk

ifeq ($(OS),Windows_NT)
    COMP = $(WCOMP)
else
    COMP = $(LCOMP)
endif

##############################################
#########CUSTOM MAKE OPTIONS##################
### Running these should always be enough.###

all : lap exe

run : $(EXE)
	./$(EXE)

run-lap : $(EXE-LAP)
	./$(EXE-LAP)

clean : 
	rm $(EXE) $(EXE-LAP)

lap : $(EXE-LAP)
	echo "Done building "$(EXE-LAP)

exe : $(EXE)
	echo "Done building "$(EXE)

##############################################
##############SUFFIX RULES####################
##############################################

$(EXE-LAP) : $(SRC) $(ALL-SRC)
	echo "Building -o"$@;
	cp binds-intrusive.ahk binds-laptop.ahk
	$(COMP) /in "$(SRC)" /out "$@"
	rm -f binds-laptop.ahk
	touch binds-laptop.ahk 

$(EXE) : $(SRC) $(ALL-SRC)
	echo "Building -o"$@;
	touch binds-laptop.ahk 
	$(COMP) /in "$(SRC)" /out "$@"

