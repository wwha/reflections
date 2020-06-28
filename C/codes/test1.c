// The function is to find the square.

#include<stdio.h>

void sort(int arr[],int len)
{
    int i, j, temp;
    for (i=0; i<len-1;i++)
    {
        for (j=0; j<len-1-i;j++)
        {
            if (arr[j]>arr[j+1])
            {
                temp=arr[j];
                arr[j]=arr[j+1];
                arr[j+1]=temp;
            }
         }
    }
}
int main(void)
{
    int num;
    int i;
    scanf("%d", &num);
    int x[num],y[num];
    for (i=0;i<num;i++)
    {
        scanf("%d",&x[i]);

    }

    for (i=0;i<num;i++)
    {
        scanf("%d",&y[i]);
    }

    sort(x,num);
    sort(y,num);

    printf("%d %d %d %d\n",x[0],y[0],x[num-1],y[num-1]);


    return 0;

}
