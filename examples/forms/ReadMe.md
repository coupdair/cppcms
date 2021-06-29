
#compile

~~~ { .bash }
../../bin/cppcms_tmpl_cc view.tmpl -o view.cpp
g++ -Wall -I../.. -I../../booster -I../../build -I../../build/booster forms.cpp view.cpp -o forms -L../../build -L../../build/booster -lcppcms -lbooster 
~~~

#run

~~~ { .bash }
LD_LIBRARY_PATH="../../build;../../build/booster" ./forms -c config.js
~~~          

#view

~~~ { .bash }
firefox http://localhost:8080/form   #config.js
firefox http://localhost:8080/forms  #arg[0]
firefox http://localhost:8080/hello  #default
~~~

## HTTP server

~~~ { .bash }
sudo service lighttpd start
#see build/fastcgi.sh
~~~

~~~ { .bash }
firefox http://193.48.111.153/forms
~~~
