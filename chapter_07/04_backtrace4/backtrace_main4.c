extern void print_walk_through2(void);

int foo(void)
{
    print_walk_through2();

    return 0;
}

int bar(void)
{
    foo();

    return 0;
}

int boo(void)
{
    bar();

    return 0;
}

int baz(void)
{
    boo();

    return 0;
}

int main(int argc, char *argv[])
{
    baz();

    return 0;
}
