// example.i
%module example
%{
#include "example.h"
%}


// -------------------------- get_service ------------------------------------

// This was one mechanism to return a string in place of the struct.
// Though it worked(After modifications to C# generaed code), I was not too
// enthused and decided to go with a pure swig approach.
// Uncommend the typemap below if you want to give it a shot...
//%typemap(out) MYService *
//{
//    $result = SWIG_csharp_string_callback((const char *)$1->stringEntry);
//    free($1);
//}


%inline %{

// This container is to return the result to .NET.
struct container_service {
int count;
MYService *service;
};

typedef struct container_service Container_Service;

Container_Service *fillup_service_proxy(int fail)
{
    // Call the real fillup_service here.
    MYService *service;
    int ret = fillup_service(fail, &service);
    //Create new container_service.
    Container_Service *retcontainer = (Container_Service *)malloc(sizeof(Container_Service*));
    retcontainer->count = ret;
    retcontainer->service = service;
    return retcontainer;
}

// This container is to return the result to .NET.
struct container_service_array {
int count;
MYService **services;
};

typedef struct container_service_array Container_Service_Array;

Container_Service_Array *fillup_service_array_proxy(int fail)
{
    // Call the real fillup_service here.
    MYService **service_array;
    int ret = fillup_service_array(fail, &service_array);
    //Create new container_service.
    Container_Service_Array *retcontainer = (Container_Service_Array *)malloc(sizeof(Container_Service_Array *));
    retcontainer->count = ret;
    retcontainer->services = service_array;
    return retcontainer;
}

%}


%include "example.h"

// This container is to return the result to .NET.
struct container_service {
int count;
MYService *service;
};

typedef struct container_service Container_Service;

// Now create a proxy to fillup_service.
Container_Service *fillup_service_proxy(int fail);

//------------------------------------------------------

// This container is to return the result to .NET.
struct container_service_array {
int count;
MYService **services;
};

typedef struct container_service_array Container_Service_Array;

// Now create a proxy to fillup_service.
Container_Service_Array *fillup_service_array_proxy(int fail);


// TODO: Add destroy methods for Container_Service and Container_Service_Array

//------------------------------------------------------
