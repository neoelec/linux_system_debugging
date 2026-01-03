#include <stdio.h>
#include <stdlib.h>

void Abnormal(void)
{
    char *p = (char *)malloc(sizeof(char) * 1);

    free(p);
    free(p); /* double free */
}

void AbnormalContainer(void)
{
    Abnormal();
}

void Normal(void)
{
    printf("normal function.\n");
}

int main(int argc, char **argv)
{
    AbnormalContainer();
    Normal();

    return 0;
}
