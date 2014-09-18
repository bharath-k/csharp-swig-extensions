csharp-swig-extensions
======================

I initially thought that writing C# extensions for C code would be as easy and flexible as writing them in Python. That was until I got my feet wet. Oh the pain and the anguish! Python is built on C and CPython is a natural way of writing extensions in Python where as C# is anything but that.

You can create and return any internal python object(List, Hashtable etc.) in your C extension and access the same in the Python layer. Want to shoot yourself in the foot and return a Python List of Python Hashtables in C and access them in python as List of Hashtables. Sure, go ahead.

In C#, PInvoke is the method used to call into unmanaged C libraries. And all that you can get from the unmanaged layer(i.e. the C library) is basic types and basic array types. No complicated class or structure.

In this scenario, I have rewritten the python extension I had written earlier and tailor it to generate C# wrappers using SWIG. 

And because of the reason mentioned above, I added new methods/accessors. I could no longer send a Null terminated list of structs. Instead I had to provide an end user a way to obtain next element in the list and get the count of number of elements in the list.

There are a few more examples and I have added enough comments in the code base of help. Remember, the SWIG documentation is your friend.

Build Instructions
==================
Run "swig -csharp example.i" in command prompt. This will generate a lot of files required in the VS Project.
Open the example.sln in Visual Studio.
Right click on Solution and choose "Rebuild All"
Start the example-cs project.

Visual Studio setting details
=============================
Don't bother reading this unless you are creating the project yourself:
1. Set to compile in pure C.
2. Configuration Properties -> C/C++ -> Advanced -> Compile As = Compile as C Code (/TC)


Errors
======
1. "eh.h is only for C++!"	This means that there are some C++ bindings that have been added unncessarily in your C code. Remove those.

2. "LINK : fatal error LNK1123: failure during conversion to COFF: file invalid or corrupt":
Disable incremental linking.
Configuration Properties -> Linker -> Enable Incremental Linking: No (/INCREMENTAL:NO)
