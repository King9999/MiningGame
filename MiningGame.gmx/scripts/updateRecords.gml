//this script will only update when necessary.

var recordFile = working_directory + "records.ini";
ini_open(recordFile);

if (global.floorsCleared < global.level)
{
    //new record
    global.floorsCleared = global.level;
    ini_write_real("Records", "floorsCleared", global.floorsCleared);
}

ini_write_real("Records", "totalDistance", global.totalDistance);
ini_write_real("Records", "totalCashLifetime", global.totalCash);
ini_write_real("Records", "totalCashSpent", global.cashSpent);
ini_write_real("Records", "enemiesDefeated", global.enemiesKilled);
ini_write_real("Records", "heartsLost", global.totalHeartsLost);
ini_write_real("Records", "bonusStageCount", global.bonusStageCount);
ini_write_real("Records", "pickaxeUpgrades", global.pickaxeUpgradeCount);
ini_write_real("Records", "tankUpgrades", global.oxygenTankUpgradeCount);
ini_write_real("Records", "heartUpgrades", global.heartUpgradeCount);
ini_write_real("Records", "lanternUpgrades", global.lanternUpgradeCount);
ini_write_real("Records", "closeCalls", global.closeCallCount);
ini_write_real("Records", "completeClearCount", global.floorsCompletelyCleared);
ini_write_real("Sound", "musicEnabled", global.musicEnabled);
ini_write_real("Sound", "sfxEnabled", global.sfxEnabled);

ini_close();
