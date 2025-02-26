#include <stdio.h>
#include <fcntl.h>

int main()
{
    // have kernel open connection to our our file
    int fd = open("alphabet.txt",O_RDONLY);
    FILE *fs1 = fdopen(fd,"r");
    char buff1[20];
    setvbuf(fs1,buff1,_IOFBF,20);
    FILE *fs2 = fdopen(fd,"r");
    char buff2[20];
    setvbuf(fs2,buff2,_IOFBF,20);

    // read a char & write it alternatingly from connections fs1 & fd2
    int flag1 = 1, flag2 = 2;
    while(flag1 == 1 || flag2 == 1)
    {
        char c;
        flag1 = fscanf(fs1,"%c",&c);
        if (flag1 == 1)
        	fprintf(stdout,"%c",c);

        flag2 = fscanf(fs2,"%c",&c);
        if (flag2 == 1)
        	fprintf(stdout,"%c",c);
    }
    return 0;
}

