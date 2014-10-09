/*
 * Author: Bharath Kumaran
 * Licensing: GNU General Public License (http://www.gnu.org/copyleft/gpl.html)
 * Description: example header file.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "example.h"

MYService *
get_service()
{
    // Just malloc a MYService with dummy values.
    MYService *service = (MYService *)malloc(sizeof(MYService));
    char *strval = (char *)calloc(12, sizeof(char));
    strcpy(strval, "test string");
    service->stringEntry = strval;
    return service;
}

MYService **
get_service_array()
{
    // Just initialized a null array and fill up some dummy values.
    MYService **serviceArray = (MYService **)calloc(3, sizeof(MYService *));
    serviceArray[0] = get_service();
    serviceArray[1] = get_service();
    return serviceArray;
}

int
fillup_service(int fail, MYService **servicePointer)
{
    if(fail == 0)
    {
        *servicePointer = get_service();
        return 0;
    }
    else return 1;
}

int
fillup_service_array(int fail, MYService ***serviceArrayPointer)
{
    if(fail == 0)
    {
        // Set the value at address...
        *serviceArrayPointer = get_service_array();
        return 0;
    }
    else return 1;
}

int
get_count(MYService **service_array)
{
    int index = 0;
    while(service_array[index] != NULL)
    {
        index++;
    }
    return index;
}

MYService *
get_index_value(MYService **service_array, int index)
{
    //Need to assert here that service_array is not NULL.
    return service_array[index];
}

/*
 * Returns a character pointer.
 */
char *return_string()
{
    char *strval = (char *)calloc(12, sizeof(char));
    strcpy(strval, "test string");
    return strval;
}

/*
 * Returns a wide character pointer.
 */
wchar_t *return_string_wchar()
{
    wchar_t *strval = (wchar_t *)calloc(12, sizeof(wchar_t));
    wcscpy(strval, L"test string");
    return strval;
}

int
main(int argc, char **argv)
{
    /*char *t1 = return_string();
    wchar_t *t2 = return_string_wchar();*/
}
