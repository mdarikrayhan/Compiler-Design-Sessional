//No of line from input file
#include<stdio.h>
int main(){
    FILE *f1;
    char ch;

    int line=0;//No of lines

    f1=fopen("input.txt","r");
    while((ch=fgetc(f1))!=EOF){
        if(ch=='\n'){
            line++;
        }
        // if(ch==10){
        //     line++;
        // }
    }
    fclose(f1);
    printf("No of lines: %d\n",line+1);
    return 0;
}
// newline ascii value is 10 / char '\n'