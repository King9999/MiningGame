var file = working_directory + "collection.ini";
var mineralFound = false;

ini_open(file);

mineralFound = ini_read_real("Minerals", argument0, false);

ini_close();

return mineralFound;
