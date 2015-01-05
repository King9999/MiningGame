//writes amount of miner coins to file.  Should be written to a server depending on whether
//player can use real money to buy coins.

var fileName = working_directory + "coins.ini";
ini_open(fileName);
ini_write_real("Coins", "total", global.minerCoins);
ini_close();
