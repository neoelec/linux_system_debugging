extern void print_unw_backtrace(void);

int foo(void)
{
    print_unw_backtrace();

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
