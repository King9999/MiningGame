//updates the total cash accumulated after a run is over. Also converts cash to miner coins.

global.totalCash += global.currentTotalCash;

var coins = floor((global.currentTotalCash * 0.01) / 2);

global.minerCoins += coins;
script_execute(writeCoinsToFile);

var recordFile = working_directory + "records.ini";
ini_open(recordFile);
ini_write_real("Records", "totalCashLifetime", global.totalCash);
ini_close();
