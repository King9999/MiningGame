/* Creates a temporary save file so player can resume game. File is deleted after resuming game.

argument0 = player's x position
argument1 = player's y position */

var xPos = argument0;
var yPos = argument1;
var roomWidth = argument2;
var roomHeight = argument3;

var file = working_directory + "quicksave.ini";
ini_open(file);

//map information
ini_write_real("Level", "seed", random_get_seed());
ini_write_real("Level", "playerX", xPos);
ini_write_real("Level", "playerY", yPos);
ini_write_real("Level", "floor", global.level);
ini_write_real("Level", "tier", global.tier);
ini_write_real("Level", "rockCount", global.rockCount);
ini_write_real("Level", "enemyCount", global.enemyCount);
ini_write_real("Level", "levelModded", global.levelModded);
ini_write_real("Level", "bonusRate", global.bonusRateMod);
ini_write_real("Level", "dropRate", global.dropRateMod);
ini_write_real("Level", "mineralValue", global.valueMod);
ini_write_real("Level", "roomWidth", roomWidth);
ini_write_real("Level", "roomHeight", roomHeight);


//stats
ini_write_real("Stats", "oxygen", global.oxygen);
ini_write_real("Stats", "hearts", global.hearts);
ini_write_real("Stats", "maxHearts", global.currentMaxHearts);
ini_write_real("Stats", "cash", global.cash);
//ini_write_real("Stats", "totalCash", global.totalCash);
ini_write_real("Stats", "currentTotalCash", global.currentTotalCash);
ini_write_real("Stats", "pickaxeLevel", global.pickaxeLevel);
ini_write_real("Stats", "heartLevel", global.heartLevel);
ini_write_real("Stats", "oxygenLevel", global.oxygenLevel);
ini_write_real("Stats", "lanternLevel", global.lanternLevel);

//items
ini_write_real("Items", "gasMask", global.gasMaskEnabled);
ini_write_real("Items", "dummy", global.dummyEnabled);
ini_write_real("Items", "repellent", global.repellentEnabled);
ini_write_real("Items", "charm", global.charmEnabled);


//write level data (i.e. grid values)
var i = 0;
var j = 0;
ini_write_real("Grid", "width", ds_grid_width(global.finishedGrid));
ini_write_real("Grid", "height", ds_grid_height(global.finishedGrid));
while (i < ds_grid_width(global.finishedGrid))
{
    j = 0;
    while (j < ds_grid_height(global.finishedGrid))
    {
        ini_write_real("Grid", "r" + string(i) + "c" + string(j), ds_grid_get(global.finishedGrid, i, j));
        j++;
    }
    i++;
}


 
ini_close();

show_debug_message(file + " saved!");
