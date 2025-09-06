#include <iostream>
#include "finder.h"

using namespace std;

int main(int argc, char **argv)
{
    if (argc != 3)
    {
        printf("Use: %s <input string> <string to find>\n", argv[0]);
        return 2;
    }

    return !find_str(argv[1], argv[2]);
}