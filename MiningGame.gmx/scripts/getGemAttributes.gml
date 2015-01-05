var name = "";
var cashValue = 0;
var gemSprite = blankTile;

var gemNumber = 1;
switch(gemNumber){
    case 1:
        name = "Quartz"
        cashValue = floor(50 * global.valueMod);
        gemSprite = quartz;
    break;
    case 2:
    break;
    case 3:
    break;
    default:
        name = "No Gem"
        cashValue = 666;
        gemSprite = blankTile;
    break;
}

atributes[0] = name;
attributes[1] = cashValue;
attributes[2] = gemSprite;

return attributes;
