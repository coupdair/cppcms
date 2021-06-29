LIBS=-lcppcms -lbooster

all: clean forms 

forms: forms.cpp view.cpp content.h
	$(CXX) -Wall forms.cpp view.cpp -o forms $(LIBS)

view.cpp: view.tmpl content.h
	cppcms_tmpl_cc view.tmpl -o view.cpp

clean:
	rm -fr *.exe *.so view.cpp cppcms_rundir forms
