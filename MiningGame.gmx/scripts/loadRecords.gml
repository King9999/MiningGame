var recordFile = working_directory + "records.ini";
ini_open(recordFile);

global.floorsCleared = ini_read_real("Records", "floorsCleared", 0);
global.totalDistance = ini_read_real("Records", "totalDistance", 0);
global.totalCash = ini_read_real("Records", "totalCashLifetime", 0);
global.cashSpent = ini_read_real("Records", "totalCashSpent", 0);
global.enemiesKilled = ini_read_real("Records", "enemiesDefeated", 0);
global.totalHeartsLost = ini_read_real("Records", "heartsLost", 0);
global.bonusStageCount = ini_read_real("Records", "bonusStageCount", 0);
global.pickaxeUpgradeCount = ini_read_real("Records", "pickaxeUpgrades", 0);
global.oxygenTankUpgradeCount = ini_read_real("Records", "tankUpgrades", 0);
global.heartUpgradeCount = ini_read_real("Records", "heartUpgrades", 0);
global.lanternUpgradeCount = ini_read_real("Records", "lanternUpgrades", 0);   
global.closeCallCount = ini_read_real("Records", "closeCalls", 0);
global.floorsCompletelyCleared = ini_read_real("Records", "completeClearCount", 0);
global.musicEnabled = ini_read_real("Sound", "musicEnabled", true);
global.sfxEnabled = ini_read_real("Sound", "sfxEnabled", true);

ini_close();
