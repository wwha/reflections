// The function is to input the number "1/2 3/4" to return the equal relationship
// "1/2<3/4".

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int str2Int(char* str)
{
    int number = 0;
    int i;
    for (i=0;i<=(sizeof(*str)/sizeof(str[i]));i++)
    {
        number = number*10 + (str[i] - '0');
    }

    return number;
}

int seperate(char* str, int *pa, int *pb)
{
      char *lc = strchr(str,'/');
      char c = *lc;
      *lc = '\0';
      char *t = (char*)malloc(strlen(str)+1);
      strcpy(t,str);
      *pa = str2Int(t);
      free(t);
      *lc = c;
      *pb = str2Int(lc+1);
      return 0;

}


int main(void)
{
    char str1[30],str2[30];
    int number1,number2,number3,number4;
    scanf("%s",str1);
    scanf("%s",str2);
    seperate(str1, &number1, &number2);
    printf("%d, %d\n", number1,number2);

    seperate(str2, &number3, &number4);
    printf("%d, %d\n", number3,number4);

    float val1 = (float)number1/number2;
    float val2 = (float)number3/number4;
    char relate;

    if (val1>val2)
    {
      relate='>';
    } else if (val1<val2)
    {
      relate='<';
    }
    else
    {
      relate = '=';
    }

    printf("%s%c%s\n", str1,relate,str2);

    return 0;
}
