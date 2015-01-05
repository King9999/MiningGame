/* This script holds all global variables and must execute before anything else is done. Should execute during game startup */

/*** General globals ***/
global.mapTileWidth = 32;
global.delta = 0;    //used to control the FPS for slower devices.
global.nextScreen = 0;                  //used to transistion between screens. Used with screenFadeObj
global.prevScreen = 0;                  //used by the back button to go to last viewed screen.
global.locationSet = false;             //avatar moves to tapped location when true
global.locationX = 0;
global.locationY = 0;
global.hudInstance = 0;                 //holds instance ID of hud.
global.musicEnabled = true;
global.sfxEnabled = true;
global.minerCoins = 0;              //currency used for purchasing items outside of the game.
global.currentTotalCash = 0;        //amount of cash collected for the current run only. Used to convert to miner coins. Does not count spent money.
global.inventory = ds_list_create();        //holds all items. Can hold 5 items.
global.inRestArea = false;           //if false, player is sent to rest area when leaving level. Otherwise, they go to next level

/*** Game Screen globals ***/
global.mapGrid = ds_grid_create(4, 4);          //Initial map size. used to draw tiles on the screen.
global.finishedGrid = ds_grid_create(1, 1);     //Completed map grid. Contains all used templates
global.aStarGrid = ds_grid_create(1, 1);        //used by avatar to take shortest route. Must favour destructible rocks.
//global.rockHealthGrid = ds_grid_create(1, 1);   //holds HP of all destructible rocks.
//global.objectGrid = ds_grid_create(1, 1);
global.inventory = ds_list_create();            //Player's inventory of Items
global.level = 1;                               //current map level
global.tier = 1;                                //controls the amount of objects and the size/complexity of the levels.
global.oxygen = MAX_OXYGEN;                            //when this reaches 0, player starts losing health. Oxygen can rise above 100 through bonuses
global.hearts = MIN_HEARTS;                              //player health.
global.currentMaxHearts = MIN_HEARTS;
global.pickaxeLevel = 1;
global.heartLevel = 1;
global.oxygenLevel = 1;
global.lanternLevel = 1;
global.cash = 1000000;                                //current cash in hand
global.levelModAlert = "";                      //used to display messages when a level mod is active.
global.levelModded = false;
global.modEffect = 0;                       //the level mod to apply. used with checkLevelMod script.


/**** Modifiers ****/
global.bonusRateMod = 0;                        //increases by 0.01 after every finished level, and resets to 0 when a bonus stage is created.
global.dropRateMod = 1;                         //alters the rate that minerals drop
global.valueMod = 1;                            //alters mineral value
global.rocksBrittle = false;                    //if true, all rocks in level have 1 HP.
global.onBonusStage = false;                    //if true, rock HP is 1 and there's no darkness.
global.oxygenDecreasing = true;                 //only becomes false through level mod.
global.superRocksEnabled = false;               //if true, all rocks have 10 HP + 2 times the tier.
global.rockCount = 0;                           //used for checking for any bonuses when player destroys all rocks.
global.cashBonus = 0;                           //applied whenever a player completes a feat, such as clearing all rocks.
global.oxygenBonus = 10;
global.heartBonus = 0;                           //used for bonus checking.
global.enemyCount = 0;                          //used for bonus checking.
global.enemiesSpawned = false;                  //used with the enemy count. No bonus is applied if enemies never spawned.
global.moveSpeedMod = 1;                        //used to alter player movement.
global.airReduceMod = 0;                        //adjusts how fast oxygen drops

/**** Items *****/
global.gasMaskEnabled = false;
global.horseshoeEnabled = false;
global.repellentEnabled = false;
global.charmEnabled = false;


/*** Personal Records globals ***/
global.floorsCleared = 0;           //highest number of floors cleared in a run
global.totalDistance = 0;           //number of meters travelled. Every 5 tiles = 1 metre. In game, distance is shown in kilometres.
global.totalCash = 0;               //amount of cash collected since the player installed and played the game.
global.cashSpent = 0;               //amount of cash spent in the shop.
global.enemiesKilled = 0;           //number of defeated enemies
global.totalHeartsLost = 0;         //number of times player took damage. Does not count damage taken from lack of oxygen
global.bonusStageCount = 0;         //number of times player entered a bonus room
global.pickaxeUpgradeCount = 0;     //number of times player upgraded pickaxe
global.oxygenTankUpgradeCount = 0;  //# of times oxygen tank was upgraded
global.heartUpgradeCount = 0;       //# of times hearts were upgraded
global.lanternUpgradeCount = 0;     
global.closeCallCount = 0;          //# of times a "Close Call" was achieved
global.floorsCompletelyCleared = 0; //# of times the player removed all rocks in a level

/*** Particle setup ***/

global.particleSystem = part_system_create();

//particles for when rock is destroyed
global.dirtPart = part_type_create();
var dirtColor = make_color_rgb(102, 51, 0);
part_type_shape(global.dirtPart, pt_shape_pixel);
part_type_size(global.dirtPart, 1, 3, 0, 0);
part_type_scale(global.dirtPart, 1, 1);
part_type_color1(global.dirtPart, dirtColor);
part_type_direction(global.dirtPart, 0, 359, 0, 10);
part_type_speed(global.dirtPart, 1, 3, 0, 0);
part_type_gravity(global.dirtPart, 0.2, 270);
part_type_life(global.dirtPart, 15, 30);

//sparks for when player hits an object
global.sparkPart = part_type_create();
var sparkColor = make_color_rgb(255, 255, 0);
part_type_shape(global.sparkPart, pt_shape_pixel);
part_type_size(global.sparkPart, 1, 2, 0, 0);
part_type_scale(global.sparkPart, 1, 1);
part_type_color1(global.sparkPart, sparkColor);
part_type_direction(global.sparkPart, 0, 359, 0, 10);
part_type_speed(global.sparkPart, 6, 8, 0, 0);
part_type_life(global.sparkPart, 8, 15);

//Player Customization
global.avatarOptions[0, 0] = naked_mole_male;
global.avatarOptions[0, 1] = construction_mole_male;
global.avatarOptions[0, 2] = denim_mole_male;
global.avatarOptions[0, 3] = polkadot_mole_male;
global.avatarOptions[1, 0] = naked_mole_female;
global.avatarOptions[1, 1] = construction_mole_female;
global.avatarOptions[1, 2] = denim_mole_female;
global.avatarOptions[1, 3] = polkadot_mole_female;

global.avatarOptions[2, 0] = naked_slug_male;
global.avatarOptions[2, 1] = construction_slug_male;
global.avatarOptions[2, 2] = denim_slug_male;
global.avatarOptions[2, 3] = polkadot_slug_male;
global.avatarOptions[3, 0] = naked_slug_female;
global.avatarOptions[3, 1] = construction_slug_female;
global.avatarOptions[3, 2] = denim_slug_female;
global.avatarOptions[3, 3] = polkadot_slug_female;

global.avatarChoice = 0;
global.costumeChoice = 1;

//Movement Directions
global.upLeft               =   0;
global.up                   =   1;
global.upRight              =   2;
global.left                 =   3;
global.downLeft             =   4;
global.down                 =   5;
global.downRight            =   6;
global.right                =   7;
global.spritesPerDirection  =   3;


//Gems
global.QUARTZ = 0;
global.AMETHYST = 1;
global.NEPHRITE = 2;

global.AMBER = 3;
global.KYANITE = 4;
global.LODESTONE = 5;

global.XIFENGITE = 6;
global.ZIRCON = 7;
global.TREVORITE = 8;

global.HELLYERITE = 9;
global.OPAL = 10;
global.PETALITE = 11;

global.SCOLECITE = 12;
global.LABRADORITE = 13;
global.RUBY = 14;

global.MALACHITE = 15;
global.LAPISLAZULI = 16;
global.EMERALD = 17;

global.TOURMALINE = 18;
global.OBSIDIAN = 19;
global.SAPPHIRE = 20;

global.SUGILITE = 21;
global.AGATE = 22;
global.LARIMAR = 23;

global.VIVIANITE = 24;
global.WILLEMITE = 25;
global.PEARL = 26;

global.ALEXANDRITE = 27;
global.PLATINUM = 28;
global.DIAMOND = 29;
