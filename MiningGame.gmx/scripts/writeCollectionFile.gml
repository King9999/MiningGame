//argument0 = name of mineral
//argument1 = boolean. false = locked, true = unlocked in collections.

var file = working_directory + "collection.ini";

ini_open(file);

ini_write_real("Minerals", argument0, argument1);

ini_close();
