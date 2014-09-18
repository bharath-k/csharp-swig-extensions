using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace temp2cs
{
    class Class1
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("------------- get_service -------------");
            myservice service = example.get_service();
            Console.WriteLine(service.stringEntry);

            Console.WriteLine("------------- get_service_array -------------");
            SWIGTYPE_p_p_myservice service_array = example.get_service_array();
            DisplaySWIGObject(service_array);

            Console.WriteLine("------------- fillup_service -------------");
            container_service service_container = example.fillup_service_proxy(0);
            myservice service2 = service_container.service;
            Console.WriteLine(service2.stringEntry);

            Console.WriteLine("------------- fillup_service_array -------------");
            container_service_array service_array_container = example.fillup_service_array_proxy(0);
            SWIGTYPE_p_p_myservice service_array2 = service_array_container.services;
            DisplaySWIGObject(service_array2);
            Console.ReadLine();
        }

        private static void DisplaySWIGObject(SWIGTYPE_p_p_myservice service_array)
        {
            int count = example.get_count(service_array);
            for (int i = 0; i < count; i++)
            {
                myservice s1 = example.get_index_value(service_array, 0);
                Console.WriteLine(s1.stringEntry);
            }
        }

    }
}
