/* This script returns a random value based on the tier. The value is a rock's hit points. The higher the tier, the more likely
 a rock will have high HP. */

var hp = 0;
switch (global.tier)
{
    case 1:
        var chance = random(1);
        if (chance <= 0.125)
            hp = 4;      
        else if (chance <= 0.3)
            hp = 3;
        else
            hp = floor(random_range(1, 3));       
        break;
        
    case 2:
        var chance = random(1);
        if (chance <= 0.3)
            hp = 4;
        else 
            hp = floor(random_range(1, 4));       
        break;
        
    case 3:
        hp = floor(random_range(1, 5));       
        break;
        
    case 4:
        var chance = random(1);
        if (chance <= 0.3)
            hp = floor(random_range(4, 7));
        else
            hp = floor(random_range(1, 6));       
        break;
        
    case 5:
        hp = floor(random_range(2, 7));
        break;
        
    case 6:
        var chance = random(1);
        if (chance <= 0.125)
            hp = 10;
        else
            hp = floor(random_range(2, 8));
        break;
        
    case 7:
        hp = floor(random_range(3, 9));
        break;
        
    case 8:
        hp = floor(random_range(3, 11));
        break;
        
    case 9:
        hp = floor(random_range(4, 13));
        break;
        
    case 10:
        var chance = random(1);
        if (chance <= 0.05)
            hp = 25;
        else if (chance <= 0.2)
            hp = 20;
        else
            hp = floor(random_range(5, 16));
        break;
}

return hp;