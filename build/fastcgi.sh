#!/bin/bash

#LD_LIBRARY_PATH="/home/pi/SC/CppCMS/cppcms/build;/home/pi/SC/CppCMS/cppcms/build/booster;/home/pi/SC/libI2C/" /home/pi/SC/CppI2C/fake-web --config=/home/pi/SC/CppI2C/config.js

r=$1

if [ "$r" == "hello" ]
then
  /home/pi/SC/CppCMS/cppcms/build/hello_world -c /home/pi/SC/CppCMS/cppcms/examples/hello_world/config_fastcgi.js
fi

if [ "$r" == "forms" ]
then
  LD_LIBRARY_PATH="/home/pi/SC/CppCMS/cppcms/build;/home/pi/SC/CppCMS/cppcms/build/booster" /home/pi/SC/CppCMS/cppcms/build/forms -c /home/pi/SC/CppCMS/cppcms/examples/forms/config_fastcgi.js
fi

if [ "$r" == "inheritemplate" ]
then
  LD_LIBRARY_PATH="/home/pi/SC/CppCMS/cppcms/build;/home/pi/SC/CppCMS/cppcms/build/booster" /home/pi/SC/CppCMS/cppcms/build/myapp -c /home/pi/SC/CppCMS/cppcms/examples/templates_inheritance/config_fastcgi.js
fi

if [ "$r" == "web" ]
then
#  LD_LIBRARY_PATH="/home/pi/SC/CppCMS/cppcms/build;/home/pi/SC/CppCMS/cppcms/build/booster;/home/pi/SC/libI2C/" /home/pi/SC/CppI2C/i2cweb --config=/home/pi/SC/CppI2C/config_fastcgi.js
  cd /home/pi/SC/CppI2C/
  LD_LIBRARY_PATH="../CppCMS/cppcms/build;../CppCMS/cppcms/build/booster;../libI2C" /home/pi/SC/CppI2C/i2cweb -i 1 --config=/home/pi/SC/CppI2C/config_fastcgi.js
fi

if [ "$r" == "local" ]
then
#  LD_LIBRARY_PATH="/home/pi/SC/CppCMS/cppcms/build;/home/pi/SC/CppCMS/cppcms/build/booster;/home/pi/SC/libI2C/" /home/pi/SC/CppI2C/i2cweb --config=/home/pi/SC/CppI2C/config.js
  cd /home/pi/SC/CppI2C/
  LD_LIBRARY_PATH="../CppCMS/cppcms/build;../CppCMS/cppcms/build/booster;../libI2C" ./i2cweb -c config.js -i 1
fi
