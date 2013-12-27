# SRC = $(wildcard *.cpp)
# LOBJ = $(SRC:.cpp=.o) ##$(wildcard *.o)
# WOBJ = $(LOBJ:.o=.ow) ##$(wildcard *.ow)
# DOBJ = LOBJ #$(LOBJ:.o=.do) ##$(wildcard *.do)

# WF = -Wall -Wextra -Wshadow #-Weffc++
# CF = -I../../Misc -std=c++11 -c $(WF) #-g `sdl-config --cflags` 
# LF = $(WF)
# DF = -g

EXE = Keystone.exe
EXE-LAP = Keystone-laptop.exe
ICON = icon.png
LCOMP = wine ahk2exe.exe
WCOMP = ahk2exe.exe

##############################################
#########CUSTOM MAKE OPTIONS##################
### Running these should always be enough.###

run : $(EXE)
	./$(EXE)

run-lap : $(EXE-LAP)
	./$(EXE-LAP)

clean : 
	rm $(EXE) $(EXE-LAP)

all : lap exe

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

