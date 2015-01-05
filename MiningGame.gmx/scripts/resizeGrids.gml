/* resizes all grids to be reused again.
argument0 = columns (width)
argument1 = rows (height) */

/*for (var i = 0; i < ds_grid_width(global.objectGrid); i++)
{
     for (var j = 0; j < ds_grid_height(global.objectGrid); j++)
     {
        with (ds_grid_get(global.objectGrid, i, j))
            instance_destroy();
     }
}*/

//ds_grid_clear(global.objectGrid, -1);
ds_grid_resize(global.finishedGrid, argument0, argument1);
ds_grid_resize(global.aStarGrid, argument0, argument1);
//ds_grid_resize(global.objectGrid, argument0, argument1);
