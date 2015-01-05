/* This script is used to check whether the game should add a modifier to the current level. The modifiers manipulate certain
global variables so that levels behave in unusual ways.

The first level never has a modifier applied. Bonus stages do not get modifiers. 

argument0 = the mod to apply
*/

//randomize();

var levelModded = false;
//var chance = random(1);
//chance = 0.2;

//if (global.level > 9)
//{
    //if (chance <= 0.21 + (global.tier * 0.02))
    //{
        //levelModded = true;
        //level mod in effect, choose a random one
        //var modEffect = floor(random_range(1, 8));
        //var modEffect = 2;
        
        switch(argument0)
        {
            case 1: //all rocks in the level have 1 HP
                global.rocksBrittle = true;
                
                global.levelModAlert = "Everything is brittle...";
                //levelModded = true;
                break;
                
            case 2: //entire level is covered in gas, but mineral drop rate increased 5x
                global.dropRateMod = 5;
                
                //every empty space is covered in gas
                for (var i = 0; i < ds_grid_width(global.finishedGrid); i++)
                {
                    for (var j = 0; j < ds_grid_height(global.finishedGrid); j++)
                    {
                        if (ds_grid_get(global.finishedGrid, i, j) == TILE_EMPTY)
                        {
                            ds_grid_set(global.finishedGrid, i, j, TILE_GAS);
                        }
                    }
                }
                
                
                global.levelModAlert = "There's something in the air...";
                //levelModded = true;
                break;
                
            case 3: //drop rate and mineral value increase.
                global.dropRateMod = 2;
                global.valueMod = 1.5;
                global.levelModAlert = "Today's your lucky day!";
                //levelModded = true;
                break;
                
            case 4: //mineral value up, enemy speed & count up.
                global.levelModAlert = "Get rich or die tryin'.";
                //levelModded = true;
                break;
                
            case 5:
                //increase gear level
                var num = floor(random_range(1, 5));
                switch (num)
                {
                    case 1:
                        if (global.pickaxeLevel < MAX_UPGRADE)
                            global.pickaxeLevel++;
                        break;
                        
                    case 2:
                        if (global.heartLevel < MAX_UPGRADE)
                            global.heartLevel++;
                        break;
                        
                    case 3:
                        if (global.oxygenLevel < MAX_UPGRADE)
                            global.oxygenLevel++;
                        break;
                        
                    case 4:
                        if (global.lanternLevel < MAX_UPGRADE)
                            global.lanternLevel++;
                        break;
                }
                
                //decrease gear level
                num = floor(random_range(1, 5));
                switch (num)
                {
                    case 1:
                        if (global.pickaxeLevel > 1)
                            global.pickaxeLevel--;
                        break;
                        
                    case 2:
                        if (global.heartLevel > 1)
                            global.heartLevel--;
                        break;
                        
                    case 3:
                        if (global.oxygenLevel > 1)
                            global.oxygenLevel--;
                        break;
                        
                    case 4:
                        if (global.lanternLevel > 1)
                            global.lanternLevel--;
                        break;
                }
                
                global.levelModAlert = "Equivalent exchange...";
                //levelModded = true;
                break;
                
            case 6:
                global.oxygenDecreasing = false;
                global.levelModAlert = "Breathe easy!";
                //levelModded = true;
                break;
                
            case 7:
                global.superRocksEnabled = true;
                global.dropRateMod = 10;
                global.levelModAlert = "Your pickaxe hand must be strong!";
                //levelModded = true;
                break;
    
        }
    //}
//}

//return levelModded;
