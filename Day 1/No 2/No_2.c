//Write to file
#include<stdio.h>
int main(){
    FILE *f1,*f2;
    char ch;
    f1=fopen("input.txt","r");
    f2=fopen("output.txt","w");
    while((ch=fgetc(f1))!=EOF){
        printf("%c",ch);
        fprintf(f2,"%c",ch);
    }
    fclose(f1);
    fclose(f2);
    return 0;
}