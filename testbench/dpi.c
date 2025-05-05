

#include <stdio.h>

int verif_data(int addr, int wdata, int rdata)
{
    printf("[C DPI] Called with addr=%d, wdata=%d, rdata=%d\n", addr, wdata, rdata);

    if (addr <= 63)   
    {
        if (wdata == rdata)   
            return 1;
        else
            return 0;
    }
    else
    {
        return -1;
    }
}
