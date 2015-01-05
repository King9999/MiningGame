//argument0 = x or y
//argument1 = step count
if (argument0 % TILE_SIZE == 0)
{
    argument1++;
    if (argument1 > 5)
    {
        argument1 = 0;
        global.totalDistance++;
    }
}

return argument1;
