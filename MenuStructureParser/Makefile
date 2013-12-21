SRC = $(wildcard *.cpp)
LOBJ = $(SRC:.cpp=.o) ##$(wildcard *.o)
WOBJ = $(LOBJ:.o=.ow) ##$(wildcard *.ow)
DOBJ = LOBJ #$(LOBJ:.o=.do) ##$(wildcard *.do)

WF = -Wall -Wextra -Wshadow #-Weffc++
CF = -I../../Misc -std=c++11 -c $(WF) #-g `sdl-config --cflags` 
LF = $(WF)
DF = -g

LEXE = MenuStructureParser.x
DEXE = MenuStructureParser-debug.x
WEXE = MenuStructureParser.exe
LCOMP = g++ 
WCOMP = x86_64-redhat-linux-g++ -lmingw32 -lstdc++

SED = 2>&1 | \
	sed 's/, std::allocator<\([^<>]\|<[^<>]*>\)*> \?//g' | \
	sed 's/std::deque<std::deque<\([^<>]*\)>>/Map<\1>/g'  | \
	sed 's/\[[^[]*\]//g' | \
	sed 's/__gnu_cxx/gnu/g' | \
	sed 's/__[a-z]*_/_/g' | \
	sed 's/__normal_iterator<\([^<>]\|<[^<>]*>\)*>/it<>/g' | \
	sed 's/std::basic_string<[^<>]*>/string/g' | \
	sed 's/basic_istream<[^<>]*>/istream/g' | \
	sed 's/basic_ifstream<[^<>]*>/ifstream/g' | \
	sed 's/std:://g' | \
	sed 's/\/.\{40,\}\//\/...\//g' ; \
	exit $$PIPESTATUS

##############################################
#########CUSTOM MAKE OPTIONS##################
### Running these should always be enough.###

run : $(LEXE)
	./$(LEXE)

runwin : $(WEXE)
	wine $(WEXE)

debug : $(DEXE)
	xterm -maximized -e gdb -x gdb-commands $(DEXE) 
clean : 
	rm $(LEXE) *.o  $(WEXE) *.ow;

# version : $(LEXE) $(WEXE) version.sh
# 	./version.sh  $(LEXE)  $(WEXE)

release : $(LEXE) $(WEXE) version.sh
	./version.sh  $(LEXE)  $(WEXE) push

push : push-version.sh
	./push-version.sh

pull : pull-version.sh 
	./pull-version.sh

check :
	./cppcheck --enable=all ./ 2>&1 | sed 's/\[\(.*\:.*\)\]/\1/'

commit : 
	git commit -a -m "`date '+%R %d/%m/%Y'`"

edit : 
	if [ -n "`pidof emacs`" ]; then \
	emacsclient Makefile *.sh ~/.emacs *.hpp *.cpp  & \
	else \
	emacs Makefile *.sh ~/.emacs *.hpp *.cpp & \
	fi 

all : lin win

lin : $(LEXE)
	echo "Make done."

win : $(WEXE)
	echo "Make done."

version :
	echo "Compiler version (linux then windows):"
	$(LCOMP) --version
	$(WCOMP) --version

##############################################
##############SUFFIX RULES####################
##############################################

%.o: %.cpp %.hpp
	echo "Compiling -o"$@;
	$(LCOMP) $(CF) $< -o $@ $(SED)

%.do: %.cpp
	echo "Compiling -o"$@" debug mode.";
	$(LCOMP) $(DF) $(CF) $< -o $@ $(SED)

%.ow: %.cpp %.o 
	$(WCOMP) $(CF) $< -o $@

$(LEXE) : $(LOBJ) 
	echo "Building -o"$@;
	$(LCOMP) $(LLF) $(LF) $(LOBJ) -o $(LEXE) $(SED)

$(WEXE) : $(WOBJ)
	$(WCOMP)  *.ow $(WLF) $(LF) -o $(WEXE)

$(DEXE) : $(DOBJ) 
	echo "Building -o"$@" debug mode.";
	$(LCOMP) $(LLF) $(DF) $(LF) $(DOBJ) -o $(DEXE) $(SED)


