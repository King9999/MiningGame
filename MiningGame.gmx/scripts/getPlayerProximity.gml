/* This is used to check if the player is too close to the exit when generating a random level. If true,
the player is relocated, and then another check is performed. 

argument0 = the grid column to check
argument1 = the grid row to check
argument2 = the ID of the object whose proximity is be to checked

*/

//TODO: Code does not appear to work properly.

var searchRange = 2;
var playerTooClose = false;
var randCol = argument0;
var randRow = argument1;
var target = argument2;

if (randCol >= searchRange && randRow >= searchRange)
{
    var i = randCol - searchRange;
    var j = randRow - searchRange;
    while (!playerTooClose && i < randCol + searchRange && i < ds_grid_width(global.finishedGrid))
    {
        while (!playerTooClose && j < randRow + searchRange && j < ds_grid_height(global.finishedGrid))
        {
            if (ds_grid_get(global.finishedGrid, i, j) == target)
            {
                playerTooClose = true;
            }
            j++;
        }
        i++;
    }
}
else if (randCol < searchRange && randRow >= searchRange)
{
    var i = 0;
    var j = randRow - searchRange;
    while (!playerTooClose && i < randCol + (searchRange * 2) && i < ds_grid_width(global.finishedGrid))
    {
        while (!playerTooClose && j < randRow + searchRange && j < ds_grid_height(global.finishedGrid))
        {
            if (ds_grid_get(global.finishedGrid, i, j) == target)
            {
                playerTooClose = true;
            }
            j++;
        }
        i++;
    }
}
else if (randCol >= searchRange && randRow < searchRange)
{
    var i = randCol - searchRange;
    var j = 0;
    while (!playerTooClose && i < randCol + searchRange && i < ds_grid_width(global.finishedGrid))
    {
        while (!playerTooClose && j < randRow + (searchRange * 2) && j < ds_grid_height(global.finishedGrid))
        {
            if (ds_grid_get(global.finishedGrid, i, j) == target)
            {
                playerTooClose = true;
            }
            j++;
        }
        i++;
    }
}
else if (randCol < searchRange && randRow < searchRange)
{
    var i = 0;
    var j = 0;
    while (!playerTooClose && i < randCol + (searchRange * 2) && i < ds_grid_width(global.finishedGrid))
    {
        while (!playerTooClose && j < randRow + (searchRange * 2) && j < ds_grid_height(global.finishedGrid))
        {
            if (ds_grid_get(global.finishedGrid, i, j) == target)
            {
                playerTooClose = true;
            }
            j++;
        }
        i++;
    }
}
 else if (randCol == ds_grid_width(global.finishedGrid) - 1 && randRow < searchRange)
{
    var i = ds_grid_width(global.finishedGrid) - (searchRange * 2) - 1;
    var j = 0;
    while (!playerTooClose && i < ds_grid_width(global.finishedGrid))
    {
        while (!playerTooClose && j < randRow + (searchRange * 2) && j < ds_grid_height(global.finishedGrid))
        {
            if (ds_grid_get(global.finishedGrid, i, j) == target)
            {
                playerTooClose = true;
                 show_debug_message("Player too close. Moving...");
            }
            j++;
        }
        i++;
    }
}
else if (randCol == ds_grid_width(global.finishedGrid) - 1 && randRow >= searchRange)
{
    var i = ds_grid_width(global.finishedGrid) - (searchRange * 2) - 1;
    var j = randRow - searchRange;
    while (!playerTooClose && i < ds_grid_width(global.finishedGrid))
    {
        while (!playerTooClose && j < randRow + searchRange && j < ds_grid_height(global.finishedGrid))
        {
            if (ds_grid_get(global.finishedGrid, i, j) == target)
            {
                playerTooClose = true;
                 show_debug_message("Player too close. Moving...");
            }
            j++;
        }
        i++;
    }
}
else if (randCol < searchRange && randRow == ds_grid_height(global.finishedGrid) - 1)
{
    var i = 0;
    var j = ds_grid_height(global.finishedGrid) - (searchRange * 2) - 1;
    while (!playerTooClose && i < randCol + (searchRange * 2) && i < ds_grid_width(global.finishedGrid))
    {
        while (!playerTooClose && j < ds_grid_height(global.finishedGrid))
        {
            if (ds_grid_get(global.finishedGrid, i, j) == target)
            {
                playerTooClose = true;
                 show_debug_message("Player too close. Moving...");
            }
            j++;
        }
        i++;
    }
}
else if (randCol >= searchRange && randRow == ds_grid_height(global.finishedGrid) - 1)
{
    var i = randCol - searchRange;
    var j = ds_grid_height(global.finishedGrid) - (searchRange * 2) - 1;
    while (!playerTooClose && i < randCol + searchRange && i < ds_grid_width(global.finishedGrid))
    {
        while (!playerTooClose && j < ds_grid_height(global.finishedGrid))
        {
            if (ds_grid_get(global.finishedGrid, i, j) == target)
            {
                playerTooClose = true;
                 show_debug_message("Player too close. Moving...");
            }
            j++;
        }
        i++;
    }
}

return playerTooClose;
