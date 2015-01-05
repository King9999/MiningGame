/* This script contains a table of all the minerals that can drop.  In each tier, there are two common minerals and
one rare mineral.  For simplicity, the drop rates are the same for each mineral. See the GDD for mineral values and rarity.

If a rare drop occurs, it takes precedence over common drops.

argument0 = x location of where to generate a mineral
argument1 = y location of where to generate a mineral

*/

//randomize();

/*TODO: Change this so that conditions for minerals dropping changes for bonus stages. In a bonus stage, a mineral is
guaranteed to drop. */
var chance = random(1);
var charmBonus = 0;
rareMineralDropped = false;
commonMineralDropped = false;
var mineralFound = false;
var gemNumber = 0;
var gemName = "";
var gemCashValue = 0;
var gemSprite = blankTile;

if (global.charmEnabled){
    charmBonus = random_range(0.02, 1);
}

if (!global.onBonusStage){
    if (chance <= 0.02 * global.dropRateMod + charmBonus){
        rareMineralDropped = true;
    }
    else if (chance <= 0.5 * global.dropRateMod + charmBonus){
        commonMineralDropped = true;
    }
    
    //rareMineralDropped = true;
    
    if (rareMineralDropped) {
        var randomTier = floor(random_range(1, global.tier + 1));
        
        switch(randomTier){
            case 1:               
                gemNumber = global.NEPHRITE;       
                break;
                
            case 2:
                gemNumber = global.LODESTONE;
                break;
                
            case 3:
                gemNumber = global.TREVORITE;
                break;
                
            case 4:
                gemNumber = global.PETALITE;
                break;
                
            case 5:
                gemNumber = global.RUBY;
                break;
            
            case 6:
                gemNumber = global.EMERALD;
                break;
                
            case 7:
                gemNumber = global.SAPPHIRE;
                break; 
                
            case 8:
                gemNumber = global.LARIMAR;
                break; 
                
            case 9:
                gemNumber = global.PEARL
                break; 
            
            case 10:
                gemNumber = global.DIAMOND;
                break;     
        }
    }
    else if (commonMineralDropped){
        var randomTier = floor(random_range(1, global.tier + 1));
        var dropChance = random(1);
        
        switch(randomTier){
            case 1: 
                mineralFound = true;          
                if (dropChance <= 0.3)           
                    gemNumber = global.AMETHYST;
                else           
                    gemNumber = global.QUARTZ    
                break;
                
            case 2:
                if (dropChance <= 0.3)           
                    gemNumber = global.KYANITE;
                else  
                    gemNumber = global.AMBER;         
                break;
                
            case 3:
                if (dropChance <= 0.3) 
                    gemNumber = global.ZIRCON;          
                else           
                    gemNumber = global.XIFENGITE;
                break;
                
            case 4:
                if (dropChance <= 0.3)     
                    gemNumber = global.OPAL;      
                else         
                    gemNumber = global.HELLYERITE;
                break;
                
            case 5:
                if (dropChance <= 0.3)    
                    gemNumber = global.LABRADORITE;
                else           
                    gemNumber = global.SCOLECITE;
                break;
            
            case 6:
                if (dropChance <= 0.3)       
                    gemNumber = global.LAPISLAZULI;    
                else         
                    gemNumber = global.MALACHITE;  
                break;
                
            case 7:
                if (dropChance <= 0.3)   
                    gemNumber = global.OBSIDIAN;        
                else           
                    gemNumber = global.TOURMALINE;
                break; 
                
            case 8:
                if (dropChance <= 0.3)    
                    gemNumber = global.AGATE;       
                else           
                    gemNumber = global.SUGILITE;
                break; 
                
            case 9:
                if (dropChance <= 0.3)           
                    gemNumber = global.WILLEMITE;
                else           
                    gemNumber = global.VIVIANITE;
                break; 
            
            case 10:
                if (dropChance <= 0.3)  
                    gemNumber = global.PLATINUM;    
                else           
                    gemNumber = global.ALEXANDRITE;
                break;     
        }
    }
}
else{
    //on a bonus stage. change condition so that a mineral drops for sure. what gets dropped is still determined by chance.
     var randomTier = floor(random_range(1, global.tier + 1));
     var dropChance = random(1);
        
    switch(randomTier){
        case 1:
            if (dropChance <= 0.1)      
                gemNumber = global.NEPHRITE;        
            else if (dropChance <= 0.4)
                gemNumber = global.AMETHYST;
            else           
                gemNumber = global.QUARTZ;                   
            break;
            
        case 2:
            if (dropChance <= 0.1)
                gemNumber = global.LODESTONE;
            else if (dropChance <= 0.4)        
                gemNumber = global.KYANITE;   
            else           
                gemNumber = global.AMBER;
            break;
            
        case 3:
            if (dropChance <= 0.1)
                gemNumber = global.TREVORITE;
            else if (dropChance <= 0.4)          
                gemNumber = global.ZIRCON; 
            else           
                gemNumber = global.XIFENGITE;   
            break;
            
        case 4:
            if (dropChance <= 0.1)
                gemNumber = global.PETALITE;
            else if (dropChance <= 0.4)     
                gemNumber = global.OPAL;      
            else           
                gemNumber = global.HELLYERITE;
            break;
            
        case 5:
            if (dropChance <= 0.1)
                gemNumber = global.RUBY;
            else if (dropChance <= 0.4)       
                gemNumber = global.LABRADORITE;    
            else           
                gemNumber = global.SCOLECITE;   
            break;
        
        case 6:
            if (dropChance <= 0.1)
                gemNumber = global.EMERALD;
            else if (dropChance <= 0.4)           
                gemNumber = global.LAPISLAZULI;
            else           
                gemNumber = global.MALACHITE;
            break;
            
        case 7:
            if (dropChance <= 0.1)
                gemNumber = global.SAPPHIRE;
            else if (dropChance <= 0.4)         
                gemNumber = global.OBSIDIAN;  
            else           
                gemNumber = global.TOURMALINE;
            break; 
            
        case 8:
            if (dropChance <= 0.1)
                gemNumber = global.LARIMAR;
            else if (dropChance <= 0.4)           
                gemNumber = global.AGATE;
            else           
                gemNumber = global.SUGILITE;
            break; 
            
        case 9:
            if (dropChance <= 0.1)
                gemNumber = global.PEARL;
            else if (dropChance <= 0.4)        
                gemNumber = global.WILLEMITE;  
            else           
                gemNumber = global.VIVIANITE;   
            break; 
        
        case 10:
            if (dropChance <= 0.1)
                gemNumber = global.DIAMOND;
            else if (dropChance <= 0.4)        
                gemNumber = global.PLATINUM;   
            else           
                gemNumber = global.ALEXANDRITE;
            break;
    }     
}

if(mineralFound == true){  
    switch(gemNumber){
        case 0:
            gemName = "Quartz";
            gemCashValue =  floor(50 * global.valueMod);
            gemSprite = quartz; 
            break;
        case 1:
            gemName = "Amethyst";
            gemCashValue = floor(60 * global.valueMod);
            gemSprite = amethyst;
            break;
        case 2:
            gemName = "Nephrite";
            gemCashValue = floor(200 * global.valueMod);
            gemSprite = nephrite;
            break;
        case 3:
            gemName = "Amber";
            gemCashValue = floor(80 * global.valueMod);
            gemSprite = amber;
            break;  
        case 4:
            gemName = "Kyanite";
            gemCashValue = floor(130 * global.valueMod);
            gemSprite = kyanite;
            break;  
        case 5:
            gemName = "Lodestone";
            gemCashValue = floor(600 * global.valueMod);
            gemSprite = lodestone;
            break;
        case 6:
            gemName = "Xifengite";
            gemCashValue = floor(110 * global.valueMod);
            gemSprite = xifengite;
            break;
        case 7:
            gemName = "Zircon";
            gemCashValue = floor(140 * global.valueMod);
            gemSprite = zircon;
            break;
        case 8:
            gemName = "Trevorite";
            gemCashValue = floor(1500 * global.valueMod);
            gemSprite = trevorite;
            break;
        case 9:
            gemName = "Hellyerite";
            gemCashValue = floor(150 * global.valueMod);
            gemSprite = hellyerite;
            break;
        case 10:
            gemName = "Opal";
            gemCashValue = floor(200 * global.valueMod);
            gemSprite = opal;
            break;
        case 11:
            gemName = "Petalite";
            gemCashValue = floor(2650 * global.valueMod);
            gemSprite = petalite;
            break;
        case 12:
            gemName = "Scolecite";
            gemCashValue = floor(2650 * global.valueMod);
            gemSprite = scolecite;
            break;
        case 13:
            gemName = "Labradorite";
            gemCashValue = floor(300 * global.valueMod);
            gemSprite = labradorite;
            break;
        case 14:
            gemName = "Ruby";
            gemCashValue = floor(4800 * global.valueMod);
            gemSprite = ruby;
            break;
        case 15:
            gemName = "Malachite";
            gemCashValue = floor(340 * global.valueMod);
            gemSprite = malachite;
            break;
        case 16:
            gemName = "Lapis Lazuli";
            gemCashValue = floor(400 * global.valueMod);
            gemSprite = lapis;
            break;
        case 17:
            gemName = "Emerald";
            gemCashValue = floor(400 * global.valueMod);
            gemSprite = emerald;
            break;
        case 18:
            gemName = "Tourmaline";
            gemCashValue = floor(500 * global.valueMod);
            gemSprite = tourmaline;
            break;
        case 19:
            gemName = "Obsidian";
            gemCashValue = floor(600 * global.valueMod);
            gemSprite = obsidian;
            break;
        case 20:
            gemName = "Sapphire";
            gemCashValue = floor(8500 * global.valueMod);
            gemSprite = sapphire;
            break;
        case 21:
            gemName = "Sugilite";
            gemCashValue = floor(660 * global.valueMod);
            gemSprite = sugilite;
            break;
        case 22:
            gemName = "Agate";
            gemCashValue = floor(720 * global.valueMod);
            gemSprite = agate;
            break;
        case 23:
            gemName = "Larimar";
            gemCashValue = floor(11000 * global.valueMod);
            gemSprite = larimar;
            break;
        case 24:
            gemName = "Vivianite";
            gemCashValue = floor(830 * global.valueMod);
            gemSprite = vivianite;
            break;
        case 25:
            gemName = "Willemite";
            gemCashValue = floor(900 * global.valueMod);
            gemSprite = willemite;
            break;
        case 26:
            gemName = "Pearl";
            gemCashValue = floor(20000 * global.valueMod);
            gemSprite = pearl;
            break;
        case 27:
            gemName = "Alexandrite";
            gemCashValue = floor(1200 * global.valueMod);
            gemSprite = alexandrite;
            break;
        case 28:
            gemName = "Platinum";
            gemCashValue = floor(1600 * global.valueMod);
            gemSprite = platinum;
            break;
        case 29:
            gemName = "Diamond";
            gemCashValue = floor(50000 * global.valueMod);
            gemSprite = diamond;
            break;
    }
    newGem = instance_create(argument0, argument1, mineralObj);
    newGem.gemNumber = gemNumber;
    newGem.name = gemName;
    newGem.cashValue = gemCashValue;
    newGem.gemSprite = gemSprite;
}