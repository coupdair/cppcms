#include <cppcms/application.h>
#include <cppcms/applications_pool.h>
#include <cppcms/service.h>
#include <cppcms/http_response.h>
#include <iostream>
#include "content.h"

using namespace std;
class forms: public cppcms::application {
public:
    forms(cppcms::service &s) :
        cppcms::application(s) 
    {
    }//constructor

    void main(std::string /*unused*/)
    {
        content::message c;
        if(request().request_method()=="POST") {
            c.info.load(context());
            if(c.info.validate()) {
            	c.name=c.info.name.value();
            	c.sex=c.info.sex.selected_id();
            	c.state=c.info.marital.selected_id();
            	c.age=c.info.age.value();
            	c.info.clear();
            }//valid
        }//POST
        render("message",c);
    }//main
};//forms

int main(int argc,char ** argv)
{
    try {
        cppcms::service app(argc,argv);
        app.applications_pool().mount(cppcms::applications_factory<forms>());
        app.run();
    }
    catch(std::exception const &e) {
        cerr<<e.what()<<endl;
    }
}//main
// vim: tabstop=4 expandtab shiftwidth=4 softtabstop=4

