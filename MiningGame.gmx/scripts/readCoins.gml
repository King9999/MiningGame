//read amount of miner coins from file.  Should be read from a server depending on whether
//player can use real money to buy coins.

var fileName = working_directory + "coins.ini";
ini_open(fileName);
global.minerCoins = ini_read_real("Coins", "total", 0);
ini_close();
