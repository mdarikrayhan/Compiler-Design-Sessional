//Remove comments from the given C program.
#include<stdio.h>
int main(){
    FILE *f1,*f2;
    char ch;
    int dslash=0;
    f1=fopen("input.txt","r");
    f2=fopen("output.txt","w");
    while((ch=fgetc(f1))!=EOF){
        if(ch=='/'){
            ch=fgetc(f1);//second character
            if(ch=='/'){//single line comment
                while((ch=fgetc(f1))!='\n'){
                    dslash++;
                }
                fprintf(f2,"%c",'\n');
            }
            else if(ch=='*'){//multi line comment
                while((ch=fgetc(f1))!='*'){
                    dslash++;
                }
                ch=fgetc(f1);
                if(ch=='/'){
                    dslash++;
                }
            }
        }
        else{
            fprintf(f2,"%c",ch);
        }
    }
    fclose(f1);
    fclose(f2);

    return 0;
}