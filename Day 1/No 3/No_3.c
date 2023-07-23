//Finding a character
#include<stdio.h>
int main(){
    FILE *f1;
    char ch;
    f1=fopen("input.txt","r");
    while((ch=fgetc(f1))!=EOF){
        if(ch=='o'){
            printf("Yes o character found\n");
        }
    }
    fclose(f1);
    return 0;
}