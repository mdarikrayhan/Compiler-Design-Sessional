//Read From File
#include<stdio.h>
int main(){

    FILE *f1;//file pointer

    char ch;

    f1=fopen("input.txt","r");//read mode

    while((ch=fgetc(f1))!=EOF){
        printf("%c",ch);
    }

    fclose(f1);
    
    return 0;
}