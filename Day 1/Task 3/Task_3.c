// Remove extra spaces and newline from the given C program.
#include <stdio.h>
int main()
{
    FILE *f1, *f2;
    char ch;
    int dslash = 0;
    f1 = fopen("input.txt", "r");
    f2 = fopen("output.txt", "w");
    
    while ((ch = fgetc(f1)) != EOF)
    {
        if (ch == '/')
        { // remove comments
            ch = fgetc(f1);
            if (ch == '/')
            {
                while ((ch = fgetc(f1)) != '\n')
                {
                    dslash++;
                }
                fprintf(f2, "%c", '\n');
            }
            else if (ch == '*')
            {
                while ((ch = fgetc(f1)) != '*')
                {
                    dslash++;
                }
                ch = fgetc(f1);
                if (ch == '/')
                {
                    dslash++;
                }
            }
        }
        else
        {
            fprintf(f2, "%c", ch);
        }
    }
    fclose(f1);
    fclose(f2);

    f1 = fopen("output.txt", "r");
    f2 = fopen("file3.txt", "w");

    int nflag = 0, wflag = 0;//0 means havent printed yet
    while ((ch = fgetc(f1)) != EOF)
    {
        
        if (ch == ' ')
        { // remove extra spaces
            if (wflag == 0)
            {
                fprintf(f2, "%c", ' ');
            }
            wflag = 1;
            continue;
        }
        if (ch == '\n')
        { // remove extra newlines
            if (nflag == 0)
            {
                fprintf(f2, "%c", '\n');
            }
            nflag = 1;
            continue;
        }
        fprintf(f2, "%c", ch);
        wflag = 0;
        nflag = 0;
        
    }
    fclose(f1);
    fclose(f2);
    remove("output.txt");
    rename("file3.txt", "output.txt");
    return 0;
}