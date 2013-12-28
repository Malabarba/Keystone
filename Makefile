EXE = Keystone.exe
EXE-LAP = Keystone-laptop.exe
ICON = icon.png
LCOMP = wine ahk2exe.exe
WCOMP = ahk2exe.exe
SRC = keystone.ahk

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

$(EXE-LAP) : $(SRC) 
	echo "Building -o"$@;
	cp binds-intrusive.ahk binds-laptop.ahk
	$(COMP) $(SRC)
	rm -f binds-laptop.ahk
	touch binds-laptop.ahk 

$(EXE) : $(SRC)
	echo "Building -o"$@;
	touch binds-laptop.ahk 
	$(COMP) $(SRC)

