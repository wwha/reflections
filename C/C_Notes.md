# C Programming Language Learning Notes

[TOC]

[MOOC course link](https://www.icourse163.org/course/ZJU-200001)

C Programming Language是一种工业语言，用于操作系统，嵌入式系统，驱动程序，底层驱动（图形引擎，图像处理，声音效果）。开发效率>>学习过程和开发乐趣。日常应用很少直接用C编写。学习C的过程主要是练习代码而非真实软件。



## 操作流程

Compile the C code with GCC

```sh
$ cc -g -Wall <input.c> -o <executable>
```

Execute the executable file

```sh
$ ./<executable>
```

Debug the code with  `lldb` on Mac and `gdb` on Linux.

```c
#include<stdio.h>
int main(int argc, const char* argv[])
{
  printf("hello world\n");
  return 0;
}
```





## 指针

指针是保存地址的变量。

指针应用场景

* 需要传入较大的数据时用作参数
* 传入数组后对数组做操作
* 函数返回值不止1个，需要用函数来修改不止1个变量
* 动态申请的内存

`*`**用来访问指针的值所表示的地址上的变量。**

`&` **用来获取变量的地址**

`int *p，*q`表示p, q是指针变量，表示具有实际值的变量地址。如果函数使用变量`*p`,实际输入须为地址`&i`。

```c
scanf("%d", &i);
```

`scanf`中的`&` **用来获取变量的地址**，它的操作必须是变量。使用打印`i`的地址。

```c
printf("%p", i);
```

```c
void func(int *p);

int main(void)
{
  int i = 0;
  func(&i);
}

void func(int *p)
{
}

```

数组变量是特殊的指针，const指针。数组变量本身表达地址

`*p++`取出地址p中的数据，然后移动到下一个指针。常用语数组类的连续空间操作。

数组中的单元的地址肯定是递增的。

NULL是一个预定定义的符号，表示0地址，表示返回的指针是无效的，或指针没有被真正初始化。有的编译器不愿意使用0来表示0地址。

`void*`表示不知道指向什么东西的指针。指针也可以转换类型

```c
int *p =&i; void*q = (void*)p;
```

这并没有改变p所致的变量的类型，而是让后人用不同的眼光通过p看它所指的变量。

## 动态分配内存

C99以前使用malloc申请空间，大小是以字节为单位，返回的结果是void*,需要类型转换为自己需要的类型。如果申请失败，返回0或者NULL。

```C
int *a=（int*)malloc(n*sizeof(int));//申请



free(a);//使用完了，释放。
```

## 链表(Linked-List)

当数组等增长时，链表可以把已有数据和新增数据连接起来，而不需要重新创建一个更长的空间并把已有和新的数据复制过去。

```C
typedef struct_node{
  int value;
  struct_node* next;
} Node;
```

链表包括value和下一结点的地址。

## 变量

全局变量被定义在函数之外，所以函数可以读取和更改。

局部变量被定义在函数中，只有定义它的函数可以读取和更改。

静态变量`static int a;`,被定义在函数中，只有定义它函数可以读写，但是是全局的生命周期。跳出函数后，保留跳出前的值。

**代码中应避免使用全局变量和静态变量。**



## 函数

main（）中的代码太长了，适合分成几个函数。一个源代码文件中代码太长了，适合分成几个文件。

分拆后的源代码文件都是.c配一个.h文件，main（）所在的源代码文件除外。函数被定义在.c,被声明在.h。如果需要调用其他文件中的函数，需要添加#include <.h>, 表示让编译器在指定目录寻找函数，#include”.h”,表示让编译器在当前目录中寻找函数。

变量的声明为`extern int i;`



## 结构

```C
struct point{
  int x;
  int y;
};

struct point p1,p2;
//p1和p2都是point，里面有x和y的值。

struct {
  int x;
  int y;
} p1,p2;
//p1和p2都是一种无名结构，里面有x和y的值。

struct point{
  int x;
  int y;
} p1,p2;
//p1和p2都是一种无名结构，里面有x和y的值。
```

结构指针，和数组不同，结构变量的名字并不是结构变量的地址，必须使用`&`运算符。

`struct date *pDate = &today;`

结构指针作为参数。

> K & R "If a large structure is to be passed to a function, it is generally more efficient to pass a pointer than to copy the whole structure."

```C
struct date{
  int month;
  int day;
  int year;
} myday;
struct date *p = &myday;

(*p).month = 12;
p->month = 12; // 用 ->表示指针所指的结构变量中的成员。
```

## 宏

#define <名字> <值>

结尾没有分号，因为宏不是C的语句。C在开始编译之前，会把宏的名字完全的文本替换为值。



## 自定义数据类型

```C
typedef int length;
```

使用typedef的功能来声明一个已有的数据类型的新名字，使得length成为int类型的别名。