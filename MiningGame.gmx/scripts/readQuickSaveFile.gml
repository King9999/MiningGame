
var file = argument0;

show_debug_message("Quicksave file " + file + " found. Loading saved map and stats.");
ini_open(file);

//map setup
var seed = ini_read_real("Level", "seed", randomize());
random_set_seed(seed);
global.tier = ini_read_real("Level", "tier", 1);
global.level = ini_read_real("Level", "floor", 1);
//global.rockCount = ini_read_real("Level", "rockCount", 0);
//global.enemyCount = ini_read_real("Level", "enemyCount", 0);
//global.levelModded = ini_read_real("Level", "levelModded", 0);
global.bonusRateMod = ini_read_real("Level", "bonusRate", 0);
global.dropRateMod = ini_read_real("Level", "dropRate", 1);
global.valueMod = ini_read_real("Level", "mineralValue", 1);

var roomWidth = ini_read_real("Level", "roomWidth", 1024);
var roomHeight = ini_read_real("Level", "roomHeight", 768);

room_set_width(gameScreen, roomWidth);
room_set_height(gameScreen, roomHeight);

//stats
global.oxygen = ini_read_real("Stats", "oxygen", 100);
global.hearts = ini_read_real("Stats", "hearts", 3);
global.currentMaxHearts = ini_read_real("Stats", "maxHearts", MIN_HEARTS);
global.cash = ini_read_real("Stats", "cash", 0);
//global.totalCash = ini_read_real("Stats", "totalCash", 0);
global.currentTotalCash = ini_read_real("Stats", "currentTotalCash", 0);
global.pickaxeLevel = ini_read_real("Stats", "pickaxeLevel", 1);
global.heartLevel = ini_read_real("Stats", "heartLevel", 1);
global.oxygenLevel = ini_read_real("Stats", "oxygenLevel", 1);
global.lanternLevel = ini_read_real("Stats", "lanternLevel", 1);

//items
global.gasMaskEnabled = ini_read_real("Items", "gasMask", false);
global.horseshoeEnabled = ini_read_real("Items", "horseshoe", false);
global.repellentEnabled = ini_read_real("Items", "repellent", false);
global.charmEnabled = ini_read_real("Items", "charm", false);

//inventory
var itemCount = ini_read_real("Inventory", "itemCount", 0);
for (var i = 0; i < itemCount; i++)
{
    ds_list_add(global.inventory, ini_read_real("Inventory", "item" + string(i), 0));
}

//NOTE: when reading the grid, I have to erase the player ID so I can place the player in the saved location.
var width = ini_read_real("Grid", "width", 1024 / TILE_SIZE);
var height = ini_read_real("Grid", "height", 768 / TILE_SIZE);

var i = 0;
var j = 0;
ds_grid_resize(global.finishedGrid, width, height);
while (i < ds_grid_width(global.finishedGrid))
{
    j = 0;
    while (j < ds_grid_height(global.finishedGrid))
    {
        var value = ini_read_real("Grid", "r" + string(i) + "c" + string(j), 0);
        
        if (value == TILE_PLAYER)
            value = TILE_EMPTY;
            
        if (value == TILE_ROCK)
            global.rockCount++;
            
        ds_grid_set(global.finishedGrid, i, j, value); 
        j++;
    }
    i++;
}

//set player location.
var xPos = ini_read_real("Level", "playerX", 0);
var yPos = ini_read_real("Level", "playerY", 0);
ds_grid_set(global.finishedGrid, floor(xPos / TILE_SIZE), floor(yPos / TILE_SIZE), TILE_PLAYER);   

//check for level mod
global.levelModded = script_execute(checkLevelMod);

ini_close();

file_delete(file);
