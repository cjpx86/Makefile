#include <stdio.h>
#include <string.h>
#include <print.h>
#include <list.h>
#include <test.h>
void list_demo(void)
{
	linklist *head = CreateListInHead();
	head = list_add(head);
	display(head);
	destory(head);
}
void main(void)
{
    print_hello();
    print_love();
    print_birthday();
    
    list_demo();
}

