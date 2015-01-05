/* This script displays dialogue for the shopkeeper. He says different things depending on whether a level mod is to be generated.
Even if there's no mod, he will say something. He can provide info on items' effects & upgrade benefits. If a level mod is generated,
the shopkeeper will provide a hint on what the player should be buying to prepare for the coming level. There will be up to three hints
per level mod. 

The script takes one argument:
argument0 = the level mod number. corresponds to the values in the checkLevelMod script. 

*/

var dialogue = "";

switch(argument0)
{
    case 0:     //general dialogue, i.e. no level mods
        var num = floor(random(5)) + 1;
        
        switch(num)
        {
            case 1:
                dialogue = "Test message 1";
                break;
            case 2:
                dialogue = "Test message 2";
                break;
            case 3:
                dialogue = "Test message 3";
                break;
            case 4:
                dialogue = "Test message 4";
                break;
            case 5:
                dialogue = "Test message 5"; 
                break;          
        }
        break;
    
    case 1: //brittle rocks mod
        var num = floor(random(3)) + 1;
        
        switch(num)
        {
            case 1:
                dialogue = "Brittle rock hint 1";
                break;
            case 2:
                dialogue = "Brittle rock hint 2";
                break;
            case 3:
                dialogue = "Brittle rock hint 3";
                break;
        }
        break;
}

return dialogue;
