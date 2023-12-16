CCP = g++
LIBS = -lglut -lGLU -lGL

all : test1.exe test2.exe

%.exe : %.cpp
	$(CCP) -o $@ $^ $(LIBS)

clean :
	rm -rf *.exe
