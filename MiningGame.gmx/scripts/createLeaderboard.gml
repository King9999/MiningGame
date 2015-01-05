var file = working_directory + "leaderboarddata.ini";

//create & initialize file
ini_open(file);

for (var i = 0; i < 10; i++)
{
    ini_write_real("LowestLevel", "rank" + string(i + 1), 1);   //lowest floor reached
    ini_write_real("TotalCash", "rank" + string(i + 1), 1000);
}


ini_close();
