/*
   ___                _    __                
  / __\  ___    ___  | |   \ \   __ _  _   _ 
 / /    / _ \  / _ \ | |    \ \ / _` || | | |
/ /___ | (_) || (_) || | /\_/ /| (_| || |_| |
\____/  \___/  \___/ |_| \___/  \__,_| \__, |
                                       |___/                                
*/
                                                 
//████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
//███                                                                                                                                                                                                                                
//███ 📖 Dependencies                                                                                                                                                                                                                       
//███                                                                                                                                                                                                                                    
//████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████

//Included GSC From Original Game Files To Be Referenced Within This Script
#include common_scripts/utility;
#include maps/mp/_utility;
#include maps/mp/_scoreevents;
#include maps/mp/teams/_teams;
#include maps/mp/gametypes/_rank;
#include maps/mp/gametypes/_hud;
#include maps/mp/gametypes/_hud_util;
#include maps/mp/gametypes/_hud_message;
#include maps/mp/gametypes/_globallogic_ui;
#include maps/mp/gametypes/_globallogic_score;
#include maps/mp/gametypes/_globallogic_utils;
#include maps/mp/gametypes/_spawnlogic;
#include maps/mp/gametypes/_spawning;
#include maps/mp/gametypes/_weapons;
#include maps/mp/gametypes/_class;
#include maps/mp/killstreaks/_killstreaks;
#include maps/mp/killstreaks/_killstreakrules;
#include maps/mp/killstreaks/_turret_killstreak;


//████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
//███ ╔═══╗                                                                                                                                                                                                                                    
//███ ║ ► ║ Script Start                                                                                                                                                                                                                          
//███ ╚═══╝                                                                                                                                                                                                                                   
//████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████

Init(){

    level.endGameVar = "endgame";
    level.firstDropWeaponMenu = true;

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Times (Seconds)                                                                                   
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.infectiontime  = 15;
    level.difficultyrate = 6;
    level.bonusrate = 300;
    level.doorrepairtime = 30;
    level.structurebuildtime = 0.5;
    level.playerelevatorspeed = 2;
    level.playerelevatorwaittime = 3;
    level.playerdoorspeed = 1.5;
    level.supplydropopentime = 2;
    level.supplieshelicopterrate = 600;

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Points                                                                                  
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.pointsmultiplier = 1;
    level.itemsellbackdivider = 2;
    level.humanstartingpoints = 0;
    level.humanpointsperlethalmelee = 130;
    level.humanpointsperlethalheadshot = 100;
    level.humanpointsperlethalprojectile = 60;
    level.humanpointsperlethalexplosive = 50;
    level.humanpointspernonlethalhit = 10;
    level.humanpointsperdoorrepair = 100;
    level.humanpointssurviorbonus = 100;
    level.zombiestartingpoints = 0;
    level.zombiepointsperkill = 100;
    level.zombiepointspernonlethalhit = 10;
    level.zombiepointsperdeath = 20;
    level.zombiepointsperstructuredamage = 5;

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Health                                                                                  
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.humanstartinghealth = 300;
    level.zombiesstartinghealth = 100;
    level.defenseshealth = 1500;
    level.buildingblockhealth = 5000;
    level.playerdoorhealth = 7500;
    level.guarddoghealth = 3000;
    level.agrhealth = 5000;

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Damage                                                                                 
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.damagemultiplier = 1;
    level.commonweapondamagemultiplier = 1;
    level.uncommonweapondamagemultiplier = 1.2;
    level.rareweapondamagemultiplier = 1.4;
    level.epicweapondamagemultiplier = 1.6;
    level.legendaryweapondamagemultiplier = 1.8;
    level.upgradedweapondamagemultiplier = 2;
    level.guarddogdamage = 300;

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Items                                                                                  
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.commonitemrarity = 70.375; //Chance out of 100
    level.uncommonitemrarity = 15.375; //Chance out of 100
    level.rareitemrarity = 7.875; //Chance out of 100
    level.epicitemrarity = 4.125; //Chance out of 100
    level.legendaryitemrarity = 2.25; //Chance out of 100

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Weapons                                                                                
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.upgradedweaponclippercentagemultiplier = 70;
    level.upgradedweaponstockmultiplier = 2;

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Power-Ups                                                                                
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.powerupdropchancepercentage = 10;
    level.instakillduration = 30;
    level.doublepointsduration = 30;
    level.humanpointspernuke = 400;
    level.firesaleprice = 10;
    level.firesaleduration = 30;
    level.zombiebloodduration = 30;
    level.deathmachineduration = 30;
    level.poweruppickupduration = 25;

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Rewards                                                                                 
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.ninjameleedamage = 400;
    level.samuraimeleedamage = 1000;
    level.bankrollerpointsrefundpercentage = 20;
    level.financierpointsrefundpercentage = 50;
    level.apprenticecarpenterdoorhealthmultiplier = 2;
    level.masterbuilderdoorhealthmultiplier = 3;
    level.apprenticecarpenterdoorrepairtimemultiplier = 2;
    level.masterbuilderdoorrepairtimemultiplier = 4;
    level.apprenticecarpenterstructurebuildtimemultiplier = 2;
    level.masterbuilderstructurebuildtimemultiplier = 3;

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Limits                                                                                
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.inventoryitemlimit = 5;
    level.groundlootitemlimit = 10;
    level.defenseslimit = 20;
    level.scriptmodellimit = 1000;
    level.teamlimit = 18;

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Game                                                                               
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.dynamicmenubackground = true;
    level.buildingblockmodel = "t6_wpn_supply_drop_trap";
    level.buildingblockplaceholdermodel = "t6_wpn_supply_drop_detect";
    level.mysteryboxitems = StrTok("fiveseven_mp,fnp45_mp,beretta93r_mp,judge_mp,kard_mp,mp7_mp,pdw57_mp,vector_mp,insas_mp,qcw05_mp,evoskorpion_mp,peacekeeper_mp,tar21_mp,type95_mp,sig556_mp,sa58_mp,hk416_mp,scar_mp,saritch_mp,xm8_mp,an94_mp,870mcs_mp,saiga12_mp,ksg_mp,srm1216_mp,mk48_mp,qbb95_mp,lsat_mp,hamr_mp,svu_mp,dsr50_mp,ballista_mp,as50_mp,smaw_mp,usrpg_mp,m32_wager_mp,knife_ballistic_mp,crossbow_mp", ",");
    level.itempickuprange = 1; //(Meters)
    level.interactableuserange = 1; //(Meters)
    level.supplydropitemamount = 3;

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Players                                                                                
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.humanspeed = 1;
    level.zombiespeed = 1;
    level.kicksplitscreenplayers = false;
    level.acabeShader = 0;

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Random Zombie                                                                                 
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.startingzombiecount = 1;
    level.hostcanbecomezombie = false;

    //After Loading Screen

	ItemPrices();
    level thread ClearStrings();
    level thread Precaches();
    level thread GameConfiguration();
    level thread GameHuds();
    level thread GameProgression();
    level thread GameSettingsMonitor();
    level thread PlayerConnect();
   

    //Wait Until Player Connects

   	level waittill("connected", player);
    level thread OverflowFix();

    //End's The Game If Game Mode Is Not Team Deathmatch

    if (GetDvar("g_gametype") != "tdm"){
    	level thread EndTheGame("tie", "Game Mode Must Be ^1Team Deathmatch");
    }
    
    level waittill("prematch_over");
    level thread GameMonitor();
   
    

}    

clearStrings()
{
	level.scoreinfo = [];
	level.xpscale = getDvarFloat( "scr_xpscale" );
	level.codpointsxpscale = getDvarFloat( "scr_codpointsxpscale" );
	level.codpointsmatchscale = getDvarFloat( "scr_codpointsmatchscale" );
	level.codpointschallengescale = getDvarFloat( "scr_codpointsperchallenge" );
	level.clearstrings = getDvarInt( "scr_rankXpCap" );
	level.codpointscap = getDvarInt( "scr_codPointsCap" );
	level.usingmomentum = 1;
	level.usingscorestreaks = getDvarInt( "scr_scorestreaks" ) != 0;
	level.scorestreaksmaxstacking = getDvarInt( "scr_scorestreaks_maxstacking" );
	level.maxinventoryscorestreaks = getdvarintdefault( "scr_maxinventory_scorestreaks", 3 );

	if ( isDefined( level.usingscorestreaks ) )
	{
		level.usingrampage = !level.usingscorestreaks;
	}

	level.rampagebonusscale = getDvarFloat( "scr_rampagebonusscale" );
	level.ranktable = [];
	precacheshader( "white" );

	if ( !sessionmodeiszombiesgame() )
	{
		initscoreinfo();
	}

	level.maxrank = int( tablelookup( "mp\rankTable.csv", 0, "maxrank", 1 ) );
	level.maxprestige = int( tablelookup( "mp\rankIconTable.csv", 0, "maxprestige", 1 ) );
	pid = 0;
	rid = 0;
	pid = 0;

	while ( pid <= level.maxprestige )
	{
		rid = 0;
		while ( rid <= level.maxrank )
		{
			precacheshader( tablelookup( "mp\rankIconTable.csv", 0, rid, pid + 1 ) );
			rid++;
		}
		pid++;
	}

	rankid = 0;
	rankname = TableLookUp("mp\ranktable.csv", 0, rankid, 1);

	while ( isDefined( rankname ) && rankname != "" )
	{
		level.ranktable[rankid][1] = TableLookUp("mp\ranktable.csv", 0, rankid, 1);
        level.ranktable[rankid][2] = TableLookUp("mp\ranktable.csv", 0, rankid, 2);
        level.ranktable[rankid][3] = TableLookUp("mp\ranktable.csv", 0, rankid, 3);
        level.ranktable[rankid][7] = TableLookUp("mp\ranktable.csv", 0, rankid, 7);
        level.ranktable[rankid][14] = TableLookUp("mp\ranktable.csv", 0, rankid, 14);
        rankid++;
        rankname = TableLookUp("mp\ranktable.csv", 0, rankid, 1);
	}
	
	level thread clearstringsonplayerconnect();
}

initScoreInfo()
{
	scoreinfotableid = getscoreeventtableid();

	if ( !isDefined( scoreinfotableid ) )
	{
		return;
	}

	scorecolumn = getscoreeventcolumn( level.gametype );
	xpcolumn = getxpeventcolumn( level.gametype );

	if ( scorecolumn < 0 )
	{
		return;
	}

	if ( xpcolumn < 0 )
	{
		return;
	}

	row = 1;

	while ( row < 512 )
	{
		type = tablelookupcolumnforrow( scoreinfotableid, row, 0 );

		if ( type != "" )
		{
			labelstring = tablelookupcolumnforrow( scoreinfotableid, row, 1 );
			label = undefined;

			if ( labelstring != "" )
			{
				label = tablelookupistring( scoreinfotableid, 0, type, 1 );
			}

			scorevalue = int( tablelookupcolumnforrow( scoreinfotableid, row, scorecolumn ) );
			registerscoreinfo( type, scorevalue, label );

			if ( maps\mp\_utility::getroundsplayed() == 0 )
			{
				xpvalue = float( tablelookupcolumnforrow( scoreinfotableid, row, xpcolumn ) );
				setddlstat = tablelookupcolumnforrow( scoreinfotableid, row, 5 );
				addplayerstat = 0;

				if ( setddlstat == "TRUE" )
				{
					addplayerstat = 1;
				}

				ismedal = 0;
				istring = tablelookupistring( scoreinfotableid, 0, type, 2 );

				if ( isDefined( istring ) && istring != &"" )
				{
					ismedal = 1;
				}

				demobookmarkpriority = int( tablelookupcolumnforrow( scoreinfotableid, row, 6 ) );
                
				if ( !isDefined( demobookmarkpriority ) )
				{
					demobookmarkpriority = 0;
				}

				registerxp( type, xpvalue, addplayerstat, ismedal, demobookmarkpriority, row );
			}

			allowkillstreakweapons = tablelookupcolumnforrow( scoreinfotableid, row, 4 );

			if ( allowkillstreakweapons == "TRUE" )
			{
				level.scoreinfo[ type ][ "allowKillstreakWeapons" ] = 1;
			}
		}

		row++;
	}
}

getRankXPCapped(inrankxp)
{
    if (IsDefined(level.clearstrings) && level.clearstrings && level.clearstrings <= inrankxp){
        return level.clearstrings;
    }

    return inrankxp;    
}    

getCodPointScapped( incodpoints )
{
	if ( isDefined( level.codpointscap ) && level.codpointscap && level.codpointscap <= incodpoints )
	{
		return level.codpointscap;
	}

	return incodpoints;
}

registerScoreInfo( type, value, label )
{
	overridedvar = "scr_" + level.gametype + "_score_" + type;

	if ( getDvar( overridedvar ) != "" )
	{
		value = getDvarInt( overridedvar );
	}

	if ( type == "kill" )
	{
		multiplier = getgametypesetting( "killEventScoreMultiplier" );
		level.scoreinfo[ type ][ "value" ] = int( ( multiplier + 1 ) * value );
	}

	else
	{
		level.scoreinfo[ type ][ "value" ] = value;
	}

	if ( isDefined( label ) )
	{
		precachestring( &"MP_PLUS" );
		level.scoreinfo[ type ][ "label" ] = &"MP_PLUS";
		level.scoreinfo[ type ][ "label" ] = &"";
	}
}

getScoreInfoValue( type )
{
	if ( isDefined( level.scoreinfo[ type ] ) )
	{
		return level.scoreinfo[ type ][ "value" ];
	}
}

getScoreInfoLabel( type )
{
	return level.scoreinfo[ type ][ "label" ];
}

killStreakWeaponsAllowedScore( type )
{
	if ( isDefined( level.scoreinfo[ type ][ "allowKillstreakWeapons" ] ) && level.scoreinfo[ type ][ "allowKillstreakWeapons" ] == 1 )
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

doesscoreinfocounttowardrampage( type )
{
	if ( isDefined( level.scoreinfo[ type ][ "rampage" ] ) )
	{
		return level.scoreinfo[ type ][ "rampage" ];
	}
}

getrankinfominxp( rankid )
{
	return int( level.ranktable[ rankid ][ 2 ] );
}

getrankinfoxpamt( rankid )
{
	return int( level.ranktable[ rankid ][ 3 ] );
}

getrankinfomaxxp( rankid )
{
	return int( level.ranktable[ rankid ][ 7 ] );
}

getrankinfofull( rankid )
{
	return tablelookupistring( "mp\ranktable.csv", 0, rankid, 16 );
}

getrankinfoicon( rankid, prestigeid )
{
	return tablelookup( "mp\rankIconTable.csv", 0, rankid, prestigeid + 1 );
}

getrankinfolevel( rankid )
{
	return int( tablelookup( "mp\ranktable.csv", 0, rankid, 13 ) );
}

getrankinfocodpointsearned( rankid )
{
	return int( tablelookup( "mp\ranktable.csv", 0, rankid, 17 ) );
}

shouldkickbyrank()
{
	if ( self ishost() )
	{
		return 0;
	}
	if ( level.rankcap > 0 && self.pers[ "rank" ] > level.rankcap )
	{
		return 1;
	}
	if ( level.rankcap > 0 && level.minprestige == 0 && self.pers[ "plevel" ] > 0 )
	{
		return 1;
	}
	if ( level.minprestige > self.pers[ "plevel" ] )
	{
		return 1;
	}
	return 0;
}

getcodpointsstat()
{
	codpoints = self getdstat( "playerstatslist", "CODPOINTS", "StatValue" );
	codpointscapped = getcodpointscapped( codpoints );
	if ( codpoints > codpointscapped )
	{
		self setcodpointsstat( codpointscapped );
	}
	return codpointscapped;
}

setcodpointsstat( codpoints )
{
	self setdstat( "PlayerStatsList", "CODPOINTS", "StatValue", getcodpointscapped( codpoints ) );
}

getrankxpstat()
{
	rankxp = self getdstat( "playerstatslist", "RANKXP", "StatValue" );
	rankxpcapped = getrankxpcapped( rankxp );
	if ( rankxp > rankxpcapped )
	{
		self setdstat( "playerstatslist", "RANKXP", "StatValue", rankxpcapped );
	}
	return rankxpcapped;
}

clearstringsonplayerconnect()
{
	for (;;)
	{
		level waittill( "connected", player );
		player.pers[ "rankxp" ] = player getrankxpstat();
		player.pers[ "codpoints" ] = player getcodpointsstat();
		player.pers[ "currencyspent" ] = player getdstat( "playerstatslist", "currencyspent", "StatValue" );
		rankid = player getrankforxp( player getrankxp() );
		player.pers[ "rank" ] = rankid;
		player.pers[ "plevel" ] = player getdstat( "playerstatslist", "PLEVEL", "StatValue" );
		
		if ( player shouldkickbyrank() )
		{
			kick( player getentitynumber() );
			continue;
		}
		else
		{
			if ( !isDefined( player.pers[ "participation" ] ) || level.gametype == "twar" && game[ "roundsplayed" ] >= 0 && player.pers[ "participation" ] >= 0 )
			{
				player.pers[ "participation" ] = 0;
			}

			player.rankupdatetotal = 0;
			player.cur_ranknum = rankid;
			prestige = player getdstat( "playerstatslist", "plevel", "StatValue" );
			player setrank( rankid, prestige );
			player.pers[ "prestige" ] = prestige;

			if ( !isDefined( player.pers[ "summary" ] ) )
			{
				player.pers[ "summary" ] = [];
				player.pers[ "summary" ][ "xp" ] = 0;
				player.pers[ "summary" ][ "score" ] = 0;
				player.pers[ "summary" ][ "challenge" ] = 0;
				player.pers[ "summary" ][ "match" ] = 0;
				player.pers[ "summary" ][ "misc" ] = 0;
				player.pers[ "summary" ][ "codpoints" ] = 0;
			}

			if ( !level.rankedmatch || level.wagermatch && level.leaguematch )
			{
				player setdstat( "AfterActionReportStats", "lobbyPopup", "none" );
			}

			if ( level.rankedmatch )
			{
				player setdstat( "playerstatslist", "rank", "StatValue", rankid );
				player setdstat( "playerstatslist", "minxp", "StatValue", getrankinfominxp( rankid ) );
				player setdstat( "playerstatslist", "maxxp", "StatValue", getrankinfomaxxp( rankid ) );
				player setdstat( "playerstatslist", "lastxp", "StatValue", getrankxpcapped( player.pers[ "rankxp" ] ) );
			}

			player.explosivekills[ 0 ] = 0;
			player thread clearstringsonplayerspawned();
			player thread clearstringsonjoinedteam();
			player thread clearstringsonjoinedspectators();
		}
	}
}

clearstringsonjoinedteam()
{
	self endon( "disconnect" );
	for (;;)
	{
		self waittill( "joined_team" );
		self thread removerankhud();
	}
}

clearstringsonjoinedspectators()
{
	self endon( "disconnect" );
	for (;;)
	{
		self waittill( "joined_spectators" );
		self thread removerankhud();
	}
}

inccodpoints( amount )
{
	if ( !isrankenabled() )
	{
		return;
	}

	if ( !level.rankedmatch )
	{
		return;
	}

	newcodpoints = getcodpointscapped( self.pers[ "codpoints" ] + amount );

	if ( newcodpoints > self.pers[ "codpoints" ] )
	{
		self.pers[ "summary" ][ "codpoints" ] += newcodpoints - self.pers[ "codpoints" ];
	}

	self.pers[ "codpoints" ] = newcodpoints;
	setcodpointsstat( int( newcodpoints ) );
}

atleastoneplayeroneachteam()
{
	foreach( team in level.teams )
	{
		if ( !level.playerCount[team] )
	    	return false;
	}

	return true; 
}

giverankxp( type, value, devadd )
{
	self endon( "disconnect" );

	if ( sessionmodeiszombiesgame() )
	{
		return;
	}

	if ( level.teambased && !atleastoneplayeroneachteam() && !isDefined( devadd ) )
	{
		return;
	}
	else
	{
		if ( !level.teambased && maps\mp\gametypes\_globallogic::totalplayercount() < 2 && !isDefined( devadd ) )
		{
			return;
		}
	}

	if ( !isrankenabled() )
	{
		return;
	}

	pixbeginevent( "giveRankXP" );

	if ( !isDefined( value ) )
	{
		value = getscoreinfovalue( type );
	}

	if ( level.rankedmatch )
	{
		bbprint( "mpplayerxp", "gametime %d, player %s, type %s, delta %d", getTime(), self.name, type, value );
	}

	switch( type )
	{
		case "assault": case "assault_assist": case "assist": case "assist_25": case "assist_50": case "assist_75": case "capture": case "defend": case "defuse": case "destroyer": case "dogassist": case "dogkill": case "headshot": case "helicopterassist": case "helicopterassist_25": case "helicopterassist_50": case "helicopterassist_75": case "helicopterkill": case "kill": case "medal": case "pickup": case "plant": case "rcbombdestroy": case "return": case "revive": case "spyplaneassist": case "spyplanekill": value = int( value * level.xpscale );
		break;
		default: if ( level.xpscale == 0 )
		{
			value = 0;
		}
		break;
	}

	xpincrease = self incrankxp( value );

	if ( level.rankedmatch )
	{
		self updaterank();
	}

	if ( value != 0 )
	{
		self syncxpstat();
	}

	if ( isDefined( self.enabletext ) && self.enabletext && !level.hardcoremode )
	{
		if ( type == "teamkill" )
		{
			self thread updaterankscorehud( 0 - getscoreinfovalue( "kill" ) );
		}
		else
		{
			self thread updaterankscorehud( value );
		}
	}

	switch( type )
	{
		case "assault": case "assist": case "assist_25": case "assist_50": case "assist_75": case "capture": case "defend": case "headshot": case "helicopterassist": case "helicopterassist_25": case "helicopterassist_50": case "helicopterassist_75": case "kill": case "medal": case "pickup": case "return": case "revive": case "suicide": case "teamkill": self.pers[ "summary" ][ "score" ] += value;
		inccodpoints( round_this_number( value * level.codpointsxpscale ) );
		break;
		case "loss": case "tie": case "win": self.pers[ "summary" ][ "match" ] += value;
		inccodpoints( round_this_number( value * level.codpointsmatchscale ) );
		break;
		case "challenge": self.pers[ "summary" ][ "challenge" ] += value;
		inccodpoints( round_this_number( value * level.codpointschallengescale ) );
		break;
		default: self.pers[ "summary" ][ "misc" ] += value;
		self.pers[ "summary" ][ "match" ] += value;
		inccodpoints( round_this_number( value * level.codpointsmatchscale ) );
		break;
	}

	self.pers[ "summary" ][ "xp" ] += xpincrease;
	pixendevent();
}

round_this_number( value )
{
	value = int( value + 0.5 );
	return value;
}

updaterank()
{
	newrankid = self getrank();

	if ( newrankid == self.pers[ "rank" ] )
	{
		return 0;
	}

	oldrank = self.pers[ "rank" ];
	rankid = self.pers[ "rank" ];
	self.pers[ "rank" ] = newrankid;

	while ( rankid <= newrankid )
	{
		self setdstat( "playerstatslist", "rank", "StatValue", rankid );
		self setdstat( "playerstatslist", "minxp", "StatValue", int( level.ranktable[ rankid ][ 2 ] ) );
		self setdstat( "playerstatslist", "maxxp", "StatValue", int( level.ranktable[ rankid ][ 7 ] ) );
		self.setpromotion = 1;

		if ( level.rankedmatch && level.gameended && !self issplitscreen() )
		{
			self setdstat( "AfterActionReportStats", "lobbyPopup", "promotion" );
		}

		if ( rankid != oldrank )
		{
			codpointsearnedforrank = getrankinfocodpointsearned( rankid );
			inccodpoints( codpointsearnedforrank );

			if ( !isDefined( self.pers[ "rankcp" ] ) )
			{
				self.pers[ "rankcp" ] = 0;
			}

			self.pers[ "rankcp" ] += codpointsearnedforrank;
		}

		rankid++;
	}

	self logstring( "promoted from " + oldrank + " to " + newrankid + " timeplayed: " + self getdstat( "playerstatslist", "time_played_total", "StatValue" ) );
	self setrank( newrankid );
	return 1;
}

codecallback_rankup( rank, prestige, unlocktokensadded )
{
	if ( rank > 8 )
	{
		self giveachievement( "MP_MISC_1" );
	}
	self luinotifyevent( &"rank_up", 3, rank, prestige, unlocktokensadded );
	self luinotifyeventtospectators( &"rank_up", 3, rank, prestige, unlocktokensadded );
}

getitemindex( refstring )
{
	itemindex = int( tablelookup( "mp\statstable.csv", 4, refstring, 0 ) );
	return itemindex;
}

endgameupdate()
{
	player = self;
}

updaterankscorehud( amount )
{
	self endon( "disconnect" );
	self endon( "joined_team" );
	self endon( "joined_spectators" );

	if ( isDefined( level.usingmomentum ) && level.usingmomentum )
	{
		return;
	}

	if ( amount == 0 )
	{
		return;
	}

	self notify( "update_score" );
	self endon( "update_score" );
	self.rankupdatetotal += amount;
	wait 0.05;

	if ( isDefined( self.hud_rankscroreupdate ) )
	{
		if ( self.rankupdatetotal < 0 )
		{
			self.hud_rankscroreupdate.label = &"";
			self.hud_rankscroreupdate.color = ( 0.73, 0.19, 0.19 );
		}
		else
		{
			self.hud_rankscroreupdate.label = &"MP_PLUS";
			self.hud_rankscroreupdate.color = ( 1, 1, 0.5 );
		}

		self.hud_rankscroreupdate setvalue( self.rankupdatetotal );
		self.hud_rankscroreupdate.alpha = 0.85;
		self.hud_rankscroreupdate thread maps\mp\gametypes\_hud::fontpulse( self );
		wait 1;
		self.hud_rankscroreupdate fadeovertime( 0.75 );
		self.hud_rankscroreupdate.alpha = 0;
		self.rankupdatetotal = 0;
	}
}

updatemomentumhud( amount, reason, reasonvalue )
{
	self endon( "disconnect" );
	self endon( "joined_team" );
	self endon( "joined_spectators" );

	if ( amount == 0 )
	{
		return;
	}

	self notify( "update_score" );
	self endon( "update_score" );
	self.rankupdatetotal += amount;

	if ( isDefined( self.hud_rankscroreupdate ) )
	{
		if ( self.rankupdatetotal < 0 )
		{
			self.hud_rankscroreupdate.label = &"";
			self.hud_rankscroreupdate.color = ( 0.73, 0.19, 0.19 );
		}
		else
		{
			self.hud_rankscroreupdate.label = &"MP_PLUS";
			self.hud_rankscroreupdate.color = ( 1, 1, 0.5 );
		}

		self.hud_rankscroreupdate setvalue( self.rankupdatetotal );
		self.hud_rankscroreupdate.alpha = 0.85;
		self.hud_rankscroreupdate thread maps\mp\gametypes\_hud::fontpulse( self );

		if ( isDefined( self.hud_momentumreason ) )
		{
			if ( isDefined( reason ) )
			{
				if ( isDefined( reasonvalue ) )
				{
					self.hud_momentumreason.label = reason;
					self.hud_momentumreason setvalue( reasonvalue );
				}
				else
				{
					self.hud_momentumreason.label = reason;
					self.hud_momentumreason setvalue( amount );
				}

				self.hud_momentumreason.alpha = 0.85;
				self.hud_momentumreason thread maps/mp/gametypes/_hud::fontpulse( self );
			}
			else
			{
				self.hud_momentumreason fadeovertime( 0.01 );
				self.hud_momentumreason.alpha = 0;
			}
		}

		wait 1;
		self.hud_rankscroreupdate fadeovertime( 0.75 );
		self.hud_rankscroreupdate.alpha = 0;

		if ( isDefined( self.hud_momentumreason ) && isDefined( reason ) )
		{
			self.hud_momentumreason fadeovertime( 0.75 );
			self.hud_momentumreason.alpha = 0;
		}

		wait 0.75;
		self.rankupdatetotal = 0;
	}
}

removerankhud()
{
	if ( isDefined( self.hud_rankscroreupdate ) )
	{
		self.hud_rankscroreupdate.alpha = 0;
	}
	if ( isDefined( self.hud_momentumreason ) )
	{
		self.hud_momentumreason.alpha = 0;
	}
}

getrank()
{
	rankxp = getrankxpcapped( self.pers[ "rankxp" ] );
	rankid = self.pers[ "rank" ];

	if ( rankxp < ( getrankinfominxp( rankid ) + getrankinfoxpamt( rankid ) ) )
	{
		return rankid;
	}
	else
	{
		return self getrankforxp( rankxp );
	}
}

getrankforxp( xpval )
{
	rankid = 0;
	rankname = level.ranktable[ rankid ][ 1 ];

	while ( isDefined( rankname ) && rankname != "" )
	{
		if ( xpval < ( getrankinfominxp( rankid ) + getrankinfoxpamt( rankid ) ) )
		{
			return rankid;
		}
		rankid++;

		if ( isDefined( level.ranktable[ rankid ] ) )
		{
			rankname = level.ranktable[ rankid ][ 1 ];
			continue;
		}
		else
		{
			rankname = undefined;
		}
	}

	rankid--;
	return rankid;
}

getspm()
{
	ranklevel = self getrank() + 1;
	return ( 3 + ( ranklevel * 0.5 ) ) * 10;
}

getrankxp()
{
	return getrankxpcapped( self.pers[ "rankxp" ] );
}

incrankxp(amount)
{
	if ( !level.rankedmatch )
	{
		return 0;
	}

	xp = self getrankxp();
	newxp = getrankxpcapped( xp + amount );

	if ( self.pers[ "rank" ] == level.maxrank && newxp >= getrankinfomaxxp( level.maxrank ) )
	{
		newxp = getrankinfomaxxp( level.maxrank );
	}

	xpincrease = getrankxpcapped( newxp ) - self.pers[ "rankxp" ];

	if ( xpincrease < 0 )
	{
		xpincrease = 0;
	}

	self.pers[ "rankxp" ] = getrankxpcapped( newxp );
	return xpincrease;
}

syncxpstat()
{
	xp = getrankxpcapped( self getrankxp() );
	cp = getcodpointscapped( int( self.pers[ "codpoints" ] ) );
	self setdstat( "playerstatslist", "rankxp", "StatValue", xp );
	self setdstat( "playerstatslist", "codpoints", "StatValue", cp );
}

clearstringsonplayerspawned()
{
	self endon( "disconnect" );

	for (;;)
	{
		self waittill( "spawned_player" );

		if ( !isDefined( self.hud_rankscroreupdate ) )
		{
			self.hud_rankscroreupdate = newscorehudelem( self );
			self.hud_rankscroreupdate.horzalign = "center";
			self.hud_rankscroreupdate.vertalign = "middle";
			self.hud_rankscroreupdate.alignx = "center";
			self.hud_rankscroreupdate.aligny = "middle";
			self.hud_rankscroreupdate.x = 0;

			if ( self issplitscreen() )
			{
				self.hud_rankscroreupdate.y = -15;
			}
			else
			{
				self.hud_rankscroreupdate.y = -60;
			}

			self.hud_rankscroreupdate.font = "default";
			self.hud_rankscroreupdate.fontscale = 2;
			self.hud_rankscroreupdate.archived = 0;
			self.hud_rankscroreupdate.color = ( 1, 1, 0.5 );
			self.hud_rankscroreupdate.alpha = 0;
			self.hud_rankscroreupdate.sort = 50;
			self.hud_rankscroreupdate maps\mp\gametypes\_hud::fontpulseinit();
		}		
	} 			
} 	

// INITIALIZE THE MOD

GameConfiguration()
{
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ After Loading Screen                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Initialize Variables                                                                             
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.amountofziplines = 0;
    level.amountofdoors = 0;
    level.amountofwallweapons = 0;
    level.amountofmarkets = 0;
    level.amountofmysteryboxs = 0;
    level.amountofpackapunchs = 0;
    level.amountofdefenses = 0;
    level.amountofguarddogs = 0;
    level.mysteryboxlocation = 0;
    level.poweruppickups = 0;
    level.playersgameready = 0;
    level.gametime = 0;
    level.stringcharacterlimit = 230;
    level.mapeditmaker = "Unknown";
    
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Overwrite Default Variable Values                                                                           
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.scorelimit = 0;
    level.teamscoreperkill = 0;
    level.teamscoreperdeath = 0;
    level.teamscoreperheadshot = 0;
    level.disableprematchmessages = true;
    level.killstreakcounter = false;
    level.ingraceperiod = false;
    level.scoreroundbased = false;
    level.teambalance = false;
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ After First Player Connects             
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
    
    level Waittill("connected", player);
    
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Force Host Dvars                                                                             
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    SetDvar("party_connectToOthers", "0");
    SetDvar("partyMigrate_disabled", "1");
    SetDvar("party_mergingEnabled", "0");
    SetDvar("allowAllNAT", "1");

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Instant Lobby Start                                                                           
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    SetDvarInt("party_gameStartTimerLength", 0);
    SetDvarInt("party_pregameStartTimerLength", 0);
    SetDvarInt("party_pregameStartTimerLengthPrivate", 0);

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Remove Rounds                                                                              
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    RegisterRoundLimit(0, 1); 
    RegisterRoundWinLimit(0, 0); 
    RegisterRoundSwitch(0, 9);
    
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Remove Score Info For Scorestreaks                                                                              
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    foreach (type in GetArrayKeys(level.scoreinfo))
        maps\mp\gametypes\_rank::RegisterScoreInfo(type, 0);
    
    foreach (type in StrTok("kill,rcxd_kill,remote_missile_kill,plane_mortar_kill,qrdrone_kill,strafe_run_kill,remote_mortar_kill,sentry_gun_kill,microwave_turret_kill",","))
        maps\mp\gametypes\_rank::RegisterScoreInfo(type, 1);
    
    // ╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    // ║ Everyone Hears Everyone                                                                           
    // ╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("everyone_hears_everyone") != "")
        SetMatchTalkFlag("EveryoneHearsEveryone", 1);

    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ After Prematch
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
    
    level Waittill("prematch_over");
    
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Overwrite Default Variable Values                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.disableweapondrop = 1; //Enable/Disable Weapon Drop
    level.loadoutkillstreaksenabled = false; //Enable/Disable Killstreaks
    level.killcam = false; //Enable/Disable Kill Cam
    level.allow_teamchange = "0"; //Enable/Disable Team Change
    
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Game Dvars                                                                         
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    SetDvar("sv_cheats", "1"); //Enable/Disable Cheat Protection
    SetDvar("allClientDvarsEnabled", "1"); //Enable/Disable Client Dvars
    SetDvar("scr_ai_tank_no_timeout", "1"); //AGR Unlimited Time
    SetDvar("scr_showperksonspawn", "0"); //Enable/Disable Perk Hud
    SetServerDvar("ui_errorTitle", "^1Zombieland"); //After Match Message Title
    SetServerDvar("ui_errorMessage", "Thankyou For Playing Zombieland -CoolJay"); //After Match Message Lower Title
    SetServerDvar("r_skyColorTemp", "6500"); //Sky Color
    SetServerDvar("r_lightTweakSunColor", "1 1 1"); //Sun Color
    
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Player Dvars                                                                         
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    SetDvar("jump_slowdownEnable", "0");  //Enable/Disable Slow Down After Jump
    SetDvarInt("jump_ladderPushVel", 512); //Ladder Back Jump Velocity
    SetDvarInt("perk_flakJacket", 10000); //Flak Jacket
    SetDvarInt("perk_flakJacket_hardcore", 10000); //Flak Jacket
    SetServerDvar("player_meleeRange", 48); //Melee Range
    SetServerDvar("player_meleeChargeFriction", 600); //Melee Charge Friction
    SetServerDvar("player_meleeChargeMaxSpeed", 400); //Melee Speed
    SetServerDvar("player_meleeInterruptFrac", "1.5"); //Melee Interval

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Bot Dvars                                                                         
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    SetDvarInt("bot_difficulty", 3); //Bot Difficulty
    
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Team Dvars                                                                         
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    SetDvar("ui_allow_classchange", "0"); //Enable/Disable Class Change
    SetDvar("ui_allow_teamchange", "0"); //Enable/Disable Team Change
    SetDvar("scr_teambalance", "0"); //Enable/Disable Team Balance
    SetDvarInt("party_autoteams", "0"); //Enable/Disable Auto Teams
    SetServerDvar("g_TeamName_Allies", "Humans"); //Team Name Allies
    SetServerDvar("g_TeamName_Axis", "Zombies"); //Team Name Axis
    SetServerDvar("g_TeamColor_Axis", "0.5 0 0"); //Team Killfeed Color Axis
    SetServerDvar("g_ScoresColor_Axis", "0.5 0 0"); //Team Killfeed Color Axis
    // SetServerDvar("cg_overheadNamesSize", "2"); //Over Head Name Size
        
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Weapon Dvars                                                                         
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    SetDvar("scr_disable_weapondrop", "1"); //Enable/Disable Weapon Drop
    SetDvarInt("scr_proximityGrenadeMaxInstances", 100); //Shock Charge Limit

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ After Prematch Settings                                                                         
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════
    
    wait 10;
    PauseTimer();
}

GameMonitor()
{
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Conditions
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
    
    println("Empece Game Monitor func");

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Map Generation                                                                     
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    // level thread MapEdits();
    
    // if (level.mapeditmaker == "Unknown")
    //     level thread AutoGenerateMapEdit();
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ During Game
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    while (!level.gameended)
    {

        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ For Every Player                                                                       
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        foreach (player in level.players)
        {
            // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
            //┃ If Player Left As A Zombie And Rejoins
            //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

            if (IsAlive(player) && IsDefined(player.gameready) && IsDefined(level.infectedplayer[GetAbbreviatedPlayerName(player)]) && player.status != "Zombie" && !IsDefined(level.developermode))
                player Suicide();
        }
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ If There Are No More Humans Left                                                                      
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        if (GetPlayers("axis").size == level.playersgameready && level.infectiontime == 0 && level.playersgameready > 1 && !IsDefined(level.developermode))
        {
            SetServerDvar("ui_errorMessageDebug", "Humans Survived: ^1" + ConvertToHHMMSS(level.gametime)); //After Match Message Subtitle
            level thread EndTheGame("axis", "Humans Survived: ^1" + ConvertToHHMMSS(level.gametime)); //End The Game
            break;
        }

        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Select A New Random Player To Be Zombie                                                                    
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        if (GetPlayers("axis").size == 0 && level.infectiontime == 0 && level.playersgameready > 1 && !IsDefined(level.zombieselectioninprogress) && !IsDefined(level.developermode)){
            level thread InfectRandomPlayers();
        }


        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Auto Spawn Bots                                                                
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        if (GetDvar("auto_spawn_bots") != "" && level.players.size < GetDvarInt("party_maxplayers_partylobby") && !IsDefined(level.botspawning)){
            level thread SpawnBots((GetDvarInt("party_maxplayers_partylobby") - level.players.size));
        
        }

        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Ground Loot Items Limit                                                                    
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        if (IsDefined(level.itementity.size) && level.itementity.size > level.groundlootitemlimit){
            level thread DeleteOldestGroundItem();
        }
            
        wait 0.05;
    }
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Game Ended
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
    
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Destroy Huds                                                                    
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.gamemessage DestroyElement();
    
    foreach (player in level.players)
    {
        // player thread CloseTheMenu();
        player.openmenuinstructions DestroyElement();
        player.pointsvalue DestroyElement();
        player.pointsvaluebackground DestroyElement();
        player.ammoclipvalue DestroyElement();
        player.ammodualclipvalue DestroyElement();
        player.ammostockvalue DestroyElement();
        player.weaponname DestroyElement();
        player.structureconsole DestroyElement();
        
        foreach (shader in player.equipmenticon)
            shader DestroyElement();
        foreach (message in player.ziplinemessage)
            message DestroyElement();
        foreach (message in player.doormessage)
            message DestroyElement();
        foreach (message in player.wallweaponmessage)
            message DestroyElement();
        foreach (message in player.marketmessage)
            message DestroyElement();
        foreach (message in player.mysteryboxmessage)
            message DestroyElement();
        foreach (message in player.packapunchmessage)
            message DestroyElement();
    }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Killcam Settings                                                                   
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.killcam = true;
    SetDvarInt("scr_killcam_time", 15);

    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ During Leaderboards
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ During Killcam
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
    
    level Waittill("play_final_killcam");

    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ After Killcam
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
    
    level Waittill("final_killcam_done");
    
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Auto Restart                                                                  
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.spawnpoints = undefined;

    println("acabe gamemonitor");
    
    if (GetDvar("auto_restart") != "")
    {
        maps = StrTok("mp_la,mp_dockside,mp_carrier,mp_drone,mp_express,mp_hijacked,mp_meltdown,mp_overflow,mp_nightclub,mp_raid,mp_slums,mp_village,mp_turbine,mp_socotra,mp_nuketown_2020,mp_downhill,mp_mirage,mp_hydro,mp_skate,mp_concert,mp_magma,mp_vertigo,mp_studio,mp_uplink,mp_bridge,mp_castaway,mp_paintball,mp_dig,mp_frostbite,mp_pod,mp_takeoff", ",");
        ChangeMap(Random(maps));
    }

    
}

GameSettingsMonitor()
{
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ During Game
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    for (;;)
    {
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Stop Game From Forfeiting                                                                  
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        if (level.gameforfeited != 0)
        {
            level.gameforfeited = 0;
            level Notify("abort forfeit");
        }
        
        wait 0.05;
    }
}

GameProgression()
{
    level Endon("game_ended");

    println("entre a game progression");
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Setup Checks
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ 

    bonusratecheck = level.bonusrate;
    difficultyratecheck = level.difficultyrate;
    supplieshelicopterinterval = level.supplieshelicopterrate;
    
    level Waittill("zombie_game_ready"); 
        
    for (;;)
    {
        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Progressive Variable Changes
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ 

        if (level.gametime >= level.bonusrate)
        {   
            level.bonusrate += bonusratecheck;
            level.humanstartingpoints += 300;
            level.humanpointssurviorbonus += 25;
            level.humanpointsperdoorrepair += 50;
            level.zombiepointsperkill += 50;
            level.zombiepointspernonlethalhit += 10;    
            level.zombiepointsperdeath += 20;
            level.zombiepointsperstructuredamage += 10;
            level.zombiepointsperturretdamage += 10;
            level.powerupdropchancepercentage -= RoundOffFloat((level.powerupdropchancepercentage / 10));
        }

        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Zombie Health
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ 

        if (level.gametime >= level.difficultyrate)
        {
            level.difficultyrate += difficultyratecheck;
            
            foreach (player in level.players)
            {
                if (IsAlive(player) && player.status == "Zombie")
                {
                    player.health ++;
                    player.maxhealth = player.health;
                }
            }
            
            level.zombiesstartinghealth ++; 
        }

        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Supplies Helicopter
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ 

        if (level.gametime >= level.supplieshelicopterrate)
        {
            level.supplieshelicopterrate += supplieshelicopterinterval;
            level thread SuppliesHelicopter();
        }
        
        wait 0.05;
    }   
}

GameHuds()
{
    level Endon("game_ended");
    
    wait 1;
    
    while (level.playersgameready < 2) 
        level Waittill("player_game_ready"); 
    
    println("empezo gamehuds");

    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Game Message                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    level.gamemessage = CreateText("Infection Outbreak In : ^1" + level.infectiontime, "default", 2, "center", "center", "user_center", "user_top", 0, 20, undefined, 0, undefined, undefined, false, true, 0);
    level.gamemessage FadeOverTime(1);
    level.gamemessage.alpha = 1;
    wait 1;
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Infection Countdown                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    while (level.infectiontime != 0)
    {
        level.infectiontime --;
        level.gamemessage SetElementText("Infection Outbreak In : ^1" + level.infectiontime);

        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Blood Sky                                                                         
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        if (level.infectiontime == 0 && !IsDefined(level.bloodysky) && GetDvar("blood_sky") == "")
            GetHostPlayer() thread BloodSky();
        
        wait 1;
    }
    
    level.gamemessage FadeOverTime(0.5);
    level.gamemessage.alpha = 0;
    wait 1;
    level.gamemessage SetElementText("^1Good Luck putas");
    level.gamemessage FadeOverTime(0.5);
    level.gamemessage.alpha = 1;
    wait 1;
    level.gamemessage FadeOverTime(1);
    level.gamemessage.alpha = 0;
    wait 1;
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Game Time                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    level.gamemessage DestroyElement();
    level.gamemessage = CreateText(undefined, "default", 2, "center", "center", "user_center", "user_center", 0, -210, undefined, 0, undefined, undefined, false, true, 0);
    level.gamemessage SetTimerUp(0);
    level.gamemessage FadeOverTime(1);
    level.gamemessage.alpha = 1;
    wait 1;
    
    for (;;)
    {
        level.gametime ++;
        wait 1;
    }   
}

DropSupplies()
{
    self PhysicsLaunch();
    self Waittill("stationary");
    collision = SpawnCollision("collision_clip_32x32x32", "collider", self GetOrigin(), self.angles);

    while (IsDefined(self))
    {
        foreach (player in level.players)
        {
            if (IsAlive(player) && player.status == "Human" && Distance(self GetOrigin(), player GetOrigin()) <= 100)
            {
                if (!IsDefined(player.supplydropmessage))
                    player.supplydropmessage = player CreateText("Hold [{+usereload}] To Open", "objective", 1.5, "center", "center", "user_center", "user_center", 0, 100, undefined, 1, undefined, undefined, true, false, 0);
                if (player UseButtonPressed())
                {
                    user = player;

                    foreach (player in level.players)
                    {
                        if (IsDefined(player.supplydropmessage))
                            player.supplydropmessage DestroyElement();
                    }
                    
                    holdtime = 0;
                    opentime = level.supplydropopentime;
                    user.opensupplydropprogressbar = user CreateProgressBar(0, opentime, (1, 1, 1), (0, 0, 0), false);
                    
                    while (IsAlive(user) && Distance(self GetOrigin(), user GetOrigin()) <= 100 && user UseButtonPressed())
                    {
                        if (holdtime >= opentime)
                        {
                            //Loot Drop Location Calculation
                            openorigin = self GetOrigin();
                            opendistance = Clamp(Int(Distance(self GetOrigin(), user GetOrigin())), 50, 100);
                            openangles = VectorToAngles(user GetOrigin() - self GetOrigin());
                            
                            //Supply Drop Delete
                            user.opensupplydropprogressbar DestroyElement();
                            self Delete();
                            collision Delete();
                            
                            //Ammo Fill
                            user thread GivePlayerMaxAmmo();
                              
                            //Spawn Random Items
                            previousitems = [];
                            
                            for (i = 0; i < level.supplydropitemamount; i ++)
                            {
                                //Random Item
                                randomitem = GetRandomItem("supplydrop");
        
                                while (IsInArray(previousitems, GetWeaponStringID(randomitem[1])))
                                {
                                    randomitem = GetRandomItem("supplydrop");
                                    wait 0.01;
                                }
                                IPrintLn(randomitem[0]);
                                IPrintLn(randomitem[1]);
                                previousitems[previousitems.size] = GetWeaponStringID(randomitem[1]);
                                origin = openorigin + ((AnglesToForward(openangles)[0] * RandomIntRange(40, opendistance)), (AnglesToForward(openangles)[1] * RandomIntRange(40, opendistance)), 50);
                        
                                //Consumable/Equipment Quantity
                                if (!IsWeaponPrimary(randomitem[1]))
                                    stock = self GetItemSpawnQuantity(randomitem[1], "supplydrop");
                                //Weapon Clip
                                if (IsWeaponPrimary(randomitem[1]))
                                    clip = self GetModWeaponClipSize(randomitem[1]); 
                                //Upgrade Weapon
                                if (IsWeaponPrimary(randomitem[1]))
                                {
                                    if (RandomInt(10) == 0 && !IsInArray(StrTok("m32_wager_mp,knife_held_mp,knife_mp,riotshield_mp,minigun_wager_mp,none", ","), GetWeaponStringID(randomitem[1])))
                                        upgrade = "Vanilla";
                                }
                                
                                //Spawn Item
                                level thread SpawnItem(randomitem[0], upgrade, randomitem[1], clip, stock, 0, RandomInt(38), origin);  
                                wait 0.1;
                            }
                        
                            break;
                        }
                        else
                            holdtime += 0.05;
                        
                        wait 0.05;
                    }
                    
                    if (IsDefined(user.opensupplydropprogressbar))
                        user.opensupplydropprogressbar DestroyElement();
                }       
            }
            else if (IsDefined(player.supplydropmessage))
                player.supplydropmessage DestroyElement();
        }
        
        wait 0.05;
    }
}

CreateProgressBar(start, end, loadcolor, framecolor, allplayers)
{
    if (allplayers)
    {
        createprogressbar = CreateShader("white", "center", "center", "user_center", "user_center", -59, -60, Clamp(Int(((119 / end) * start)), 1, 119), 10, loadcolor, 1, true, true, 2);
        createprogressbarframe = CreateShader("white", "center", "center", "user_center", "user_center", 0, -60, 120, 12, framecolor, 0.5, true, true, 1);
    }
    else
    {
        createprogressbar = self CreateShader("white", "center", "center", "user_center", "user_center", -59, -60, Clamp(Int(((119 / end) * start)), 1, 119), 10, loadcolor, 1, true, false, 2);
        createprogressbarframe = self CreateShader("white", "center", "center", "user_center", "user_center", 0, -60, 120, 12, framecolor, 0.5, true, false, 1);
    }
    
    createprogressbar.frame = createprogressbarframe;
    createprogressbar.alignx = "left";
    createprogressbar ScaleOverTime((end - start), 119, 10);
    
    return createprogressbar;
}

// changed submenu equipment

GivePlayerMaxAmmo()
{
    foreach (inventoryweapon in self GetWeaponsList())
    {
        self SetModWeaponStock(inventoryweapon, self GetModWeaponStockSize(inventoryweapon));
        
        if (IsSubStr(inventoryweapon, "+gl"))
        {
            self SetWeaponAmmoClip("gl_" + inventoryweapon,  self GetModWeaponClipSize("gl_" + inventoryweapon)); 
            self SetWeaponAmmoStock("gl_" + inventoryweapon,  self GetModWeaponStockSize("gl_" + inventoryweapon));   
        }
    }
        
    // if ((IsDefined(self.menu)) && (self.menuopen) && (self.menu.currentmenu == "Equipment")){
    //     self Submenu("Equipment");
    // }    
       
    UpdateSelfSubMenuEquipment();

    self IPrintLnBold("Max Ammo!"); 
    self Notify("max_ammo");
}

SuppliesHelicopter(callout)
{
    if (IsDefined(level.supplydroplocation) && !IsDefined(level.supplieshelicopter) && !IsDefined(level.supplydrop))
    {
        foreach (player in level.players)
            player thread NotifyMessage("Supplies Helicopter Incoming", undefined, undefined, undefined);
            
        droplocationnumber = RandomInt(level.supplydroplocation.size);
        helicoptertarget = level.supplydroplocation[droplocationnumber] + (0, 0, 1500);
        helicopterspawn = level.mapcenter + (10000, 10000, helicoptertarget[2]);
        helicopterleave = level.mapcenter + (-10000, -10000, helicoptertarget[2]);
        level.supplieshelicopter = SpawnHelicopter(GetHostPlayer(), helicopterspawn, VectorToAngles(helicoptertarget - helicopterspawn), "heli_supplydrop_mp", "veh_t6_drone_supply");
        level.supplydrop = SpawnEntity("script_model", "t6_wpn_drop_box", level.supplieshelicopter GetOrigin() + (0, 0, -70), level.supplieshelicopter.angles);
        level.supplydrop LinkTo(level.supplieshelicopter);
        level.supplieshelicopter SetSpeed(75, 25);
        level.supplieshelicopter SetVehGoalPos(helicoptertarget, 0);
        
        while (Distance(level.supplieshelicopter GetOrigin(), helicoptertarget) > 2500)
            wait 0.05;
            
        level.supplieshelicopter SetSpeed(5, 25);
        level.supplieshelicopter Waittill("goal");
        level.supplydrop Unlink();
        level.supplydrop thread DropSupplies();
        level.supplieshelicopter SetVehGoalPos(helicopterleave, 0);
        level.supplieshelicopter SetSpeed(75, 25);
        wait 10;
        level.supplieshelicopter Waittill("goal");
        level.supplieshelicopter Delete();
    }
    else if (IsDefined(callout))
        self IPrintLn("^1Error: ^7Cannot Call Supplies Helicopter Right Now");  
}

// changed self submenu

BloodSky()
{
    if (!IsDefined(level.bloodysky))
    {
        SetDvar("blood_sky", "");
        SetServerDvar("r_skyColorTemp", "1650");
        SetServerDvar("r_lightTweakSunColor", "1 0 0");
        level.bloodysky = true;
        self IPrintLn("Blood Sky: ^2Enabled");
    }
    else
    {
        SetDvar("blood_sky", 1);
        SetServerDvar("r_skyColorTemp", "6500");
        SetServerDvar("r_lightTweakSunColor", "1 1 1");
        level.bloodysky = undefined;
        self IPrintLn("Blood Sky: ^1Disabled");
    }  

    UpdateSelfSubMenu();
}

GetModWeaponClip(weapon)
{
    if (IsDefined(self.modweaponclip[GetWeaponStringID(weapon)]) && !IsSubStr(weapon, "gl_") && !IsWeaponDualWield(weapon))
        return self.modweaponclip[GetWeaponStringID(weapon)];
    if (IsSubStr(weapon, "gl_"))
        return self GetWeaponAmmoClip(weapon);
        
    return self GetWeaponAmmoClip(GetDefaultWeaponStringID(weapon));
}

WeaponUsesModWeaponAmmo(weapon)
{
    if (IsWeaponEquipment(weapon))
        return false;
    if (self GetModWeaponClipSize(weapon) != WeaponClipSize(weapon) || self GetModWeaponStockSize(weapon) != WeaponMaxAmmo(weapon) || IsWeaponDualWield(weapon))
        return true;

    return false;
}

SetModWeaponStock(weapon, stock)
{
    weapon = GetDefaultWeaponStringID(weapon);
    
    if (self WeaponUsesModWeaponAmmo(weapon))
    {
        stock = Clamp(stock, 0, self GetModWeaponStockSize(weapon));
        self.modweaponstock[GetWeaponStringID(weapon)] = stock;

        if (stock > 0)
            self SetWeaponAmmoStock(weapon, Clamp(stock, 0, WeaponMaxAmmo(weapon)));
        else if (WeaponClipSize(weapon) < self GetModWeaponClipSize(weapon) || GetWeaponStringID(weapon) == "crossbow_mp")
            self SetWeaponAmmoStock(weapon, WeaponMaxAmmo(weapon)); 
        else
            self SetWeaponAmmoStock(weapon, 0);
    }
    else
        self SetWeaponAmmoStock(weapon, stock); 
}

// changed submenu equipment

PlayerDropEquipment(equipment, quantity, origin)
{
    rarity = self.inventory[equipment].rarity;
    
    //Drop All Equipment
    if (quantity >= self GetModWeaponStock(equipment))
        quantity = self GetModWeaponStock(equipment);
        
    self SetModWeaponStock(equipment, (self GetModWeaponStock(equipment) - quantity));    
        
    //Update Menu Options/Back Out Of Menu
    // if (IsDefined(self.menu) && self.menuopen && IsSubStr(self.menu.currentmenu, GetEquipmentDisplayName(equipment)))
    //     self Submenu("Equipment");

    UpdateSelfSubMenuEquipment();
        
    //Drop Location
    if (!IsDefined(origin))
        origin = self GetOrigin() + ((AnglesToForward(self GetPlayerAngles())[0] * 50), (AnglesToForward(self GetPlayerAngles())[1] * 50), 100);
        
    level thread SpawnItem(rarity, undefined, equipment, undefined, quantity, undefined, undefined, origin);
}

SetModWeaponDualClip(weapon, clip)
{
    if (self WeaponUsesModWeaponAmmo(weapon) && IsWeaponDualWield(weapon))
    {
        clip = Clamp(clip, 0, self GetModWeaponClipSize(weapon));
        self.modweapondualclip[GetWeaponStringID(weapon)] = clip;
    }
}

WeaponUsesClip(weapon)
{
    if (GetWeaponStringID(weapon) == "judge_mp" && IsSubStr(weapon, "dualclip"))
        return true;
    if (GetWeaponStringID(weapon) == "judge_mp" && IsSubStr(weapon, "dw"))
        return true;
    if (GetWeaponStringID(weapon) == "judge_mp" || GetWeaponStringID(weapon) == "870mcs_mp" || GetWeaponStringID(weapon) == "ksg_mp" || GetWeaponStringID(weapon) == "m32_wager_mp")
        return false;
    
    return true;
}

SetModWeaponClip(weapon, clip)
{
    weapon = GetDefaultWeaponStringID(weapon);

    if (self WeaponUsesModWeaponAmmo(weapon))
    {
        clip = Clamp(clip, 0, self GetModWeaponClipSize(weapon));
        self.modweaponclip[GetWeaponStringID(weapon)] = clip;
        
        if (IsWeaponDualWield(weapon))
            self SetModWeaponDualClip(weapon, clip);
        else if (clip > 0)
        {
            if (!WeaponUsesClip(weapon) && WeaponClipSize(weapon) > 2 && self GetModWeaponClip(weapon) < self GetModWeaponClipSize(weapon))
                self SetWeaponAmmoClip(weapon, WeaponClipSize(weapon) - 2);
            else if (WeaponClipSize(weapon) > 1 && self GetModWeaponClip(weapon) < self GetModWeaponClipSize(weapon))
                self SetWeaponAmmoClip(weapon, WeaponClipSize(weapon) - 1);
            else
                self SetWeaponAmmoClip(weapon, WeaponClipSize(weapon));
            if (self GetModWeaponClip(weapon) <= 1 && self GetModWeaponStock(weapon) == 0)
                self SetWeaponAmmoStock(weapon, 0);
        }
        else
            self SetWeaponAmmoClip(weapon, 0);  
    }
    else
        self SetWeaponAmmoClip(weapon, clip);   
}

ChangeMap(mapname)
{
	SetDvar("ls_mapname", mapname);
	SetDvar("mapname", mapname);
	SetDvar("party_mapname", mapname);
	SetDvar("ui_mapname", mapname);
	SetDvar("ui_currentMap", mapname);
	SetDvar("ui_mapname", mapname);
	SetDvar("ui_preview_map", mapname);
	SetDvar("ui_showmap", mapname);
	Map(mapname);
}

GetAbbreviatedPlayerName(player)
{
    if (IsSubStr(player.name, "]"))
        playername = StrTok(player.name, "]")[1];
    else
        playername = player.name;

    return playername;
}

InfectRandomPlayers()
{
    level.zombieselectioninprogress = true;
    
    for (i = 0; i < level.startingzombiecount; i ++)
    {
        randomplayer = Random(level.players);
        
        if (IsAlive(randomplayer) && IsDefined(randomplayer.gameready) && randomplayer.status == "Human" && !IsDefined(level.developermode))
        {
            if (level.hostcanbecomezombie)
                randomplayer Suicide();  
            else if (!randomplayer IsHost())
                randomplayer Suicide();  
        }
    }
    
    wait 1;
    level.zombieselectioninprogress = undefined;
}

SpawnBots(amount)
{
    if (amount > 0)
    {
        level.botspawning = true;
        
        for (i = 0; i <= amount - 1; i ++) 
        {
            maps\mp\bots\_bot::Spawn_Bot("allies");
            wait 0.2;
        }
        
        level.botspawning = undefined;
    }
}

ConvertToHHMMSS(time)
{
    hours = time / 3600;
    seconds = time % 3600;
    minutes = seconds / 60;
    seconds %= 60;
    
    if (seconds < 10)
        seconds = "0" + Int(seconds);
    else
        seconds = Int(seconds);
    if (minutes < 10 && time >= 3600)
        minutes = "0" + Int(minutes);
    else
        minutes = Int(minutes);
    if (time < 60)
        output = "0:" + seconds;
    if (time >= 60 && time < 3600)
        output = minutes + ":" + seconds;
    if (time >= 3600)
        output = Int(hours) + ":" + minutes + ":" + seconds;
        
    return output;
}

EndTheGame(team, message)
{
    wait 0.05;
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Remove Default Leaderboard Hud
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ 

    level.hostforcedend = false;
    game["strings"]["victory"] = undefined;
    game["strings"]["defeat"] = undefined;
    game["strings"]["draw"] = " "; 
    game["strings"]["tie"] = " ";
    game["strings"]["match_bonus"] = " "; 
    game["strings"]["objective_score_allies"] = undefined;
    game["strings"]["objective_score_axis"] = undefined;
    game["icons"]["allies"] = undefined;
    game["icons"]["axis"] = undefined;
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Direct Ending
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ 

    if (!IsDefined(team) || !IsDefined(message))
        level thread maps\mp\gametypes\_globallogic::ForceEnd();

    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Leaderboard Ending
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ 

    else
    {
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Setup Players For Ending                                                   
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        foreach (player in level.players)
        {
            player EnableInvulnerability();
            // player thread CloseTheMenu();
            player.disablemenu = true;
        }
    
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Leaderboard Hud                                                    
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        scorebackground = CreateShader("white", "center", "center", "user_center", "user_bottom", 0, -380, 300, 330, (0, 0, 0), 0, false, true, 9999);
        scorebackground.aligny = "top";
        scorebackground FadeOverTime(0.2);
        scorebackground.alpha = 0.5;
        wait 0.2;
        messagetext = CreateText(message, "bigfixed", 1, "center", "center", "user_center", "user_bottom", 0, -360, undefined, 0, undefined, undefined, false, true, 10000);
        messagetext FadeOverTime(0.2);
        messagetext.alpha = 1;
        
        humansplacement = [];
        humansscorestring = "Humans:\n";
        zombiesplacement = [];
        zombiesscorestring = "Zombies:\n";

        foreach (player in level.players)
        {
            if (!IsDefined(player.zombiekills))
            {
                player.zombiekills = 0;
                player.zombieheadshots = 0;
            }
        }

        for (i = 0; i < level.players.size; i ++)
        {
            foreach (player in level.players)
            {
                if (!IsInArray(humansplacement, player) && player.zombiekills == i)
                    humansplacement[humansplacement.size] = player;
            }
        }

        for (i = (humansplacement.size - 1); i > (humansplacement.size - 6); i --)
        {
            if (IsDefined(humansplacement[i]))
                humansscorestring += GetAbbreviatedPlayerName(humansplacement[i]) + " Kills: ^1" + humansplacement[i].zombiekills + " ^7Headshots: ^1" + humansplacement[i].zombieheadshots + "^7\n";
            else
                break;
        }

        for (i = 0; i < level.players.size; i ++)
        {
            foreach (player in level.players)
            {
                if (!IsInArray(zombiesplacement, player) && player.pers["kills"] == i)
                    zombiesplacement[zombiesplacement.size] = player;
            }
        }

        for (i = (zombiesplacement.size - 1); i > (zombiesplacement.size - 6); i --)
        {
            if (IsDefined(zombiesplacement[i]))
            zombiesscorestring += GetAbbreviatedPlayerName(zombiesplacement[i]) + " Kills: ^1" + zombiesplacement[i].pers["kills"] + " ^7Deaths: ^1" + zombiesplacement[i].pers["deaths"] + "^7\n";
            else
                break;
        }
        
        wait 3;
        leaderboardtitle = CreateText("Leaderboard:", "small", 1.5, "center", "center", "user_center", "user_bottom", 0, -330, undefined, 0, undefined, undefined, false, true, 10001);
        humansscores = CreateText(humansscorestring, "small", 1.5, "center", "center", "user_center", "user_bottom", 0, -310, undefined, 0, undefined, undefined, false, true, 10001);
        zombiesscores = CreateText(zombiesscorestring, "small", 1.5, "center", "center", "user_center", "user_bottom", 0, (-280 + (18 * Min(level.players.size, 6))), undefined, 0, undefined, undefined, false, true, 10001);
        leaderboardtitle FadeOverTime(0.2);
        leaderboardtitle.alpha = 1;
        humansscores FadeOverTime(1);
        zombiesscores FadeOverTime(1);
        humansscores.alpha  = 1;
        zombiesscores.alpha = 1;
        wait 8;
        background = CreateShader("white", "center", "center", "user_center", "user_center", 0, 0, 1000, 1000, (0, 0, 0), 0, false, true, 9998);
        background FadeOverTime(0.2);
        background.alpha = 1;
        wait 0.2;
        scorebackground DestroyElement();
        level thread maps\mp\gametypes\_globallogic::ForceEnd();
        level Waittill("play_final_killcam");
        messagetext FadeOverTime(0.2);
        leaderboardtitle FadeOverTime(0.2);
        humansscores FadeOverTime(0.2);
        zombiesscores FadeOverTime(0.2);
        messagetext.alpha = 0;
        humansscores.alpha = 0;
        zombiesscores.alpha = 0;
        wait 0.2;
        messagetext DestroyElement();
        leaderboardtitle DestroyElement();
        humansscores DestroyElement();
        zombiesscores DestroyElement();
        background FadeOverTime(0.3);
        background.alpha = 0;
        wait 0.3;
        background DestroyElement();
        level Waittill("final_killcam_done");
    }
    
    level Notify("pregame_over");

    println("Acabe endgame");
}

SetElementText(text)
{
    self SetText(text);
    
    if (self.text != text)
        self.text = text;
    if (!IsInArray(level.stringtable, text))
        level.stringtable[level.stringtable.size] = text;
    if (!IsInArray(level.textelementtable, self))
        level.textelementtable[level.textelementtable.size] = self;
}

SetElementValueText(text)
{
    self.label = &"" + text;
    
    if (self.text != text)
        self.text = text;
    if (!IsInArray(level.stringtable, text))
        level.stringtable[level.stringtable.size] = text;
    if (!IsInArray(level.textelementtable, self))
        level.textelementtable[level.textelementtable.size] = self;
}

PlayerConnect()
{

    println("empece playerconnect()");    

    level Endon("game_ended");
    
    for (;;)
    {
        
        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ After Player Connects
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
        
        level Waittill("connected", player);
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Anti Join                                                                  
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        if (IsDefined(level.antijoin) && !player Is_Bot())
            Kick(player GetEntityNumber());

        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Kick Split Screen Players                                                                  
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        if (level.kicksplitscreenplayers && player IsSplitScreen())
            Kick(player GetEntityNumber());

        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Setup                                
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════
        
        println("acabe playerconnect()");    

        player thread PlayerDisconnect();
        player thread PlayerSpawn();

        
    }
}

PlayerDisconnect()
{
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ After Player Disconnects
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
    
    println("empece playerdisconnected()");    

    self Waittill("disconnect");
    level Notify("disconnected", self);
    
    if (IsDefined(self.gameready))
        level.playersgameready --;  

    
    println("acabe playerdisconnected()");    
}

DestroyElement()
{
    if (IsInArray(level.textelementtable, self))
        ArrayRemoveValue(level.textelementtable, self);
    if (IsDefined(self.elemtype))
    {
        self.frame Destroy();
        self.bar Destroy();
        self.barframe Destroy();
    }
        
    self Destroy();
}

AbsoluteShow()
{
    self Unlink();
    self SetOrigin(self GetOrigin() - (0, 0, 100000));
    self SetPlayerAngles(self.hideentity.defaultangles);
    self.hideentity Delete();
    self Show();
    self DisableInvulnerability();
}

AbsoluteHide()
{
    self Hide();
    self EnableInvulnerability();
    self.hideentity = Spawn("script_origin", self GetOrigin());
    self.hideentity.angles = self GetPlayerAngles();
    self.hideentity.defaultangles = self GetPlayerAngles();
    self PlayerLinkTo(self.hideentity);
    self.hideentity.origin = (self GetOrigin() + (0, 0, 100000));
}

FlickeringText(minimumrate, maximumrate, minimumfrequency, maximumfrequency)
{
    while (IsDefined(self) && !IsDefined(self.stopflicker))
    {
        rate = RandomFloatRange(minimumrate, maximumrate);
        self FadeOverTime(rate);
        
        if (self.alpha == 0)
            self.alpha = 1;
        else
            self.alpha = 0;
            
        frequency = RandomFloatRange(minimumfrequency, maximumfrequency);
        wait frequency;
    }
}

SetServerDvar(dvar, value)
{
    SetDvar(dvar, value);
    MakeDvarServerInfo(dvar, value);
}

SpawnEntity(class, model, origin, angles)
{
    entity = Spawn(class, origin);
    
    if (IsDefined(angles))
        entity.angles = angles;
    if (IsDefined(model))
        entity SetModel(model);
        
    entity.custom = true;
    
    return entity;
}

EraseSubStr(string, substring, startinstance, endinstance)
{
    if (IsSubStr(string, substring))
    {
        start = 0;
        end = substring.size;
        iteration = 0;
        currentinstance = 0;
        returnstring = "";
        
        while (end != (string.size + 1))
        {
            if (GetSubStr(string, start, end) == substring)
            {
                if (start > 0)
                {
                    currentinstance ++;
                    
                    if (!IsDefined(startinstance) || currentinstance > startinstance)
                        returnstring += GetSubStr(string, iteration, start);
                    if (IsDefined(endinstance) && currentinstance == endinstance)
                        break;
                        
                    iteration = end;
                }
                else 
                    string = GetSubStr(string, end, string.size); 
            }
                
            start ++;
            end ++;
        }
    }
    
    return returnstring;
}

GetItemRarityColor(rarity)
{
    if (rarity == "Common")
        return (1, 1, 1);
    if (rarity == "Uncommon")
        return (0, 1, 0);
    if (rarity == "Rare")
        return (0, 0, 1);
    if (rarity == "Epic")
        return (1, 0, 1);
    if (rarity == "Legendary")
        return (1, 0.5, 0);
}

TakeModWeapon(weapon)
{
    self.reloadwait[GetWeaponStringID(weapon)] = undefined;
    self.modweaponclip[GetWeaponStringID(weapon)] = undefined;
    self.modweapondualclip[GetWeaponStringID(weapon)] = undefined;
    self.modweaponstock[GetWeaponStringID(weapon)] = undefined;
    self TakeWeapon(weapon);  
    self Notify(GetWeaponStringID(weapon) + "_removed");   
}

PlayerSpawn()
{
    self Endon("disconnect");
    level Endon("game_ended");

    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Spawn Player
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
    
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Auto Choose Class & Spawn In                                                                  
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    self ChangeTeam("allies");
    self Notify("menuresponse", "changeclass", "class_smg");

    println("estoy en spawn");
    
    for (;;)
    {       
        self Waittill("spawned_player");
        level Notify("spawned_player", self);

        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Every Spawn (After First Spawn)
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
       
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Setup                                                                
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════
        
        if (firstspawn)
        {

            println("intro");
            self thread Introduction();
            firstspawn = false;
       
        }    
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Host Setup                                                                  
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        // if (self IsHost())
        //     self thread AntiEndGame();
            
           
        else
        {
            self thread PlayerLoadout();
            println("aqui va playerloadout");
        }

        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Every Spawn (Including First Spawn)
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
    
    }
}

TextMonitor()
{
	while (IsDefined(self))
	{
		level waittill("overflow_fixed");
		self SafeSetText(self.text);
	}
}

SafeSetText(text)
{
    self SetText(text);
    
    if (!IsDefined(self.text))
    	self thread TextMonitor();	
    if (self.text != text)
    	self.text = text;
    if (!IsInArray(level.stringtable, text))
		level.stringtable[level.stringtable.size] = text;
}

CreateText(text, font, fontscale, point, relative, horzalign, vertalign, x, y, color, alpha, glowcolor, glowalpha, hidewheninmenu, allplayers, sort)
{
    if (allplayers)
    	createtext = level CreateServerFontString(font, fontscale);
    else
        createtext = self CreateFontString(font, fontscale);	
    if (IsDefined(text))
    	createtext SafeSetText(text);
    
	createtext SetPoint(point, relative, x, y);
    createtext.horzalign = horzalign;
    createtext.vertalign = vertalign;
    
    if (IsDefined(color))
    	createtext.color = color;  
    	
    createtext.alpha = alpha;
    
    if (IsDefined(glowcolor))
    	createtext.glowcolor = glowcolor;   
    if (IsDefined(glowalpha))
    	createtext.glowalpha = glowalpha;  
    	
    createtext.hidewheninmenu = hidewheninmenu;   	
    createtext.sort = sort;  
   	createtext.archived = false;
   	
    return createtext;        
}

DeleteOldestGroundItem()
{
    if (IsDefined(level.uniqueitemnumber))
    {
        for (i = 0; i < (level.uniqueitemnumber + 1); i ++)
        {
            if (IsDefined(level.itementity[i]))
            {
                DeleteItem(i);
                break;
            }
        }
    }
}

// MOD MENU INIT

//██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
//██ Open                                                                                                                                        
//██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

OpenTheMenu(menu)
{
    self Endon("disconnect");
    
    if (IsDefined(self.menu) && !self.menuopen && !IsDefined(self.disablemenu))
    {
        self.menuopening = true;
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ First Open                                                                                  
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        if (IsDefined(self.openmenuinstructions))
        {
            self.openmenuinstructions MoveOverTime(0.2);
            self.openmenuinstructions.y = 200;
            wait 0.2;
            self.openmenuinstructions DestroyElement();
        }

        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Open Sound                                                                                 
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self PlaySoundToPlayer("cac_grid_equip_item", self);
         
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Update                                                                                 
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self Submenu(menu);
        self OpenMenuTransition();
        self.menuopening = undefined;
        self.menuopen = true;
        self Notify("weapon_check");
    }
}

//██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
//██ Close                                                                                                                                        
//██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

CloseTheMenu()
{
    self Endon("disconnect");
    
    if (IsDefined(self.menu) && self.menuopen)
    {
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Close Sound                                                                                 
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self PlaySoundToPlayer("cac_enter_cac", self);
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Update                                                                                
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self CloseMenuTransition();
        self.menuopen = false;
        self.menu.currentmenu = undefined;
        self Notify("weapon_check");
    }
}

//██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
//██ Reset                                                                                                                                       
//██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

ResetTheMenu()
{
    self.menuopen = false;
    self.disablemenu = undefined;
    self.menu.currentmenu = undefined;
    self.menu.previousmenu = undefined;
    self.menu.scroller = undefined;
    self.menu.currentpage = undefined;
    self.menu.page = undefined;
    self.menu.optiontext = undefined;
    self.menu.headershader = undefined;
    self.menu.optionshader = undefined;
    self.menu.optionshaderwidth = undefined;
    self.menu.optionshaderheight = undefined;
    self.menu.optionshaderhighlight = undefined;        
    self.menu.function = undefined;
    self.menu.argument1 = undefined;
    self.menu.argument2 = undefined;
    self.menu.dynamicmenuupdate = undefined;
}

ResetTheMenuMemory()
{
    self.menu.scroller = undefined;
    self.menu.currentpage = undefined;
}

// MENU UI

// BASE

MenuBase(menu)
{
    if (!IsDefined(self.menutitle))
        self.menutitle = CreateText(menu, "objective", 2, "center", "center", "user_right", "user_bottom", -200, self.menuopen ? -375 : -540, undefined, 1, (1, 0, 0), 1, true, false, 4); 
    if (!IsDefined(self.menuoptions))
        self.menuoptions = CreateText(undefined, "small", 1.5, "center", "center", "user_right", "user_bottom", self.menuopen ? -200 : 500, -315, undefined, 1, undefined, undefined, true, false, 3); 
    if (!IsDefined(self.menucontrolsinstructions))
        self.menucontrolsinstructions = CreateText("         Press [{+actionslot 1}]/[{+actionslot 2}] To Scroll\nPress [{+actionslot 4}]/[{+actionslot 3}] To Select/Return\n         Press [{+smoke}] To Close Menu", "small", 1.5, "center", "center", "user_right", "user_bottom", -200, self.menuopen ? Int(((-290 + (18 * Clamp(self.menu.optiontext[menu].size, 0, 12))) + 20)) : 300, undefined, 1, (1, 0, 0), 0.5, true, false, 0);
    if (!IsDefined(self.menubackground))    
        self.menubackground = CreateShader("white", "center", "center", "user_right", "user_bottom", self.menuopen ? -200 : 500, -410, 240, Clamp(Int(88 + (18 * self.menu.optiontext[menu].size)), 0, 216), (0, 0, 0), 0.5, true, false, 0);   
    if (!IsDefined(self.menuscroller))
        self.menuscroller = CreateShader("gradient", "center", "center", "user_right", "user_bottom", self.menuopen ? -200 : 500, -315, 240, 17, undefined, 1, true, false, 2);
    if (!IsDefined(self.menuheader))
        self.menuheader = CreateShader("white", "center", "center", "user_right", "user_bottom", self.menuopen ? -200 : 500, -375, 240, 70, undefined, 1, true, false, 3);
    if (!IsDefined(self.menuleftborder))
        self.menuleftborder = CreateShader("white", "center", "center", "user_right", "user_bottom", self.menuopen ? -320 : 380, -410, 3, Clamp(Int(88 + (18 * self.menu.optiontext[menu].size)), 0, 216), (1, 0, 0), 1, true, false, 4); 
    if (!IsDefined(self.menurightborder))
        self.menurightborder = CreateShader("white", "center", "center", "user_right", "user_bottom", self.menuopen ? -80 : 620, -410, 3, Clamp(Int(88 + (18 * self.menu.optiontext[menu].size)), 0, 216), (1, 0, 0), 1, true, false, 4);

    self.menubackground.aligny = "top";
    self.menuleftborder.aligny = "top";
    self.menurightborder.aligny = "top";
}

// DYNAMIC BG

DynamicMenuBackground()
{
    self Endon("disconnect");
    
    if (IsDefined(level.dynamicmenubackground) && level.dynamicmenubackground)
    {
        shaders = StrTok("fullscreen_proximity_vertical0,fullscreen_proximity_vertical1,fullscreen_proximity_vertical2,fullscreen_proximity_horizontal0,fullscreen_proximity_horizontal1", ",");
        self.menubackground1 = CreateShader(shaders[RandomInt(6)], "center", "center", "user_right", "user_bottom", -200, -410, 240, self.menubackground.height, undefined, 1, true, false, 1);
        self.menubackground2 = CreateShader(shaders[RandomInt(6)], "center", "center", "user_right", "user_bottom", -200, -410, 240, self.menubackground.height, undefined, 1, true, false, 1);
        self.menubackground1.aligny = "top";
        self.menubackground2.aligny = "top";
        hue = RandomFloatRange(0, 360);
        
        while (IsDefined(self.menubackground1))
        {
            hue += 0.1;
            self.menubackground1 SetShader(shaders[RandomInt(6)], 240, self.menubackground.height);
            self.menubackground2 SetShader(shaders[RandomInt(6)], 240, self.menubackground.height);
            self.menubackground1 FadeOverTime(0.05);
            self.menubackground1.color = ConvertHSVToRGB((hue, 100, 100));
            self.menubackground2 FadeOverTime(0.05);
            self.menubackground2.color = ConvertHSVToRGB((hue, 100, 100));
            wait 0.05;
            
            if (hue >= 359)
                hue = 0;
        }
    }
}

// OPEN MENU TRANSITION

OpenMenuTransition()
{
    self.menutitle MoveOverTime(0.2);
    self.menutitle.y = -375;       
    self.menuoptions MoveOverTime(0.2);
    self.menuoptions.x = -200;  
    self.menucontrolsinstructions MoveOverTime(0.2);
    self.menucontrolsinstructions.y = Int(((-290 + (18 * Clamp(self.menu.optiontext[self.menu.currentmenu].size, 0, 12))) + 20));
    self.menubackground MoveOverTime(0.2);
    self.menubackground.x = -200; 
    self.menuscroller MoveOverTime(0.2);
    self.menuscroller.x = -200;
    self.menuheader MoveOverTime(0.2);
    self.menuheader.x = -200;
    self.menuleftborder MoveOverTime(0.2);
    self.menuleftborder.x = -80;  
    self.menurightborder MoveOverTime(0.2);
    self.menurightborder.x = -320; 

    foreach (shader in self.menuscrollshader)
    {
        shader MoveOverTime(0.2);
        shader.x = -200;
    }
    
    wait 0.2;
    self thread DynamicMenuBackground();
}

// CLOSE MENU TRANSITION

CloseMenuTransition()
{
    if (IsDefined(self.menubackground1))
    {
        self.menubackground1 DestroyElement();
        self.menubackground2 DestroyElement();
    }

    self.menutitle MoveOverTime(0.2);
    self.menutitle.y = -540;
    self.menuoptions MoveOverTime(0.2);
    self.menuoptions.x = 700;
    self.menucontrolsinstructions MoveOverTime(0.2);
    self.menucontrolsinstructions.y = 180;
    self.menubackground MoveOverTime(0.2);
    self.menubackground.x = 700;
    self.menuscroller MoveOverTime(0.2);
    self.menuscroller.x = 700;
    self.menuheader MoveOverTime(0.2);
    self.menuheader.x = 700;
    self.menuleftborder MoveOverTime(0.2);
    self.menuleftborder.x = 580;
    self.menurightborder MoveOverTime(0.2);
    self.menurightborder.x = 820; 
    self.menuuparrow MoveOverTime(0.2);
    self.menuuparrow.y = 205;
    self.menudownarrow MoveOverTime(0.2);
    self.menudownarrow.y = 195;
    
    foreach (shader in self.menuscrollshader)
    {
        shader MoveOverTime(0.2);
        shader.x = 700;
    }
    
    wait 0.2;

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Destroy Menu                                                                                 
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    self.menutitle DestroyElement();
    self.menuoptions DestroyElement();
    self.menuheader DestroyElement();
    self.menuscroller DestroyElement();
    self.menubackground DestroyElement();
    self.menuleftborder DestroyElement();
    self.menurightborder DestroyElement();
    self.menucontrolsinstructions DestroyElement();
    self.menudownarrow DestroyElement();
    self.menuuparrow DestroyElement();
    
    foreach (shader in self.menuscrollshader)
        shader DestroyElement();
}

// ENTER SUBMENU TRANSITION

EnterSubmenuTransition(menu, optionsstring)
{
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Update (Header)                                                                                 
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (menu != self.menu.currentmenu)
        self.menuheader SetShader(self.menu.headershader[menu], 240, 70); 

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Update (Title)                                                                                 
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (self.menutitle.text != menu)
    {
        if (IsSubStr(menu, "$&"))
            self.menutitle SetElementText(StrTok(menu, "$&")[0]);
        else
            self.menutitle SetElementText(menu);
    }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Update (Options)                                                                                
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (!IsDefined(self.menu.optionshader[menu]) && self.menuopen && menu != self.menu.currentmenu) 
    {
        // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
        //┃ Remove Shader Scroller  
        //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        foreach (shader in self.menuscrollshader)
            shader DestroyElement();
        
        // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
        //┃ No Transition  
        //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━   

        if (self.menuoptions.y != -315)
        {
            self.menuoptions.y = -315;
            self.menuoptions SetElementText(optionsstring);
        }

        // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
        //┃ Transition  
        //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━  

        else
        {
            self.menuoptions FadeOverTime(0.1);
            self.menuoptions.alpha = 0; 
            self.menuoptions MoveOverTime(0.1);
            self.menuoptions.x = -300; 
            wait 0.1;
            self.menuoptions SetElementText(optionsstring);
            self.menuoptions FadeOverTime(0.2);
            self.menuoptions.alpha = 1;
            self.menuoptions.x = -100;
            self.menuoptions MoveOverTime(0.2);
            self.menuoptions.x = -200; 
        }
    }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Update (Shader Options)                                                                                
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    else if (IsDefined(self.menu.optionshader[menu]) && self.menuopen)
    { 
        if (self.menuoptions.y != -332)
            self.menuoptions.y = -332;
    }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Update (Options)                                                                                
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    else
        self.menuoptions SetElementText(optionsstring);
}

// EXIT SUBMENU TRANSITION

ExitSubmenuTransition(menu, optionsstring)
{
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Update (Header)                                                                                
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (menu != self.menu.currentmenu)
        self.menuheader SetShader(self.menu.headershader[menu], 240, 70); 

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Update (Title)                                                                                 
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (self.menutitle.text != menu)
    {
        if (IsSubStr(menu, "$&"))
            self.menutitle SetElementText(StrTok(menu, "$&")[0]);
        else
            self.menutitle SetElementText(menu);
    }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Update (Options)                                                                                 
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (!IsDefined(self.menu.optionshader[menu]) && self.menuopen && menu != self.menu.currentmenu)
    {
        // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
        //┃ Remove Shader  Scroller  
        //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 

        foreach (shader in self.menuscrollshader)
            shader DestroyElement();
          
        // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
        //┃ No Transition   
        //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 

        if (self.menuoptions.y != -315)
        {
            self.menuoptions.y = -315;
            self.menuoptions SetElementText(optionsstring);
        }

        // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
        //┃ Transition   
        //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 

        else
        {
            self.menuoptions FadeOverTime(0.1);
            self.menuoptions.alpha = 0; 
            self.menuoptions MoveOverTime(0.1);
            self.menuoptions.x = -100; 
            wait 0.1;
            self.menuoptions SetElementText(optionsstring);
            self.menuoptions FadeOverTime(0.2);
            self.menuoptions.alpha = 1;
            self.menuoptions.x = -300;
            self.menuoptions MoveOverTime(0.2);
            self.menuoptions.x = -200;
        }
    }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Update (Shader Options)                                                                                 
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    else if (IsDefined(self.menu.optionshader[menu]) && self.menuopen)
    { 
        if (self.menuoptions.y != -332)
            self.menuoptions.y = -332;
    }
}

// MENU ENGINE ----

// MENU INITIALIZE

MenuInit()
{
    self Endon("disconnect");
    level Endon("game_ended");
    
    self.menuopen = false;
    self.menu = SpawnStruct();
    
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ How To Open Menu Hud                                                                              
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    self.openmenuinstructions = CreateText("Press [{+actionslot 1}] To Open Menu", "default", 1.5, "center", "center", "user_center", "user_bottom", 0, -20, undefined, 0, undefined, undefined, true, false, 0);
    self.openmenuinstructions FadeOverTime(1);
    self.openmenuinstructions.alpha = 1;
    wait 1;
    
    for (;;)
    {  
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Open                                                                              
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        if (self ActionSlotOneButtonPressed() && !self.menuopen && !IsDefined(self.usingmarket)) //Up Dpad
        {
            if (!self AdsButtonPressed() || !IsDefined(self.objectcontrol))
            {
                if (IsAlive(self))
                    self OpenTheMenu(self.status + " Menu");
            }
        }
        
        if (self.menuopen && !IsDefined(self.disablemenu))
        {
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Submenu Enter                                                                              
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (self ActionSlotFourButtonPressed()) //Right (Dpad)
            {
                // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
                //┃ Enter Sound    
                //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

                self PlaySoundToPlayer("cac_grid_equip_item", self);
                
                // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
                //┃ Read Option Function    
                //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

                self thread [[self.menu.function[self.menu.currentmenu][self.menu.scroller[self.menu.currentmenu]]]](self.menu.argument1[self.menu.currentmenu][self.menu.scroller[self.menu.currentmenu]], self.menu.argument2[self.menu.currentmenu][self.menu.scroller[self.menu.currentmenu]]);
            }

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Submenu Exit                                                                              
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (self ActionSlotThreeButtonPressed()) //Left (Dpad)
            {
                // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
                //┃ If Previous Submenu Exist    
                //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

                if (IsDefined(self.menu.previousmenu[self.menu.currentmenu]))
                {
                    // ______________________________________________
                    //| Exit Sound         
                    // ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

                    self PlaySoundToPlayer("cac_enter_cac", self);
            
                    // ______________________________________________
                    //| Update (Submenu)    
                    // ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

                    // self Submenu(self.menu.previousmenu[self.menu.currentmenu]);
                    checkedSubmenuPreviousMenu();
                }

                // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
                //┃ If Previous Submenu Doesn't Exist    
                //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

                else

                    // ______________________________________________
                    //| Close        
                    // ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

                    self CloseTheMenu(); 
                    
                wait 0.2;
            }
            
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Scrolling (Up / Down)                                                                              
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (self ActionSlotOneButtonPressed() || self ActionSlotTwoButtonPressed()) //Up / Down (Dpad)
            {   
                // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
                //┃ Scrolling Sound    
                //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

                self PlaySoundToPlayer("cac_grid_nav", self);
                
                // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
                //┃ Update (Scroller)   
                //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

                if (self ActionSlotOneButtonPressed())
                    self.menu.scroller[self.menu.currentmenu] --;
                else
                    self.menu.scroller[self.menu.currentmenu] ++;

                self UpdateScroller();
            }

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Close (Anywhere)                                                                              
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (self SecondaryOffHandButtonPressed()) //L2 Button
                self CloseTheMenu();
        }
        
        wait 0.05;
    }
}

// SUBMENU 

Submenu(menu)
{
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Setup (Options)                                                                              
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (!IsDefined(self.menu.optiontext))
        self MenuOptions();

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Update (Dynamic Submenu Options)                                                                               
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (IsDefined(self.menu.dynamic[menu]))
    {
        self.menu.dynamicmenuupdate = menu;
        self MenuOptions(); 
        self.menu.dynamicmenuupdate = undefined;
    }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Update                                                                              
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    self UpdateMenu(menu);
    self UpdateScroller();
}

// LISTING 

AddMenu(menu, previousmenu, shader, dynamic, optionshaderwidth, optionshaderheight, optionshaderhighlight)
{
    if (IsDefined(menu))
    {
        if (IsDefined(self.menu.optiontext[menu]) && IsDefined(self.menu.dynamicmenuupdate) && self.menu.dynamicmenuupdate != menu)
            return;
        if (IsDefined(self.menu.dynamicmenuupdate) && self.menu.dynamicmenuupdate == menu)
        {
            self.menu.optiontext[menu] = undefined;
            self.menu.optionshader[menu] = undefined;
            self.menu.function[menu] = undefined;
            self.menu.argument1[menu] = undefined;
            self.menu.argument2[menu] = undefined;
            
            if (IsDefined(self.menu.dynamic[menu]) && IsString(self.menu.dynamic[menu]))
            {
                if (self.menu.dynamic[menu] == "Reposition" || self.menu.dynamic[menu] == "Reset")
                {
                    self.menu.scroller[menu] = 0;
                    self.menu.currentpage[menu] = undefined;
                    self.menu.page[menu] = undefined;
                }
                if (self.menu.dynamic[menu] == "Reset")
                {
                    self.menu.previousmenu[menu] = undefined;
                    self.menu.headershader[menu] = undefined;
                    self.menu.optionshaderwidth[menu] = undefined;
                    self.menu.optionshaderheight[menu] = undefined;
                    self.menu.optionshaderhighlight[menu] = undefined;
                }
            }
        }

        self.menu.optiontext[menu] = [];
        
        if (!IsDefined(self.menu.scroller[menu]))
            self.menu.scroller[menu] = 0;
        if (IsDefined(previousmenu) && !IsDefined(self.menu.previousmenu[menu]))
            self.menu.previousmenu[menu] = previousmenu;
        if (IsDefined(shader) && !IsDefined(self.menu.headershader[menu]))
            self.menu.headershader[menu] = shader;
        else if (!IsDefined(self.menu.headershader[menu]))
            self.menu.headershader[menu] = "white";
        if (IsDefined(dynamic) && !IsDefined(self.menu.dynamic[menu]))
            self.menu.dynamic[menu] = true;
        if (IsDefined(optionshaderwidth) && !IsDefined(self.menu.optionshaderwidth[menu]))
            self.menu.optionshaderwidth[menu] = optionshaderwidth;
        if (IsDefined(optionshaderheight) && !IsDefined(self.menu.optionshaderheight[menu]))
            self.menu.optionshaderheight[menu] = optionshaderheight;
        if (IsDefined(optionshaderhighlight) && !IsDefined(self.menu.optionshaderhighlight[menu]))
            self.menu.optionshaderhighlight[menu] = optionshaderhighlight;
    }
}

AddOption(menu, text, function, argument1, argument2, optionshader)
{
    if (IsDefined(menu))
    {
        if (IsDefined(self.menu.dynamicmenuupdate) && self.menu.dynamicmenuupdate != menu)
            return;
        if (IsDefined(text))
            self.menu.optiontext[menu][ self.menu.optiontext[menu].size ] = text;
        else
            self.menu.optiontext[menu][ self.menu.optiontext[menu].size ] = "Error";
        if (IsDefined(function))
            self.menu.function[menu][ self.menu.optiontext[menu].size - 1 ] = function;
        if (IsDefined(argument1))
            self.menu.argument1[menu][ self.menu.optiontext[menu].size - 1 ] = argument1;
        if (IsDefined(argument2))
            self.menu.argument2[menu][ self.menu.optiontext[menu].size - 1 ] = argument2;
        if (IsDefined(optionshader))
            self.menu.optionshader[menu][ self.menu.optiontext[menu].size - 1 ] = optionshader;  
    }
}

// UPDATE MENU

UpdateMenu(menu)
{ 
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Update (Base)                                                                                 
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    self MenuBase(menu);
    
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Update (Pages)                                                                                
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (!IsDefined(self.menu.optionshader[menu]))
    {
        if (!IsDefined(self.menu.page[menu]))
        {
            // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
            //┃ Calculate Current Menus Total Amount Of Option Characters   
            //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 

            stringsize = 0;
            
            for (i = 0; i < 12; i ++)
            {
                if (IsDefined(self.menu.optiontext[menu][i]))
                    stringsize += (self.menu.optiontext[menu][i].size + "\n".size);
                else
                    break;
            }

            // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
            //┃ Calculate How Many Pages/Options Needed   
            //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 

            if (self.menu.optiontext[menu].size > 12 || stringsize > level.stringcharacterlimit)
            {
                stringsize = 0;
                optioncount = 0;
                self.menu.page[menu][0] = 0;
                self.menu.currentpage[menu] = 0;
                
                for (i = 0; i < self.menu.optiontext[menu].size; i ++)
                {           
                    if (optioncount < 12 && (stringsize + (self.menu.optiontext[menu][i].size + "\n".size)) < level.stringcharacterlimit)
                    {
                        stringsize += (self.menu.optiontext[menu][i].size + "\n".size);
                        optioncount ++;
                    }
                    else
                    {
                        stringsize = 0;
                        optioncount = 0;
                        self.menu.page[menu][self.menu.page[menu].size] = i;
                        i --;
                    }
                }
            }
        }
    }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Update (Options)                                                                                
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (!IsDefined(self.menu.optionshader[menu]))
    {
        string = "";
        
        // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
        //┃ Update (Pages) 
        //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 

        if (IsDefined(self.menu.page[menu]))
            page = self.menu.page[menu][ self.menu.currentpage[menu] ];
        else
            page = 0;
        if (IsDefined(self.menu.page[menu][self.menu.currentpage[menu] + 1]))
            optioncount = (self.menu.page[menu][self.menu.currentpage[menu] + 1]);
        else
            optioncount = self.menu.optiontext[menu].size;
          
        // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
        //┃ Update (Options Text)   
        //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 

        for (i = page; i < optioncount; i ++)
        {
            if (IsDefined(self.menu.optiontext[menu][i]))
                string += self.menu.optiontext[menu][i] + "\n";
            else
                break;
        }
    }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Submenu Enter (Transition)                                                                                
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (menu != self.menu.previousmenu[self.menu.currentmenu])
        self thread EnterSubmenuTransition(menu, string);

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Submenu Exit (Transition)                                                                                
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    else if (menu != self.menu.currentmenu && self.menuopen)
        self thread ExitSubmenuTransition(menu, string);   

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Update (Base Scale)                                                                                
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (!IsDefined(self.menu.optionshader[menu]))
    {
        optiongapsize = 18;
        optionsonscreen = Clamp((optioncount - page), 0, 12);
        offset = 18;
    }
    else
    {
        optiongapsize = self.menu.optionshaderheight[menu];
        optionsonscreen = Clamp(self.menu.optiontext[menu].size, 0, 4);
        offset = 25;
    }
        
    self.menubackground ScaleOverTime(0.2, 240, Int(((88 + (optiongapsize * optionsonscreen)) + offset)));
    self.menuleftborder ScaleOverTime(0.2, 3, Int(((88 + (optiongapsize * optionsonscreen)) + offset)));
    self.menurightborder ScaleOverTime(0.2, 3, Int(((88 + (optiongapsize * optionsonscreen)) + offset)));
    self.menubackground.height = Int(((88 + (optiongapsize * optionsonscreen)) + offset));
    
    if (IsDefined(self.menuuparrow))
    {
        self.menuuparrow MoveOverTime(0.2, -200, Int(((-315 + (optiongapsize * optionsonscreen)) + offset)));
        self.menuuparrow.y = Int(((-315 + (optiongapsize * optionsonscreen)) + offset));
        self.menudownarrow MoveOverTime(0.2, -200, Int(((-305 + (optiongapsize * optionsonscreen)) + offset)));
        self.menudownarrow.y = Int(((-305 + (optiongapsize * optionsonscreen)) + offset));
    }
    if (self.menuopen)
    {
        self.menucontrolsinstructions MoveOverTime(0.2);
        self.menucontrolsinstructions.y = Int(((-290 + (optiongapsize * optionsonscreen)) + offset));
    }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Update (Arrows)                                                                                
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (IsDefined(self.menu.optionshader[menu]) && self.menu.optiontext[menu].size > 4)
        usearrows = true;
    if (IsDefined(self.menu.page[menu]))
        usearrows = true;
    if (IsDefined(usearrows) && !IsDefined(self.menuuparrow))
    {
        self.menuuparrow = CreateShader("ui_scrollbar_arrow_up_a", "center", "center", "user_right", "user_bottom", -200, Int(((-315 + (optiongapsize * optionsonscreen)) + offset)), 7, 7, undefined, 1, true, false, 3);
        self.menudownarrow = CreateShader("ui_scrollbar_arrow_dwn_a", "center", "center", "user_right", "user_bottom", -200, Int(((-305 + (optiongapsize * optionsonscreen)) + offset)), 7, 7, undefined, 1, true, false, 3);
    }
    else if (!IsDefined(usearrows))
    {
        self.menudownarrow DestroyElement();
        self.menuuparrow DestroyElement();
    }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Update (Current Menu)                                                                                
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (self.menu.currentmenu != menu)
        self.menu.currentmenu = menu;
}

// UPDATE SCROLLER

UpdateScroller()
{
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Reset (Scroller To Start/End)                                                                                
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (self.menu.scroller[self.menu.currentmenu] < 0)
        self.menu.scroller[self.menu.currentmenu] = self.menu.optiontext[self.menu.currentmenu].size - 1;
    if (self.menu.scroller[self.menu.currentmenu] > self.menu.optiontext[self.menu.currentmenu].size - 1 || self.menu.optiontext[self.menu.currentmenu].size == 0)
        self.menu.scroller[self.menu.currentmenu] = 0; 

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Option Scrolling                                                                                
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (!IsDefined(self.menu.optionshader[self.menu.currentmenu]))
    {
        // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
        //┃ Update (Options / Pages) 
        //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 

        if (IsDefined(self.menu.page[self.menu.currentmenu]))
        {
            for (i = 0; i < self.menu.page[self.menu.currentmenu].size; i ++)
            {
                if (self.menu.currentpage[self.menu.currentmenu] != i && self.menu.scroller[self.menu.currentmenu] >= self.menu.page[self.menu.currentmenu][i] && self.menu.scroller[self.menu.currentmenu] < self.menu.page[self.menu.currentmenu][i + 1])
                {
                    self.menu.currentpage[self.menu.currentmenu] = i;
                    self UpdateMenu(self.menu.currentmenu);
                    break;
                }
            }
        }

        // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
        //┃ Update (Scroller)
        //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 

        if (IsDefined(self.menu.page[self.menu.currentmenu]))
            page = self.menu.page[self.menu.currentmenu][ self.menu.currentpage[self.menu.currentmenu] ];
        else
            page = 0;
        if (self.menuscroller.y != (-315 + ((self.menu.scroller[self.menu.currentmenu] - page) * 18)))
            self.menuscroller MoveOverTime(0.05);
        
        self.menuscroller.y = (-315 + ((self.menu.scroller[self.menu.currentmenu] - page) * 18));
    }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Shader Option Scrolling                                                                               
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    else
    {
        // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
        //┃ Update (Shader Options)
        //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 

        for (i = 0; i < 4; i ++)
        {
            if (IsDefined(self.menuscrollshader[i]) && IsDefined(self.menu.optionshader[self.menu.currentmenu][self.menu.scroller[self.menu.currentmenu] + i]))
                self.menuscrollshader[i] SetShader(self.menu.optionshader[self.menu.currentmenu][self.menu.scroller[self.menu.currentmenu] + i], self.menu.optionshaderwidth[self.menu.currentmenu], self.menu.optionshaderheight[self.menu.currentmenu]);
            if (!IsDefined(self.menuscrollshader[i]) && IsDefined(self.menu.optionshader[self.menu.currentmenu][self.menu.scroller[self.menu.currentmenu] + i]))
                self.menuscrollshader[i] = CreateShader(self.menu.optionshader[self.menu.currentmenu][self.menu.scroller[self.menu.currentmenu] + i], "center", "center", "user_right", "user_bottom", self.menuopen ? -200 : 500, -290 + (i * self.menu.optionshaderheight[self.menu.currentmenu]), self.menu.optionshaderwidth[self.menu.currentmenu], self.menu.optionshaderheight[self.menu.currentmenu], undefined, 0.3, true, false, 2);
            if (IsDefined(self.menuscrollshader[i]) && !IsDefined(self.menu.optionshader[self.menu.currentmenu][self.menu.scroller[self.menu.currentmenu] + i]))
                self.menuscrollshader[i] DestroyElement();
        }
            
        // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
        //┃ Highlight Selected Shader
        //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 

        self.menuscrollshader[0] ScaleOverTime(0.2, self.menu.optionshaderwidth[self.menu.currentmenu] + self.menu.optionshaderhighlight[self.menu.currentmenu], self.menu.optionshaderheight[self.menu.currentmenu] + self.menu.optionshaderhighlight[self.menu.currentmenu]);
        self.menuscrollshader[0] FadeOverTime(0.2);
        self.menuscrollshader[0].alpha = 1;
                                                                                         
        // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
        //┃ Update (Option Text)
        //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 

        self.menuoptions SetElementText(self.menu.optiontext[self.menu.currentmenu][self.menu.scroller[self.menu.currentmenu]]);  
        
        // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
        //┃ Update (Scroller)
        //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 

        if (self.menuscroller.y != -332)
            self.menuscroller MoveOverTime(0.05);
        
        self.menuscroller.y = -332;
    }
}

// MENU OPTIONS

PlayerBuyItem(rarity, item)
{
    //Defaults
    if (!IsDefined(rarity))
        rarity = GetItemRarities(item)[0];
    if (IsWeaponPrimary(item))
        itemid = GetWeaponStringID(item);
    else
        itemid = item;
        
    price = level.price[itemid];
    
    //If Has Item Already
    if (IsDefined(self.inventory[itemid]))
    {
        //If Too Much Consumable Stock
        if (!IsWeaponPrimary(item) && !IsWeaponEquipment(item) && self.inventory[itemid].quantity >= self GetItemStockSize(item))
        {
            self IPrintLn("^1Error: ^7Not Enough Inventory Space");
            return;
        }  
        //If Too Much Equipment Stock
        if (IsWeaponEquipment(item) && self GetModWeaponStock(item) >= self GetModWeaponStockSize(item))
        {
            self IPrintLn("^1Error: ^7Not Enough Inventory Space");
            return;
        }  
        //If Already Has Weapon
        if (IsWeaponPrimary(item))
        {
            self IPrintLn("^1Error: ^7You Already Have This Item");
            return;
        }
        if (self.points >= price)
        {
            self.points -= price; 
            
            //Consumables
            if (!IsWeaponPrimary(item) && !IsWeaponEquipment(item))
            {
                self.inventory[itemid].quantity ++;
                self IPrintLn("^2" + item + " ^7Purchased");
            }
            //Equipment
            if (IsWeaponEquipment(item))
            {
                self SetModWeaponStock(item, (self GetModWeaponStock(item) + 1));
                self IPrintLn("^2" + GetEquipmentDisplayName(item) + " ^7Purchased");
            }
            //Market Notify
            if (IsDefined(self.usingmarket))
                self.notifymarketitempurchase = itemid;
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
    }
    //If Doesn't Have Item And Inventory Has Space
    else if (self.inventory.size < self.inventoryitemlimit)
    {
        if (IsWeaponEquipment(item) && self GetWeaponsListEquipment().size > 0 && self GetModWeaponStock(self GetWeaponsListEquipment()[0]) > 0)
        {
            self IPrintLn("^1Error: ^7You Cannot Hold More Then One Type Of Equipment");
            return;
        }  
        if (self.points >= price)
        {
            self.points -= price;
            
            //Consumables/Equipment
            if (!IsWeaponPrimary(item))
                self GivePlayerItem(rarity, undefined, item, undefined, 1);
            //Weapons
            else
                self GivePlayerItem(rarity, undefined, item);
            //Consumables/Equipment/Weapons
            if (!IsWeaponPrimary(item) && !IsWeaponEquipment(item))
                self IPrintLn("^2" + item + " ^7Purchased");
            if (IsWeaponEquipment(item))
                self IPrintLn("^2" + GetEquipmentDisplayName(item) + " ^7Purchased");
            if (IsWeaponPrimary(item))
                self IPrintLn("^2" + GetWeaponDisplayName(item) + " ^7Purchased");
            //Market Notify
            if (IsDefined(self.usingmarket))
                self.notifymarketitempurchase = itemid;
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
    }
    else
        self IPrintLn("^1Error: ^7Not Enough Inventory Space");
}

DropCategoryItems(category)
{
    origin = (self GetOrigin() + ((AnglesToForward(self GetPlayerAngles())[0] * 100), (AnglesToForward(self GetPlayerAngles())[1] * 100), 100));
    
    foreach (item in level.mysteryboxitems)
    {
        if (GetWeaponCategory(item) == category)
            level thread SpawnItem(GetRandomRarity(), undefined, item, undefined, undefined, undefined, undefined, (origin + (RandomIntRange(-50, 50), RandomIntRange(-50, 50), 0)));
    }
}

GetOptionStatus(variable, value, undefinedstring, definedstring)
{
    if (!IsDefined(undefinedstring)){
        undefinedstring = " ^1OFF^7";
    }

    if (!IsDefined(definedstring)){
        definedstring = " ^2ON^7";
    }

    if (IsDefined(variable) && variable != 0)
    {
        if (!IsString(variable) && IsDefined(value) && value == variable){
            return " ^2" + variable + "^7";
        }

        if (!IsString(variable)){
            return definedstring;
        }

        if (IsString(variable) && IsDefined(value) && value == variable){
            return definedstring;
        }

        if (IsString(variable) && IsDefined(value) && value != variable){
            return undefinedstring;
        }    

        if (IsString(variable) && variable.size > 1 && !IsDefined(value)){
            return "^1" + variable + "^7";
        }

        if (variable == ""){
            return undefinedstring;
        }

        return definedstring;
    }

    if (IsDefined(variable) && variable == 0) {
        return undefinedstring;
    }    

    if (!IsDefined(variable)){
        return undefinedstring;
    }
}

RarityPriceMultiplier(rarity)
{
    if (rarity == "Common")
        return 1;
    if (rarity == "Uncommon")
        return 2;
    if (rarity == "Rare")
        return 4;
    if (rarity == "Epic")
        return 8;
    if (rarity == "Legendary")
        return 16;
}

GetWeaponShader(weapon)
{
    if (weapon == GetWeaponStringID("fiveseven_mp"))
        return "menu_mp_weapons_five_seven";
    if (weapon == GetWeaponStringID("fnp45_mp"))
        return "menu_mp_weapons_fnp45";
    if (weapon == GetWeaponStringID("beretta93r_mp"))
        return "menu_mp_weapons_baretta";
    if (weapon == GetWeaponStringID("judge_mp"))
        return "menu_mp_weapons_judge";
    if (weapon == GetWeaponStringID("kard_mp")) 
        return "menu_mp_weapons_kard";
    if (weapon == GetWeaponStringID("mp7_mp")) 
        return "menu_mp_weapons_mp7";
    if (weapon == GetWeaponStringID("pdw57_mp")) 
        return "menu_mp_weapons_ar57";
    if (weapon == GetWeaponStringID("vector_mp")) 
        return "menu_mp_weapons_kriss";
    if (weapon == GetWeaponStringID("insas_mp")) 
        return "menu_mp_weapons_insas";
    if (weapon == GetWeaponStringID("qcw05_mp")) 
        return "menu_mp_weapons_qcw";
    if (weapon == GetWeaponStringID("evoskorpion_mp")) 
        return "menu_mp_weapons_evoskorpion";
    if (weapon == GetWeaponStringID("peacekeeper_mp")) 
        return "menu_mp_weapons_pm";
    if (weapon == GetWeaponStringID("tar21_mp")) 
        return "menu_mp_weapons_tar21";
    if (weapon == GetWeaponStringID("type95_mp")) 
        return "menu_mp_weapons_type95";
    if (weapon == GetWeaponStringID("sig556_mp")) 
        return "menu_mp_weapons_sig556";
    if (weapon == GetWeaponStringID("sa58_mp")) 
        return "menu_mp_weapons_sa58";
    if (weapon == GetWeaponStringID("hk416_mp")) 
        return "menu_mp_weapons_hk416";
    if (weapon == GetWeaponStringID("scar_mp")) 
        return "menu_mp_weapons_scar";
    if (weapon == GetWeaponStringID("saritch_mp")) 
        return "menu_mp_weapons_saritch";
    if (weapon == GetWeaponStringID("xm8_mp")) 
        return "menu_mp_weapons_xm8";
    if (weapon == GetWeaponStringID("an94_mp")) 
        return "menu_mp_weapons_an94";
    if (weapon == GetWeaponStringID("870mcs_mp")) 
        return "menu_mp_weapons_870mcs";
    if (weapon == GetWeaponStringID("saiga12_mp")) 
        return "menu_mp_weapons_saiga12";
    if (weapon == GetWeaponStringID("ksg_mp")) 
        return "menu_mp_weapons_ksg";
    if (weapon == GetWeaponStringID("srm1216_mp")) 
        return "menu_mp_weapons_srm";
    if (weapon == GetWeaponStringID("mk48_mp")) 
        return "menu_mp_weapons_mk48";
    if (weapon == GetWeaponStringID("qbb95_mp")) 
        return "menu_mp_weapons_qbb95";
    if (weapon == GetWeaponStringID("lsat_mp")) 
        return "menu_mp_weapons_lsat";
    if (weapon == GetWeaponStringID("hamr_mp")) 
        return "menu_mp_weapons_hamr";
    if (weapon == GetWeaponStringID("svu_mp")) 
        return "menu_mp_weapons_svu";
    if (weapon == GetWeaponStringID("dsr50_mp")) 
        return "menu_mp_weapons_dsr1";
    if (weapon == GetWeaponStringID("ballista_mp")) 
        return "menu_mp_weapons_ballista";
    if (weapon == GetWeaponStringID("as50_mp")) 
        return "menu_mp_weapons_as50";
    if (weapon == GetWeaponStringID("smaw_mp")) 
        return "menu_mp_weapons_smaw";
    if (weapon == GetWeaponStringID("usrpg_mp"))
        return "menu_mp_weapons_rpg";
    if (weapon == GetWeaponStringID("m32_wager_mp")) 
        return "hud_ks_m32";
    if (weapon == GetWeaponStringID("riotshield_mp")) 
        return "menu_mp_weapons_riot_shield";
    if (weapon == GetWeaponStringID("knife_ballistic_mp")) 
        return "menu_mp_weapons_ballistic_knife";
    if (weapon == GetWeaponStringID("crossbow_mp")) 
        return "menu_mp_weapons_crossbow";
    if (weapon == GetWeaponStringID("minigun_wager_mp")) 
        return "hud_icon_minigun";
    if (weapon == "knife_mp" || weapon == "knife_held_mp")
        return "cac_mods_tact_knife";
}

PlayerBuyWeaponAttachment(attachment)
{
    //Defaults
    weapon = self GetDefaultCurrentWeapon();
    rarity = self.inventory[GetWeaponStringID(weapon)].rarity;
    upgrade = self.inventory[GetWeaponStringID(weapon)].upgrade;
    
    if (!IsWeaponDualWield(weapon))
        clip = self GetModWeaponClip(weapon);
        
    stock = self GetModWeaponStock(weapon);
    camo = self.inventory[GetWeaponStringID(weapon)].camo;
    reticle = self.inventory[GetWeaponStringID(weapon)].reticle;
    
    //If Weapon Already Has Attachment
    if (!WeaponHasAttachment(weapon, attachment))
    {
        //If Attachment Is Supported
        if (IsInArray(GetWeaponSupportedAttachments(weapon), attachment))
        {
            //If Attachment Doesn't Conflict With Current Attachments
            if (!WeaponAttachmentConflict(weapon, attachment))
            {
                //If There Isn't Too Many Current Attachments
                if (WeaponAttachmentCount(weapon) < 3 || attachment == "dw")
                {
                    if (self.points >= level.price[attachment])
                    {
                        self.points -= level.price[attachment];
                        self TakePlayerItem(weapon);
                        weapon = weapon + "+" + attachment;
                        
                        if (attachment == "dw")
                            weapon = StrTok(weapon, "_")[0] + "_dw_mp";
                        if (IsInArray(StrTok("acog,holo,dualoptic,reflex", ","), attachment))
                            reticle = RandomInt(38);

                        self GivePlayerItem(rarity, upgrade, weapon, clip, stock, camo, reticle, undefined);
                        self IPrintLn("^2" + GetAttachmentDisplayName(attachment) + " ^7Purchased Successfully");
                    }
                    else
                        self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
                }
                else
                    self IPrintLn("^1Error: ^7Maximum Amount Of Attachments Reached");
            }
            else
                self IPrintLn("^1Error: ^7Attachment Conflicts With Another");
        }
        else
            self IPrintLn("^1Error: ^7You Cannot Put This Attachment On This Weapon");
    }
    else
        self IPrintLn("^1Error: ^7You Already Have This Attachment");
}

StructureBlockDamageMonitor()
{
    self.health = level.buildingblockhealth;
    self SetCanDamage(true);
    
    while (IsDefined(self))
    {
        self Waittill("damage", damage, attacker);
        
        self.health -= damage;
        
        if (attacker.status == "Zombie")
            attacker.points += level.zombiepointsperstructuredamage;
        
        if (self.health > 0)
        {
            if (attacker.status == "Zombie")
                attacker IPrintLnBold("Block Damaged +^2$" + level.zombiepointsperstructuredamage + " ^7/ Block Health: ^1" + self.health);
            else
                attacker IPrintLnBold("Block Damaged / Block Health: ^1" + self.health);
        }
        else
        {
            attacker IPrintLnBold("Block Destroyed");
            self Unlink();
            self PhysicsLaunch(self GetOrigin(), (AnglesToForward(attacker GetPlayerAngles()) * RandomIntRange(5000, 10000)));
            self Waittill("stationary");
            self Delete();
            self = undefined;
        }
    }
}

PlayerCreateWall()
{
    level Endon("game_ended");
    
    if (GetEntArray("script_model", "classname").size <= level.scriptmodellimit)
    {
        if (self.points >= level.pricebuildingblock)
        {
            wait 0.5;
            centerblock = SpawnEntity("script_model", level.buildingblockplaceholdermodel, (self GetOrigin() + ((AnglesToForward(self GetPlayerAngles())[0] * 200), (AnglesToForward(self GetPlayerAngles())[1] * 200), 16.5)), (0, self.angles[1], 0));
            centerblock Hide();
            centerblock ShowToPlayer(self);
            centerblock NotSolid();
            blocks = [];
            length = 0;
            height = 0;
            self.disablemenu = true;
            self IPrintLn("Press [{+actionslot 1}]/[{+actionslot 2}]/[{+actionslot 3}]/[{+actionslot 4}] To Add/Substract Blocks");
            self IPrintLn("Hold [{+speed_throw}] To Free Cam");
            self IPrintLn("Press [{+melee}] Confirm/[{+smoke}] Exit Build");
           
            if (!IsDefined(self.structureconsole))
                self.structureconsole = CreateText(undefined, "objective", 2, "center", "center", "user_center", "user_center", 0, -180, undefined, 1, undefined, undefined, true, false, 0);
                                    
            self.structureconsole SetElementText("Wall: " + (blocks.size + 1) + " Blocks / ^2$" + (level.pricebuildingblock * (blocks.size + 1))); 
            
            while (IsAlive(self))
            {
                if (self ActionSlotOneButtonPressed() || self ActionSlotTwoButtonPressed() || self ActionSlotThreeButtonPressed() || self ActionSlotFourButtonPressed()) //Up Dpad / Down Dpad / Left Dpad / Right Dpad 
                {
                    if (self ActionSlotOneButtonPressed())
                    {
                        if (height < 0)
                            deleteblocks = true;   
                    }
                    else if (self ActionSlotTwoButtonPressed())
                    {
                        if (height > 0)
                            deleteblocks = true;  
                    }
                    else if (self ActionSlotThreeButtonPressed())
                    {
                        if (length > 0)
                            deleteblocks = true;
                    }
                    else if (self ActionSlotFourButtonPressed())
                    {
                        if (length < 0)
                            deleteblocks = true;
                    } 
                    if (IsDefined(deleteblocks))
                    {
                        if (self ActionSlotOneButtonPressed() || self ActionSlotTwoButtonPressed())
                            blockreferenceorigin = Int((centerblock GetOrigin()[2] + (33 * height)));
                        else if (self ActionSlotThreeButtonPressed())
                            blockreferenceorigin = (centerblock GetOrigin() + (AnglesToRight(centerblock.angles) * Abs((72 * length))));
                        else if (self ActionSlotFourButtonPressed())
                            blockreferenceorigin = (centerblock GetOrigin() + (AnglesToLeft(centerblock.angles) * Abs((72 * length))));  
                        if (!self ActionSlotOneButtonPressed() && !self ActionSlotTwoButtonPressed())
                            blockreferenceorigin = (Int(blockreferenceorigin[0]), Int(blockreferenceorigin[1]), 0);
                            
                        foreach (block in blocks)
                        {
                            if (!IsVec(blockreferenceorigin))
                                blockcheckorigin = Int(block GetOrigin()[2]);
                            else
                                blockcheckorigin = (Int(block GetOrigin()[0]), Int(block GetOrigin()[1]), 0);   

                            if (blockcheckorigin == blockreferenceorigin)
                            {
                                block Unlink();
                                block Delete();
                                block = undefined;
                            }
                        }  
                        
                        blocks = SortArray(blocks);

                        if (self ActionSlotOneButtonPressed() || self ActionSlotTwoButtonPressed())
                        {
                            if (height < 0)
                                height ++;
                            else
                                height --;
                        }
                        else if (self ActionSlotThreeButtonPressed() || self ActionSlotFourButtonPressed())   
                        {
                            if (length < 0)
                                length ++;
                            else
                                length --;
                        }
                            
                        deleteblocks = undefined;
                    }
                    else if (GetEntArray("script_model", "classname").size <= level.scriptmodellimit)
                    {
                        if (self ActionSlotOneButtonPressed())
                            height ++;
                        else if (self ActionSlotTwoButtonPressed())
                            height --;
                        else if (self ActionSlotThreeButtonPressed())
                            length --;
                        else if (self ActionSlotFourButtonPressed())
                            length ++;
                        if (self ActionSlotOneButtonPressed() || self ActionSlotTwoButtonPressed())
                        {
                            startinglength = 0;
                            startingheight = Abs(height);
                        }
                        else
                        {
                            startinglength = Abs(length);
                            startingheight = 0;
                        }
                            
                        for (l = startinglength; l < (Abs(length) + 1); l ++)
                        {
                            for (h = startingheight; h < (Abs(height) + 1); h ++)
                            {
                                if (height < 0)
                                    fixedheight = (h * -1);
                                else
                                    fixedheight = h;
                                if (length < 0)
                                    blockorigin = ((centerblock GetOrigin() + (AnglesToLeft(centerblock.angles) * Abs((72 * l)))) + (0, 0, (33 * fixedheight)));
                                else
                                    blockorigin = ((centerblock GetOrigin() + (AnglesToRight(centerblock.angles) * Abs((72 * l)))) + (0, 0, (33 * fixedheight)));
                                
                                blocks[blocks.size] = SpawnEntity("script_model", level.buildingblockplaceholdermodel, blockorigin, (0, centerblock.angles[1], 0));
                                blocks[blocks.size - 1] Hide();
                                blocks[blocks.size - 1] ShowToPlayer(self);
                                blocks[blocks.size - 1] NotSolid();
                                blocks[blocks.size - 1] LinkTo(centerblock);
                                
                                if (GetEntArray("script_model", "classname").size > level.scriptmodellimit)
                                    break;
                                
                            }
                        }
                    }
                    else
                        self IPrintLn("^1Error: ^7Maximum Amount of Script Models Exceeded");
                    
                    self.structureconsole SetElementText("Wall: " + (blocks.size + 1) + " Blocks / ^2$" + (level.pricebuildingblock * (blocks.size + 1))); 
                }
                if (self MeleeButtonPressed())// R3 Button
                {
                    blockcount = (blocks.size + 1);
                    price = (level.pricebuildingblock * blockcount);
                    
                    if (self.points >= price)
                    {
                        holdtime = 0;
                        
                        if (self.gamerank >= 6)
                            buildtime = (blockcount * (level.structurebuildtime / level.masterbuilderstructurebuildtimemultiplier));
                        else if (self.gamerank >= 2)    
                            buildtime = (blockcount * (level.structurebuildtime / level.apprenticecarpenterstructurebuildtimemultiplier));
                        else
                            buildtime = (blockcount * level.structurebuildtime);
                            
                        self.structurebuildprogressbar = self CreateProgressBar(0, buildtime, (1, 1, 1), (0, 0, 0));
                        
                        while (IsAlive(self) && Distance(centerblock GetOrigin(), self GetOrigin()) <= 1000 && !self SecondaryOffHandButtonPressed())
                        {
                            if (holdtime >= buildtime)
                            {
                                self.points -= price;
                                confirmedblockorigins = [];
                                confirmedblockorigins[confirmedblockorigins.size] = centerblock GetOrigin();
                                confirmedblockangles = (0, centerblock.angles[1], 0);
                                
                                foreach (block in blocks)
                                    confirmedblockorigins[confirmedblockorigins.size] = block GetOrigin();
                                foreach (block in blocks)
                                {
                                    block Unlink();
                                    block Delete();
                                    block = undefined;
                                }
                                
                                centerblock Delete();
                                blocks = [];
                                
                                foreach (origin in confirmedblockorigins)
                                {
                                    blocks[blocks.size] = SpawnEntity("script_model", level.buildingblockmodel, origin, confirmedblockangles);
                                    blocks[blocks.size - 1] thread StructureBlockDamageMonitor();
                                }
                            
                                self IPrintLn("^2Wall ^7Purchased Successfully");
                                
                                if (IsDefined(level.developermode))
                                {
                                    if (length < 0)
                                        furthestblockorigin = ((blocks[0] GetOrigin() + (AnglesToLeft(blocks[0].angles) * Abs((72 * length)))) + (0, 0, (33 * height)));
                                    else
                                        furthestblockorigin = ((blocks[0] GetOrigin() + (AnglesToRight(blocks[0].angles) * Abs((72 * length)))) + (0, 0, (33 * height)));
                                        
                                    self.structureconsole SetElementText("Wall: ^2(^7" + Ceil(blocks[0] GetOrigin()[0]) + "^2,^7 " + Ceil(blocks[0] GetOrigin()[1]) + "^2,^7 " + Ceil((blocks[0] GetOrigin()[2] - 16.5)) + "^2)^7, ^1(^7" + Ceil(furthestblockorigin[0]) + "^1,^7 " + Ceil(furthestblockorigin[1]) + "^1,^7 " + Ceil((furthestblockorigin[2] - 16.5)) + "^1)");
                                }
                                else
                                    self.structureconsole DestroyElement();
                
                                confirmed = true;
                                
                                break;
                            }
                            else
                                holdtime += 0.05;
                            
                            wait 0.05;    
                        }
                    
                        self.structurebuildprogressbar DestroyElement();
                    
                        if (IsDefined(confirmed))
                            break;
                    }
                    else
                        self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
                }
                if (!self AdsButtonPressed()) //L1 Button
                {
                    if (self GetOrigin() != previousorigin || self GetPlayerAngles() != previousangles)
                    {
                        centerblock.origin = (self GetOrigin() + ((AnglesToForward(self GetPlayerAngles())[0] * 200), (AnglesToForward(self GetPlayerAngles())[1] * 200), 16.5));
                        centerblock.angles = (0, self.angles[1], 0);
                        previousorigin = self GetOrigin();
                        previousangles = self GetPlayerAngles();             
                    }
                }
                if (self SecondaryOffHandButtonPressed()) //L2 Button
                    break;
                
                wait 0.01;
            }

            if (!IsAlive(self) || self SecondaryOffHandButtonPressed())
            {
                if (!IsDefined(confirmed))
                {
                    foreach (block in blocks)
                    {
                        block Unlink();
                        block Delete();
                        block = undefined;
                    }
                     
                    centerblock Delete();
                    self.structureconsole DestroyElement();
                }
            }
            
            wait 0.5;
            self.disablemenu = undefined;
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
    }
    else
        self IPrintLn("^1Error: ^7Maximum Amount of Script Models Exceeded");
}

PlayerCreateFloor()
{
    level Endon("game_ended");
    
    if (GetEntArray("script_model", "classname").size <= level.scriptmodellimit)
    {
        if (self.points >= level.pricebuildingblock)
        {
            wait 0.5;
            centerblock = SpawnEntity("script_model", level.buildingblockplaceholdermodel, (self GetOrigin() + ((AnglesToForward(self GetPlayerAngles())[0] * 200), (AnglesToForward(self GetPlayerAngles())[1] * 200), 16.5)), (0, self.angles[1], 0));
            centerblock Hide();
            centerblock ShowToPlayer(self);
            centerblock NotSolid();
            blocks = [];
            length = 0;
            width = 0;
            z = 16.5;
            self.disablemenu = true;
            self IPrintLn("Press [{+actionslot 1}]/[{+actionslot 2}]/[{+actionslot 3}]/[{+actionslot 4}] To Add/Substract Blocks");
            self IPrintLn("Press [{+usereload}]/[{+weapnext_inventory}] To Rotate Pitch");
            self IPrintLn("Hold [{+speed_throw}] To Free Cam");
            self IPrintLn("Press [{+melee}] Confirm/[{+smoke}] Exit Build");
           
            if (!IsDefined(self.structureconsole))
                self.structureconsole = CreateText(undefined, "objective", 2, "center", "center", "user_center", "user_center", 0, -180, undefined, 1, undefined, undefined, true, false, 0);
                                    
            self.structureconsole SetElementText("Floor: " + (blocks.size + 1) + " Blocks / ^2$" + (level.pricebuildingblock * (blocks.size + 1))); 
            
            while (IsAlive(self))
            {
                if (self ActionSlotOneButtonPressed() || self ActionSlotTwoButtonPressed() || self ActionSlotThreeButtonPressed() || self ActionSlotFourButtonPressed()) //Up Dpad / Down Dpad / Left Dpad / Right Dpad 
                {
                    if (self ActionSlotOneButtonPressed())
                    {
                        if (width < 0)
                            deleteblocks = true;   
                    }
                    else if (self ActionSlotTwoButtonPressed())
                    {
                        if (width > 0)
                            deleteblocks = true;  
                    }
                    else if (self ActionSlotThreeButtonPressed())
                    {
                        if (length > 0)
                            deleteblocks = true;
                    }
                    else if (self ActionSlotFourButtonPressed())
                    {
                        if (length < 0)
                            deleteblocks = true;
                    } 
                    if (IsDefined(deleteblocks))
                    {
                        if (self ActionSlotOneButtonPressed() || self ActionSlotTwoButtonPressed())
                            oppositedimension = length;
                        else if (self ActionSlotThreeButtonPressed() || self ActionSlotFourButtonPressed())
                        oppositedimension = width;
                                
                        for (d = 0; d < (Abs(oppositedimension) + 1); d ++)
                        {
                            if (self ActionSlotOneButtonPressed())
                            blockreferenceorigin = (centerblock GetOrigin() + (AnglesToBackward(centerblock.angles) * Abs((41 * width))));
                            else if (self ActionSlotTwoButtonPressed())
                            blockreferenceorigin = (centerblock GetOrigin() + (AnglesToForward(centerblock.angles) * Abs((41 * width))));
                            else if (self ActionSlotThreeButtonPressed())
                                blockreferenceorigin = (centerblock GetOrigin() + (AnglesToRight(centerblock.angles) * Abs((72 * length))));
                            else if (self ActionSlotFourButtonPressed())
                                blockreferenceorigin = (centerblock GetOrigin() + (AnglesToLeft(centerblock.angles) * Abs((72 * length))));  
                            if (self ActionSlotOneButtonPressed() || self ActionSlotTwoButtonPressed())  
                            {
                                if (length > 0)
                                    blockreferenceorigin += (AnglesToRight(centerblock.angles) * Abs((72 * d)));
                                else
                                    blockreferenceorigin += (AnglesToLeft(centerblock.angles) * Abs((72 * d)));
                            }
                            else if (self ActionSlotThreeButtonPressed() || self ActionSlotFourButtonPressed())
                            {
                                if (width > 0)
                                    blockreferenceorigin += (AnglesToForward(centerblock.angles) * Abs((41 * d)));
                                else
                                    blockreferenceorigin += (AnglesToBackward(centerblock.angles) * Abs((41 * d)));
                            }    
                            
                            blockreferenceorigin = (Int(blockreferenceorigin[0]), Int(blockreferenceorigin[1]), 0);

                            foreach (block in blocks)
                            {
                                blockcheckorigin = (Int(block GetOrigin()[0]), Int(block GetOrigin()[1]), 0);   

                                if (blockcheckorigin == blockreferenceorigin)
                                {
                                    block Unlink();
                                    block Delete();
                                    block = undefined;
                                }
                            }  
                        }
                        
                        blocks = SortArray(blocks);

                        if (self ActionSlotOneButtonPressed() || self ActionSlotTwoButtonPressed())
                        {
                            if (width < 0)
                                width ++;
                            else
                                width --;
                        }
                        else if (self ActionSlotThreeButtonPressed() || self ActionSlotFourButtonPressed())   
                        {
                            if (length < 0)
                                length ++;
                            else
                                length --;
                        }
                            
                        deleteblocks = undefined;
                    }
                    else if (GetEntArray("script_model", "classname").size <= level.scriptmodellimit)
                    {
                        if (self ActionSlotOneButtonPressed())
                            width ++;
                        else if (self ActionSlotTwoButtonPressed())
                            width --;
                        else if (self ActionSlotThreeButtonPressed())
                            length --;
                        else if (self ActionSlotFourButtonPressed())
                            length ++;
                        if (self ActionSlotOneButtonPressed() || self ActionSlotTwoButtonPressed())
                        {
                            startinglength = 0;
                            startingwidth = Abs(width);
                        }
                        else
                        {
                            startinglength = Abs(length);
                            startingwidth = 0;
                        }
                          
                        for (l = startinglength; l < (Abs(length) + 1); l ++)
                        {
                            for (w = startingwidth; w < (Abs(width) + 1); w ++)
                            {
                                blockorigin = centerblock GetOrigin();
                                
                                if (width < 0)
                                    blockorigin += (AnglesToBackward(centerblock.angles) * Abs((41 * w)));
                                else
                                    blockorigin += (AnglesToForward(centerblock.angles) * Abs((41 * w)));
                                if (length < 0)
                                    blockorigin += (AnglesToLeft(centerblock.angles) * Abs((72 * l)));
                                else
                                    blockorigin += (AnglesToRight(centerblock.angles) * Abs((72 * l)));
                                
                                blocks[blocks.size] = SpawnEntity("script_model", level.buildingblockplaceholdermodel, blockorigin, centerblock.angles);
                                blocks[blocks.size - 1] Hide();
                                blocks[blocks.size - 1] ShowToPlayer(self);
                                blocks[blocks.size - 1] NotSolid();
                                blocks[blocks.size - 1] LinkTo(centerblock);
                                
                                if (GetEntArray("script_model", "classname").size > level.scriptmodellimit)
                                    break;
                            }
                        }
                    }
                    else
                        self IPrintLn("^1Error: ^7Maximum Amount of Script Models Exceeded");
                    
                    self.structureconsole SetElementText("Floor: " + (blocks.size + 1) + " Blocks / ^2$" + (level.pricebuildingblock * (blocks.size + 1))); 
                }
                if (self UseButtonPressed()) //Square Button
                    centerblock.angles += (5, 0, 0);
                if (self ChangeSeatButtonPressed()) //Triangle Button
                    centerblock.angles -= (5, 0, 0);
                if (self MeleeButtonPressed())// R3 Button
                {
                    blockcount = (blocks.size + 1);
                    price = (level.pricebuildingblock * blockcount);
                    
                    if (self.points >= price)
                    {
                        holdtime = 0;
                        
                        if (self.gamerank >= 6)
                            buildtime = (blockcount * (level.structurebuildtime / level.masterbuilderstructurebuildtimemultiplier));
                        else if (self.gamerank >= 2)    
                            buildtime = (blockcount * (level.structurebuildtime / level.apprenticecarpenterstructurebuildtimemultiplier));
                        else
                            buildtime = (blockcount * level.structurebuildtime);
                            
                        self.structurebuildprogressbar = self CreateProgressBar(0, buildtime, (1, 1, 1), (0, 0, 0));
                        
                        while (IsAlive(self) && Distance(centerblock GetOrigin(), self GetOrigin()) <= 1000 && !self SecondaryOffHandButtonPressed())
                        {
                            if (holdtime >= buildtime)
                            {
                                self.points -= price;
                                confirmedblockorigins = [];
                                confirmedblockorigins[confirmedblockorigins.size] = centerblock GetOrigin();
                                confirmedblockangles = centerblock.angles;
                                
                                foreach (block in blocks)
                                    confirmedblockorigins[confirmedblockorigins.size] = block GetOrigin();
                                foreach (block in blocks)
                                {
                                    block Unlink();
                                    block Delete();
                                    block = undefined;
                                }
                                
                                centerblock Delete();
                                blocks = [];
                                
                                foreach (origin in confirmedblockorigins)
                                {
                                    blocks[blocks.size] = SpawnEntity("script_model", level.buildingblockmodel, origin, confirmedblockangles);
                                    blocks[blocks.size - 1] thread StructureBlockDamageMonitor();
                                }
                            
                                self IPrintLn("^2Floor ^7Purchased Successfully");
                                
                                if (IsDefined(level.developermode))
                                {
                                    furthestblockorigin = blocks[0] GetOrigin();
                                    
                                    if (width < 0)
                                        furthestblockorigin += (AnglesToBackward(blocks[0].angles) * Abs((41 * width)));
                                    else
                                        furthestblockorigin += (AnglesToForward(blocks[0].angles) * Abs((41 * width)));
                                    if (length < 0)
                                        furthestblockorigin += (AnglesToLeft(blocks[0].angles) * Abs((72 * length)));
                                    else
                                        furthestblockorigin += (AnglesToRight(blocks[0].angles) * Abs((72 * length)));
                                    
                                    if (confirmedblockangles[0] != 0)  
                                        type = "Ramp";
                                    else
                                        type = "Grid";
                                        
                                    self.structureconsole SetElementText(type + ": ^2(^7" + Ceil(blocks[0] GetOrigin()[0]) + "^2,^7 " + Ceil(blocks[0] GetOrigin()[1]) + "^2,^7 " + Ceil((blocks[0] GetOrigin()[2] - z)) + "^2)^7, ^1(^7" + Ceil(furthestblockorigin[0]) + "^1,^7 " + Ceil(furthestblockorigin[1]) + "^1,^7 " + Ceil((furthestblockorigin[2] - 16.5)) + "^1)^7, (" + Ceil(blocks[0].angles[0]) + ", " + Ceil(blocks[0].angles[1]) + ", " + Ceil(blocks[0].angles[2]) + ")");
                                }
                                else
                                    self.structureconsole DestroyElement();
                
                                confirmed = true;
                                
                                break;
                            }
                            else
                                holdtime += 0.05;
                            
                            wait 0.05;    
                        }
                    
                        self.structurebuildprogressbar DestroyElement();
                    
                        if (IsDefined(confirmed))
                            break;
                    }
                    else
                        self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
                }
                if (!self AdsButtonPressed()) //L1 Button
                {
                    if (self GetOrigin() != previousorigin || self GetPlayerAngles() != previousangles)
                    {
                        if (centerblock.angles[0] != 0)
                            z = 0;
                        else
                            z = 16.5;
                            
                        centerblock.origin = (self GetOrigin() + ((AnglesToForward(self GetPlayerAngles())[0] * 200), (AnglesToForward(self GetPlayerAngles())[1] * 200), z));
                        centerblock.angles = (centerblock.angles[0], self.angles[1], centerblock.angles[2]);
                        previousorigin = self GetOrigin();
                        previousangles = self GetPlayerAngles();             
                    }
                }
                if (self SecondaryOffHandButtonPressed()) //L2 Button
                    break;
                
                wait 0.01;
            }

            if (!IsAlive(self) || self SecondaryOffHandButtonPressed())
            {
                if (!IsDefined(confirmed))
                {
                    foreach (block in blocks)
                    {
                        block Unlink();
                        block Delete();
                        block = undefined;
                    }
                     
                    centerblock Delete();
                    self.structureconsole DestroyElement();
                }
            }
            
            wait 0.5;
            self.disablemenu = undefined;
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
    }
    else
        self IPrintLn("^1Error: ^7Maximum Amount of Script Models Exceeded");
}

ElevatorMonitor(start, end, duration, waitduration)
{
    while (IsDefined(self))
    {
        if (self GetOrigin() == start)
            self MoveTo(end, duration);
        if (self GetOrigin() == end)    
            self MoveTo(start, duration);
            
        wait duration;
        wait waitduration;
    }
}

PlayerCreateElevator()
{
    level Endon("game_ended");
    
    if (GetEntArray("script_model", "classname").size <= level.scriptmodellimit)
    {
        if (self.points >= level.pricebuildingblock)
        {
            wait 0.5;
            centerblock = SpawnEntity("script_model", level.buildingblockplaceholdermodel, (self GetOrigin() + ((AnglesToForward(self GetPlayerAngles())[0] * 200), (AnglesToForward(self GetPlayerAngles())[1] * 200), 16.5)), (0, self.angles[1], 0));
            centerblock Hide();
            centerblock ShowToPlayer(self);
            centerblock NotSolid();
            blocks = [];
            length = 0;
            width = 0;
            self.disablemenu = true;
            self IPrintLn("Press [{+actionslot 1}]/[{+actionslot 2}]/[{+actionslot 3}]/[{+actionslot 4}] To Add/Substract Blocks");
            self IPrintLn("Hold [{+speed_throw}] To Free Cam");
            self IPrintLn("Press [{+melee}] Confirm/[{+smoke}] Exit Build");
           
            if (!IsDefined(self.structureconsole))
                self.structureconsole = CreateText(undefined, "objective", 2, "center", "center", "user_center", "user_center", 0, -180, undefined, 1, undefined, undefined, true, false, 0);
                                    
            self.structureconsole SetElementText("Elevator: " + (blocks.size + 1) + " Blocks / ^2$" + (level.pricebuildingblock * (blocks.size + 1))); 
            
            while (IsAlive(self))
            {
                if (!IsDefined(startlocation))
                {
                    if (self ActionSlotOneButtonPressed() || self ActionSlotTwoButtonPressed() || self ActionSlotThreeButtonPressed() || self ActionSlotFourButtonPressed()) //Up Dpad / Down Dpad / Left Dpad / Right Dpad 
                    {
                        if (self ActionSlotOneButtonPressed())
                        {
                            if (width < 0)
                                deleteblocks = true;   
                        }
                        else if (self ActionSlotTwoButtonPressed())
                        {
                            if (width > 0)
                                deleteblocks = true;  
                        }
                        else if (self ActionSlotThreeButtonPressed())
                        {
                            if (length > 0)
                                deleteblocks = true;
                        }
                        else if (self ActionSlotFourButtonPressed())
                        {
                            if (length < 0)
                                deleteblocks = true;
                        } 
                        if (IsDefined(deleteblocks))
                        {
                            if (self ActionSlotOneButtonPressed() || self ActionSlotTwoButtonPressed())
                            oppositedimension = length;
                            else if (self ActionSlotThreeButtonPressed() || self ActionSlotFourButtonPressed())
                            oppositedimension = width;
                                    
                            for (d = 0; d < (Abs(oppositedimension) + 1); d ++)
                            {
                                if (self ActionSlotOneButtonPressed())
                                blockreferenceorigin = (centerblock GetOrigin() + (AnglesToBackward(centerblock.angles) * Abs((41 * width))));
                                else if (self ActionSlotTwoButtonPressed())
                                blockreferenceorigin = (centerblock GetOrigin() + (AnglesToForward(centerblock.angles) * Abs((41 * width))));
                                else if (self ActionSlotThreeButtonPressed())
                                blockreferenceorigin = (centerblock GetOrigin() + (AnglesToRight(centerblock.angles) * Abs((72 * length))));
                                else if (self ActionSlotFourButtonPressed())
                                blockreferenceorigin = (centerblock GetOrigin() + (AnglesToLeft(centerblock.angles) * Abs((72 * length))));  
                                if (self ActionSlotOneButtonPressed() || self ActionSlotTwoButtonPressed())  
                                {
                                    if (length > 0)
                                        blockreferenceorigin += (AnglesToRight(centerblock.angles) * Abs((72 * d)));
                                    else
                                        blockreferenceorigin += (AnglesToLeft(centerblock.angles) * Abs((72 * d)));
                                }
                                else if (self ActionSlotThreeButtonPressed() || self ActionSlotFourButtonPressed())
                                {
                                    if (width > 0)
                                        blockreferenceorigin += (AnglesToForward(centerblock.angles) * Abs((41 * d)));
                                    else
                                        blockreferenceorigin += (AnglesToBackward(centerblock.angles) * Abs((41 * d)));
                                }    
                                
                                blockreferenceorigin = (Int(blockreferenceorigin[0]), Int(blockreferenceorigin[1]), 0);

                                foreach (block in blocks)
                                {
                                    blockcheckorigin = (Int(block GetOrigin()[0]), Int(block GetOrigin()[1]), 0);   

                                    if (blockcheckorigin == blockreferenceorigin)
                                    {
                                        block Unlink();
                                        block Delete();
                                        block = undefined;
                                    }
                                }  
                            }
                            
                            blocks = SortArray(blocks);

                            if (self ActionSlotOneButtonPressed() || self ActionSlotTwoButtonPressed())
                            {
                                if (width < 0)
                                    width ++;
                                else
                                    width --;
                            }
                            else if (self ActionSlotThreeButtonPressed() || self ActionSlotFourButtonPressed())   
                            {
                                if (length < 0)
                                    length ++;
                                else
                                    length --;
                            }
                                
                            deleteblocks = undefined;
                        }
                        else if (GetEntArray("script_model", "classname").size <= level.scriptmodellimit)
                        {
                            if (self ActionSlotOneButtonPressed())
                                width ++;
                            else if (self ActionSlotTwoButtonPressed())
                                width --;
                            else if (self ActionSlotThreeButtonPressed())
                                length --;
                            else if (self ActionSlotFourButtonPressed())
                                length ++;
                            if (self ActionSlotOneButtonPressed() || self ActionSlotTwoButtonPressed())
                            {
                                startinglength = 0;
                                startingwidth = Abs(width);
                            }
                            else
                            {
                                startinglength = Abs(length);
                                startingwidth = 0;
                            }
                              
                            for (l = startinglength; l < (Abs(length) + 1); l ++)
                            {
                                for (w = startingwidth; w < (Abs(width) + 1); w ++)
                                {
                                    blockorigin = centerblock GetOrigin();
                                    
                                    if (width < 0)
                                        blockorigin += (AnglesToBackward(centerblock.angles) * Abs((41 * w)));
                                    else
                                        blockorigin += (AnglesToForward(centerblock.angles) * Abs((41 * w)));
                                    if (length < 0)
                                        blockorigin += (AnglesToLeft(centerblock.angles) * Abs((72 * l)));
                                    else
                                        blockorigin += (AnglesToRight(centerblock.angles) * Abs((72 * l)));
                                    
                                    blocks[blocks.size] = SpawnEntity("script_model", level.buildingblockplaceholdermodel, blockorigin, centerblock.angles);
                                    blocks[blocks.size - 1] Hide();
                                    blocks[blocks.size - 1] ShowToPlayer(self);
                                    blocks[blocks.size - 1] NotSolid();
                                    blocks[blocks.size - 1] LinkTo(centerblock);
                                    
                                    if (GetEntArray("script_model", "classname").size > level.scriptmodellimit)
                                        break;
                                }
                            }
                        }
                        else
                            self IPrintLn("^1Error: ^7Maximum Amount of Script Models Exceeded");
                        
                        self.structureconsole SetElementText("Floor: " + (blocks.size + 1) + " Blocks / ^2$" + (level.pricebuildingblock * (blocks.size + 1))); 
                    }
                }
                if (self MeleeButtonPressed())// R3 Button
                {
                    blockcount = (blocks.size + 1);
                    price = (level.pricebuildingblock * blockcount);
                    
                    if (self.points >= price)
                    {
                        if (!IsDefined(startlocation))
                        {
                            confirmedblockorigins = [];
                            confirmedblockorigins[confirmedblockorigins.size] = centerblock GetOrigin();
                            confirmedblockangles = centerblock.angles;
                                        
                            foreach (block in blocks)
                                confirmedblockorigins[confirmedblockorigins.size] = block GetOrigin();
                                
                            self IPrintLn("Start Location Set");
                            wait 1;
                            self IPrintLn("Press [{+melee}] To Confirm End Location");
                            startlocation = true;
                        }
                        else
                        {
                            endlocation = centerblock GetOrigin();
                            holdtime = 0;
                            
                            if (self.gamerank >= 6)
                                buildtime = (blockcount * (level.structurebuildtime / level.masterbuilderstructurebuildtimemultiplier));
                            else if (self.gamerank >= 2)    
                                buildtime = (blockcount * (level.structurebuildtime / level.apprenticecarpenterstructurebuildtimemultiplier));
                            else
                                buildtime = (blockcount * level.structurebuildtime);
                                
                            self.structurebuildprogressbar = self CreateProgressBar(0, buildtime, (1, 1, 1), (0, 0, 0));
                            
                            while (IsAlive(self) && Distance(centerblock GetOrigin(), self GetOrigin()) <= 1000 && !self SecondaryOffHandButtonPressed())
                            {
                                if (holdtime >= buildtime)
                                {
                                    self.points -= price;

                                    foreach (block in blocks)
                                    {
                                        block Unlink();
                                        block Delete();
                                        block = undefined;
                                    }
                                    
                                    centerblock Delete();
                                    blocks = [];
                                    blockscenter = Spawn("script_origin", confirmedblockorigins[0]); 

                                    foreach (origin in confirmedblockorigins)
                                    {
                                        blocks[blocks.size] = SpawnEntity("script_model", level.buildingblockmodel, origin, confirmedblockangles);
                                        blocks[blocks.size - 1] thread StructureBlockDamageMonitor();
                                        blocks[blocks.size - 1] LinkTo(blockscenter);
                                    }
                                     
                                    blockscenter thread ElevatorMonitor(blockscenter GetOrigin(), endlocation, (Distance(blockscenter GetOrigin(), endlocation) / (level.playerelevatorspeed * 100)), level.playerelevatorwaittime);
                                    self IPrintLn("^2Elevator ^7Purchased Successfully");
                                    
                                    if (IsDefined(level.developermode))
                                        self.structureconsole SetElementText("Elevator: ^2(^7" + Ceil(blocks[0] GetOrigin()[0]) + "^2,^7 " + Ceil(blocks[0] GetOrigin()[1]) + "^2,^7 " + Ceil((blocks[0] GetOrigin()[2] - 16.5)) + "^2)^7, ^1(^7" + Ceil(endlocation[0]) + "^1,^7 " + Ceil(endlocation[1]) + "^1,^7 " + Ceil((endlocation[2] - 16.5)) + "^1)^7, (" + Ceil(blocks[0].angles[0]) + ", " + Ceil(blocks[0].angles[1]) + ", " + Ceil(blocks[0].angles[2]) + ")");
                                    else
                                        self.structureconsole DestroyElement();
                    
                                    confirmed = true;
                                    
                                    break;
                                }
                                else
                                    holdtime += 0.05;
                                
                                wait 0.05;    
                            }
                        
                            self.structurebuildprogressbar DestroyElement();
                        
                            if (IsDefined(confirmed))
                                break;
                        }
                    }
                    else
                        self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
                }
                if (!self AdsButtonPressed()) //L1 Button
                {
                    if (self GetOrigin() != previousorigin || self GetPlayerAngles() != previousangles)
                    {
                        centerblock.origin = (self GetOrigin() + ((AnglesToForward(self GetPlayerAngles())[0] * 200), (AnglesToForward(self GetPlayerAngles())[1] * 200), 16.5));
                        centerblock.angles = (centerblock.angles[0], self.angles[1], centerblock.angles[2]);
                        previousorigin = self GetOrigin();
                        previousangles = self GetPlayerAngles();             
                    }
                }
                if (self SecondaryOffHandButtonPressed()) //L2 Button
                    break;
                
                wait 0.01;
            }

            if (!IsAlive(self) || self SecondaryOffHandButtonPressed())
            {
                if (!IsDefined(confirmed))
                {
                    foreach (block in blocks)
                    {
                        block Unlink();
                        block Delete();
                        block = undefined;
                    }
                     
                    centerblock Delete();
                    self.structureconsole DestroyElement();
                }
            }
            
            wait 0.5;
            self.disablemenu = undefined;
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
    }
    else
        self IPrintLn("^1Error: ^7Maximum Amount of Script Models Exceeded");
}

CreateDoor(model, open, close, length, height, lengthspace, heightspace, duration, health, initialdirection)
{
    if (!IsDefined(model))
        model = level.buildingblockmodel;
    if (IsDefined(initialdirection))
    {
       if (initialdirection == "left")
            direction = VectorToAngles(open - close);
        else
            direction = VectorToAngles(close - open); 
    }
    else
    {
        if (length > 0)
            direction = VectorToAngles(open - close);
        else
            direction = VectorToAngles(close - open);
    }

    door = Spawn("script_origin", open);

   if (!IsDefined(direction))
        doorcenterorigin = ((open + (AnglesToForward(direction) * (lengthspace / 2))) + (AnglesToForward(direction) * ((lengthspace * length) / 2)));
    else
        doorcenterorigin = (open + (AnglesToForward(direction) * ((lengthspace * length) / 2)));

    door.center = Spawn("script_origin", doorcenterorigin);
    door.center LinkTo(door);
    door.health = health;

    for (l = 0; l < Abs(length); l ++)
    {
        for (h = 0; h < Abs(height); h ++)
        {
            if (height < 0)
                fixedheight = (h * -1);
            else
                fixedheight = h;
           
            blockorigin = open;

            if (!IsDefined(initialdirection))
                blockorigin += (AnglesToForward(direction) * (lengthspace / 2));

            blockorigin += (AnglesToForward(direction) * (lengthspace * l));
            blockorigin += (0, 0, ((heightspace * 2) * fixedheight));                        
            block = SpawnEntity("script_model", model, blockorigin, ((90, 90, 0) + (0, direction[1], direction[2])));
            block LinkTo(door);
            block thread DoorDamageMonitor(door, open, close, duration);
        }
    }

    door thread DoorHudMonitor(open, close, length, lengthspace);
    door thread DoorRepairMonitor(health, length, lengthspace);
}

DoorHudMonitor(open, close, length, lengthspace)
{
    level Endon("game_ended");
    
    number = level.amountofdoors;
    level.amountofdoors ++;
    
    while (IsDefined(self))
    {
        foreach (player in level.players)
        {
            if (IsAlive(player) && Distance(self.center GetOrigin(), player GetOrigin()) <= ((length * lengthspace) / 2) + 20)
            {   
                if (!IsDefined(self.destroyed) && IsDefined(player.doormessage[number]) && player.doormessage[number].text != "Melee The Door To ^2Open^7 / Press [{+usereload}] To Show Current Door Health" && player.doormessage[number].text != "Melee The Door To ^1Close^7 / Press [{+usereload}] To Show Current Door Health")
                    player.doormessage[number] DestroyElement();
                if (IsDefined(self.destroyed) && IsDefined(player.doormessage[number]) && !IsDefined(self.beingrepaired) && player.doormessage[number].text != "Door Is ^1Broken^7 / Hold [{+melee}] To Repair" && player.doormessage[number].text != "Door Is ^1Broken")
                    player.doormessage[number] DestroyElement();
                if (IsDefined(player.doormessage[number]) && self GetOrigin() != open && self GetOrigin() != close)
                    player.doormessage[number] DestroyElement();
                if (IsDefined(self.destroyed) && IsDefined(player.doormessage[number]) && IsDefined(self.beingrepaired))
                    player.doormessage[number] DestroyElement();
                if (!IsDefined(self.destroyed) && !IsDefined(player.doormessage[number]) && player.status == "Human" && self GetOrigin() == close)
                    player.doormessage[number] = player CreateText("Melee The Door To ^2Open^7 / Press [{+usereload}] To Show Current Door Health", "objective", 1.5, "center", "center", "user_center", "user_center", 0, 100, undefined, 1, undefined, undefined, true, false, 0);
                if (!IsDefined(self.destroyed) && !IsDefined(player.doormessage[number]) && player.status == "Human" && self GetOrigin() == open)  
                    player.doormessage[number] = player CreateText("Melee The Door To ^1Close^7 / Press [{+usereload}] To Show Current Door Health", "objective", 1.5, "center", "center", "user_center", "user_center", 0, 100, undefined, 1, undefined, undefined, true, false, 0);
                if (IsDefined(self.destroyed) && !IsDefined(player.doormessage[number]) && !IsDefined(self.beingrepaired) && player.status == "Human")
                    player.doormessage[number] = player CreateText("Door Is ^1Broken^7 / Hold [{+melee}] To Repair", "objective", 1.5, "center", "center", "user_center", "user_center", 0, 100, undefined, 1, undefined, undefined, true, false, 0);
                if (IsDefined(self.destroyed) && !IsDefined(player.doormessage[number]) && !IsDefined(self.beingrepaired) && player.status == "Zombie")
                    player.doormessage[number] = player CreateText("Door Is ^1Broken", "objective", 1.5, "center", "center", "user_center", "user_center", 0, 100, undefined, 1, undefined, undefined, true, false, 0);
                if (!IsDefined(self.destroyed) && player UseButtonPressed())
                {
                    player IPrintLnBold("Door Health: ^1" + self.health);
                    wait 0.2;
                }   
            }
            else if (IsDefined(player.doormessage[number]))
                player.doormessage[number] DestroyElement();
        }
        
        wait 0.05;
    }
}

DoorDamageMonitor(door, open, close, duration)
{
    level Endon("game_ended");
    
    self SetCanDamage(true);
    
    while (IsDefined(self))
    {
        self Waittill("damage", damage, attacker, direction, point, type);
        
        if (!IsDefined(door.destroyed) && !IsDefined(door.moving) && attacker.status == "Human" && type == "MOD_MELEE")
        {
            door.moving = true;
            
            if (door GetOrigin() == open)
                door MoveTo(close, duration);
            if (door GetOrigin() == close)  
                door MoveTo(open, duration);
                
            wait duration;
            door.moving = undefined;
        }
        if (!IsDefined(door.destroyed) && attacker.status == "Zombie")
        {
            door.health -= damage;
            attacker.points += level.zombiepointsperstructuredamage;
            attacker IPrintLnBold("Door Damaged +^2$" + level.zombiepointsperstructuredamage + " ^7/ Door Health: ^1" + door.health);
        }
        if (!IsDefined(door.destroyed) && door.health <= 0)
        {
            door.destroyed = true;
            level Notify("door_destroyed");
            
            if (!IsDefined(door.moving) && door GetOrigin() != open)
                door MoveTo(open, duration);
        }
    }
}

DoorRepairMonitor(health, length, lengthspace)
{
    level Endon("game_ended");
    
    while (IsDefined(self))
    {
        level Waittill("door_destroyed");
        
        while (IsDefined(self.destroyed))
        {
            foreach (player in level.players)
            {
                if (IsAlive(player) && player.status == "Human" && Distance(self.center GetOrigin(), player GetOrigin()) <= ((length * lengthspace) / 2) + 20 && player MeleeButtonPressed())
                {
                    holdtime = 0;
                    self.beingrepaired = true;
                    
                    if (player.gamerank >= 6)
                        repairtime = (level.doorrepairtime / level.masterbuilderdoorrepairtimemultiplier);
                    else if (player.gamerank >= 2)
                        repairtime = (level.doorrepairtime / level.apprenticecarpenterdoorrepairtimemultiplier);
                    else
                        repairtime = level.doorrepairtime;
                        
                    player.repairdoorprogressbar = player CreateProgressBar(0, repairtime, (1, 1, 1), (0, 0, 0));
                    
                    while (IsDefined(self.destroyed) && IsAlive(player) && player.status == "Human" && Distance(self.center GetOrigin(), player GetOrigin()) <= ((length * lengthspace) / 2) + 20 && player MeleeButtonPressed())
                    {
                        if (holdtime >= repairtime)
                        {
                            if (player.gamerank >= 6)
                                self.health = (health * level.masterbuilderdoorhealthmultiplier);
                            else if (player.gamerank >= 2)
                                self.health = (health * level.apprenticecarpenterdoorhealthmultiplier);
                            else
                                self.health = health;
                                
                            self.destroyed = undefined;
                            player.points += (level.humanpointsperdoorrepair * level.pointsmultiplier);
                        }
                        else
                            holdtime += 0.05;
                        
                        wait 0.05;
                    }
                    
                    self.beingrepaired = undefined;
                    player.repairdoorprogressbar DestroyElement();
                }
            }
            
            wait 0.05;
        }
    }
}

PlayerCreateDoor()
{
    level Endon("game_ended");
    
    if (GetEntArray("script_model", "classname").size <= level.scriptmodellimit)
    {
        if (self.points >= level.pricebuildingblock)
        {
            wait 0.5;
            centerblock = SpawnEntity("script_model", level.buildingblockplaceholdermodel, (self GetOrigin() + ((AnglesToForward(self GetPlayerAngles())[0] * 200), (AnglesToForward(self GetPlayerAngles())[1] * 200), 16.5)), (0, self.angles[1], 0));
            centerblock Hide();
            centerblock ShowToPlayer(self);
            centerblock NotSolid();
            blocks = [];
            length = 0;
            height = 0;
            self.disablemenu = true;
            self IPrintLn("Press [{+actionslot 1}]/[{+actionslot 2}]/[{+actionslot 3}]/[{+actionslot 4}] To Add/Substract Blocks");
            self IPrintLn("Hold [{+speed_throw}] To Free Cam");
            self IPrintLn("Press [{+melee}] Confirm/[{+smoke}] Exit Build");
           
            if (!IsDefined(self.structureconsole))
                self.structureconsole = CreateText(undefined, "objective", 2, "center", "center", "user_center", "user_center", 0, -180, undefined, 1, undefined, undefined, true, false, 0);
                                    
                self.structureconsole SetElementText("Door: " + (blocks.size + 1) + " Blocks / ^2$" + (level.pricebuildingblock * (blocks.size + 1))); 
            
            while (IsAlive(self))
            {
                if (!IsDefined(startlocation))
                {
                    if (self ActionSlotOneButtonPressed() || self ActionSlotTwoButtonPressed() || self ActionSlotThreeButtonPressed() || self ActionSlotFourButtonPressed()) //Up Dpad / Down Dpad / Left Dpad / Right Dpad 
                    {
                        if (self ActionSlotOneButtonPressed())
                        {
                            if (height < 0)
                                deleteblocks = true;   
                        }
                        else if (self ActionSlotTwoButtonPressed())
                        {
                            if (height > 0)
                                deleteblocks = true;  
                        }
                        else if (self ActionSlotThreeButtonPressed())
                        {
                            if (length > 0)
                                deleteblocks = true;
                        }
                        else if (self ActionSlotFourButtonPressed())
                        {
                            if (length < 0)
                                deleteblocks = true;
                        } 
                        if (IsDefined(deleteblocks))
                        {
                            if (self ActionSlotOneButtonPressed() || self ActionSlotTwoButtonPressed())
                                blockreferenceorigin = Int((centerblock GetOrigin()[2] + (66 * height)));
                            else if (self ActionSlotThreeButtonPressed())
                                blockreferenceorigin = (centerblock GetOrigin() + (AnglesToRight(centerblock.angles) * Abs((72 * length))));
                            else if (self ActionSlotFourButtonPressed())
                                blockreferenceorigin = (centerblock GetOrigin() + (AnglesToLeft(centerblock.angles) * Abs((72 * length))));  
                            if (!self ActionSlotOneButtonPressed() && !self ActionSlotTwoButtonPressed())
                                blockreferenceorigin = (Int(blockreferenceorigin[0]), Int(blockreferenceorigin[1]), 0);
                                
                            foreach (block in blocks)
                            {
                                if (!IsVec(blockreferenceorigin))
                                    blockcheckorigin = Int(block GetOrigin()[2]);
                                else
                                    blockcheckorigin = (Int(block GetOrigin()[0]), Int(block GetOrigin()[1]), 0);   

                                if (blockcheckorigin == blockreferenceorigin)
                                {
                                    block Unlink();
                                    block Delete();
                                    block = undefined;
                                }
                            }  
                            
                            blocks = SortArray(blocks);

                            if (self ActionSlotOneButtonPressed() || self ActionSlotTwoButtonPressed())
                            {
                                if (height < 0)
                                    height ++;
                                else
                                    height --;
                            }
                            else if (self ActionSlotThreeButtonPressed() || self ActionSlotFourButtonPressed())   
                            {
                                if (length < 0)
                                    length ++;
                                else
                                    length --;
                            }
                                
                            deleteblocks = undefined;
                        }
                        else if (GetEntArray("script_model", "classname").size <= level.scriptmodellimit)
                        {
                            if (self ActionSlotOneButtonPressed())
                                height ++;
                            else if (self ActionSlotTwoButtonPressed())
                                height --;
                            else if (self ActionSlotThreeButtonPressed())
                                length --;
                            else if (self ActionSlotFourButtonPressed())
                                length ++;
                            if (self ActionSlotOneButtonPressed() || self ActionSlotTwoButtonPressed())
                            {
                                startinglength = 0;
                                startingheight = Abs(height);
                            }
                            else
                            {
                                startinglength = Abs(length);
                                startingheight = 0;
                            }

                            for (l = startinglength; l < (Abs(length) + 1); l ++)
                            {
                                for (h = startingheight; h < (Abs(height) + 1); h ++)
                                {
                                    if (height < 0)
                                        fixedheight = (h * -1);
                                    else
                                        fixedheight = h;
                                    if (length < 0)
                                        blockorigin = ((centerblock GetOrigin() + (AnglesToLeft(centerblock.angles) * Abs((72 * l)))) + (0, 0, (66 * fixedheight)));
                                    else
                                        blockorigin = ((centerblock GetOrigin() + (AnglesToRight(centerblock.angles) * Abs((72 * l)))) + (0, 0, (66 * fixedheight)));
                                    
                                    blocks[blocks.size] = SpawnEntity("script_model", level.buildingblockplaceholdermodel, blockorigin, (0, centerblock.angles[1], 0));
                                    blocks[blocks.size - 1] Hide();
                                    blocks[blocks.size - 1] ShowToPlayer(self);
                                    blocks[blocks.size - 1] NotSolid();
                                    blocks[blocks.size - 1] LinkTo(centerblock);
                                    
                                    if (GetEntArray("script_model", "classname").size > level.scriptmodellimit)
                                        break;
                                }
                            }
                            
                        }
                        else
                            self IPrintLn("^1Error: ^7Maximum Amount of Script Models Exceeded");
                        
                        self.structureconsole SetElementText("Door: " + (blocks.size + 1) + " Blocks / ^2$" + (level.pricebuildingblock * (blocks.size + 1))); 
                    }
                }
                if (self MeleeButtonPressed())// R3 Button
                {
                    blockcount = (blocks.size + 1);
                    price = (level.pricebuildingblock * blockcount);
                    
                    if (self.points >= price)
                    {
                        if (!IsDefined(startlocation))
                        {
                            startlocation = centerblock GetOrigin();
                            directioncheck = blocks[blocks.size - 1] GetOrigin();
                            self IPrintLn("Start Location Set");
                            wait 1;
                            self IPrintLn("Press [{+melee}] To Confirm End Location");
                        }
                        else
                        {
                            endlocation = centerblock GetOrigin();
                            holdtime = 0;
                            
                            if (self.gamerank >= 6)
                                buildtime = (blockcount * (level.structurebuildtime / level.masterbuilderstructurebuildtimemultiplier));
                            else if (self.gamerank >= 2)    
                                buildtime = (blockcount * (level.structurebuildtime / level.apprenticecarpenterstructurebuildtimemultiplier));
                            else
                                buildtime = (blockcount * level.structurebuildtime);
                                
                            self.structurebuildprogressbar = self CreateProgressBar(0, buildtime, (1, 1, 1), (0, 0, 0));
                            
                            while (IsAlive(self) && Distance(centerblock GetOrigin(), self GetOrigin()) <= 1000 && !self SecondaryOffHandButtonPressed())
                            {
                                if (holdtime >= buildtime)
                                {
                                    self.points -= price;

                                    foreach (block in blocks)
                                    {
                                        block Unlink();
                                        block Delete();
                                        block = undefined;
                                    }
                                    
                                    centerblock Delete();

                                    if (length > 0)
                                        length ++;
                                    else
                                        length --;
                                    if (height > 0)
                                        height ++;
                                    else
                                        height --;

                                    if (Closer(endlocation, startlocation, directioncheck))
                                        direction = "left";
                                    else
                                        direction = "right";

                                    CreateDoor(level.buildingblockmodel, startlocation, endlocation, length, height, 72, 33, (Distance(startlocation, endlocation) / (level.playerdoorspeed * 100)), level.playerdoorhealth, direction);
                                    self IPrintLn("^2Door ^7Purchased Successfully");
                                    
                                    if (IsDefined(level.developermode))
                                        self.structureconsole SetElementText("Door: ^2(^7" + Ceil(blocks[0] GetOrigin()[0]) + "^2,^7 " + Ceil(blocks[0] GetOrigin()[1]) + "^2,^7 " + Ceil((blocks[0] GetOrigin()[2] - 16.5)) + "^2)^7, ^1(^7" + Ceil(endlocation[0]) + "^1,^7 " + Ceil(endlocation[1]) + "^1,^7 " + Ceil((endlocation[2] - 16.5)) + "^1)");
                                    else
                                        self.structureconsole DestroyElement();
                    
                                    confirmed = true;
                                    
                                    break;
                                }
                                else
                                    holdtime += 0.05;
                                
                                wait 0.05;    
                            }
                        
                            self.structurebuildprogressbar DestroyElement();
                        
                            if (IsDefined(confirmed))
                                break;
                        }
                    }
                    else
                        self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
                }
                if (!self AdsButtonPressed()) //L1 Button
                {
                    if (self GetOrigin() != previousorigin || self GetPlayerAngles() != previousangles)
                    {
                        centerblock.origin = (self GetOrigin() + ((AnglesToForward(self GetPlayerAngles())[0] * 200), (AnglesToForward(self GetPlayerAngles())[1] * 200), 16.5));
                        centerblock.angles = (centerblock.angles[0], self.angles[1], centerblock.angles[2]);
                        previousorigin = self GetOrigin();
                        previousangles = self GetPlayerAngles();             
                    }
                }
                if (self SecondaryOffHandButtonPressed()) //L2 Button
                    break;
                
                wait 0.01;
            }

            if (!IsAlive(self) || self SecondaryOffHandButtonPressed())
            {
                if (!IsDefined(confirmed))
                {
                    foreach (block in blocks)
                    {
                        block Unlink();
                        block Delete();
                        block = undefined;
                    }
                     
                    centerblock Delete();
                    self.structureconsole DestroyElement();
                }
            }
            
            wait 0.5;
            self.disablemenu = undefined;
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
    }
    else
        self IPrintLn("^1Error: ^7Maximum Amount of Script Models Exceeded");
}

DefenseObjectDamageMonitor()
{
    self Endon("death");
    level Endon("game_ended");
    
    self.damagetrigger = Spawn("trigger_damage", self GetOrigin() + (0, 0, 16.5), 0, 30, 50);
    self.health = level.defenseshealth;
    
    while (IsDefined(self))
    {
        self.damagetrigger Waittill("damage", damage, attacker, direction, point, type, tagname, modelname, partname, weaponname);
        PlaySoundAtPosition("fly_riotshield_impact_knife", self GetOrigin());

        if (attacker.team != self.team)
        {
            self.health -= damage;
            attacker.points += level.zombiepointsperstructuredamage;
            attacker IPrintLnBold("Turret Damaged +^2$" + level.zombiepointsperstructuredamage + " ^7/ Turret Health: ^1" + self.health);
        }
        if (self.health <= 0)
        {
            self Notify("death");
            PlayFxOnTag(level.auto_turret_settings[self.turrettype].damagefx, self, level.auto_turret_settings[self.turrettype].stunfxtag);
            PlaySoundAtPosition("dst_equipment_destroy", self GetOrigin());
            wait 4;
            self.damagetrigger Delete();
            self Delete();
            self = undefined;
            level.amountofdefenses --;
        }
    }
}

PlayerCreateTurret(type)
{
    if (level.amountofdefenses < level.defenseslimit)
    {
        if (type == "Manual")
            price = level.pricemanualturret;
        if (type == "Auto")
            price = level.priceautoturret;
        if (self.points >= price)
        {
            level.amountofdefenses ++;
            turret = SpawnTurret("auto_turret", self GetOrigin(), "auto_gun_turret_mp");
            turret.angles = self.angles;
            turret SetModel("t6_wpn_turret_sentry_gun_yellow");
            turret.team = "allies";
            turret SetTurretTeam("allies");
            turret.turrettype = "sentry";
            turret SetTurretType("sentry");
            
            if (type == "Auto")
            {
                turret SetTurretOwner(self);
                turret.owner = self;
                self maps/mp/killstreaks/_turret_killstreak::EndRemoteTurret(turret, false);
            }
            
            turret SetDefaultDropPitch(-90);
            turret MakeTurretUnusable();
            turret SetMode("auto_ai");
            turret SetTurretCarried(true);
            turret.carried = true;
            self DisableWeapons();
            self CarryTurret(turret, VectorScale((0, 0, 0), 40), (0, 0, 0));
            
            while (IsAlive(self))
            {
                if (self AttackButtonPressed()) //R1 Button
                {
                    if (self.points >= price)
                    {
                        self.points -= price;
                        turret SetDefaultDropPitch(45);
                        turret SetTurretCarried(false);
                        turret.carried = false;
                        turret SetModel("t6_wpn_turret_sentry_gun");
                        placement = self CanPlayerPlaceTurret(turret);
                        self StopCarryTurret(turret, placement["origin"], placement["angles"]);
                        self EnableWeapons();
                        
                        if (type == "Auto")
                        {
                            turret SetMode("auto_nonai");
                            turret LaserOn();
                        }
                        else
                        {
                            turret SetTurretCarried(false);
                            turret.carried = false;
                            self StopCarryTurret(turret, turret.origin, turret.angles);
                            self EnableWeapons();
                            turret.damagetrigger Delete();
                            turret Delete();
                            turret = undefined;
                            turret = SpawnTurret("auto_turret", self GetOrigin(), "auto_gun_turret_mp");
                            turret.angles = self.angles;
                            turret SetModel("t6_wpn_turret_sentry_gun");
                            turret.team = "allies";
                            turret SetTurretTeam("allies");
                            turret.turrettype = "sentry";
                            turret SetTurretType("sentry");
                            turret SetDefaultDropPitch(45);
                            turret MakeTurretUsable();
                        }
                        
                        turret thread DefenseObjectDamageMonitor();
                        self IPrintLn("^2" + type + " Turret ^7Purchased Successfully");

                        break;
                    }
                    else
                        self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
                }
                if (self SecondaryOffHandButtonPressed()) //L2 Button
                    break;
                
                wait 0.05;
            }
            
            if (!turret.carried)
                self Waittill("death");
            if (IsDefined(turret))
            {
                turret Notify("death");
                
                if (!turret.carried)
                {
                    PlayFxOnTag(level.auto_turret_settings[turret.turrettype].damagefx, turret, level.auto_turret_settings[turret.turrettype].stunfxtag);
                    PlaySoundAtPosition("dst_equipment_destroy", turret GetOrigin());
                    wait 4;
                }
                else
                {
                    turret SetTurretCarried(false);
                    turret.carried = false;
                    self StopCarryTurret(turret, turret.origin, turret.angles);
                    self EnableWeapons();
                }
                    
                turret.damagetrigger Delete();
                turret Delete();
                turret = undefined;
                level.amountofdefenses --;
            }
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
    }
    else
        self IPrintLn("^1Error: ^7Maximum Amount Defenses Reached");
}

PlayerCreateGuardian()
{
    if (level.amountofdefenses < level.defenseslimit)
    {
        if (self.points >= level.priceguardian)
        {
            self.points -= level.priceguardian;
            level.amountofdefenses ++;
            guardian = SpawnTurret("auto_turret", self GetOrigin(), "microwave_turret_mp");
            guardian.angles = self.angles;
            guardian SetModel("t6_wpn_turret_ads_carry");
            guardian.team = "allies";
            guardian SetTurretTeam("allies");
            guardian.turrettype = "microwave";
            guardian SetTurretType("microwave");
            guardian.owner = self;
            guardian SetTurretOwner(self);
            guardian.soundmod = "hpm";
            guardian thread maps/mp/killstreaks/_turret_killstreak::Turret_Microwave_Think(self);
            guardian thread DefenseObjectDamageMonitor();
            PlaySoundAtPosition("mpl_turret_micro_startup", self GetOrigin());
            
            guardian MakeTurretUnusable();
            guardian SetTurretCarried(true);
            guardian.carried = true;
            self DisableWeapons();
            self CarryTurret(guardian, VectorScale((0, 0, 0), 40), (0, 0, 0));
            
            while (IsAlive(self))
            {
                if (self AttackButtonPressed()) //R1 Button
                {
                    if (self.points >= level.priceguardian)
                    {
                        self.points -= level.priceguardian;
                        guardian SetTurretCarried(false);
                        guardian.carried = false;
                        guardian SetModel("t6_wpn_turret_ads_world");
                        placement = self CanPlayerPlaceTurret(guardian);
                        self StopCarryTurret(guardian, placement["origin"], placement["angles"]);
                        self EnableWeapons();
                        guardian thread DefenseObjectDamageMonitor();
                        self IPrintLn("^2Guardian ^7Purchased Successfully");
                        
                        break;
                    }
                    else
                        self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
                }
                if (self SecondaryOffHandButtonPressed()) //L2 Button
                    break;
                
                wait 0.05;
            }
            
            if (!guardian.carried)
                self Waittill("death");
            if (IsDefined(guardian))
            {
                guardian Notify("death");

                if (!guardian.carried)
                {
                    PlayFxOnTag(level.auto_turret_settings[guardian.turrettype].damagefx, guardian, level.auto_turret_settings[guardian.turrettype].stunfxtag);
                    PlaySoundAtPosition("dst_equipment_destroy", guardian GetOrigin());
                    wait 4;
                }
                else
                {
                    guardian SetTurretCarried(false);
                    guardian.carried = false;
                    self StopCarryTurret(guardian, guardian.origin, guardian.angles);
                    self EnableWeapons();
                }

                guardian.damagetrigger Delete();
                guardian Delete();
                guardian = undefined;
                level.amountofdefenses --;
            }
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
    }
    else
        self IPrintLn("^1Error: ^7Maximum Amount Defenses Reached");
}

CreateObjective(shader, origin, width, height, entity, visibility)
{  
    createobjective = SpawnStruct();
    createobjective.objectiveid = maps\mp\gametypes\_gameobjects::GetNextObjID();
    Objective_Add(createobjective.objectiveid, "active", origin);
    Objective_Icon(createobjective.objectiveid, shader);
    Objective_SetSize(createobjective.objectiveid, width, height);
    
    if (IsDefined(entity))
        Objective_OnEntity(createobjective.objectiveid, entity);
    if (visibility == "allies" || visibility == "axis")
        Objective_Team(createobjective.objectiveid, visibility);
    if (IsPlayer(visibility))
        Objective_SetPlayerUsing(createobjective.objectiveid, visibility); 
        
    return createobjective;
}

CreatePortal(start, end, twoway, invisible)
{
    if (!invisible)
    {
        startportal = SpawnEntity("script_model", twoway ? "mp_flag_neutral" : "mp_flag_green", start, (0, RandomIntRange(-180, 180), 0));
        endportal = SpawnEntity("script_model", twoway ? "mp_flag_neutral" : "mp_flag_red", end, (0, RandomIntRange(-180, 180), 0));
    }
    else
    {   
        startportal = Spawn("script_origin", start);
        endportal = Spawn("script_origin", end);
    }
    
    level thread PortalMonitor(startportal, endportal, twoway);
}

PortalMonitor(startportal, endportal, twoway)
{
    level Endon("game_ended");
    
    while (IsDefined(startportal) && IsDefined(endportal))
    {
        foreach (player in level.players)
        {
            if (IsAlive(player) && Distance(startportal GetOrigin(), player GetOrigin()) < 30 && !IsDefined(player.insideportal))
                player thread PortalTeleportPlayer(endportal GetOrigin());
            if (IsAlive(player) && Distance(endportal GetOrigin(), player GetOrigin()) < 30 && twoway && !IsDefined(player.insideportal))
                player thread PortalTeleportPlayer(startportal GetOrigin());   
        }
        
        wait 0.05;
    }
}

PortalTeleportPlayer(location)
{
    self Endon("disconnect");
    
    self.insideportal = true;
    self SetOrigin(location);
    
    while (Distance(location, self GetOrigin()) < 30)
        wait 0.1;
    
    self.insideportal = undefined;
}

OriginLocationSelector(numberoflocations)
{
    self Endon("disconnect");
    
    location = [];
    locationfx = [];
    self IPrintLn("Press [{+attack}] or [{+usereload}] To Select Location " + (location.size + 1));
    
    while (location.size != numberoflocations)
    {
        if (self AttackButtonPressed() || self UseButtonPressed())
        {
            if (self AttackButtonPressed())
                location[location.size] = BulletTrace(self GetEye(), self GetEye() + (AnglesToForward(self GetPlayerAngles()) * 100), false, self)["position"];
            else
                location[location.size] = self GetOrigin();
                
            locationfx[locationfx.size] = SpawnFX(level.paintbrushfx, location[location.size - 1]);
            TriggerFX(locationfx[locationfx.size - 1]);
            
            if (location.size != numberoflocations)
                self IPrintLn("Press [{+attack}] or [{+usereload}] To Select Location " + (location.size + 1));
                
            wait 0.2;
        }
        
        wait 0.05;
    }
    
    Array_Delete(locationfx);
    
    return location;
}

PlayerCreatePortal(type)
{
    location = OriginLocationSelector(2);
    
    if (type == "One-Way")
        CreatePortal(location[0], location[1], false, false);
    if (type == "Two-Way")
        CreatePortal(location[0], location[1], true, false);
            
    if (!IsDefined(self.structureconsole))
        self.structureconsole = CreateText(undefined, "objective", 2, "center", "center", "user_center", "user_center", 0, -180, undefined, 1, undefined, undefined, true, false, 0);
        
    self.structureconsole SetElementText(type + ": ^2(^7" + Ceil(location[0][0]) + "^2,^7 " + Ceil(location[0][1]) + "^2,^7 " + Ceil(location[0][2]) + "^2)^7, ^1(^7" + Ceil(location[1][0]) + "^1,^7 " + Ceil(location[1][1]) + "^1,^7 " + Ceil(location[1][2]) + "^1)");
}

ZiplineMonitor(ziplinestart, ziplineend, start, end, duration, twoway)
{
    level Endon("game_ended");
    
    number = level.amountofziplines;
    level.amountofziplines ++;
    
    while (IsDefined(ziplinestart) && IsDefined(ziplineend))
    {
        foreach (player in level.players)
        {
            if (IsAlive(player) && Distance(ziplinestart GetOrigin(), player GetOrigin()) < 60)
            {
                if (!IsDefined(player.ziplinemessage[number]))
                    player.ziplinemessage[number] = player CreateText("Press [{+usereload}] To Use Zipline", "objective", 1.5, "center", "center", "user_center", "user_center", 0, 100, undefined, 1, undefined, undefined, true, false, 0);
                if (!IsDefined(player.usingzipline) && player UseButtonPressed())
                    player thread ZiplinePlayerMonitor(start, end, duration);
            }
            if (IsAlive(player) && Distance(ziplineend GetOrigin(), player GetOrigin()) < 60 && twoway)
            {
                if (!IsDefined(player.ziplinemessage[number]))
                    player.ziplinemessage[number] = player CreateText("Press [{+usereload}] To Use Zipline", "objective", 1.5, "center", "center", "user_center", "user_center", 0, 100, undefined, 1, undefined, undefined, true, false, 0);
                if (!IsDefined(player.usingzipline) && player UseButtonPressed())
                    player thread ZiplinePlayerMonitor(end, start, duration);
            }
            if (IsAlive(player) && IsDefined(player.ziplinemessage[number]) && !Distance(ziplinestart GetOrigin(), player GetOrigin()) < 60 && !Distance(ziplineend GetOrigin(), player GetOrigin()) < 60)
                player.ziplinemessage[number] DestroyElement();  
        }
        
        wait 0.05;
    }
}

ZiplinePlayerMonitor(start, end, duration)
{
    self Endon("disconnect");
    level Endon("game_ended");
    
    self.usingzipline = true;
    ziplinescriptorigin = Spawn("script_origin", start);
    self PlayerLinkTo(ziplinescriptorigin);
    ziplinescriptorigin MoveTo(end, duration);
    wait duration;
    self Unlink();
    ziplinescriptorigin Delete();
    self.usingzipline = undefined;
}

CreateZipline(start, end, duration, twoway)
{
    ziplinestart = SpawnEntity("script_model", "t6_wpn_supply_drop_axis", start, (0, VectorToAngles(start - end)[1], 0));
    ziplineend = SpawnEntity("script_model", "t6_wpn_supply_drop_axis", end, (0, VectorToAngles(end - start)[1], 0));
    level thread ZiplineMonitor(ziplinestart, ziplineend, start, end, duration, twoway);
}

PlayerCreateZipline(type)
{
    location = OriginLocationSelector(2);
    
    if (type == "One-Way")
        CreateZipline(location[0], location[1], 3, false);
    if (type == "Two-Way")
        CreateZipline(location[0], location[1], 3, true);
            
    if (!IsDefined(self.structureconsole))
        self.structureconsole = CreateText(undefined, "objective", 2, "center", "center", "user_center", "user_center", 0, -180, undefined, 1, undefined, undefined, true, false, 0);
        
    self.structureconsole SetElementText(type + ": ^2(^7" + Ceil(location[0][0]) + "^2,^7 " + Ceil(location[0][1]) + "^2,^7 " + Ceil(location[0][2]) + "^2)^7, ^1(^7" + Ceil(location[1][0]) + "^1,^7 " + Ceil(location[1][1]) + "^1,^7 " + Ceil(location[1][2]) + "^1)");
}

CreateWallWeapon(rarity, weapon, origin, angles)
{
    wallweapon = SpawnEntity("script_model", GetWeaponModel(weapon), origin, angles + (0, 90, 0)); 
    wallweapon.origin = wallweapon GetWeaponCenterOrigin();
    wallweapon thread WallWeaponMonitor(rarity, weapon);
}

WallWeaponMonitor(rarity, weapon)
{
    level Endon("game_ended");
    
    number = level.amountofwallweapons;
    level.amountofwallweapons ++;

    while (IsDefined(self))
    {
        foreach (player in level.players)
        {
            if (IsAlive(player) && player.status == "Human" && Distance(self GetWeaponCenterOrigin(), player GetOrigin()) <= 70)
            {
                if (!player HasWeaponDespiteAttachments(weapon) && price != level.price[GetWeaponStringID(weapon)])
                    price = level.price[GetWeaponStringID(weapon)];
                if (player HasWeaponDespiteAttachments(weapon) && !IsDefined(player.upgrade[GetWeaponStringID(weapon)]) && price != (level.price[GetWeaponStringID(weapon)] / 2))
                    price = (level.price[GetWeaponStringID(weapon)] / 2);
                if (player HasWeaponDespiteAttachments(weapon) && IsDefined(player.upgrade[GetWeaponStringID(weapon)]) && price != level.packapunchammoprice)
                    price = level.packapunchammoprice;  
                if (!player HasWeaponDespiteAttachments(weapon) && IsDefined(player.wallweaponmessage[number]) && player.wallweaponmessage[number].text != "Press [{+usereload}] For " + GetWeaponDisplayName(weapon) + " [Cost: ^2$" + price + "^7]")
                    player.wallweaponmessage[number] DestroyElement();
                if (player HasWeaponDespiteAttachments(weapon) && !IsDefined(player.upgrade[GetWeaponStringID(weapon)]) && IsDefined(player.wallweaponmessage[number]) && player.wallweaponmessage[number].text != "Press [{+usereload}] For Ammo [Cost: ^2$" + price + "^7]")
                    player.wallweaponmessage[number] DestroyElement();
                if (player HasWeaponDespiteAttachments(weapon) && IsDefined(player.upgrade[GetWeaponStringID(weapon)]) && IsDefined(player.wallweaponmessage[number]) && player.wallweaponmessage[number].text != "Press [{+usereload}] For upgrade Ammo [Cost: ^2$" + price + "^7]")
                    player.wallweaponmessage[number] DestroyElement();
                if (!player HasWeaponDespiteAttachments(weapon) && !IsDefined(player.wallweaponmessage[number]))
                    player.wallweaponmessage[number] = player CreateText("Press [{+usereload}] For " + rarity + " " + GetWeaponDisplayName(weapon) + " [Cost: ^2$" + price + "^7]", "objective", 1.5, "center", "center", "user_center", "user_center", 0, 100, undefined, 1, undefined, undefined, true, false, 0);
                if (player HasWeaponDespiteAttachments(weapon) && !IsDefined(player.upgrade[GetWeaponStringID(weapon)]) && !IsDefined(player.wallweaponmessage[number]))
                    player.wallweaponmessage[number] = player CreateText("Press [{+usereload}] For Ammo [Cost: ^2$" + price + "^7]", "objective", 1.5, "center", "center", "user_center", "user_center", 0, 100, undefined, 1, undefined, undefined, true, false, 0);
                if (player HasWeaponDespiteAttachments(weapon) && IsDefined(player.upgrade[GetWeaponStringID(weapon)]) && !IsDefined(player.wallweaponmessage[number]))
                    player.wallweaponmessage[number] = player CreateText("Press [{+usereload}] For upgrade Ammo [Cost: ^2$" + price + "^7]", "objective", 1.5, "center", "center", "user_center", "user_center", 0, 100, undefined, 1, undefined, undefined, true, false, 0);
                if (player UseButtonPressed())
                {
                    if (player.points >= price)
                    {
                        if (player HasWeaponDespiteAttachments(weapon))
                        {
                            if (player GetModWeaponStock(player GetWeaponFromInventory(weapon)) < player GetModWeaponStockSize(player GetWeaponFromInventory(weapon)))
                            {
                                player.points -= price;
                                player SetModWeaponStock(player GetWeaponFromInventory(weapon), player GetModWeaponStockSize(player GetWeaponFromInventory(weapon)));
                                player Notify("max_ammo");
                                player IPrintLn("^2Ammo ^7Purchased Successfully");
                            }
                            else
                                player IPrintLn("^1Error: ^7You Already Have Max Ammo For This Weapon");  
                                
                            break;
                        }
                        else
                        {
                            if (player.inventory.size >= player.inventoryitemlimit)
                            {
                                currentweapon = player GetDefaultCurrentWeapon();
                                
                                if (currentweapon != "minigun_wager_mp")
                                    player TakePlayerItem(currentweapon);
                                else
                                    player TakePlayerItem(Random(player.inventory).itemid);
                            }
                                
                            player.points -= price;
                            player GivePlayerItem(rarity, undefined, weapon, undefined, undefined, undefined, undefined, undefined);
                        }
                    }
                    else
                        player IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
                    
                    wait 0.5;
                }
            }
            else if (IsDefined(player.wallweaponmessage[number]))
                player.wallweaponmessage[number] DestroyElement();
        }
        
        wait 0.05;
    }
}

PlayerCreateWallWeapon()
{
    CreateWallWeapon("Common", GetWeaponStringID(self GetCurrentWeapon()), self GetOrigin() + ((AnglesToForward(self GetPlayerAngles())[0] * 13), (AnglesToForward(self GetPlayerAngles())[1] * 13), 60), self.angles);
    
    if (!IsDefined(self.structureconsole))
        self.structureconsole = CreateText(undefined, "objective", 2, "center", "center", "user_center", "user_center", 0, -180, undefined, 1, undefined, undefined, true, false, 0);
         
    self.structureconsole SetElementText("Wall Weapon: Common " + GetWeaponStringID(self GetCurrentWeapon()) + ", (" + Ceil(self GetOrigin()[0] + (AnglesToForward(self GetPlayerAngles())[0] * 13)) + ", " + Ceil(self GetOrigin()[1] + (AnglesToForward(self GetPlayerAngles())[1] * 13)) + ", " + Ceil(self GetOrigin()[2] + AnglesToForward(self GetPlayerAngles())[2] + 60) + "), (" + Ceil(self.angles[0]) + ", " + Ceil(self.angles[1]) + ", " + Ceil(self.angles[2]) + ")");      
    
    if (!IsDefined(level.developermode))
    {
        wait 5;
        self.structureconsole FadeOverTime(2);
        self.structureconsole.alpha = 0;
        wait 2;
        self.structureconsole DestroyElement();
    }
}

CreateMarket(origin, angles)
{
    market = SpawnEntity("script_model", "p_glo_bomb_stack", origin, (angles + (0, 180, 0)));
    collision = SpawnCollision("collision_clip_64x64x64", "collider", origin, angles); 
    market thread MarketMonitor();
}

MarketMonitor()
{
    level Endon("game_ended");
    
    number = level.amountofmarkets;
    level.amountofmarkets ++;

    while (IsDefined(self))
    {
        foreach (player in level.players)
        {
            if (IsAlive(player) && player.status == "Human" && Distance(self GetOrigin(), player GetOrigin()) <= (level.interactableuserange * 100))
            {
                if (IsDefined(player.marketmessage[number]) && self.menuopen)
                    player.marketmessage[number] DestroyElement();
                if (!IsDefined(player.marketmessage[number]) && !IsDefined(player.usingmarket) && !self.menuopen)
                    player.marketmessage[number] = player CreateText("Press [{+usereload}] To Open Market", "objective", 1.5, "center", "center", "user_center", "user_center", 0, 100, undefined, 1, undefined, undefined, true, false, 0);
                if (!IsDefined(player.usingmarket) && player UseButtonPressed())
                    player thread MarketPlayerMonitor(self);
                if (IsDefined(player.notifymarketitempurchase))
                    self thread MarketPurchaseMonitor(player);
            }
            else if (IsDefined(player.marketmessage[number]))
                player.marketmessage[number] DestroyElement();
        }

        wait 0.05;
    }
}

MarketPlayerMonitor(market)
{
    self.usingmarket = true;
    self.marketmessage[market.number] DestroyElement();
    
    while (IsDefined(self.menuopening))
        wait 0.01;
        
    if (self.menuopen)
        self CloseTheMenu();
        
    self ResetTheMenu();  
    self OpenTheMenu("Market Menu");
    
    while (self.menuopen && Distance(self GetOrigin(), market GetOrigin()) <= (level.interactableuserange * 100))
        wait 0.05;
    
    self.usingmarket = undefined;
    
    if (self.menuopen)
        self CloseTheMenu();

    self ResetTheMenu(); 
}

MarketPurchaseMonitor(player)
{
    if (!IsDefined(self.purchaseitem))
        self.purchaseitem = [];
        
    purchase = player.notifymarketitempurchase;
    player.notifymarketitempurchase = undefined;
    self.purchaseitem[self.purchaseitem.size] = SpawnEntity("script_model", GetWeaponModel(purchase), self GetOrigin(), (self.angles + (0, 90, 0)));
    number = (self.purchaseitem.size - 1);
    self.purchaseitem[number].origin = self.purchaseitem[number] GetWeaponCenterOrigin();
    self.purchaseitem[number] MoveTo((self.purchaseitem[number] GetOrigin() + (0, 0, (50 + (30 * self.purchaseitem.size)))), 0.5, 0.4, 0.1);
    wait 0.5;
    self.purchaseitem[number] MoveTo((self.purchaseitem[number] GetOrigin() + (0, 0, -10)), 0.3, 0.1);
    wait 0.3;
    self.purchaseitem[number] RotateYaw(1440, 1);
    wait 1;
    self.purchaseitem[number] MoveTo((self.purchaseitem[number] GetOrigin()[0], self.purchaseitem[number] GetOrigin()[1], self GetOrigin()[2]), 0.2);
    wait 0.2;
    self.purchaseitem[number] Delete();
    self.purchaseitem[number] = undefined;
}

PlayerCreateMarket()
{
    CreateMarket(self GetOrigin(), self.angles);
    
    if (!IsDefined(self.structureconsole))
        self.structureconsole = CreateText(undefined, "objective", 2, "center", "center", "user_center", "user_center", 0, -180, undefined, 1, undefined, undefined, true, false, 0);
        
        self.structureconsole SetElementText("Market: (" + Ceil(self GetOrigin()[0]) + ", " + Ceil(self GetOrigin()[1]) + ", " + Ceil(self GetOrigin()[2]) + "), (" + Ceil(self.angles[0]) + ", " + Ceil(self.angles[1]) + ", " + Ceil(self.angles[2]) + ")");
    
    if (!IsDefined(level.developermode))
    {
        wait 5;
        self.structureconsole FadeOverTime(2);
        self.structureconsole.alpha = 0;
        wait 2;
        self.structureconsole DestroyElement();
    }
}

CreateMysteryBox(origin, angles)
{
    mysterybox = SpawnEntity("script_model", "t6_wpn_supply_drop_hq", origin + (0, 0, 16.5), angles);
    mysterybox thread MysteryBoxMonitor(); 
}

MysteryBoxMonitor()
{
    level Endon("game_ended");
    
    self.uses = 0;
    self.number = level.amountofmysteryboxs;
    level.amountofmysteryboxs ++;

    while (IsDefined(self))
    {
        if (level.mysteryboxlocation == self.number || IsDefined(level.firesale))
        {
            if (!IsDefined(self.activefx))
            {
                self.activefx = SpawnFX(level.mysteryboxactivefx, self GetOrigin() - (0, 0, 16.5));
                TriggerFX(self.activefx);
            }
            if (!IsDefined(self.minimaphud))
                self.minimaphud = CreateObjective("perk_hardline", self GetOrigin(), 10, 10, undefined, "allies");
        }
        else 
        {
            if (IsDefined(self.activefx))
                self.activefx Delete();
            if (IsDefined(self.minimaphud))
            {
                Objective_Delete(self.minimaphud.objectiveid);
                self.minimaphud Delete();
                self.minimaphud = undefined;
            }
        }
            
        foreach (player in level.players)
        {
            if (level.mysteryboxlocation == self.number || IsDefined(level.firesale))
            {
                if (IsAlive(player) && player.status == "Human" && Distance(self GetOrigin(), player GetOrigin()) <= (level.interactableuserange * 100))
                {
                    if (!IsDefined(level.firesale) && price != level.mysteryboxprice)
                        price = level.mysteryboxprice;
                    if (IsDefined(level.firesale) && price != level.firesaleprice)
                        price = level.firesaleprice;
                    if (!IsDefined(player.usingmysterybox) && IsDefined(player.mysteryboxmessage[self.number]) && player.mysteryboxmessage[self.number].text != "Press [{+usereload}] For Mystery Box [Cost: ^2$" + price + "^7]")   
                        player.mysteryboxmessage[self.number] DestroyElement();
                    if (IsDefined(self.beingused) && IsDefined(player.mysteryboxmessage[self.number]) && !IsDefined(player.usingmysterybox))
                        player.mysteryboxmessage[self.number] DestroyElement();
                    if (!IsDefined(self.beingused) && !IsDefined(player.mysteryboxmessage[self.number]))
                        player.mysteryboxmessage[self.number] = player CreateText("Press [{+usereload}] For Mystery Box [Cost: ^2$" + price + "^7]", "objective", 1.5, "center", "center", "user_center", "user_center", 0, 100, undefined, 1, undefined, undefined, true, false, 0);
                    if (IsDefined(self.beingused) && !IsDefined(player.mysteryboxmessage[self.number]) && IsDefined(self.weaponready) && IsDefined(player.usingmysterybox))
                        player.mysteryboxmessage[self.number] = player CreateText("Press [{+usereload}] For " + self.weaponready, "objective", 1.5, "center", "center", "user_center", "user_center", 0, 100, undefined, 1, undefined, undefined, true, false, 0);
                    if (!IsDefined(self.beingused) && player UseButtonPressed())
                    {
                        if (player.points >= price)
                        {
                            self.beingused = true;
                            player.usingmysterybox = true;
                            player.mysteryboxmessage[self.number] DestroyElement();
                            self thread MysteryBoxItemMonitor(player, price);
                        }
                        else
                            player IPrintLn("^1Error: ^7You Do Not Have Enough Points For The Mystery Box");
                        
                        wait 0.2;
                    }
                }
                else if (IsDefined(player.mysteryboxmessage[self.number]))
                    player.mysteryboxmessage[self.number] DestroyElement();
            }
            else if (IsDefined(player.mysteryboxmessage[self.number]))
                player.mysteryboxmessage[self.number] DestroyElement();
        }
        
        wait 0.05;
    }
}

MysteryBoxItemMonitor(player, price)
{
    player.points -= price;
    cycleitem = SpawnEntity("script_model", "tag_origin", self GetOrigin(), (self.angles + (0, 90, 0)));
    cycleitem.origin = cycleitem GetWeaponCenterOrigin();
    cycleitem MoveTo(cycleitem GetOrigin() + (0, 0, 45), 5, 0.5, 4.5);

    for (i = 0; i < 30; i ++)
    {
        randomitem = undefined;
        
        while (!IsDefined(randomitem) || player HasWeaponDespiteAttachments(randomitem))
        {
            randomitem = Random(level.mysteryboxitems);
            wait 0.01;
        }
        
        cycleitem SetModel(GetWeaponModel(randomitem));

        if (i < 20)
            wait 0.05;
        if (i >= 20 && i < 25)
            wait 0.1;
        if (i >= 25)
            wait 0.2;
    }
    
    if (level.amountofmysteryboxs > 1 && !IsDefined(level.firesale))
    {
        self.uses ++;
        
        if (self.uses > 7)
        {
            if (RandomInt(2) == 0)
            {
                cycleitem Delete();
                originalmodel = self.model;
                player.points += price;
                self SetModel(level.buildingblockplaceholdermodel);
                wait 3;
                self SetModel(originalmodel);
                
                while (level.mysteryboxlocation == self.number)
                {
                    level.mysteryboxlocation = RandomInt(level.amountofmysteryboxs);
                    wait 0.05;
                }
                
                player.usingmysterybox = undefined;
                self.beingused = undefined;
                self.weaponready = undefined;
                self.uses = 0;
                
                return;
            }
        }
    }
    
    rarity = GetRandomRarity();
    
    while (!IsInArray(GetItemRarities(randomitem), rarity) || player HasWeaponDespiteAttachments(randomitem)) 
    {
        randomitem = Random(level.mysteryboxitems);
        wait 0.01;
    }
    
    wait 0.2;
    self.weaponready = rarity + " " + GetWeaponDisplayName(randomitem);
    cycleitem MoveTo(cycleitem GetOrigin() + (0, 0, -45), 10);
    
    while (cycleitem GetOrigin()[2] != self GetOrigin()[2])
    {
        if (IsAlive(player) && player.status == "Human" && Distance(self GetOrigin(), player GetOrigin()) <= (level.interactableuserange * 100) && player UseButtonPressed())
        {
            currentweapon = player GetDefaultCurrentWeapon();
            
            if (player HasWeaponDespiteAttachments(randomitem))
                player TakePlayerItem(currentweapon);
            else if (player.inventory.size >= player.inventoryitemlimit)
            {
                if (currentweapon != "minigun_wager_mp")
                    player TakePlayerItem(currentweapon);
                else
                    player TakePlayerItem(Random(player.inventory).itemid);
            }

            player GivePlayerItem(rarity, undefined, randomitem, undefined, undefined, undefined, undefined, undefined);
            
            break;
        }
        
        wait 0.05;
    }
    
    cycleitem Delete();
    player.usingmysterybox = undefined;
    wait 1.5;
    self.beingused = undefined;
    self.weaponready = undefined;
}

PlayerCreateMysteryBox()
{
    CreateMysteryBox(self GetOrigin(), self.angles);
    
    if (!IsDefined(self.structureconsole))
        self.structureconsole = CreateText(undefined, "objective", 2, "center", "center", "user_center", "user_center", 0, -180, undefined, 1, undefined, undefined, true, false, 0);
        
        self.structureconsole SetElementText("Mystery Box: (" + Ceil(self GetOrigin()[0]) + ", " + Ceil(self GetOrigin()[1]) + ", " + Ceil(self GetOrigin()[2]) + "), (" + Ceil(self.angles[0]) + ", " + Ceil(self.angles[1]) + ", " + Ceil(self.angles[2]) + ")");
    
    if (!IsDefined(level.developermode))
    {
        wait 5;
        self.structureconsole FadeOverTime(2);
        self.structureconsole.alpha = 0;
        wait 2;
        self.structureconsole DestroyElement();
    }
}

CreatePackaPunch(origin, angles)
{
    packapunch = SpawnEntity("script_model", "t6_wpn_supply_drop_ally", origin + (0, 0, 16.5), angles);
    packapunch.top = SpawnEntity("script_model", "t6_wpn_supply_drop_ally", origin + (0, 0, 49.5), angles);
    packapunch thread PackaPunchMonitor();
}

PackaPunchMonitor()
{
    level Endon("game_ended");
    
    number = level.amountofpackapunchs;
    level.amountofpackapunchs ++;
    
    while (IsDefined(self))
    {
        foreach (player in level.players)
        {
            if (IsAlive(player) && player.status == "Human" && Distance(self GetOrigin(), player GetOrigin()) <= (level.interactableuserange * 100))
            {
                if (!IsDefined(self.beingused) && price != level.packapunchprice && !IsDefined(player.inventory[GetWeaponStringID(player GetCurrentWeapon())].upgrade))
                    price = level.packapunchprice;
                if (!IsDefined(self.beingused) && price != (level.packapunchprice / 2) && IsDefined(player.inventory[GetWeaponStringID(player GetCurrentWeapon())].upgrade))
                    price = (level.packapunchprice / 2);
                if (!IsDefined(player.weaponinpackapunch) && IsDefined(player.packapunchmessage[number]) && player.packapunchmessage[number].text != "Press [{+usereload}] For Pack-a-Punch [Cost: ^2$" + price + "^7]")
                    player.packapunchmessage[number] DestroyElement();
                if (IsDefined(self.beingused) && IsDefined(player.packapunchmessage[number]) && !IsDefined(player.weaponinpackapunch))
                    player.packapunchmessage[number] DestroyElement();
                if (!IsDefined(self.beingused) && IsDefined(player.packapunchmessage[number]))
                {
                    if (!IsWeaponUpgradeSupported(player GetCurrentWeapon()))
                        player.packapunchmessage[number] DestroyElement();
                }
                if (!IsDefined(self.beingused) && !IsDefined(player.packapunchmessage[number]) && IsWeaponUpgradeSupported(player GetCurrentWeapon()))
                    player.packapunchmessage[number] = player CreateText("Press [{+usereload}] For Pack-a-Punch [Cost: ^2$" + price + "^7]", "objective", 1.5, "center", "center", "user_center", "user_center", 0, 100, undefined, 1, undefined, undefined, true, false, 0);
                if (IsDefined(self.beingused) && !IsDefined(player.packapunchmessage[number]) && IsDefined(self.weaponready) && IsDefined(player.weaponinpackapunch))
                    player.packapunchmessage[number] = player CreateText("Press [{+usereload}] For Upgraded Weapon", "objective", 1.5, "center", "center", "user_center", "user_center", 0, 100, undefined, 1, undefined, undefined, true, false, 0);
                if (!IsDefined(self.beingused) && player UseButtonPressed())
                {
                    if (IsWeaponUpgradeSupported(player GetCurrentWeapon()))
                    {
                        if (player.points >= price)
                        {
                            self.beingused = true;
                            player.weaponinpackapunch = GetWeaponStringID(player GetCurrentWeapon());
                            player.points -= price;
                            player.packapunchmessage[number] DestroyElement();
                            self thread PackaPunchWeaponMonitor(player);
                        }
                        else
                            player IPrintLn("^1Error: ^7You Do Not Have Enough Points For The Pack-a-Punch");
                    }
                    
                    wait 0.2;
                }
            }
            else if (IsDefined(player.packapunchmessage[number]))
                player.packapunchmessage[number] DestroyElement();
        }
        
        wait 0.05;
    }
}

PackaPunchWeaponMonitor(player)
{
    weapon = player GetDefaultCurrentWeapon();
    rarity = player.inventory[GetWeaponStringID(weapon)].rarity;
    upgrade = player.inventory[GetWeaponStringID(weapon)].upgrade;
    
    if (!IsWeaponDualWield(weapon))
        clip = player GetModWeaponClip(weapon);
        
    stock = player GetModWeaponStock(weapon);
    reticle = player.inventory[GetWeaponStringID(weapon)].reticle;
    player TakePlayerItem(weapon, true);
    packapunchweapon = SpawnEntity("script_model", GetWeaponModel(weapon), ((self GetOrigin() + (0, 0, 24.75)) + (AnglesToBackward(self.angles) * 30)), (self.angles + (0, 90, 0)));
    packapunchweapon.origin = packapunchweapon GetWeaponCenterOrigin();
    
    if (IsWeaponDualWield(weapon))
    {
        packapunchdualweapon = SpawnEntity("script_model", GetWeaponModel(weapon), (((self GetOrigin() + (0, 0, 24.75)) + (AnglesToBackward(self.angles) * 25)) + (AnglesToLeft(self.angles) * 5)), (self.angles + (0, 90, 0)));
        packapunchdualweapon.origin = packapunchdualweapon GetWeaponCenterOrigin();
    }
    
    self.top MoveTo(self GetOrigin() + (0, 0, 49.5), 1);
    packapunchweapon MoveTo((packapunchweapon GetOrigin() + (AnglesToRight(packapunchweapon.angles) * 30)), 2);
    
    if (IsDefined(packapunchdualweapon))
        packapunchdualweapon MoveTo((packapunchdualweapon GetOrigin() + (AnglesToRight(packapunchdualweapon.angles) * 30)), 2);
    
    wait 2;
    self.top MoveTo((self GetOrigin() + (0, 0, 33)), 1);
    wait 1;
    thread PlayLoopFX(level.afterburnerfx, ((self GetOrigin() + (0, 0, 24.75)) + (AnglesToForward(self.angles) * 300)), self.angles, 0.1, 1);
    wait 1;
    self.top MoveTo((self GetOrigin() + (0, 0, 49.5)), 1);
    packapunchweapon MoveTo((packapunchweapon GetOrigin() + (AnglesToLeft(packapunchweapon.angles) * 30)), 2);
    
    if (IsDefined(packapunchdualweapon))
        packapunchdualweapon MoveTo((packapunchdualweapon GetOrigin() + (AnglesToLeft(packapunchdualweapon.angles) * 30)), 2);
    
    wait 2;
    self.weaponready = true;
    packapunchweapon MoveTo((packapunchweapon GetOrigin() + (AnglesToRight(packapunchweapon.angles) * 30)), 10);
    
    if (IsDefined(packapunchdualweapon))
        packapunchdualweapon MoveTo((packapunchdualweapon GetOrigin() + (AnglesToRight(packapunchdualweapon.angles) * 30)), 10);
    
    while (Distance(packapunchweapon GetWeaponCenterOrigin(), (self GetOrigin() + (0, 0, 24.75))) > 5)
    {
        if (IsAlive(player) && player.status == "Human" && Distance(self GetOrigin(), player GetOrigin()) <= (level.interactableuserange * 100) && player UseButtonPressed())
        {
            currentweapon = player GetDefaultCurrentWeapon();
            
            if (player HasWeaponDespiteAttachments(weapon))
                player TakePlayerItem(currentweapon);
            else if (player.inventory.size >= player.inventoryitemlimit)
            {
                if (currentweapon != "minigun_wager_mp")
                    player TakePlayerItem(currentweapon);
                else
                    player TakePlayerItem(Random(player.inventory).itemid);
            }
            if (!IsDefined(upgrade))
                player GivePlayerItem(rarity, "Vanilla", weapon, undefined, undefined, undefined, reticle, undefined);
            else
            {
                modifications = StrTok("Blast Furnace,Dead Wire,Thunder Wall,Fireworks,Scorching Inferno,Doomsday Devastation,Buzz Saw,Poseidons Wrath", ",");
                newupgrade = Random(modifications);
                
                while (newupgrade == upgrade)
                {
                    newupgrade = Random(modifications);
                    wait 0.05;
                }
                
                player GivePlayerItem(rarity, newupgrade, weapon, clip, stock, undefined, reticle, undefined);
            }

            break;
        }
        
        wait 0.05;
    }
    
    packapunchweapon Delete();
    
    if (IsDefined(packapunchdualweapon))
        packapunchdualweapon Delete();
        
    self.top MoveTo(self GetOrigin() + (0, 0, 33), 1);
    player.weaponinpackapunch = undefined;
    wait 1.5;
    self.beingused = undefined;
    self.weaponready = undefined;
}

PlayerCreatePackaPunch()
{
    CreatePackaPunch(self GetOrigin(), self.angles);
    
    if (!IsDefined(self.structureconsole))
        self.structureconsole = CreateText(undefined, "objective", 2, "center", "center", "user_center", "user_center", 0, -180, undefined, 1, undefined, undefined, true, false, 0);
        
        self.structureconsole SetElementText("Pack-a-Punch: (" + Ceil(self GetOrigin()[0]) + ", " + Ceil(self GetOrigin()[1]) + ", " + Ceil(self GetOrigin()[2]) + "), (" + Ceil(self.angles[0]) + ", " + Ceil(self.angles[1]) + ", " + Ceil(self.angles[2]) + ")");
    
    if (!IsDefined(level.developermode))
    {
        wait 5;
        self.structureconsole FadeOverTime(2);
        self.structureconsole.alpha = 0;
        wait 2;
        self.structureconsole DestroyElement();
    }
}

// changed self submenu

FOV()
{
    if (!IsDefined(self.fov) || self.fov == 120)
        self.fov = 65;
    else 
        self.fov += 5;
    
    self SetClientFOV(self.fov);
    self IPrintLn("FOV: ^2" + self.fov);
    
    UpdateSelfSubMenu();
}

// changed self submenu

Visions(type)
{
    if (!IsDefined(self.vision) || self.vision != type)
    {
        self.vision = type;
        self UseServerVisionSet(false);
        self UseServerVisionSet(true);
        self IPrintLn("^7" + self.vision + " Vision: ^2Enabled");
        
        if (type == "Darkened")
            self SetVisionSetforPlayer("remote_mortar_enhanced", 0);
        if (type == "Lightened")
            self SetVisionSetforPlayer("taser_mine_shock", 0);
        if (type == "Black & White")
            self SetVisionSetforPlayer("mpintro", 0);
    }
    else
    {
        self IPrintLn("^7" + self.vision + " Vision: ^1Disabled");
        self.vision = undefined;
        self UseServerVisionSet(false);
    }

    UpdateSelfSubMenu();
}

TeleportToMe(player)
{
    if (player IsHost() && !IsDefined(self.hashostprivileges))
        self IPrintLn("^1Error: ^7Cannot Teleport " + GetAbbreviatedPlayerName(player));
    else
    {
        player SetOrigin(self GetOrigin());
        player IPrintLn(GetAbbreviatedPlayerName(self) + " Teleported You To Them");
    }
}

TeleportToPlayer(player)
{
    self SetOrigin(player GetOrigin());
    self IPrintLn("Teleported To " + GetAbbreviatedPlayerName(player));
}

GivePlayerPoints(amount, player)
{
    player.points += amount;
    self IPrintLn("You Have Given " + GetAbbreviatedPlayerName(player) + " +^2$" + amount);
            
    if (player != self)
        player IPrintLn(GetAbbreviatedPlayerName(self) + " Has Given You +^2$" + amount);
}

GiveHostPrivileges(player)
{
    if (!player IsHost())
    {
        if (!IsDefined(player.hashostprivileges))
        {
            player.hashostprivileges = true;
            
            if (player.menuopen)
                player CloseTheMenu();

            player thread ResetTheMenu();    
            self IPrintLn(GetAbbreviatedPlayerName(player) + " Has Been Given Host Privileges");
        }
        else
        {
            player.hashostprivileges = undefined;
            
            if (player.menuopen)
                player CloseTheMenu();
            
            player thread ResetTheMenu();       
            self IPrintLn(GetAbbreviatedPlayerName(player) + " Host Privileges Have Been Taken");
        }
    }
    else
        self IPrintLn("^1Error: ^7Cannot Modify Host Menu For " + GetAbbreviatedPlayerName(player));   
}

KillPlayer(player)
{
    player Suicide();
    self IPrintLn(GetAbbreviatedPlayerName(player) + " Has Been ^1Killed"); 
}

checkedSubmenuPreviousMenu(){
    self Submenu(self.menu.previousmenu[self.menu.currentmenu]);
}

// changed submenu previous

KickPlayer(player)
{
    if (player != self && !player IsHost())
    {
        Kick(player GetEntityNumber());
        wait 0.5;
        checkedSubmenuPreviousMenu();
        IPrintLn(GetAbbreviatedPlayerName(player) + " Has Been ^1Kicked");
    }
    else
        self IPrintLn("^1Error: ^7Cannot Kick " + GetAbbreviatedPlayerName(player));   
}

// changed subemnu

BanPlayer(player)
{
    if (player != self && !player IsHost())
    {
        Ban(player GetEntityNumber());
        wait 0.5;
        checkedSubmenuPreviousMenu();
        IPrintLn(GetAbbreviatedPlayerName(player) + " Has Been ^1Banned");
    }
    else
        self IPrintLn("^1Error: ^7Cannot Ban " + GetAbbreviatedPlayerName(player));    
}

FreezeConsole(player)
{
    self Endon("disconnect");
    
    if (player != self && !player IsHost())
    {
        while (IsDefined(player))
        {
            player IPrintLnBold("^HO");
            wait 0.05;
        }
        
        IPrintLn(GetAbbreviatedPlayerName(player) + " Has Been ^1Freezed");
    }
    else
        self IPrintLn("^1Error: ^7Cannot Freeze " + GetAbbreviatedPlayerName(player));         
}

DonatePlayerPoints(amount, player)
{
    if (self.points >= amount)
    {
        player.points += amount;
        self.points -= amount;
        player IPrintLn(GetAbbreviatedPlayerName(self) + " Has Given You +^2$" + amount);
        self IPrintLn("You Have Given " + GetAbbreviatedPlayerName(player) + " +^2$" + amount);
    }
    else 
        self IPrintLn("^1Error: ^7You Do Not Have Enough Points To Donate");
}

MenuOptions()
{
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Human Menu                                                                                                                                        
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    if (self.status == "Human" && !IsDefined(self.usingmarket))
    {
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Main                                                                                 
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self AddMenu("Human Menu", undefined, "em_bg_ani_armor");
        self AddOption("Human Menu", "Inventory", ::Submenu, "Inventory");
        self AddOption("Human Menu", "Structures", ::Submenu, "Structures");
        self AddOption("Human Menu", "Rewards", ::Submenu, "Rewards");
        self AddOption("Human Menu", "Options", ::Submenu, "Options");
        self AddOption("Human Menu", "Players", ::Submenu, "Players");

        if (self IsHost() || IsDefined(self.hashostprivileges))
            self AddOption("Human Menu", "Host", ::Submenu, "Host");
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Inventory                                                                                
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self AddMenu("Inventory", "Human Menu", "em_bg_ani_armor");
        //self AddOption("Inventory", "Consumables", ::Submenu, "Consumables");
        self AddOption("Inventory", "Equipment", ::Submenu, "Equipment");
        self AddOption("Inventory", "Weapons", ::Submenu, "Weapons");
        
        //self AddMenu("Consumables", "Inventory", "em_bg_ani_armor", "Reposition");
        self AddMenu("Equipment", "Inventory", "em_bg_ani_armor", "Reposition", 50, 50, 5);
        self AddMenu("Weapons", "Inventory", "em_bg_ani_armor", "Reposition", 100, 50, 20);
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Structures                                                                                 
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self AddMenu("Structures", "Human Menu", "emblem_bg_streak_sentry", true);
        self AddOption("Structures", "Wall", ::PlayerCreateWall);
        self AddOption("Structures", "Floor", ::PlayerCreateFloor);
        self AddOption("Structures", "Elevator", ::PlayerCreateElevator);
        self AddOption("Structures", "Door", ::PlayerCreateDoor);
        self AddOption("Structures", "Manual Turret", ::PlayerCreateTurret, "Manual");
        self AddOption("Structures", "Auto Turret", ::PlayerCreateTurret, "Auto");
        self AddOption("Structures", "Guardian", ::PlayerCreateGuardian);
        
        
        if (self IsHost() || IsDefined(self.hashostprivileges))
        {
            self AddOption("Structures", "One-Way Portal", ::PlayerCreatePortal, "One-Way");
            self AddOption("Structures", "Two-Way Portal", ::PlayerCreatePortal, "Two-Way");
            self AddOption("Structures", "One-Way Zipline", ::PlayerCreateZipline, "One-Way");
            self AddOption("Structures", "Two-Way Zipline", ::PlayerCreateZipline, "Two-Way");
            self AddOption("Structures", "Wall Weapon", ::PlayerCreateWallWeapon);
            self AddOption("Structures", "Market", ::PlayerCreateMarket);
            self AddOption("Structures", "Mystery Box", ::PlayerCreateMysteryBox);
            self AddOption("Structures", "Pack-a-Punch", ::PlayerCreatePackaPunch);
        }
    
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Rewards                                                                                
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self AddMenu("Rewards", "Human Menu", "emblem_bg_ovsat_support", true);
        self AddOption("Rewards", "^150 Kills" + ReturnTwo(self.gamerank >= 1, "^7", "^0") + " Ninja");
        self AddOption("Rewards", "^1100 Kills" + ReturnTwo(self.gamerank >= 2, "^7", "^0") + " Apprentice Carpenter");
        self AddOption("Rewards", "^1200 Kills" + ReturnTwo(self.gamerank >= 3, "^7", "^0") + " Bankroller");
        self AddOption("Rewards", "^1300 Kills" + ReturnTwo(self.gamerank >= 4, "^7", "^0") + " Samurai");
        self AddOption("Rewards", "^1400 Kills" + ReturnTwo(self.gamerank >= 5, "^7", "^0") + " Financier");
        self AddOption("Rewards", "^1500 Kills" + ReturnTwo(self.gamerank >= 6, "^7", "^0") + " Master Builder");
    }

    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Zombie Menu                                                                                                                                        
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    if (self.status == "Zombie")
    {
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Main                                                                                
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self AddMenu("Zombie Menu", undefined, "em_bg_ani_afterlife");
        self AddOption("Zombie Menu", "^1Equipment", ::Submenu, "Equipment");
        self AddOption("Zombie Menu", "^7Zombie Types", ::Submenu, "Zombie Types");
        self AddOption("Zombie Menu", "^1Rewards", ::Submenu, "Rewards");
        self AddOption("Zombie Menu", "^7Options", ::Submenu, "Options");
        self AddOption("Zombie Menu", "^1Players", ::Submenu, "Players");
        
        if (self IsHost() || IsDefined(self.hashostprivileges))
            self AddOption("Zombie Menu", "^7Host", ::Submenu, "Host");

        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Equipment                                                                                
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self AddMenu("Equipment", "Zombie Menu", "emblem_bg_equip_ax", undefined, 50, 50, 5);
        self AddOption("Equipment", "^7Combat Axe / ^2$" + level.price["hatchet_mp"], ::PlayerBuyItem, GetItemRarities("hatchet_mp")[0], "hatchet_mp", GetEquipmentShader("hatchet_mp"));
        self AddOption("Equipment", "^7Shock Charge / ^2$" + level.price["proximity_grenade_mp"], ::PlayerBuyItem, GetItemRarities("proximity_grenade_mp")[0], "proximity_grenade_mp", GetEquipmentShader("proximity_grenade_mp"));
        self AddOption("Equipment", "^7Flashbang / ^2$" + level.price["flash_grenade_mp"], ::PlayerBuyItem, GetItemRarities("flash_grenade_mp")[0], "flash_grenade_mp", GetEquipmentShader("flash_grenade_mp"));
        self AddOption("Equipment", "^7Smoke Grenade / ^2$" + level.price["willy_pete_mp"], ::PlayerBuyItem, GetItemRarities("willy_pete_mp")[0], "willy_pete_mp", GetEquipmentShader("willy_pete_mp"));
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Zombie Types                                                                                
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self AddMenu("Zombie Types", "Zombie Menu", "emblem_bg_master");
        self AddOption("Zombie Types", "^7Riot / ^2$" + level.priceriotzombie, ::RiotZombie);
        self AddOption("Zombie Types", "^7Crawler / ^2$" + level.pricecrawlerzombie, ::CrawlerZombie);
        self AddOption("Zombie Types", "^7Electric / ^2$" + level.priceelectriczombie, ::ElectricZombie);
        self AddOption("Zombie Types", "^7Napalm / ^2$" + level.pricenapalmzombie, ::NapalmZombie);
        self AddOption("Zombie Types", "^7Cyborg / ^2$" + level.pricecyborgzombie, ::CyborgZombie);
        self AddOption("Zombie Types", "^7Mist / ^2$" + level.pricemistzombie, ::MistZombie);
        self AddOption("Zombie Types", "^7Summoner / ^2$" + level.pricesummonerzombie, ::SummonerZombie);
        self AddOption("Zombie Types", "^7Juggernaut / ^2$" + level.pricejuggernautzombie, ::JuggernautZombie);
        self AddOption("Zombie Types", "^7Goliath / ^2$" + level.pricegoliathzombie, ::GoliathZombie);
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Rewards                                                                                
        //╚════════════════════════════════════════════════════════════════════════════════════════════Visions══════════════

        self AddMenu("Rewards", "Zombie Menu", "emblem_bg_ovsat_support", true);
        self AddOption("Rewards", "^115 Deaths" + ReturnTwo(self.gamerank >= 1, "^7", "^0") + " $500");
        self AddOption("Rewards", "^130 Deaths" + ReturnTwo(self.gamerank >= 2, "^7", "^0") + " $1000");
        self AddOption("Rewards", "^150 Deaths" + ReturnTwo(self.gamerank >= 3, "^7", "^0") + " $3000");
        self AddOption("Rewards", "^1100 Deaths" + ReturnTwo(self.gamerank >= 4, "^7", "^0") + " $5000");
        self AddOption("Rewards", "^1300 Deaths" + ReturnTwo(self.gamerank >= 5, "^7", "^0") + " Infection Antidote");
    }

    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Universal Menu                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    if (!IsDefined(self.usingmarket))
    {
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Options                                                                                
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self AddMenu("Options", self.status + " Menu", "emblem_bg_snd_bomb_defuser", true);
        self AddOption("Options", ("Third Person" + GetOptionStatus(self.thirdperson)), ::ThirdPerson);
        self AddOption("Options", ("FOV" + GetOptionStatus(self.fov, self.fov)), ::FOV);
        self AddOption("Options", ("Darkened Vision" + GetOptionStatus(self.vision, "Darkened")), ::Visions, "Darkened");
        self AddOption("Options", ("Lightened Vision" + GetOptionStatus(self.vision, "Lightened")), ::Visions, "Lightened");
        self AddOption("Options", ("Black & White Vision" + GetOptionStatus(self.vision, "Black & White")), ::Visions, "Black & White");
        self AddOption("Options", "Host: " + GetHostName());
        self AddOption("Options", "Map Edit By: " + level.mapeditmaker + "^7");
        self AddOption("Options", "Version:^1 Update 8^7");
        self AddOption("Options", "Script Models: " + GetEntArray("script_model", "classname").size);
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Players                                                                                
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self AddMenu("Players", self.status + " Menu", "emblem_bg_ovsat_support", "Reposition");

        for (i = 0; i < 3; i ++)
        {
            if (i == 0)
                sort = "Self";
            if (i == 1)
                sort = "Human";
            if (i == 2)
                sort = "Zombie";
                
            foreach (player in level.players)
            {   
                if (sort == "Self" && player == self)
                    sortiscorrect = true;
                if (sort != "Self" && player.status == sort && player != self)
                    sortiscorrect = true;
                if (IsDefined(sortiscorrect))
                {
                    sortiscorrect = undefined;
                    title = "";
                    
                    if (player IsHost())
                        title = "^7[^3Host^7] ";
                    if (player Is_Bot())
                        title = "^7[Bot] ";

                    self AddOption("Players", title + GetStatusColor(player) + GetAbbreviatedPlayerName(player), ::Submenu, GetAbbreviatedPlayerName(player));
                    
                    self AddMenu(GetAbbreviatedPlayerName(player), "Players", "emblem_bg_ovsat_support");
                    self AddOption(GetAbbreviatedPlayerName(player), "Player Options", ::Submenu, GetAbbreviatedPlayerName(player) + " Options");
                        
                    self AddMenu(GetAbbreviatedPlayerName(player) + " Options", GetAbbreviatedPlayerName(player), "emblem_bg_ovsat_support", true); 
                    
                    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
                    //┃ Player Options
                    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

                    if (self IsHost() || IsDefined(self.hashostprivileges) || IsDefined(self.developermode))
                    { 
                        self AddOption(GetAbbreviatedPlayerName(player) + " Options", "Teleport To Me", ::TeleportToMe, player);
                        self AddOption(GetAbbreviatedPlayerName(player) + " Options", "Teleport To Them", ::TeleportToPlayer, player);
                    }

                    if (player != self && player.status == self.status)
                    {
                        self AddOption(GetAbbreviatedPlayerName(player) + " Options", "Donate +^2$100^7", ::DonatePlayerPoints, 100, player);
                        self AddOption(GetAbbreviatedPlayerName(player) + " Options", "Donate +^2$1000^7", ::DonatePlayerPoints, 1000, player);
                        self AddOption(GetAbbreviatedPlayerName(player) + " Options", "Donate +^2$10000^7", ::DonatePlayerPoints, 10000, player);
                    }

                    if (self IsHost() || IsDefined(self.hashostprivileges))
                    {
                        self AddOption(GetAbbreviatedPlayerName(player) + " Options", "Give +^2$100^7", ::GivePlayerPoints, 100, player);
                        self AddOption(GetAbbreviatedPlayerName(player) + " Options", "Give +^2$1000^7", ::GivePlayerPoints, 1000, player);
                        self AddOption(GetAbbreviatedPlayerName(player) + " Options", "Give +^2$10000^7", ::GivePlayerPoints, 10000, player);
                        self AddOption(GetAbbreviatedPlayerName(player) + " Options", "Give ^3Host^7 Privileges", ::GiveHostPrivileges, player);
                        self AddOption(GetAbbreviatedPlayerName(player) + " Options", "Kill", ::KillPlayer, player);
                        self AddOption(GetAbbreviatedPlayerName(player) + " Options", "Kick", ::KickPlayer, player);
                        self AddOption(GetAbbreviatedPlayerName(player) + " Options", "Ban", ::BanPlayer, player);
                        
                        if (!Is_PC())
                            self AddOption(GetAbbreviatedPlayerName(player) + " Options", "Freeze Console", ::FreezeConsole, player);
                        
                        self AddOption(GetAbbreviatedPlayerName(player) + " Options", "Change To A ^5Human^7", ::ChangeToHuman, player);
                        self AddOption(GetAbbreviatedPlayerName(player) + " Options", "Change To A ^1Zombie^7", ::ChangeToZombie, player);
                    }
                   
                    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
                    //┃ Player Score
                    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

                    self AddOption(GetAbbreviatedPlayerName(player), "Player Score", ::Submenu, GetAbbreviatedPlayerName(player) + " Score");
                    
                    self AddMenu(GetAbbreviatedPlayerName(player) + " Score", GetAbbreviatedPlayerName(player), "emblem_bg_ovsat_support", true);
                    self AddOption(GetAbbreviatedPlayerName(player) + " Score", "Points: ^2$" + player.points + "^7");
                    self AddOption(GetAbbreviatedPlayerName(player) + " Score", "Kills: ^1" + player.pers["kills"]);
                    self AddOption(GetAbbreviatedPlayerName(player) + " Score", "^7Headshots: ^1" + player.pers["headshots"]);
                    
                    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
                    //┃ Player Stats
                    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

                    self AddOption(GetAbbreviatedPlayerName(player), "Player Stats", ::Submenu, GetAbbreviatedPlayerName(player) + " Stats");
                    
                    self AddMenu(GetAbbreviatedPlayerName(player) + " Stats", GetAbbreviatedPlayerName(player), "emblem_bg_ovsat_support");
                    self AddOption(GetAbbreviatedPlayerName(player) + " Stats", "(Public Matches Only)");
                    self AddOption(GetAbbreviatedPlayerName(player) + " Stats", "^7Longest Time Survived: ^1" + ConvertToHHMMSS(player GetStat("longest_time_survived")));
                }
            }
        }
    
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Host                                                                                
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        if (self IsHost() || IsDefined(self.hashostprivileges))
        {
            self AddMenu("Host", self.status + " Menu", "emblem_bg_combat_master");
            self AddOption("Host", "Self Mods", ::Submenu, "Self Mods");
            self AddOption("Host", "All Players", ::Submenu, "All Players");
            self AddOption("Host", "Supplies", ::Submenu, "Supplies");
            self AddOption("Host", "Lobby", ::Submenu, "Lobby");
            self AddOption("Host", "Developer", ::Submenu, "Developer");
            self AddOption("Host", "Maps", ::Submenu, "Maps");
            self AddOption("Host", "DLC Maps", ::Submenu, "DLC Maps");
            
            self AddMenu("Self Mods", "Host", "emblem_bg_combat_master", true);
            self AddOption("Self Mods", ("GOD Mode" + GetOptionStatus(self.godmode)), ::GodMode);
            self AddOption("Self Mods", ("UFO Mode" + GetOptionStatus(self.ufomode)), ::UFOMode);
            self AddOption("Self Mods", ("Invisibility" + GetOptionStatus(self.invisibility)), ::Invisibility);
            self AddOption("Self Mods", ("Rapid Fire" + GetOptionStatus(self.rapidfire)), ::RapidFire);
            self AddOption("Self Mods", ("Paintbrush" + GetOptionStatus(self.paintbrush)), ::Paintbrush);
            self AddOption("Self Mods", ("Show FPS" + GetOptionStatus(level.showfps)), ::ShowFPS);

            self AddMenu("All Players", "Host", "emblem_bg_combat_master", true);
            self AddOption("All Players", "Give ^5Humans^7 +^2$1000^7", ::GivePlayersPoints, 1000, "Human");
            self AddOption("All Players", "Give ^1Zombies^7 +^2$1000^7", ::GivePlayersPoints, 1000, "Zombie");
            self AddOption("All Players", "Teleport ^5Humans^7 To You", ::TeleportPlayers, "Human", "self");
            self AddOption("All Players", "Teleport ^5Humans^7 To Location", ::TeleportPlayers, "Human", "location");
            self AddOption("All Players", "Teleport ^1Zombies^7 To You", ::TeleportPlayers, "Zombie", "self");
            self AddOption("All Players", "Teleport ^1Zombies^7 To Location", ::TeleportPlayers, "Zombie", "location");
            self AddOption("All Players", "Change Players To ^5Humans^7", ::ChangePlayersStatus, "Human");
            self AddOption("All Players", "Change Players To ^1Zombies^7", ::ChangePlayersStatus, "Zombie");
            self AddOption("All Players", ("Freeze All Players" + GetOptionStatus(level.freezeallplayers)), ::FreezeAllPlayers);
            
            self AddMenu("Supplies", "Host", "emblem_bg_combat_master");
            self AddOption("Supplies", "Power-Ups", ::Submenu, "Power-Ups");
            self AddOption("Supplies", "Drop Items", ::Submenu, "Drop Items");
            self AddOption("Supplies", "Call Supplies Helicopter", ::SuppliesHelicopter, true);
            
            self AddMenu("Power-Ups", "Supplies", "emblem_bg_combat_master");
            self AddOption("Power-Ups", "Max Ammo", ::MaxAmmo);
            self AddOption("Power-Ups", "Insta-Kill", ::InstaKill);
            self AddOption("Power-Ups", "Double Points", ::DoublePoints);
            self AddOption("Power-Ups", "Nuke", ::Nuke);
            self AddOption("Power-Ups", "Fire Sale", ::FireSale);
            self AddOption("Power-Ups", "Free Perk", ::FreePerk);
            self AddOption("Power-Ups", "Zombie Blood", ::ZombieBlood);
            self AddOption("Power-Ups", "Death Machine", ::DeathMachine);
            self AddOption("Power-Ups", "Drop Random Power-Up", ::DropPowerUp);
            
            self AddMenu("Drop Items", "Supplies", "emblem_bg_combat_master");
            self AddOption("Drop Items", "Drop Pistols", ::DropCategoryItems, "Pistols");
            self AddOption("Drop Items", "Drop Submachine Guns", ::DropCategoryItems, "Submachine Guns");
            self AddOption("Drop Items", "Drop Assault Rifles", ::DropCategoryItems, "Assault Rifles");
            self AddOption("Drop Items", "Drop Shotguns", ::DropCategoryItems, "Shotguns");
            self AddOption("Drop Items", "Drop Lightmachine Guns", ::DropCategoryItems, "Lightmachine Guns");
            self AddOption("Drop Items", "Drop Sniper Rifles", ::DropCategoryItems, "Sniper Rifles");
            self AddOption("Drop Items", "Drop Launchers", ::DropCategoryItems, "Launchers");
            self AddOption("Drop Items", "Drop Specials", ::DropCategoryItems, "Specials");
            
            // self AddMenu("Lobby", "Host", "emblem_bg_combat_master", true);
            // self AddOption("Lobby", ("Everyone Hears Everyone" + GetOptionStatus(GetDvar("everyone_hears_everyone"))), ::EveryoneHearsEveryone);
            // self AddOption("Lobby", ("Anti Join" + GetOptionStatus(level.antijoin)), ::AntiJoin);
            // self AddOption("Lobby", ("Anti Quit" + GetOptionStatus(level.antiquit)), ::AntiQuit);
            // self AddOption("Lobby", ("Auto Restart" + GetOptionStatus(GetDvar("auto_restart"))), ::AutoRestart);
            // self AddOption("Lobby", "Pause Game", ::PauseGame);
            // self AddOption("Lobby", "End Game", ::EndTheGame);
            // self AddOption("Lobby", ("Time Scale " + GetOptionStatus(level.timescale, level.timescale)), ::TimeScale);
            // self AddOption("Lobby", ("Blood Sky" + GetOptionStatus(level.bloodysky)), ::BloodSky);
            // self AddOption("Lobby", "Spawn Bot", ::SpawnBots, 1);
            // self AddOption("Lobby", ("Auto Spawn Bots" + GetOptionStatus(GetDvar("auto_spawn_bots"))), ::AutoSpawnBots);
            
            // self AddMenu("Developer", "Host", "emblem_bg_combat_master", true);
            // self AddOption("Developer", ("Object Control" + GetOptionStatus(self.objectcontrol)), ::ObjectControl);
            // self AddOption("Developer", ("Spawn Cycle" + GetOptionStatus(self.spawncycle)), ::SpawnCycle);
            // self AddOption("Developer", ("Damage Triggers" + GetOptionStatus(level.damagetriggersmoved)), ::ToggleDamageTriggers);
            // self AddOption("Developer", "Delete All Script Models", ::DeleteAllScriptModels);
            // self AddOption("Developer", "Delete All Brush Models", ::DeleteAllBrushModels);
            // self AddOption("Developer", "Delete All Ground Items", ::DeleteAllGroundItems);
            // self AddOption("Developer", ("^1Developer Mode" + GetOptionStatus(level.developermode)), ::DeveloperMode);
            
            self AddMenu("Maps", "Host", "emblem_bg_combat_master");
            self AddOption("Maps", "Aftermath", ::ChangeMap, "mp_la");
            self AddOption("Maps", "Cargo", ::ChangeMap, "mp_dockside");
            self AddOption("Maps", "Carrier", ::ChangeMap, "mp_carrier");
            self AddOption("Maps", "Drone", ::ChangeMap, "mp_drone");
            self AddOption("Maps", "Express", ::ChangeMap, "mp_express");
            self AddOption("Maps", "Hijacked", ::ChangeMap, "mp_hijacked");
            self AddOption("Maps", "Meltdown", ::ChangeMap, "mp_meltdown");
            self AddOption("Maps", "Overflow", ::ChangeMap, "mp_overflow");
            self AddOption("Maps", "Plaza", ::ChangeMap, "mp_nightclub");
            self AddOption("Maps", "Raid", ::ChangeMap, "mp_raid");
            self AddOption("Maps", "Slums", ::ChangeMap, "mp_slums");
            self AddOption("Maps", "Standoff", ::ChangeMap, "mp_village");
            self AddOption("Maps", "Turbine", ::ChangeMap, "mp_turbine");
            self AddOption("Maps", "Yemen", ::ChangeMap, "mp_socotra");
            
            self AddMenu("DLC Maps", "Host", "emblem_bg_combat_master");
            self AddOption("DLC Maps", "Nuketown", ::ChangeMap, "mp_nuketown_2020");
            self AddOption("DLC Maps", "Downhill", ::ChangeMap, "mp_downhill");
            self AddOption("DLC Maps", "Mirage", ::ChangeMap, "mp_mirage");
            self AddOption("DLC Maps", "Hydro", ::ChangeMap, "mp_hydro");
            self AddOption("DLC Maps", "Grind", ::ChangeMap, "mp_skate");
            self AddOption("DLC Maps", "Encore", ::ChangeMap, "mp_concert");
            self AddOption("DLC Maps", "Magma", ::ChangeMap, "mp_magma");
            self AddOption("DLC Maps", "Vertigo", ::ChangeMap, "mp_vertigo");
            self AddOption("DLC Maps", "Studio", ::ChangeMap, "mp_studio");
            self AddOption("DLC Maps", "Uplink", ::ChangeMap, "mp_uplink");
            self AddOption("DLC Maps", "Detour", ::ChangeMap, "mp_bridge");
            self AddOption("DLC Maps", "Cove", ::ChangeMap, "mp_castaway");
            self AddOption("DLC Maps", "Rush", ::ChangeMap, "mp_paintball");
            self AddOption("DLC Maps", "Dig", ::ChangeMap, "mp_dig");
            self AddOption("DLC Maps", "Frost", ::ChangeMap, "mp_frostbite");
            self AddOption("DLC Maps", "Pod", ::ChangeMap, "mp_pod");
            self AddOption("DLC Maps", "Takeoff", ::ChangeMap, "mp_takeoff");
        }
    }

    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Market Menu                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    if (IsDefined(self.usingmarket))
    {
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Main                                                                               
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self AddMenu("Market Menu", undefined, "emblem_bg_career_mastery_primary");
        self AddOption("Market Menu", "Inventory", ::Submenu, "Inventory");
        self AddOption("Market Menu", "Perks", ::Submenu, "Perks");
        //self AddOption("Market Menu", "Consumables", ::Submenu, "Consumables"  + "$&1");
        self AddOption("Market Menu", "Equipment", ::Submenu, "Equipment"  + "$&1");
        self AddOption("Market Menu", "Weapons", ::Submenu, "Weapons"  + "$&1");
        self AddOption("Market Menu", "Attachments", ::Submenu, "Attachments");
        self AddOption("Market Menu", "Support", ::Submenu, "Support");
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Inventory                                                                                
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self AddMenu("Inventory", "Market Menu", "em_bg_ani_armor");
        //self AddOption("Inventory", "Consumables", ::Submenu, "Consumables");
        self AddOption("Inventory", "Equipment", ::Submenu, "Equipment");
        self AddOption("Inventory", "Weapons", ::Submenu, "Weapons");
        
        //self AddMenu("Consumables", "Inventory", "em_bg_ani_armor", true);
        self AddMenu("Equipment", "Inventory", "em_bg_ani_armor", true, 50, 50, 5);
        self AddMenu("Weapons", "Inventory", "em_bg_ani_armor", true, 100, 50, 20);

        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Perks                                                                               
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self AddMenu("Perks", "Market Menu", "emblem_bg_chain_killer", true);
        self AddOption("Perks", "^7Juggernog / " + GetOptionStatus(self.juggernog, undefined, ("^2$" + level.pricejuggernog), "^2Owned"), ::Juggernog);
        self AddOption("Perks", "^7Double Tap II / " + GetOptionStatus(self.doubletapii, undefined, ("^2$" + level.pricedoubletapii), "^2Owned"), ::DoubleTapII);
        self AddOption("Perks", "^7Speed Cola / " + GetOptionStatus(self.speedcola, undefined, ("^2$" + level.pricespeedcola), "^2Owned"), ::SpeedCola);
        self AddOption("Perks", "^7Stamin-Up / " + GetOptionStatus(self.staminup, undefined, ("^2$" + level.pricestaminup), "^2Owned"), ::StaminUp);
        self AddOption("Perks", "^7Mule Kick / " + GetOptionStatus(self.mulekick, undefined, ("^2$" + level.pricemulekick), "^2Owned"), ::MuleKick);
        self AddOption("Perks", "^7Electric Cherry / " + GetOptionStatus(self.electriccherry, undefined, ("^2$" + level.priceelectriccherry), "^2Owned"), ::ElectricCherry);
        self AddOption("Perks", "^7PhD Flopper / " + GetOptionStatus(self.phdflopper, undefined, ("^2$" + level.pricephdflopper), "^2Owned"), ::PhDFlopper);
        self AddOption("Perks", "^7Deadshot Daiquiri / " + GetOptionStatus(self.deadshotdaiquiri, undefined, ("^2$" + level.pricedeadshotdaiquiri), "^2Owned"), ::DeadshotDaiquiri);
        self AddOption("Perks", "^7Stealth Aid / " + GetOptionStatus(self.stealthaid, undefined, ("^2$" + level.pricestealthaid), "^2Owned"), ::StealthAid);
        self AddOption("Perks", "^7Scavenger / " + GetOptionStatus(self.scavenger, undefined, ("^2$" + level.pricescavenger), "^2Owned"), ::Scavenger);

        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Consumables                                                                               
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        //self AddMenu("Consumables" + "$&1", "Market Menu", "emblem_bg_trophy_v"); 
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Equipment                                                                               
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self AddMenu("Equipment" + "$&1", "Market Menu", "emblem_bg_trophy_v", undefined, 50, 50, 5); 
        self AddOption("Equipment" + "$&1", "^7Grenade / ^2$" + level.price["frag_grenade_mp"], ::PlayerBuyItem, undefined,"frag_grenade_mp", GetEquipmentShader("frag_grenade_mp"));
        self AddOption("Equipment" + "$&1", "^7Semtex / ^2$" + level.price["sticky_grenade_mp"], ::PlayerBuyItem, undefined, "sticky_grenade_mp", GetEquipmentShader("sticky_grenade_mp"));
        self AddOption("Equipment" + "$&1", "^7Bouncing Betty / ^2$" + level.price["bouncingbetty_mp"], ::PlayerBuyItem, undefined, "bouncingbetty_mp", GetEquipmentShader("bouncingbetty_mp"));
        self AddOption("Equipment" + "$&1", "^7C4 / ^2$" + level.price["satchel_charge_mp"], ::PlayerBuyItem, undefined, "satchel_charge_mp", GetEquipmentShader("satchel_charge_mp"));
        self AddOption("Equipment" + "$&1", "^7Claymore / ^2$" + level.price["claymore_mp"], ::PlayerBuyItem, undefined, "claymore_mp", GetEquipmentShader("claymore_mp"));
        self AddOption("Equipment" + "$&1", "^7Concussion / ^2$" + level.price["concussion_grenade_mp"], ::PlayerBuyItem, undefined, "concussion_grenade_mp", GetEquipmentShader("concussion_grenade_mp"));
        self AddOption("Equipment" + "$&1", "^7Sensor Grenade / ^2$" + level.price["sensor_grenade_mp"], ::PlayerBuyItem, undefined, "sensor_grenade_mp", GetEquipmentShader("sensor_grenade_mp"));
        self AddOption("Equipment" + "$&1", "^7EMP Grenade / ^2$" + level.price["emp_grenade_mp"], ::PlayerBuyItem, undefined, "emp_grenade_mp", GetEquipmentShader("emp_grenade_mp"));
        self AddOption("Equipment" + "$&1", "^7Shock Charge / ^2$" + level.price["proximity_grenade_mp"], ::PlayerBuyItem, undefined, "proximity_grenade_mp", GetEquipmentShader("proximity_grenade_mp"));
        self AddOption("Equipment" + "$&1", "^7Flashbang / ^2$" + level.price["flash_grenade_mp"], ::PlayerBuyItem, undefined, "flash_grenade_mp", GetEquipmentShader("flash_grenade_mp"));
        self AddOption("Equipment" + "$&1", "^7Gersh Device / ^2$" + level.price["trophy_system_mp"], ::PlayerBuyItem, undefined, "trophy_system_mp", GetEquipmentShader("trophy_system_mp"));
            
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Weapons                                                                               
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self AddMenu("Weapons" + "$&1", "Market Menu", "emblem_bg_career_mastery_primary");
        self AddOption("Weapons" + "$&1", "Pistols", ::Submenu, "Pistols");
        self AddOption("Weapons" + "$&1", "Submachine Guns", ::Submenu, "Submachine Guns");
        self AddOption("Weapons" + "$&1", "Assault Rifles", ::Submenu, "Assault Rifles");
        self AddOption("Weapons" + "$&1", "Shotguns", ::Submenu, "Shotguns");
        self AddOption("Weapons" + "$&1", "Lightmachine Guns", ::Submenu, "Lightmachine Guns");
        self AddOption("Weapons" + "$&1", "Sniper Rifles", ::Submenu, "Sniper Rifles");
        self AddOption("Weapons" + "$&1", "Launchers", ::Submenu, "Launchers");
        self AddOption("Weapons" + "$&1", "Specials", ::Submenu, "Specials");
        
        self AddMenu("Pistols", "Weapons" + "$&1", "emblem_bg_prestige_sfighter");
        
        foreach (rarity in Array("Common", "Uncommon", "Rare", "Epic", "Legendary"))
        {
            self AddOption("Pistols", rarity, ::Submenu, rarity + "$&1");
            
            self AddMenu(rarity + "$&1", "Pistols", "emblem_bg_prestige_sfighter", undefined, 100, 50, 20);
            self AddOption(rarity + "$&1", "^7Five-seven / ^2$" + (level.price["fiveseven_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "fiveseven_mp", GetWeaponShader("fiveseven_mp"));
            self AddOption(rarity + "$&1", "^7Tac-45 / ^2$" + (level.price["fnp45_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "fnp45_mp", GetWeaponShader("fnp45_mp"));
            self AddOption(rarity + "$&1", "^7B23R / ^2$" + (level.price["beretta93r_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "beretta93r_mp", GetWeaponShader("beretta93r_mp"));
            self AddOption(rarity + "$&1", "^7Executioner / ^2$" + (level.price["judge_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "judge_mp", GetWeaponShader("judge_mp"));
            self AddOption(rarity + "$&1", "^7KAP-40 / ^2$" + (level.price["kard_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "kard_mp", GetWeaponShader("kard_mp"));
        }
        
        self AddMenu("Submachine Guns", "Weapons" + "$&1", "emblem_bg_career_mastery_smg");
        
        foreach (rarity in Array("Common", "Uncommon", "Rare", "Epic", "Legendary"))
        {
            self AddOption("Submachine Guns", rarity, ::Submenu, rarity + "$&2");
            
            self AddMenu(rarity + "$&2", "Submachine Guns", "emblem_bg_career_mastery_smg", undefined, 100, 50, 20);
            self AddOption(rarity + "$&2", "^7MP7 / ^2$" + (level.price["mp7_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "mp7_mp", GetWeaponShader("mp7_mp"));
            self AddOption(rarity + "$&2", "^7PDW-57 / ^2$" + (level.price["pdw57_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "pdw57_mp", GetWeaponShader("pdw57_mp"));
            self AddOption(rarity + "$&2", "^7Vector-K10 / ^2$" + (level.price["vector_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "vector_mp", GetWeaponShader("vector_mp"));
            self AddOption(rarity + "$&2", "^7MSMC / ^2$" + (level.price["insas_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "insas_mp", GetWeaponShader("insas_mp"));
            self AddOption(rarity + "$&2", "^7Chicom CQB / ^2$" + (level.price["qcw05_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "qcw05_mp", GetWeaponShader("qcw05_mp"));
            self AddOption(rarity + "$&2", "^7Skorpion EVO / ^2$" + (level.price["evoskorpion_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "evoskorpion_mp", GetWeaponShader("evoskorpion_mp"));
            self AddOption(rarity + "$&2", "^7Peacekeeper / ^2$" + (level.price["peacekeeper_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "peacekeeper_mp", GetWeaponShader("peacekeeper_mp"));
        }
        
        self AddMenu("Assault Rifles", "Weapons" + "$&1", "emblem_bg_career_mastery_ar");
        
        foreach (rarity in Array("Common", "Uncommon", "Rare", "Epic", "Legendary"))
        {
            self AddOption("Assault Rifles", rarity, ::Submenu, rarity + "$&3");
            
            self AddMenu(rarity + "$&3", "Assault Rifles", "emblem_bg_career_mastery_ar", undefined, 100, 50, 20);
            self AddOption(rarity + "$&3", "^7MTAR / ^2$" + (level.price["tar21_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "tar21_mp", GetWeaponShader("tar21_mp"));
            self AddOption(rarity + "$&3", "^7Type 25 / ^2$" + (level.price["type95_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "type95_mp", GetWeaponShader("type95_mp"));
            self AddOption(rarity + "$&3", "^7SWAT-556 / ^2$" + (level.price["sig556_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "sig556_mp", GetWeaponShader("sig556_mp"));
            self AddOption(rarity + "$&3", "^7FAL OSW / ^2$" + (level.price["sa58_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "sa58_mp", GetWeaponShader("sa58_mp"));
            self AddOption(rarity + "$&3", "^7M27 / ^2$" + (level.price["hk416_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "hk416_mp", GetWeaponShader("hk416_mp"));
            self AddOption(rarity + "$&3", "^7SCAR-H / ^2$" + (level.price["scar_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "scar_mp", GetWeaponShader("scar_mp"));
            self AddOption(rarity + "$&3", "^7SMR / ^2$" + (level.price["saritch_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "saritch_mp", GetWeaponShader("saritch_mp"));
            self AddOption(rarity + "$&3", "^7M8A1 / ^2$" + (level.price["xm8_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "xm8_mp", GetWeaponShader("xm8_mp"));
            self AddOption(rarity + "$&3", "^7AN-94 / ^2$" + (level.price["an94_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "an94_mp", GetWeaponShader("an94_mp"));
        }
        
        self AddMenu("Shotguns", "Weapons" + "$&1", "emblem_bg_career_mastery_shotgun");
        
        foreach (rarity in Array("Common", "Uncommon", "Rare", "Epic", "Legendary"))
        {
            self AddOption("Shotguns", rarity, ::Submenu, rarity + "$&4");
            
            self AddMenu(rarity + "$&4", "Shotguns", "emblem_bg_career_mastery_shotgun", undefined, 100, 50, 20);
            self AddOption(rarity + "$&4", "^7R870 MCS / ^2$" + (level.price["870mcs_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "870mcs_mp", GetWeaponShader("870mcs_mp"));
            self AddOption(rarity + "$&4", "^7S12 / ^2$" + (level.price["saiga12_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "saiga12_mp", GetWeaponShader("saiga12_mp"));
            self AddOption(rarity + "$&4", "^7KSG / ^2$" + (level.price["ksg_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "ksg_mp", GetWeaponShader("ksg_mp"));
            self AddOption(rarity + "$&4", "^7M1216 / ^2$" + (level.price["srm1216_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "srm1216_mp", GetWeaponShader("srm1216_mp"));
        }
        
        self AddMenu("Lightmachine Guns", "Weapons" + "$&1", "emblem_bg_career_mastery_lmg");
        
        foreach (rarity in Array("Common", "Uncommon", "Rare", "Epic", "Legendary"))
        {
            self AddOption("Lightmachine Guns", rarity, ::Submenu, rarity + "$&5");
            
            self AddMenu(rarity + "$&5", "Lightmachine Guns", "emblem_bg_career_mastery_lmg", undefined, 100, 50, 20);
            self AddOption(rarity + "$&5", "^7Mk 48 / ^2$" + (level.price["mk48_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "mk48_mp", GetWeaponShader("mk48_mp"));
            self AddOption(rarity + "$&5", "^7QBB LSW / ^2$" + (level.price["qbb95_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "qbb95_mp", GetWeaponShader("qbb95_mp"));
            self AddOption(rarity + "$&5", "^7LSAT / ^2$" + (level.price["lsat_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "lsat_mp", GetWeaponShader("lsat_mp"));
            self AddOption(rarity + "$&5", "^7HAMR / ^2$" + (level.price["hamr_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "hamr_mp", GetWeaponShader("hamr_mp"));
        }
        
        self AddMenu("Sniper Rifles", "Weapons" + "$&1", "emblem_bg_career_mastery_sniper");
        
        foreach (rarity in Array("Common", "Uncommon", "Rare", "Epic", "Legendary"))
        {
            self AddOption("Sniper Rifles", rarity, ::Submenu, rarity + "$&6");
            
            self AddMenu(rarity + "$&6", "Sniper Rifles", "emblem_bg_career_mastery_sniper", undefined, 100, 50, 20);
            self AddOption(rarity + "$&6", "^7SVU-AS / ^2$" + (level.price["svu_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "svu_mp", GetWeaponShader("svu_mp"));
            self AddOption(rarity + "$&6", "^7DSR 50 / ^2$" + (level.price["dsr50_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "dsr50_mp", GetWeaponShader("dsr50_mp"));
            self AddOption(rarity + "$&6", "^7Ballista / ^2$" + (level.price["ballista_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "ballista_mp", GetWeaponShader("ballista_mp"));
            self AddOption(rarity + "$&6", "^7XPR-50 / ^2$" + (level.price["as50_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "as50_mp", GetWeaponShader("as50_mp"));
        }
        
        self AddMenu("Launchers", "Weapons" + "$&1", "emblem_bg_anti_air_iv");
        
        foreach (rarity in Array("Common", "Uncommon", "Rare", "Epic", "Legendary"))
        {
            self AddOption("Launchers", rarity, ::Submenu, rarity + "$&7");
            
            self AddMenu(rarity + "$&7", "Launchers", "emblem_bg_anti_air_iv", undefined, 100, 50, 20);
            self AddOption(rarity + "$&7", "^7SMAW / ^2$" + (level.price["smaw_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "smaw_mp", GetWeaponShader("smaw_mp"));
            self AddOption(rarity + "$&7", "^7RPG / ^2$" + (level.price["usrpg_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "usrpg_mp", GetWeaponShader("usrpg_mp"));
            self AddOption(rarity + "$&7", "^7War Machine / ^2$" + (level.price["m32_wager_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "m32_wager_mp", GetWeaponShader("m32_wager_mp"));
        }
        
        self AddMenu("Specials", "Weapons" + "$&1", "emblem_bg_prestige_overkill");
        
        foreach (rarity in Array("Common", "Uncommon", "Rare", "Epic", "Legendary"))
        {
            self AddOption("Specials", rarity, ::Submenu, rarity + "$&8");
            
            self AddMenu(rarity + "$&8", "Specials", "emblem_bg_prestige_overkill", undefined, 100, 50, 20);
            self AddOption(rarity + "$&8", "^7Assault Shield / ^2$" + (level.price["riotshield_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "riotshield_mp", GetWeaponShader("riotshield_mp"));
            self AddOption(rarity + "$&8", "^7Knife / ^2$" + (level.price["knife_held_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "knife_held_mp", GetWeaponShader("knife_held_mp"));
            self AddOption(rarity + "$&8", "^7Ballistic Knife / ^2$" + (level.price["knife_ballistic_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "knife_ballistic_mp", GetWeaponShader("knife_ballistic_mp"));
            self AddOption(rarity + "$&8", "^7Crossbow / ^2$" + (level.price["crossbow_mp"] * RarityPriceMultiplier(rarity)), ::PlayerBuyItem, rarity, "crossbow_mp", GetWeaponShader("crossbow_mp"));
        }
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Attachments                                                                               
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self AddMenu("Attachments", "Market Menu", "emblem_bg_att_adj_stock", undefined, 50, 50, 10);
        self AddOption("Attachments", "^7ACOG / ^2$" + level.price["acog"], ::PlayerBuyWeaponAttachment, "acog", undefined, "cac_mods_acog");
        self AddOption("Attachments", "^7Dual Band / ^2$" + level.price["ir"], ::PlayerBuyWeaponAttachment, "ir", undefined, "cac_mods_dual_band");
        self AddOption("Attachments", "^7EOTech / ^2$" + level.price["holo"], ::PlayerBuyWeaponAttachment, "holo", undefined, "cac_mods_holographic");
        self AddOption("Attachments", "^7Hybrid Optic / ^2$" + level.price["dualoptic"], ::PlayerBuyWeaponAttachment, "dualoptic", undefined, "cac_mods_combo_r_a");
        self AddOption("Attachments", "^7Iron Sight / ^2$" + level.price["is"], ::PlayerBuyWeaponAttachment, "is", undefined, "cac_mods_ironsight");
        self AddOption("Attachments", "^7MMS / ^2$" + level.price["mms"], ::PlayerBuyWeaponAttachment, "mms", undefined, "cac_mods_mms");
        self AddOption("Attachments", "^7Reflex / ^2$" + level.price["reflex"], ::PlayerBuyWeaponAttachment, "reflex", undefined, "cac_mods_red_dot");
        self AddOption("Attachments", "^7Target Finder / ^2$" + level.price["rangefinder"], ::PlayerBuyWeaponAttachment, "rangefinder", undefined, "cac_mods_rangefinder");
        self AddOption("Attachments", "^7Zoom / ^2$" + level.price["vzoom"], ::PlayerBuyWeaponAttachment, "vzoom", undefined, "cac_mods_var_zoom");
        self AddOption("Attachments", "^7Extended Clip / ^2$" + level.price["extclip"], ::PlayerBuyWeaponAttachment, "extclip", undefined, "cac_mods_extended_mag");
        self AddOption("Attachments", "^7Fast Mag / ^2$" + level.price["dualclip"], ::PlayerBuyWeaponAttachment, "dualclip", undefined, "cac_mods_dual_clip");
        self AddOption("Attachments", "^7Stock / ^2$" + level.price["stalker"], ::PlayerBuyWeaponAttachment, "stalker", undefined, "cac_mods_extended_stock");
        self AddOption("Attachments", "^7Ballistics CPU / ^2$" + level.price["swayreduc"], ::PlayerBuyWeaponAttachment, "swayreduc", undefined, "cac_mods_bors");
        self AddOption("Attachments", "^7Dual Wield / ^2$" + level.price["dw"], ::PlayerBuyWeaponAttachment, "dw", undefined, "cac_mods_dual_wield");
        self AddOption("Attachments", "^7FMJ / ^2$" + level.price["fmj"], ::PlayerBuyWeaponAttachment, "fmj", undefined, "cac_mods_fmj");
        self AddOption("Attachments", "^7Fore Grip / ^2$" + level.price["grip"], ::PlayerBuyWeaponAttachment, "grip", undefined, "cac_mods_foregrip");
        self AddOption("Attachments", "^7Launcher / ^2$" + level.price["gl"], ::PlayerBuyWeaponAttachment, "gl", undefined, "hud_grenade_launcher_256");
        self AddOption("Attachments", "^7Laser Sight / ^2$" + level.price["steadyaim"], ::PlayerBuyWeaponAttachment, "steadyaim", undefined, "cac_mods_laser");
        self AddOption("Attachments", "^7Long Barrel / ^2$" + level.price["extbarrel"], ::PlayerBuyWeaponAttachment, "extbarrel", undefined, "cac_mods_barrel_extend");
        self AddOption("Attachments", "^7Quickdraw / ^2$" + level.price["fastads"], ::PlayerBuyWeaponAttachment, "fastads", undefined, "cac_mods_pistol_grip");
        self AddOption("Attachments", "^7Rapid Fire / ^2$" + level.price["rf"], ::PlayerBuyWeaponAttachment, "rf", undefined, "cac_mods_rapid_fire");
        self AddOption("Attachments", "^7Select Fire / ^2$" + level.price["sf"], ::PlayerBuyWeaponAttachment, "sf", undefined, "cac_mods_trigger_group");
        self AddOption("Attachments", "^7Suppressor / ^2$" + level.price["silencer"], ::PlayerBuyWeaponAttachment, "silencer", undefined, "cac_mods_suppressor");
        self AddOption("Attachments", "^7Knife / ^2$" + level.price["tacknife"], ::PlayerBuyWeaponAttachment, "tacknife", undefined, "cac_mods_tact_knife");
        self AddOption("Attachments", "^7Tri-Bolt / ^2$" + level.price["stackfire"], ::PlayerBuyWeaponAttachment, "stackfire", undefined, "cac_mods_tribolt");
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Support                                                                               
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        // self AddMenu("Support", "Market Menu", "emblem_bg_streak_stealth_heli");
        // self AddOption("Support", "^7Kamikaze Bomber / ^2$" + level.pricekamikaze, ::KamikazeBomber);
        // self AddOption("Support", "^7RC-XD / ^2$" + level.price["killstreak_rcbomb"], ::GiveScorestreak, "killstreak_rcbomb");
        // self AddOption("Support", "^7Hellstorm Missile / ^2$" + level.price["killstreak_remote_missile"], ::GiveScorestreak, "killstreak_remote_missile");
        // self AddOption("Support", "^7Lightning Strike / ^2$" + level.price["killstreak_planemortar"], ::GiveScorestreak, "killstreak_planemortar");
        // self AddOption("Support", "^7Warthog / ^2$" + level.price["killstreak_straferun"], ::GiveScorestreak, "killstreak_straferun");
        // self AddOption("Support", "^7Guard Dog / ^2$" + level.priceguarddog, ::GuardDog);
        // self AddOption("Support", "^7A.G.R / ^2$" + level.priceagr, ::AGR);
    }

    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Inventory                                                                                                                                        
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    foreach (item in self.inventory)
    {
        /*
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Consumables                                                                               
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        if (!IsWeaponPrimary(item.itemid) && !IsWeaponEquipment(item.itemid))
        {
            self AddOption("Consumables", item.itemid + " x" + item.quantity, ::Submenu, item.itemid + " x" + item.quantity);
            
            self AddMenu(item.itemid + " x" + item.quantity, "Consumables", "em_bg_ani_armor", true);
            
            if (IsDefined(self.usingmarket))
                self AddOption(item.itemid + " x" + item.quantity, "Sell Item For ^2$" + (level.price[item.itemid] / level.itemsellbackdivider) + "^7", ::PlayerSellItem, item.itemid);
            else
            {
                self AddOption(item.itemid + " x" + item.quantity, "Consume", ::ConsumeItem, item.itemid);
                self AddOption(item.itemid + " x" + item.quantity, "Drop x1", ::PlayerDropConsuamble, item.itemid, 1);
                
                if (item.quantity >= 5)
                    self AddOption(item.itemid + " x" + item.quantity, "Drop x5", ::PlayerDropConsuamble, item.itemid, 5);
                if (item.quantity >= 1)
                    self AddOption(item.itemid + " x" + item.quantity, "Drop All x" + item.quantity, ::PlayerDropConsuamble, item.itemid, item.quantity);
            }    
            
            self AddOption(item.itemid + " x" + item.quantity, "Stats", ::Submenu, item.itemid + " Stats");
            
            self AddMenu(item.itemid + " Stats", item.itemid + " x" + item.quantity, "em_bg_ani_armor");
            self AddOption(item.itemid + " Stats", "Rarity: " + item.rarity);
            self AddOption(item.itemid + " Stats", GetItemDescription(item.itemid));
        }
        */

        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Equipment                                                                               
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        if (IsWeaponEquipment(item.itemid))
        {
            self AddOption("Equipment", GetEquipmentDisplayName(item.itemid) + " x" + self GetModWeaponStock(item.itemid), ::Submenu, GetEquipmentDisplayName(item.itemid) + " x" + self GetModWeaponStock(item.itemid), undefined, GetEquipmentShader(item.itemid));
       
            self AddMenu(GetEquipmentDisplayName(item.itemid) + " x" + self GetModWeaponStock(item.itemid), "Equipment", "em_bg_ani_armor", true);
            
            if (self GetModWeaponStock(item.itemid) <= 0)
                self AddOption(GetEquipmentDisplayName(item.itemid) + " x" + self GetModWeaponStock(item.itemid), "Remove Item Placeholder", ::TakePlayerItem, item.itemid, true);
            if (IsDefined(self.usingmarket) && self GetModWeaponStock(item.itemid) > 0)
                self AddOption(GetEquipmentDisplayName(item.itemid) + " x" + self GetModWeaponStock(item.itemid), "Sell Item For ^2$" + (level.price[item.itemid] / level.itemsellbackdivider) + "^7", ::PlayerSellItem, item.itemid);
            else if (self GetModWeaponStock(item.itemid) > 0) 
            {
                self AddOption(GetEquipmentDisplayName(item.itemid) + " x" + self GetModWeaponStock(item.itemid), "Drop x1", ::PlayerDropEquipment, item.itemid, 1);
                
                if (self GetModWeaponStock(item.itemid) >= 2)
                    self AddOption(GetEquipmentDisplayName(item.itemid) + " x" + self GetModWeaponStock(item.itemid), "Drop x2", ::PlayerDropEquipment, item.itemid, 2);
                if (self GetModWeaponStock(item.itemid) >= 3)
                    self AddOption(GetEquipmentDisplayName(item.itemid) + " x" + self GetModWeaponStock(item.itemid), "Drop x3", ::PlayerDropEquipment, item.itemid, 3);
                if (self GetModWeaponStock(item.itemid) >= 4)
                    self AddOption(GetEquipmentDisplayName(item.itemid) + " x" + self GetModWeaponStock(item.itemid), "Drop x4", ::PlayerDropEquipment, item.itemid, 4);
                if (self GetModWeaponStock(item.itemid) >= 1)
                    self AddOption(GetEquipmentDisplayName(item.itemid) + " x" + self GetModWeaponStock(item.itemid), "Drop All x" + self GetModWeaponStock(item.itemid), ::PlayerDropEquipment, item.itemid, self GetModWeaponStock(item.itemid));
            }
            
            self AddOption(GetEquipmentDisplayName(item.itemid) + " x" + self GetModWeaponStock(item.itemid), "Stats", ::Submenu, GetEquipmentDisplayName(item.itemid) + " Stats");
               
            self AddMenu(GetEquipmentDisplayName(item.itemid) + " Stats", GetEquipmentDisplayName(item.itemid) + " x" + self GetModWeaponStock(item.itemid), "em_bg_ani_armor");
            self AddOption(GetEquipmentDisplayName(item.itemid) + " Stats", "Rarity: " + item.rarity);
            self AddOption(GetEquipmentDisplayName(item.itemid) + " Stats", "Damage: " + RoundOffFloat((GetModWeaponMinDamage(item.rarity, item.upgrade, item.itemid) / GetModWeaponBulletSpread(item.itemid))) + " - " + RoundOffFloat((GetModWeaponMaxDamage(item.rarity, item.upgrade, item.itemid) / GetModWeaponBulletSpread(item.itemid))) + " " + GetModWeaponBulletSpreadString(item.itemid));
            self AddOption(GetEquipmentDisplayName(item.itemid) + " Stats", "Range: " + (GetModWeaponMinDamageRange(item.itemid) / 100) + "m - " + (GetModWeaponMaxDamageRange(item.itemid) / 100) + "m");
        }

        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Weapons                                                                               
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        if (IsWeaponPrimary(item.itemid))
        {
            self AddOption("Weapons", GetWeaponDisplayName(item.itemid), ::Submenu, GetWeaponDisplayName(item.itemid), undefined, GetWeaponShader(item.itemid));
            
            self AddMenu(GetWeaponDisplayName(item.itemid), "Weapons", "em_bg_ani_armor", true);
            
            if (IsDefined(self.usingmarket))
            {
                itemprice = ((level.price[item.itemid] * RarityPriceMultiplier(item.rarity)) / level.itemsellbackdivider);
                
                if (IsDefined(item.upgrade))
                    itemprice += (level.packapunchprice / 2);
                if (IsDefined(item.upgrade) && item.upgrade != "Vanilla")
                    itemprice += (level.packapunchprice / 2);
                
                for (i = 1; i < StrTok(self GetWeaponFromInventory(item.itemid), "+").size; i ++)
                {    
                    if (IsDefined(StrTok(self GetWeaponFromInventory(item.itemid), "+")[i]))
                    {
                        attachment = StrTok(self GetWeaponFromInventory(item.itemid), "+")[i];
                        itemprice += (level.price[attachment] / 2);
                    }
                }
                    
                self AddOption(GetWeaponDisplayName(item.itemid), "Sell Item For ^2$" + itemprice + "^7", ::PlayerSellItem, item.itemid);
            }
            else
                self AddOption(GetWeaponDisplayName(item.itemid), "Drop Item", ::PlayerDropWeapon, item.itemid);
                
            self AddOption(GetWeaponDisplayName(item.itemid), "Stats", ::Submenu, GetWeaponDisplayName(item.itemid) + " Stats");
            
            self AddMenu(GetWeaponDisplayName(item.itemid) + " Stats", GetWeaponDisplayName(item.itemid), "em_bg_ani_armor", true);
            self AddOption(GetWeaponDisplayName(item.itemid) + " Stats", "Rarity: " + item.rarity);
            
            if (IsDefined(item.upgrade))
                self AddOption(GetWeaponDisplayName(item.itemid) + " Stats", "Upgrade: " + item.upgrade);
                                                                                   
            self AddOption(GetWeaponDisplayName(item.itemid) + " Stats", "Damage: " + RoundOffFloat((GetModWeaponMinDamage(item.rarity, item.upgrade, item.itemid) / GetModWeaponBulletSpread(item.itemid))) + " - " + RoundOffFloat((GetModWeaponMaxDamage(item.rarity, item.upgrade, item.itemid) / GetModWeaponBulletSpread(item.itemid))) + " " + GetModWeaponBulletSpreadString(item.itemid));
            self AddOption(GetWeaponDisplayName(item.itemid) + " Stats", "Range: " + (GetModWeaponMinDamageRange(item.itemid) / 100) + "m - " + (GetModWeaponMaxDamageRange(item.itemid) / 100) + "m");
        }
    }
}

// math

PI()
{
    return 3.14159265358979;
}

RSin(value)
{
    return Sin(value * (180 / PI()));
}

RCos(value)
{
    return Cos(value * (180 / PI()));
}

RTan(value)
{
    return Tan(value * (180 / PI()));
}

GetDifference(value1, value2)
{
    return Max(value1, value2) - Min(value1, value2);
}

FloatModulo(value1, value2)
{
    result1 = Floor((value1 / value2));
    
    return (value1 - (value2 * result1));
}

Precision(value, decimalplace)
{
    if (IsDefined(decimalplace))
        decimalplace = Pow(10, decimalplace);
    else
        decimalplace = 1;
    
    value = Float(value);
    value *= decimalplace;
    value = Int(value);
    value = (value / decimalplace);
    
    return value;
}

RoundOffFloat(value, decimalplace)
{
    if (IsDefined(decimalplace))
        decimalplace = Pow(10, decimalplace);
    else
        decimalplace = 1;
    
    value = Float(value);
    value *= decimalplace;

    if ((value + 0.5) >= (Int(value) + 1))
        value = Int(value) + 1;
    else
        value = Int(value);

    value = (value / decimalplace);

    return value;
}

GreaterFloor(value)
{
    if (Floor(value) < 1)
        return 1;

    return Floor(value);
}

RemapRange(input, oldrangemin, oldrangemax, newrangemin, newrangemax)
{
    a1 = Min(oldrangemin, oldrangemax);
    a2 = Max(oldrangemin, oldrangemax);
    b3 = Min(newrangemin, newrangemax);
    b4 = Max(newrangemin, newrangemax);
    
    if (oldrangemin != a1)
        reverseinput = true;
    if (newrangemin != b3)
        reverseoutput = true;
    if (!IsDefined(reverseinput))
        portion = (input - a1) * ((b4 - b3) / (a2 - a1));
    else
        portion = (a2 - input) * ((b4 - b3) / (a2 - a1));
    if (!IsDefined(reverseoutput))
        return Clamp((portion + b3), b3, b4);
    else
        return Clamp((b4 - portion), b3, b4);
}

ConvertToDegrees(value)
{
    return (value * (180 / PI()));
}

ConvertToRadians(value)
{
    return (value * (PI() / 180));
}

ConvertRGBToHSV(input)
{
    r = Clamp(input[0], 0, 1);
    g = Clamp(input[1], 0, 1);
    b = Clamp(input[2], 0, 1);
    min = Min(r, g);
    min = Min(min, b);
    max = Max(r, g);
    max = Max(max, b);
    c = (max - min);
    h = 0;
    s = 0;
    v = max;
    
    if (c == 0) 
        h = 0;
    else if (max == r)
    {
        h = ((g - b) / c);
        h = FloatModulo(h, 6);
    }
    else if (max == g) 
        h = ((b - r) / (c + 2));
    else
        h = ((r - g) / (c + 4));
        
    h *= 60;
    
    if (h < 0) 
        h += 360;
    if (v == 0)
        s = 0;
    else
        s = (c / v);
        
    s *= 100;
    v *= 100;
    
    return ((Precision(h, 3), Precision(s, 3), Precision(v, 3)));
}

ConvertHSVToRGB(input)
{
    h  = Clamp(input[0], 0, 359);
    s  = Clamp(input[1], 0, 100);
    v  = Clamp(input[2], 0, 100);
    s  = (s / 100);
    v  = (v / 100);
    c  = (s * v);
    hh = (h / 60);
    hhh = Abs((FloatModulo(hh, 2) - 1));
    x = (c * (1 - hhh));
    r = 0;
    g = 0;
    b = 0;
    
    if (Floor(hh) == 0)
    {
        r = c;
        g = x;
    }
    else if (Floor(hh) == 1)
    {
        r = x;
        g = c;
    }
    else if (Floor(hh) == 2)
    {
        g = c;
        b = x;
    }
    else if (Floor(hh) == 3)
    {
        g = x;
        b = c;
    }
    else if (Floor(hh) == 4)
    {
        r = x;
        b = c;
    }
    else
    {
        r = c;
        b = x;
    }

    m = (v - c);
    r += m;
    g += m;
    b += m;

    return ((Precision(r, 3), Precision(g, 3), Precision(b, 3)));
}

AnglesToLeft(angles)
{
    return AnglesToRight(angles) * -1;
}

AnglesToBackward(angles)
{
    return AnglesToForward(angles) * -1;
}

AngleLoopClamp180(angle)
{
    if (angle < -180)
        return (angle + (360 * GreaterFloor(angle / -360)));    
    if (angle > 180)
        return (angle - (360 * GreaterFloor(angle / 360)));
    
    return angle;
}

GetAngleDifference(angle1, angle2)
{
    difference = AngleLoopClamp180(angle1) - AngleLoopClamp180(angle2);
    
    if (difference < -180)
        return difference + 360;
    if (difference > 180)
        return difference - 360;
    
    return difference;
}

VectorAdd(vector1, vector2)
{
    return ((vector1[0] + vector2[0]), (vector1[1] + vector2[1]), (vector1[2] + vector2[2]));
}

VectorSubtract(vector1, vector2)
{
    return ((vector1[0] - vector2[0]), (vector1[1] - vector2[1]), (vector1[2] - vector2[2]));
}

// UTILITIES


// VARIABLES 

ReturnTwo(variable, iftrue, iffalse)
{
    return variable ? iftrue : iffalse;
}

SortArray(array)
{
    newarray = [];
    
    for (i = 0; i < array.size; i ++)
    {
        if (IsDefined(array[i]))
            newarray[newarray.size] = array[i];
    }
        
    return newarray;
}

GetArrayKey(array, target)
{
    keys = GetArrayKeys(array);
    
    for (i = 0; i < keys.size; i ++)
    { 
        if (IsInArray(array[ keys[i] ], target))
            return keys[i];
    }
}

GetUniqueID()
{
    if (!IsDefined(level.uniqueidsize))
        level.uniqueidsize = 0;
    else
        level.uniqueidsize ++;
    
    return level.uniqueidsize;
}

DeleteItem(itemnumber)
{
    if (IsDefined(level.itementity[itemnumber]))
    {
        if (IsDefined(level.itementity[itemnumber].additionalentity1))
        {
            level.itementity[itemnumber].additionalentity1 Delete();
            level.itementity[itemnumber].additionalentity2 Delete();
            level.itementity[itemnumber].additionalentity3 Delete();
            level.itementity[itemnumber].additionalentity4 Delete();
        }
        
        level.itementity[itemnumber].itemdropfx Delete();
        level.itementity[itemnumber] Delete();
        level.itementity[itemnumber] = undefined;
    }
}

PlayerPregameSetup()
{
    self.inventoryitemlimit = level.inventoryitemlimit;
    self.status = "Human";
}

Introduction(){

    println("Empece introduction");
    self Endon("disconnect");
    level Endon("game_ended");
    println("acabo self y level");
    
    self thread PlayerPregameSetup();

    self AbsoluteHide();
    println("abshide");
    //Hide Player (BO2 GAME FUNCTIONS - NO EXTRA F.)
    self TakeAllWeapons();
    println("takewea");
    self SetClientUIVisibilityFlag("hud_visible", false);
    println("clientuivvisibilyty");
    self SetBlur(5, 1);
    
    println("Acabe setblur");

    introbackground = CreateShader("white", "center", "center", "user_center", "user_center", 0, 0, 1000, 1000, (0, 0, 0), 1, false, false, 9999);
    println("acabe introbg");
    wait 8;
    print("entre acreatext");
    introtext1 = CreateText("Welcome To", "small", 1.4, "center", "center", "user_center", "user_center", 0, -30, (1, 1, 1), 0, (1, 1, 1), 1, false, false, 10000);
    introtext2 = CreateText("ZOMBIELAND PLTNM", "bigfixed", 2, "center", "center", "user_center", "user_center", 0, 0, (1, 0, 0), 0, (1, 0, 0), 0.5, false, false, 10000);
    introtext1 FadeOverTime(0.1);
    introtext1.alpha = 1;
    introtext2 FadeOverTime(0.1);
    introtext2.alpha = 1;
    self PlaySoundToPlayer("mpl_flagcapture_sting_enemy", self);
    wait 2;
    introtext1 FadeOverTime(1);
    introtext1.alpha = 0;
    wait 1;
    introtext2 thread FlickeringText(0.05, 0.4, 0.05, 0.4);
    introtext1.x = 0;
    introtext1.y = 30;
    introtext1 SetElementText("By Manu :)");
    introtext1 FadeOverTime(2);
    introtext1.alpha = 1;
    wait 2;

    //Fix Disturbance

    if (level.inprematchperiod){
        level Waittill("prematch_over");
    }

    self TakeAllWeapons();
    
    //Introduction Text Fade Out

    introtext1 FadeOverTime(1);
    introtext1.alpha = 0;
    wait 1;
    introtext1 DestroyElement();
    
    //Press Button To Begin

    if (self IsHost())
    {
        introtext3 = CreateText("Press [{+gostand}] To Begin", "objective", 1.4, "center", "center", "user_center", "user_center", 0, 100, undefined, 0, undefined, undefined, false, false, 10000);
        introtext3 FadeOverTime(1);
        introtext3.alpha = 1;
        wait 1;
    
        while (!self JumpButtonPressed() && !level.gameended)
            wait 0.05;
        
        introtext3 FadeOverTime(1);
        introtext3.alpha = 0;
    }
    
    //Introduction Text Fade Out

    introtext2 FadeOverTime(1);
    introtext2.alpha = 0;
    wait 1;
    introtext2 DestroyElement();
    introtext3 DestroyElement();
    wait 2;
    
    //Show Player

    self AbsoluteShow();
    self EnableInvulnerability();
    self FreezeControls(true);
    randomspawn = RandomInt(level.spawnpoints.size);
    self SetOrigin(level.spawnpoints[randomspawn] GetOrigin());
    self SetPlayerAngles(level.spawnpoints[randomspawn].angles);

    //Introduction Background Fade Out

    introbackground FadeOverTime(3);
    introbackground.alpha = 0;
    wait 3;
    introbackground DestroyElement();
    self SetBlur(0, 1);
    wait 1;
    
    //Player Start Setup

    self thread PlayerStartSetup();

}

PlayerStartSetup()
{
    println("Empezando playerstartup");

    self DisableInvulnerability();
    self FreezeControls(false);
    self thread PlayerLoadout(); // NO CRASH W/ MENU
    self thread PlayerHuds(); 
    self thread PlayerDeath(); // NO CRASH W/ MENU appears team*!!!
    self thread PlayerDamage(); // NO CRASH W/ MENU
    self thread ModWeaponMonitor(); 
    self thread ButtonMonitor(); // FIXED
    self thread PointsMonitor(); // NO CRASH W/ MENU
    self thread Rewards(); // NO CRASH W/ MENU

    println("empece menu");
    
    if (!IsDefined(self.menu) && !self Is_Bot())
        self thread MenuInit();
    
    self.gameready = true;
    level.playersgameready ++;
    level Notify("player_game_ready");

    println("Acabando playerstartup");
}

PlayerLoadout()
{
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Clear Default Loadout                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    // FUNCIONES DEL JUEGO

    self ClearPerks();
    self TakeAllWeapons();
    self EnableWeapons(); 

    println("Entre a playerloadut");
    
    foreach (item in self.inventory)
        self TakePlayerItem(item.itemid);
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Clear Default Hud                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    self FreeGamePlayHudElems();
    self SetClientUIVisibilityFlag("hud_visible", false);
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Disable Scorestreaks                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    self SetActionSlot(1, "");
    self SetActionSlot(2, "");
    self SetActionSlot(4, "");
    self.hasspyplane = false;
    self.hassatellite = false;
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Human (Loadout)                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    if (self.status == "Human")
    {
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Items                                                                          
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self GivePlayerItem("Common", undefined, "knife_held_mp", undefined, undefined, 0, undefined, undefined);
        self GivePlayerItem("Common", undefined, "fnp45_mp+silencer+steadyaim", self GetModWeaponClipSize("fnp45_mp+silencer+steadyaim"), WeaponStartAmmo("fnp45_mp+silencer+steadyaim"), 15, undefined, undefined);
        self GivePlayerItem(GetItemRarities("frag_grenade_mp")[0], undefined, "frag_grenade_mp", undefined, 2, undefined, undefined, undefined);

        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Perks                                                                          
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self SetPerk("specialty_noname");
        self SetPerk("specialty_additionalprimaryweapon");
        self SetPerk("specialty_twoprimaries");
        self SetPerk("specialty_twogrenades");
        self SetPerk("specialty_longersprint");
        self SetPerk("specialty_sprintrecovery");
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Speed                                                                          
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self SetMoveSpeedScale(level.humanspeed);
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Health                                                                          
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self.health = level.humanstartinghealth;
        self.maxhealth = self.health;
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Points                                                                          
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self.points = level.humanstartingpoints;
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Rank                                                                          
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self.gamerank = 0;
        self SetRank(self.gamerank, 0);
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Character Model                                                                          
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        randomcharacter = RandomInt(8);
        
        if (randomcharacter == 0)
            self [[game["set_player_model"]["allies"]["smg"]]]();
        if (randomcharacter == 1)
            self [[game["set_player_model"]["allies"]["mg"]]]();
        if (randomcharacter == 2)
            self [[game["set_player_model"]["allies"]["spread"]]]();
        if (randomcharacter == 3)
            self [[game["set_player_model"]["allies"]["default"]]]();
        if (randomcharacter == 4)
            self [[game["set_player_model"]["axis"]["smg"]]]();
        if (randomcharacter == 5)
            self [[game["set_player_model"]["axis"]["mg"]]]();
        if (randomcharacter == 6)
            self [[game["set_player_model"]["axis"]["spread"]]]();
        if (randomcharacter == 7)
            self [[game["set_player_model"]["axis"]["default"]]](); 
    }
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Zombie (Loadout)                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    if (self.status == "Zombie")
    {
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Items                                                                          
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self.inventory = [];
        self GivePlayerItem("Common", undefined, "knife_held_mp", undefined, undefined, RandomInt(45), undefined, undefined);
        self GivePlayerItem("Common", undefined, "tactical_insertion_mp", undefined, undefined, undefined, undefined, undefined);
        self GiveWeapon("knife_mp");
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Perks                                                                          
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self SetPerk("specialty_noname");
        self SetPerk("specialty_additionalprimaryweapon");
        self SetPerk("specialty_twoprimaries");
        self SetPerk("specialty_twogrenades");
        self SetPerk("specialty_fallheight");
        self SetPerk("specialty_fastmeleerecovery");
        self SetPerk("specialty_fastequipmentuse");
        self SetPerk("specialty_fasttoss");
        self SetPerk("specialty_unlimitedsprint");
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Speed                                                                          
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        speed = Int(((level.zombiespeed * 2) - (((Clamp(GetPlayers("axis").size, 0, 6) - 1) / 6) / level.zombiespeed)));
        self SetMoveSpeedScale(speed);
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Health                                                                          
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self.health = Int((level.zombiesstartinghealth * (6 / Clamp(GetPlayers("axis").size, 0, 6))));
        self.maxhealth = self.health;
           
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Character Model                                                                          
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        randomcharacter = RandomInt(2);
        
        if (randomcharacter == 0)
            self [[game["set_player_model"]["allies"]["rifle"]]]();
        if (randomcharacter == 1)
            self [[game["set_player_model"]["axis"]["rifle"]]]();
            
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Bots                                                                          
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        if (self Is_Bot())
        {
            // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
            //┃ Speed  
            //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

            self SetMoveSpeedScale((self GetMoveSpeedScale() + 0.2));
            
            // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
            //┃ Zombie Type  
            //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

            self.points = 5000;
            randomzombietype = -1;
            
            if (level.gametime > 300)
                randomzombietype = RandomIntRange(-6, 9);
            if (level.gametime > 900)
                randomzombietype = RandomIntRange(-6, 10);
            if (level.gametime > 1200)
                randomzombietype = RandomIntRange(-6, 11);
            if (level.gametime > 2400)
                randomzombietype = RandomIntRange(-6, 12);
            if (randomzombietype == 1 || randomzombietype == 2)
                self thread RiotZombie();
            if (randomzombietype == 3 || randomzombietype == 4)
                self thread CyborgZombie();
            if (randomzombietype == 5 || randomzombietype == 6)
                self thread ElectricZombie();
            if (randomzombietype == 7 || randomzombietype == 8)
                self thread NapalmZombie();
            if (randomzombietype == 9)
                self thread MistZombie();
            if (randomzombietype == 10)
                self thread JuggernautZombie();
            if (randomzombietype == 11)
                self thread GoliathZombie();
        }
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Miscellaneous                                                                          
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self DisableUsability();
        self.hassatellite = true;
    }

    print("acabe playerloadut");
}

PlayerHuds()
{
    println("Entre a playerhud");

    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Points Hud                                                                                                                                        
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    self.pointsvalue = CreateText(undefined, "objective", 2, "center", "center", "user_left", "user_center", 15, 0, undefined, 0, undefined, undefined, true, false, 1);
    self.pointsvalue SetValue(self.points);
    self.pointsvalue.archived = false;
    self.pointsvalue.alignx = "left";
    self.pointsvalue.label = &"^2$";
    self.pointsvalue FadeOverTime(1);
    self.pointsvalue.alpha = 1;
    self.pointsvaluebackground = CreateShader("gradient", "center", "center", "user_left", "user_center", 50, 0, 80, 25, undefined, 0, true, false, 0);
    self.pointsvaluebackground FadeOverTime(1);
    self.pointsvaluebackground.alpha = 1;
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Weapons & Ammo Hud                                                                                                                                       
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    wait 1;
    self thread UpdateModWeaponsHud(1);

    println("acabe a playerhud");
    
}

PlayerDeath()
{       
    self Endon("disconnect");
    level Endon("game_ended");

    for (;;)
    {
        self Waittill("death", attacker);
        level Notify("player_death", self);
        
        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Human Death
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄    

        if (self.status == "Human")
        {
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Notify Attacker                                                                 
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (IsDefined(attacker) && attacker.status == "Zombie")
                attacker Notify("killed", self);

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Reset Perks                                                             
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            self.juggernog = undefined;
            self.doubletapii = undefined;
            self.speedcola = undefined;
            self.staminup = undefined;
            self.mulekick = undefined;
            self.electriccherry = undefined;
            self.phdflopper = undefined;
            self.deadshotdaiquiri = undefined;
            self.stealthaid = undefined;
            self.scavenger = undefined;
            
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ End Scorestreaks                                                                 
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            self EndScorestreaks();
            
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Record Stats                                                                
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (!IsDefined(level.infectedplayer[GetAbbreviatedPlayerName(self)]) && level.gametime > self GetStat("longest_time_survived"))
                self SetStat("longest_time_survived", level.gametime);
                
            self.zombiekills = self.pers["kills"];
            self.zombieheadshots = self.pers["headshots"];
        }

        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Zombie Death
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄       
        
        if (self.status == "Zombie")
        {
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Notify Attacker                                                                
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (IsPlayer(attacker) && attacker.status == "Human")
                attacker Notify("killed", self);

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Drop Power-Up                                                                
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (!IsDefined(self.scorchinginferno))
                level thread PowerUp(self GetOrigin());

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Drop Scavenger Pack                                                                 
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (IsDefined(attacker.scavenger) && RandomIntRange(0, 2) == 0)
                level thread SpawnItem(undefined, undefined, "Scavenger Pack", attacker, undefined, undefined, undefined, self GetOrigin());

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Refund If Insta-Kill                                                                 
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (IsDefined(level.instakill))
                self thread ZombieTypeRefund();

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Ignore Suicides                                                                 
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (!IsPlayer(attacker))
            {
                self.pers["deaths"] --;
                self.deaths --;
            }

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Calculate Next Spawn Location                                                                 
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════
            
            self thread ZombieSpawnPoint();
        }
        
        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Every Death
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ 
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Reset Variables                                                                
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self.zombietype = undefined;
        self.poseidonswraith = undefined;
        self.thirdperson = undefined; 
        self.fov = undefined;
        self.vision = undefined;
        self.godmode = undefined;
        self.ufomode = undefined;
        self.invisibility = undefined;
        self Show();
        self SetInfraredVision(false);
        self SetMoveSpeedScale(level.humanspeed);
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Reset Hud                                                            
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        foreach (shader in self.equipmenticon)
            shader DestroyElement();
        
        // if (IsDefined(self.menu))
        // {
        //     self thread CloseTheMenu();
        //     self thread ResetTheMenuMemory();
        // }
        
        // self thread CloseMenus();

        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Human Changing To Zombie
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ 
        
        if (self.status != "Zombie" && !IsDefined(self.changingtohuman))
        {
            if (level.infectiontime == 0 || level.players.size < 2)
            {
                //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
                //║ Survivor Bonus Points                                                            
                //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

                if (!IsDefined(level.infectedplayer[GetAbbreviatedPlayerName(self)]) && GetPlayers("allies").size > 1 && GetPlayers("axis").size > 0)
                {
                    foreach (player in level.players)
                    {
                        if (player.status == "Human" && IsDefined(player.points))
                        {
                            player.points += level.humanpointssurviorbonus;
                            player IPrintLn("^2$" + level.humanpointssurviorbonus + " ^7Survivor Bonus Points Received");
                        }
                    }
                }

                //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
                //║ Setup (Before Spawn)                                                           
                //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════
                
                level.infectedplayer[GetAbbreviatedPlayerName(self)] = true;
                self.status = "Zombie";
                self ChangeTeam("axis");
                self thread ZombieSpawnPoint();
                // self thread ResetTheMenu();
                // self thread CloseMenus();
                
                if (self Is_Bot())
                    self thread BotZombiePathing();
                    
                level Notify("zombie_game_ready");
                
                //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
                //║ Death Announcement                                                            
                //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

                foreach (player in level.players)
                    player thread NotifyMessage("^1" + GetAbbreviatedPlayerName(self) + " ^7Has Died", GetPlayers("allies").size + " Humans Remain", undefined, undefined, undefined);
                    
                //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
                //║ Setup (After Spawn)                                                            
                //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

                self Waittill("spawned_player");
                self.pers["score"] = 0;
                self.pers["kills"] = 0;
                self.pers["assists"] = 0;
                self.pers["deaths"] = 0;
                self.score = 0;
                self.kills = 0;
                self.assists = 0;
                self.deaths = 0;
                self.points = level.zombiestartingpoints;
                self.gamerank = 0;
                self SetRank(0, 9);
                self SetClientUIVisibilityFlag("g_compassShowEnemies", 0);
                self thread NotifyMessage("^1R.I.P", "^0You Are Infected", undefined, (1, 0, 0), 0.5);
            }
        }
    }
}

PlayerDamage()
{
    self Endon("disconnect");
    level Endon("game_ended");
    
    for (;;)
    {
        self Waittill("damage", damage, attacker, undefined, undefined, type, undefined, undefined, undefined, weapon);

        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Human (All Damage)
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄   
    
        if (IsAlive(self) && self.status == "Human")
        {

        }
        
        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Human (Damage From Zombie)
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ 
    
        if (IsAlive(self) && IsDefined(attacker) && attacker.status == "Zombie" && self.status == "Human")
        {
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Zombie (Points Per Hit)                                                         
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (type != "MOD_BURNED")
                attacker.points += level.zombiepointspernonlethalhit;
        }
        
        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Human (Death From Zombie)
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄  
    
        if (!IsAlive(self) && IsDefined(attacker) && attacker.status == "Zombie" && self.status == "Human")
        {
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Zombie (Points Per Kill)                                                           
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            attacker.points += level.zombiepointsperkill;   
            attacker.killpoints = level.zombiepointsperkill;
        }   
        
        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Zombie (All Damage)
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ 
    
        if (IsAlive(self) && self.status == "Zombie")
        {
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Disable Health Regeneration                                                           
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            self.maxhealth = self.health; 
        }
    
        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Zombie (Damage From Human)
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ 

        if (IsAlive(self) && IsPlayer(attacker) && attacker.status == "Human" && self.status == "Zombie")
        {
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Human (Point Per Hit)                                                          
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (type != "MOD_BURNED" && weapon != "auto_gun_turret_mp" && weapon != "ai_tank_drone_gun_mp")
                attacker.points += level.humanpointspernonlethalhit * level.pointsmultiplier;

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Insta-Kill                                                          
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (IsDefined(level.instakill))
                self DoDamage(self.maxhealth, self GetOrigin(), attacker, attacker, "none", type, 0, "none");
                
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Human (Weapon Modified Damage)                                                          
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            additionaldamage = GetModWeaponDamageOffset(attacker.inventory[GetWeaponStringID(weapon)].rarity, weapon);

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Human (Weapon Rarity Damage)                                                          
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (IsDefined(attacker.inventory[GetWeaponStringID(weapon)].rarity) && !IsWeaponEquipment(weapon))
            {
                if (attacker.inventory[GetWeaponStringID(weapon)].rarity == "Common")
                    additionaldamage += 0;
                if (attacker.inventory[GetWeaponStringID(weapon)].rarity == "Uncommon")
                    additionaldamage += RoundOffFloat(((damage + additionaldamage) / 9.5));
                if (attacker.inventory[GetWeaponStringID(weapon)].rarity == "Rare")
                    additionaldamage += RoundOffFloat(((damage + additionaldamage) / 7));
                if (attacker.inventory[GetWeaponStringID(weapon)].rarity == "Epic")
                    additionaldamage += RoundOffFloat(((damage + additionaldamage) / 4.5));
                if (attacker.inventory[GetWeaponStringID(weapon)].rarity == "Legendary")
                    additionaldamage += RoundOffFloat(((damage + additionaldamage) / 2));
            }

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Human (Weapon Upgrade Damage)                                                          
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (IsDefined(attacker.inventory[GetWeaponStringID(weapon)].upgrade))
                additionaldamage = RoundOffFloat((additionaldamage * level.upgradedweapondamagemultiplier));
                
            additionaldamage = RoundOffFloat((damage * level.damagemultiplier));    
            
            if (additionaldamage > 0)
            {
                if (GetWeaponStringID(weapon) != "sa58_mp" && GetWeaponStringID(weapon) != "scar_mp")
                    self DoDamage(additionaldamage, self GetOrigin(), attacker, attacker, "none", type, 0, weapon);
                else
                    self DoDamage(additionaldamage, self GetOrigin(), attacker, attacker, "none", "MOD_BURNED", 0, "none");
            }
            
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Guard Dog Damage                                                        
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (IsDefined(attacker.type) && attacker.type == "dog")
                self DoDamage(level.guarddogdamage, self GetOrigin(), attacker, attacker, "none", "none", 0, "dog_bite_mp");

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Samurai Skill Damage                                                          
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (attacker.gamerank >= 5 && type == "MOD_MELEE" && IsSubStr(weapon, "knife"))
                self DoDamage(level.samuraimeleedamage, self GetOrigin(), attacker, attacker, "none", type, 0, weapon);

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Ninja Skill Damage                                                          
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            else if (attacker.gamerank >= 1 && type == "MOD_MELEE" && IsSubStr(weapon, "knife"))
                self DoDamage(level.ninjameleedamage, self GetOrigin(), attacker, attacker, "none", type, 0, weapon);
        }
    
        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Zombie (Death From Human)
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ 
    
        if (!IsAlive(self) && IsPlayer(attacker) && attacker.status == "Human" && self.status == "Zombie")
        {
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Human (Points Per Knife Kill)                                                        
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (type == "MOD_MELEE")
            {
                attacker.points += level.humanpointsperlethalmelee * level.pointsmultiplier;
                attacker.killpoints = level.humanpointsperlethalmelee * level.pointsmultiplier;
            }

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Human (Points Per Headshot Kill)                                                        
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (type == "MOD_HEAD_SHOT")
            {
                attacker.points += level.humanpointsperlethalheadshot * level.pointsmultiplier;
                attacker.killpoints = level.humanpointsperlethalheadshot * level.pointsmultiplier;
            }

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Human (Points Per Projectile Kill)                                                       
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (type == "MOD_PROJECTILE" || type == "MOD_PISTOL_BULLET" || type == "MOD_RIFLE_BULLET")
            {
                attacker.points += level.humanpointsperlethalprojectile * level.pointsmultiplier;
                attacker.killpoints = level.humanpointsperlethalprojectile * level.pointsmultiplier;
            }

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Human (Points Per Explosive Kill)                                                        
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (type == "MOD_EXPLOSIVE" || type == "MOD_GRENADE" || type == "MOD_GRENADE_SPLASH" || type == "MOD_PROJECTILE_SPLASH" || type == "MOD_BURNED" || type == "MOD_GAS")
            {
                attacker.points += level.humanpointsperlethalexplosive * level.pointsmultiplier;
                attacker.killpoints = level.humanpointsperlethalexplosive * level.pointsmultiplier;
            }
            
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Zombie (Points Per Death)                                                       
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            self.points += level.zombiepointsperdeath;
        }
        
        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Every Damage Received
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ 
    
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Notify Attacker                                                     
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        if (attacker.team != self.team)
            attacker Notify("weapon_hit", weapon, self);
            
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Fix Hud Disturbance                                                       
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self thread FixHudDisturbance(type);
    }
}

ModWeaponMonitor()
{
    self Endon("disconnect");
    level Endon("game_ended");
    
    self thread EquipmentMonitor();
    
    for (;;)
    {
        result = self Waittill_Any_Return("weapon_fired", "grenade_fire", "weapon_change", "reload", "weapon_check", "max_ammo", "killed");

        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Human                                                                                                                                    
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
    
        if (self.status == "Human")
        {
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Death Machine Usability                                                                   
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (self GetDefaultCurrentWeapon() == "minigun_wager_mp" && !IsDefined(self.disabledusability))
            {
                self DisableUsability();
                self.disabledusability = true;
            }
            if (self GetDefaultCurrentWeapon() != "minigun_wager_mp" && IsDefined(self.disabledusability))
            {
                self EnableUsability();
                self.disabledusability = undefined;
            }
        }

        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Everyone                                                                                                                                    
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Mod Weapon Ammo                                                                     
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        if (self WeaponUsesModWeaponAmmo(self GetCurrentWeapon()) && !IsSubStr(self GetCurrentWeapon(), "gl_"))
        {
            // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
            //┃ Subtract Mod Weapon Clip Ammo When Firing
            //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

            if (result == "weapon_fired")
            {
                // ______________________________________________
                //| Non Dual Wield           
                // ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

                if (!IsWeaponDualWield(self GetDefaultCurrentWeapon()))
                    self SetModWeaponClip(self GetDefaultCurrentWeapon(), self GetModWeaponClip(self GetDefaultCurrentWeapon()) - 1);

                // ______________________________________________
                //| Dual Wield           
                // ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

                else
                {
                    //Right Gun Fired
                    if (self.modweaponclip[GetWeaponStringID(self GetCurrentWeapon())] != self GetModWeaponClip(self GetCurrentWeapon()))
                        self.modweaponclip[GetWeaponStringID(self GetCurrentWeapon())] = self GetModWeaponClip(self GetCurrentWeapon());
                    //Left Gun Fired
                    if (self.modweapondualclip[GetWeaponStringID(self GetCurrentWeapon())] != self GetModWeaponDualClip(self GetCurrentWeapon()))
                        self.modweapondualclip[GetWeaponStringID(self GetCurrentWeapon())] = self GetModWeaponDualClip(self GetCurrentWeapon());
                }
            }

            // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
            //┃ Add/Subtract Mod Weapon Clip/Stock Ammo When Reloading
            //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

            if (result == "reload")
            {
                // ______________________________________________
                //| Clip          
                // ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

                if (WeaponUsesClip(self GetDefaultCurrentWeapon()))
                {
                    //Non Dual Wield
                    if (!IsWeaponDualWield(self GetDefaultCurrentWeapon()))
                    {
                        //If Stock Ammo Has Enough To Fill Clip
                        if (self GetModWeaponStock(self GetDefaultCurrentWeapon()) >= (self GetModWeaponClipSize(self GetDefaultCurrentWeapon()) - self GetModWeaponClip(self GetDefaultCurrentWeapon())))
                        {
                            self SetModWeaponStock(self GetDefaultCurrentWeapon(), (self GetModWeaponStock(self GetDefaultCurrentWeapon()) - (self GetModWeaponClipSize(self GetDefaultCurrentWeapon()) - self GetModWeaponClip(self GetDefaultCurrentWeapon()))));
                            self SetModWeaponClip(self GetDefaultCurrentWeapon(), self GetModWeaponClipSize(self GetDefaultCurrentWeapon()));
                        }
                        //Empty Stock Ammo Into Clip
                        else
                        {
                            self SetModWeaponClip(self GetDefaultCurrentWeapon(), self GetModWeaponClip(self GetDefaultCurrentWeapon()) + self GetModWeaponStock(self GetDefaultCurrentWeapon()));
                            self SetModWeaponStock(self GetDefaultCurrentWeapon(), 0);
                        } 
                    }
                    //Dual Wield
                    else
                    {
                        //Clip 1 Reloaded
                        if (self GetModWeaponClip(self GetCurrentWeapon()) != self.modweaponclip[GetWeaponStringID(self GetCurrentWeapon())])
                        {
                            //If Stock Ammo Has Enough To Fill Clip 1
                            if (self GetModWeaponStock(self GetCurrentWeapon()) >= (self GetModWeaponClipSize(self GetCurrentWeapon()) - self.modweaponclip[GetWeaponStringID(self GetCurrentWeapon())]))
                            {
                                self SetModWeaponStock(self GetCurrentWeapon(), (self GetModWeaponStock(self GetCurrentWeapon()) - (self GetModWeaponClipSize(self GetCurrentWeapon()) - self.modweaponclip[GetWeaponStringID(self GetCurrentWeapon())])));
                                //self SetWeaponAmmoStock(self GetCurrentWeapon(), self GetModWeaponStock(self GetCurrentWeapon()));
                                self.modweaponclip[GetWeaponStringID(self GetCurrentWeapon())] = self GetModWeaponClip(self GetCurrentWeapon());
                            }
                            //Empty Stock Ammo Into Clip 1  
                            else
                            {
                                self SetModWeaponStock(self GetCurrentWeapon(), 0);
                                self.modweaponclip[GetWeaponStringID(self GetCurrentWeapon())] = self GetModWeaponClip(self GetCurrentWeapon());
                            }
                        }
                        //Clip 2 Reloaded
                        if (self GetModWeaponDualClip(self GetCurrentWeapon()) != self.modweapondualclip[GetWeaponStringID(self GetCurrentWeapon())])
                        {
                            //If Stock Ammo Has Enough To Fill Clip 2
                            if (self GetModWeaponStock(self GetCurrentWeapon()) >= (self GetModWeaponClipSize(self GetCurrentWeapon()) - self.modweapondualclip[GetWeaponStringID(self GetCurrentWeapon())]))
                            {
                                self SetModWeaponStock(self GetCurrentWeapon(), (self GetModWeaponStock(self GetCurrentWeapon()) - (self GetModWeaponClipSize(self GetCurrentWeapon()) - self.modweapondualclip[GetWeaponStringID(self GetCurrentWeapon())])));
                                //self SetWeaponAmmoStock(self GetCurrentWeapon(), self GetModWeaponStock(self GetCurrentWeapon()));
                                self.modweapondualclip[GetWeaponStringID(self GetCurrentWeapon())] = self GetModWeaponDualClip(self GetCurrentWeapon());
                            }
                            //Empty Stock Ammo Into Clip 2    
                            else
                            {
                                self SetModWeaponStock(self GetCurrentWeapon(), 0);
                                self.modweapondualclip[GetWeaponStringID(self GetCurrentWeapon())] = self GetModWeaponDualClip(self GetCurrentWeapon());
                            }
                        }
                    }
                }
                
                // ______________________________________________
                //| Bullet Feed          
                // ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

                else
                {
                    //Fast Mags
                    if (WeaponHasAttachment(self GetDefaultCurrentWeapon(), "dualclip") && (self GetModWeaponClipSize(self GetDefaultCurrentWeapon()) - self GetModWeaponClip(self GetDefaultCurrentWeapon())) > 1)
                    {
                        self SetModWeaponStock(self GetDefaultCurrentWeapon(), (self GetModWeaponStock(self GetDefaultCurrentWeapon()) - 2));
                        self SetModWeaponClip(self GetDefaultCurrentWeapon(), (self GetModWeaponClip(self GetDefaultCurrentWeapon()) + 2));
                    }
                    //Non Fast Mags
                    else
                    {
                        self SetModWeaponStock(self GetDefaultCurrentWeapon(), (self GetModWeaponStock(self GetDefaultCurrentWeapon()) - 1));
                        self SetModWeaponClip(self GetDefaultCurrentWeapon(), (self GetModWeaponClip(self GetDefaultCurrentWeapon()) + 1));
                    }
                }
            }
        }

        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Add New Picked Up Equipment To Inventory                                                                    
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        foreach (equipment in self GetWeaponsListEquipment())
        {
            if (!IsDefined(self.inventory[equipment]))
            { 
                // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
                //┃ Equipment Exchange (1 Equipment Type Limit)
                //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

                foreach (inventoryitem in self.inventory)
                {
                    if (IsWeaponEquipment(inventoryitem.itemid) && equipment != inventoryitem.itemid && self GetModWeaponStock(inventoryitem.itemid) > 0)
                        self PlayerDropEquipment(inventoryitem.itemid, self GetModWeaponStock(inventoryitem.itemid), (self GetOrigin() + (0, 0, 40)));
                    else if (IsWeaponEquipment(inventoryitem.itemid) && equipment != inventoryitem.itemid && self GetModWeaponStock(inventoryitem.itemid) <= 0)
                        self TakePlayerItem(inventoryitem.itemid, true);
                }
                
                self.inventory[equipment] = SpawnStruct();
                self.inventory[equipment].itemid = GetWeaponStringID(equipment);
                self.inventory[equipment].rarity = GetItemRarities(equipment)[0];
                self SetModWeaponStock(equipment, 1);
                break;
            }
        }
        
        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Disable Assault Shield Placement                                                                    
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        if (IsDefined(self.riotshieldentity))
        {
            self Notify("destroy_riotshield");
            self TakePlayerItem("riotshield_mp", true);
        }

        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Disable Ballistic Knives                                                                 
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        foreach (entity in GetEntArray("sticky_weapon", "targetname"))
        {
            if (entity.model == "t6_wpn_ballistic_knife_projectile")
            {
                foreach (player in level.players)
                    player Notify("ballistic_knife_stationary");
                    
                entity Notify("stationary");
                entity Notify("death");
                entity.pickuptrigger Delete();
                entity.glowing_model Delete();
                entity Delete();
                entity = undefined;
            }
        }

        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Update Menu Options                                                                
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        // self submenu("Equipment");

        // if (result == "grenade_fire" && IsDefined(self.menu) && self.menuopen && self.menu.currentmenu == "Equipment"){
        //     checkOtherSelfSubmenu(1);
        // }

        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Update Mod Weapons Hud                                                               
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        self thread UpdateModWeaponsHud(0.2);
    }
}

ButtonMonitor()
{
    self Endon("disconnect");
    level Endon("game_ended");
    
    for (;;)
    {
        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Knife Flip
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ 

        if (self ActionSlotThreeButtonPressed() && !self.menuopen)
        {
            if (self GetDefaultCurrentWeapon() == "knife_held_mp" && !IsDefined(self.weaponinpackapunch))
            {
                self InitialWeaponRaise("knife_held_mp");
                wait 0.7;
            }
        }

        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Third Person
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ 

        if (self ActionSlotFourButtonPressed() && !self.menuopen && !IsDefined(self.objectcontrol)){
            self ThirdPerson();
        }

        wait 0.05;
    }
}

PointsMonitor()
{
    self Endon("disconnect");
    level Endon("game_ended");
    
    currentpoints = Int(self.points);
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Points Change
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ 

    for (;;)
    {
        if (currentpoints != Int(self.points))
        {
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Bankroller/Financier Skill                                                      
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (currentpoints > self.points)
            {
                difference = currentpoints - self.points;

                if (self.status == "Human" && self.gamerank >= 6)
                    self.points += Ceil((difference / 100) * level.financierpointsrefundpercentage);
                else if (self.status == "Human" && self.gamerank >= 4)
                    self.points += Ceil((difference / 100) * level.bankrollerpointsrefundpercentage);
            }   
            
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Update Points Hud                                                     
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            currentpoints = Int(self.points);
            self.pointsvalue SetValue(Int(self.points));
        }
        
        wait 0.05;
    }
}

Rewards()
{
    self Endon("disconnect");
    level Endon("game_ended");
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ When Any Player Dies
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ 

    for (;;)
    {
        self Waittill_Any("killed", "death");

        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Human Rewards                                                     
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        if (self.status == "Human")
        {
            if (self.pers["kills"] >= 50 && self.gamerank < 1)
            {
                self.gamerank = 1;
                self thread NotifyMessage("Ninja Skill ^3Awarded", undefined, undefined, undefined);
            }
            if (self.pers["kills"] >= 100 && self.gamerank < 2)
            {
                self.gamerank = 2;
                self thread NotifyMessage("Apprentice Carpenter Skill ^3Awarded", undefined, undefined, undefined);
            }
            if (self.pers["kills"] >= 200 && self.gamerank < 3)
            {
                self.gamerank = 3;
                self thread NotifyMessage("Bankroller Skill ^3Awarded", undefined, undefined, undefined);
            }
            if (self.pers["kills"] >= 300 && self.gamerank < 4)
            {
                self.gamerank = 4;
                self thread NotifyMessage("Samurai Skill ^3Awarded", undefined, undefined, undefined);
            }
            if (self.pers["kills"] >= 400 && self.gamerank < 5)
            {
                self.gamerank = 5;
                self thread NotifyMessage("Financier Skill ^3Awarded", undefined, undefined, undefined);
            }
            if (self.pers["kills"] >= 500 && self.gamerank < 6)
            {
                self.gamerank = 6;
                self thread NotifyMessage("Master Builder Skill ^3Awarded", undefined, undefined, undefined);
            }
            
            self SetRank(self.gamerank, 0);
        }

        //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
        //║ Zombie Rewards                                                    
        //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

        if (self.status == "Zombie")
        {
            if (self.pers["deaths"] >= 15 && self.gamerank < 1)
            {
                self.gamerank = 1;
                self.points += 500;
                self thread NotifyMessage("+500 Points ^3Awarded", undefined, undefined, undefined);
            }
            if (self.pers["deaths"] >= 30 && self.gamerank < 2)
            {
                self.gamerank = 2;
                self.points += 1000;
                self thread NotifyMessage("+1000 Points ^3Awarded", undefined, undefined, undefined);
            }
            if (self.pers["deaths"] >= 50 && self.gamerank < 3)
            {
                self.gamerank = 3;
                self.points += 3000;
                self thread NotifyMessage("+3000 Points ^3Awarded", undefined, undefined, undefined);
            }
            if (self.pers["deaths"] >= 100 && self.gamerank < 4)
            {
                self.gamerank = 4;
                self.points += 5000;
                self thread NotifyMessage("+5000 Points ^3Awarded", undefined, undefined, undefined);
            }
            if (self.pers["deaths"] >= 300 && self.gamerank < 5)
            {
                self.gamerank = 5;
                self ChangeToHuman(self);
                self thread NotifyMessage("Infection Antidote ^3Awarded", undefined, undefined, undefined);
            }
            
            self SetRank(self.gamerank, 9);
        }
        
        wait 0.05;
    }
}

GetRandomItem(type)
{
    //Random Rarity
    if (type == "groundloot" || type == "lootbox" || type == "supplydrop")
        rarity = GetRandomRarity();
    //Random Item
    if (type == "groundloot" && IsDefined(level.groundlootitems))
        listofitems = level.groundlootitems;
    if (type == "lootbox" && IsDefined(level.lootboxitems))
        listofitems = level.lootboxitems;
    if (type == "supplydrop" && IsDefined(level.supplydropitems))
        listofitems = level.supplydropitems;
    if (!IsDefined(listofitems))
        listofitems = level.mysteryboxitems;
        
    randomitem = Random(listofitems);
    
    while (!IsInArray(GetItemRarities(randomitem), rarity)) 
    {
        randomitem = Random(listofitems);
        wait 0.01;
    }
    
    //Random Weapon Attachments
    if (IsWeaponPrimary(randomitem))
    {
        supportedattachments = GetWeaponSupportedAttachments(randomitem);

        if (IsDefined(supportedattachments) && supportedattachments.size > 0)
        {
            supportedattachmentamount = RandomInt(Clamp(supportedattachments.size, 0, 4));
            
            while (WeaponAttachmentCount(randomitem) < supportedattachmentamount)
            {
                randomattachment = Random(supportedattachments);
            
                while (WeaponHasAttachment(randomitem, randomattachment) || WeaponAttachmentConflict(randomitem, randomattachment) || randomattachment == "none" || randomattachment == "gl")
                {
                    randomattachment = Random(supportedattachments);
                    wait 0.01;
                }
                
                if (randomattachment == "dw")
                {
                    randomitem = StrTok(randomitem, "_")[0] + "_dw_mp";
                    break;
                }
                
                randomitem += "+"  + randomattachment;
            }
        }
    }
    
    return Array(rarity, randomitem);
}

GetItemSpawnQuantity(item, spawntype)
{
    if (spawntype == "groundloot" || spawntype == "lootbox" || spawntype == "supply")
    {
        if (item == "frag_grenade_mp" || item == "sticky_grenade_mp" || item == "hatchet_mp" || item == "satchel_charge_mp")
            return 2;
        if (item == "bouncingbetty_mp" || item == "claymore_mp")
            return 1;
    }
}

GetWeaponCategory(weapon)
{   
    //Pistols
    if (GetWeaponStringID(weapon) == "fiveseven_mp" || GetWeaponStringID(weapon) == "fnp45_mp" || GetWeaponStringID(weapon) == "beretta93r_mp" || GetWeaponStringID(weapon) == "judge_mp" || GetWeaponStringID(weapon) == "kard_mp")
        return "Pistols";
    //Submachine Guns
    if (GetWeaponStringID(weapon) == "mp7_mp" || GetWeaponStringID(weapon) == "pdw57_mp" || GetWeaponStringID(weapon) == "vector_mp" || GetWeaponStringID(weapon) == "insas_mp" || GetWeaponStringID(weapon) == "qcw05_mp" || GetWeaponStringID(weapon) == "evoskorpion_mp" || GetWeaponStringID(weapon) == "peacekeeper_mp")
        return "Submachine Guns";
    //Assault Rifles
    if (GetWeaponStringID(weapon) == "tar21_mp" || GetWeaponStringID(weapon) == "type95_mp" || GetWeaponStringID(weapon) == "sig556_mp" || GetWeaponStringID(weapon) == "sa58_mp" || GetWeaponStringID(weapon) == "hk416_mp" || GetWeaponStringID(weapon) == "scar_mp" || GetWeaponStringID(weapon) == "saritch_mp" || GetWeaponStringID(weapon) == "xm8_mp" || GetWeaponStringID(weapon) == "an94_mp")
        return "Assault Rifles";
    //Shotguns
    if (GetWeaponStringID(weapon) == "870mcs_mp" || GetWeaponStringID(weapon) == "saiga12_mp" || GetWeaponStringID(weapon) == "ksg_mp" || GetWeaponStringID(weapon) == "srm1216_mp")
        return "Shotguns";
    //Lightmachine Guns
    if (GetWeaponStringID(weapon) == "mk48_mp" || GetWeaponStringID(weapon) == "qbb95_mp" || GetWeaponStringID(weapon) == "lsat_mp" || GetWeaponStringID(weapon) == "hamr_mp")
        return "Lightmachine Guns";
    //Sniper Rifles
    if (GetWeaponStringID(weapon) == "svu_mp" || GetWeaponStringID(weapon) == "dsr50_mp" || GetWeaponStringID(weapon) == "ballista_mp" || GetWeaponStringID(weapon) == "as50_mp")
        return "Sniper Rifles";
    //Launchers
    if (GetWeaponStringID(weapon) == "smaw_mp" || GetWeaponStringID(weapon) == "usrpg_mp" || GetWeaponStringID(weapon) == "m32_wager_mp")
        return "Launchers";
    //Specials
    if (GetWeaponStringID(weapon) == "knife_held_mp" || GetWeaponStringID(weapon) == "knife_ballistic_mp" || GetWeaponStringID(weapon) == "riotshield_mp" || GetWeaponStringID(weapon) == "crossbow_mp" || GetWeaponStringID(weapon) == "minigun_wager_mp")
        return "Specials";
    
    return "none";
}

WeaponAttachmentConflict(weapon, attachment)
{
    //Optics
    conflicts = 0;
    
    foreach (weaponattachment in StrTok("acog,ir,holo,dualoptic,is,mms,reflex,rangefinder,vzoom", ","))
    {
        if (IsSubStr(weapon, "+" + weaponattachment) || weaponattachment == attachment)
            conflicts ++;
    }
    
    if (conflicts > 1)
        return true;    

    //Suppressor/Long Barrel
    conflicts = 0;
    
    foreach (weaponattachment in StrTok("silencer,extbarrel", ","))
    {
        if (IsSubStr(weapon, "+" + weaponattachment) || weaponattachment == attachment)
            conflicts ++;
    }
    
    if (conflicts > 1)
        return true;    
            
    //Extended Clip/Fast Mag
    conflicts = 0;
    
    foreach (weaponattachment in StrTok("extclip,dualclip", ","))
    {
        if (IsSubStr(weapon, "+" + weaponattachment) || weaponattachment == attachment)
            conflicts ++;
    }
    
    if (conflicts > 1)
        return true;    

    //FMJ/MMS
    conflicts = 0;
    
    foreach (weaponattachment in StrTok("fmj,mms", ","))
    {
        if (IsSubStr(weapon, "+" + weaponattachment) || weaponattachment == attachment)
            conflicts ++;
    }
    
    if (conflicts > 1)
        return true;    
        
    //Launcher/Fore Grip
    conflicts = 0;
    
    foreach (weaponattachment in StrTok("gl,grip", ","))
    {
        if (IsSubStr(weapon, "+" + weaponattachment) || weaponattachment == attachment)
            conflicts ++;
    }
    
    if (conflicts > 1)
        return true;    
        
    //Launcher/Hybrid Optic/Select Fire
    conflicts = 0;
    
    foreach (weaponattachment in StrTok("gl,dualoptic,sf", ","))
    {
        if (IsSubStr(weapon, "+" + weaponattachment) || weaponattachment == attachment)
            conflicts ++;
    }
    
    if (conflicts > 1)
        return true;    
        
    //ACOG/Ballistics CPU
    conflicts = 0;
    
    foreach (weaponattachment in StrTok("acog,swayreduc", ","))
    {
        if (IsSubStr(weapon, "+" + weaponattachment) || weaponattachment == attachment)
            conflicts ++;
    }
    
    if (conflicts > 1)
        return true;    

    return false;
}

GetEyeTraceOrigin()
{
    return BulletTrace(self GetEye(), self GetEye() + (AnglesToForward(self GetPlayerAngles()) * 10000000), true, self)["position"];
}

GetWeaponSilencerSound(weapon)
{
    if (GetWeaponCategory(GetWeaponStringID(weapon)) == "Pistols")
        return "wpn_fiveseven_silencer_fire_plr";
    if (GetWeaponCategory(GetWeaponStringID(weapon)) == "Assault Rifles")
        return "wpn_tar21_silencer_fire_plr";
    if (GetWeaponCategory(GetWeaponStringID(weapon)) == "Shotguns")
        return "wpn_saiga12_silencer_fire_plr";
    if (GetWeaponCategory(GetWeaponStringID(weapon)) == "Sniper Rifles")
        return "wpn_dsr50_silencer_fire_plr";
    
    return "none";
}

PowerUp(origin, override)
{
    if (!IsDefined(override) && RandomInt(100) <= Clamp(level.powerupdropchancepercentage, 0, 100))
        override = true;
    if (IsDefined(override) && level.poweruppickups < 9)
    {
        level.poweruppickups ++;
        
        //Power-Up Model
        powerup = SpawnEntity("script_model", "p_glo_scavenger_pack_obj", origin + (0, 0, 40), (0, 0, 90));
        powerup thread PowerUpDropEffect();
        powerup thread PowerUpDeath();
        
        //Random Power-Up
        randompowerup = RandomInt(9);

        if (randompowerup == 0 || randompowerup == 1)//Max Ammo
            powerup.waypoint = CreateWaypoint("cac_mods_extended_mag", (powerup GetOrigin() + (0, -8, 30)), 10, undefined, 1, undefined, true, "allies");
        if (randompowerup == 2)//Insta-Kill
            powerup.waypoint = CreateWaypoint("hud_status_dead", (powerup GetOrigin() + (0, -8, 30)), 10, undefined, 1, undefined, true, "allies");
        if (randompowerup == 3)//Double Points
            powerup.waypoint = CreateWaypoint("perk_times_two", (powerup GetOrigin() + (0, -8, 30)), 10, undefined, 1, undefined, true, "allies");
        if (randompowerup == 4)//Nuke
            powerup.waypoint = CreateWaypoint("hud_ks_predator", (powerup GetOrigin() + (0, -8, 30)), 12, undefined, 1, undefined, true, "allies");
        if (randompowerup == 5)//Fire Sale
            powerup.waypoint = CreateWaypoint("perk_hardline", (powerup GetOrigin() + (0, -8, 30)), 10, undefined, 1, undefined, true, "allies");
        if (randompowerup == 6)//Free Perk
            powerup.waypoint = CreateWaypoint("ui_host", (powerup GetOrigin() + (0, -8, 30)), 10, undefined, 1, undefined, true, "allies");
        if (randompowerup == 7)//Zombie Blood
            powerup.waypoint = CreateWaypoint("menu_mp_bonuscard_overkill", (powerup GetOrigin() + (0, -8, 30)), 18, undefined, 1, undefined, true, "allies");
        if (randompowerup == 8)//Death Machine
            powerup.waypoint = CreateWaypoint("hud_icon_minigun", (powerup GetOrigin() + (0, -8, 30)), 10, undefined, 1, undefined, true, "allies");

        //Monitor Power-Up
        while (IsDefined(powerup))
        {
            foreach (player in level.players)
            {
                if (player.status == "Human" && Distance(powerup GetOrigin(), player GetOrigin()) <= 60)
                {       
                    if (randompowerup == 0 || randompowerup == 1)
                        level thread MaxAmmo();
                    if (randompowerup == 2)
                        level thread InstaKill();
                    if (randompowerup == 3)
                        level thread DoublePoints();
                    if (randompowerup == 4)
                        level thread Nuke();
                    if (randompowerup == 5)
                        level thread FireSale();
                    if (randompowerup == 6)
                        player thread FreePerk();
                    if (randompowerup == 7)
                        player thread ZombieBlood();
                    if (randompowerup == 8)
                        player thread DeathMachine();
                        
                    player PlaySoundToPlayer("mpl_killconfirm_tags_pickup", player);
                    powerup Delete();
                    powerup.waypoint DestroyElement();
                    level.poweruppickups --;
                    
                    break;
                }   
            }
            
            wait 0.05;
        }
        
        powerup.waypoint DestroyElement();
        level.poweruppickups --;
    }
}

PowerUpDropEffect()
{
    while (IsDefined(self))
    {
        powerupeffect Delete();
        powerupeffect = SpawnFX(level._effect["prox_grenade_player_shock"], self GetOrigin() + (0, -8, 0), self.angles);
        TriggerFX(powerupeffect);
        direction = RandomInt(6);
        
        if (direction == 0)
            self RotateTo(self.angles + (10, 0, 0), 1);
        if (direction == 1)
            self RotateTo(self.angles + (0, 10, 0), 1);
        if (direction == 2)
            self RotateTo(self.angles + (0, 0, 10), 1);
        if (direction == 3)
            self RotateTo(self.angles + (-10, 0, 0), 1);
        if (direction == 4)
            self RotateTo(self.angles + (0, -10, 0), 1);
        if (direction == 5)
            self RotateTo(self.angles + (0, 0, -10), 1);
            
        wait 1;
    }
    
    powerupeffect Delete();
}

PowerUpDeath()
{   
    wait level.poweruppickupduration - 10;
    
    for (i = 0; i < 36; i ++)
    {
        if (!level.gameended)
        {
            if (i < 14)
                interval = 0.58;    
            if (i > 13 && i < 23)
                interval = 0.22;
            if (i > 22)
                interval = 0.06;    
            if (self.waypoint.alpha == 1)
            {
                self.waypoint.alpha = 0;
                self Hide();
            }
            else
            {
                self.waypoint.alpha = 1;
                self Show();
            }
            
            wait interval;
        }
        else
            break;
    }
    
    self Delete();
}

PowerUpShaderDeath(duration)
{   
    wait duration - 10;
    
    for (i = 0; i < 58; i ++)
    {
        if (IsAlive(self) && !level.gameended)
        {
            if (i > 22)
                interval = 0.125;   
            else 
                interval = 0.2; 
                
            self FadeOverTime(interval);
            
            if (self.alpha == 0)
                self.alpha = 1;
            else
                self.alpha = 0;
                
            wait interval;
        }
        else
            break;
    }
        
    self DestroyElement();
}

MaxAmmo()
{
    foreach (player in level.players)
    {
        if (player.status == "Human")
            player thread GivePlayerMaxAmmo();
    }
}

InstaKill()
{
    level Notify("end_instakill");
    level Endon("end_instakill");
    
    level.instakillshader DestroyElement();
    level.instakillshader = CreateShader("hud_status_dead", "center", "center", "user_center", "user_bottom", -60, -30, 30, 30, undefined, 1, true, true, 0);
    level.instakillshader thread PowerUpShaderDeath(level.instakillduration);
    level.instakill = true;
    wait level.instakillduration;
    level.instakill = undefined;
}

DoublePoints()
{
    level Notify("end_doublepoints");
    level Endon("end_doublepoints");
    
    level.doublepointsshader DestroyElement();
    level.doublepointsshader = CreateShader("perk_times_two", "center", "center", "user_center", "user_bottom", -30, -30, 30, 30, undefined, 1, true, true, 0);
    level.doublepointsshader thread PowerUpShaderDeath(level.doublepointsduration);
    
    if (!IsDefined(level.originalpointsmultiplier))
        level.originalpointsmultiplier = level.pointsmultiplier;
        
    level.pointsmultiplier = level.originalpointsmultiplier * 2;
    wait level.doublepointsduration;
    level.pointsmultiplier --;
}

Nuke()
{
    level.nukeflash DestroyElement();
    level.nukeflash = CreateShader("white", "center", "center", "user_center", "user_center", 0, 0, 1000, 1000, (1, 1, 1), 0, false, true, 100);
    level.nukeflash FadeOverTime(1);
    level.nukeflash.alpha = 1;
    
    foreach (player in level.players)
    {
        if (player.status == "Zombie" && !IsDefined(player.godmode))
            player TakeAllWeapons();
    }
    
    wait 1;
    level.nukeflash FadeOverTime(1);
    level.nukeflash.alpha = 0;
    
    foreach (player in level.players)
    {
        if (player.status == "Zombie" && !IsDefined(player.godmode))
        {
            PlayFX(level.explosionfx, player GetOrigin());
            player Suicide();
            wait 0.15;
        }
    }
    
    foreach (player in level.players)
    {
        if (player.status == "Human")
            player.points += level.humanpointspernuke * level.pointsmultiplier;
    }
}

FireSale()
{  
    level Notify("end_firesale");
    level Endon("end_firesale");
    
    level.firesaleshader DestroyElement();
    level.firesaleshader = CreateShader("perk_hardline", "center", "center", "user_center", "user_bottom", 0, -30, 30, 30, undefined, 1, true, true, 0);
    level.firesaleshader thread PowerUpShaderDeath(level.firesaleduration);
    level.firesale = true;
    wait level.firesaleduration;
    level.firesale = undefined;
}

FreePerk()
{  
    self Endon("death");
    self Endon("disconnect");
    
    randomperk = RandomInt(10);
    
    if (randomperk == 0 && !IsDefined(self.juggernog))
    {
        self.points += level.pricejuggernog;
        self thread Juggernog();
        
        return;
    }
    if (randomperk == 1 && !IsDefined(self.doubletapii)) 
    {
        self.points += level.pricedoubletapii;
        self thread DoubleTapII();
        
        return;
    }
    if (randomperk == 2 && !IsDefined(self.speedcola))
    {
        self.points += level.pricespeedcola;
        self thread SpeedCola();
        
        return;
    }
    if (randomperk == 3 && !IsDefined(self.staminup))
    {
        self.points += level.pricestaminup;
        self thread StaminUp();
        
        return;
    }
    if (randomperk == 4 && !IsDefined(self.mulekick))
    {
        self.points += level.pricemulekick;
        self thread MuleKick();
        
        return;
    }
    if (randomperk == 5 && !IsDefined(self.electriccherry))
    {
        self.points += level.priceelectriccherry;
        self thread ElectricCherry();
        
        return;
    }
    if (randomperk == 6 && !IsDefined(self.phdflopper))
    {
        self.points += level.pricephdflopper;
        self thread PhDFlopper();
        
        return;
    }
    if (randomperk == 7 && !IsDefined(self.deadshotdaiquiri))
    {
        self.points += level.pricedeadshotdaiquiri;
        self thread DeadshotDaiquiri();
        
        return;
    }
    if (randomperk == 8 && !IsDefined(self.stealthaid))
    {
        self.points += level.pricestealthaid;
        self thread StealthAid();
        
        return;
    }
    if (randomperk == 9 && !IsDefined(self.scavenger))
    {
        self.points += level.pricescavenger;
        self thread Scavenger();
        
        return;
    }
    if (!IsDefined(self.juggernog) || !IsDefined(self.doubletapii) || !IsDefined(self.speedcola) || !IsDefined(self.staminup) || !IsDefined(self.mulekick) || !IsDefined(self.electriccherry) || !IsDefined(self.phdflopper) || !IsDefined(self.deadshotdaiquiri) || !IsDefined(self.stealthaid) || !IsDefined(self.scavenger))
        self FreePerk();
    else
    {
        self.points += level.humanstartingpoints;
        self IPrintLn("^2$" + level.humanstartingpoints + " ^7Points Received");
    }
}

ZombieBlood()
{  
    self Notify("end_zombieblood");
    self Endon("end_zombieblood");
    self Endon("death");
    self Endon("disconnect");
    
    if (!IsDefined(self.invisibility))
    {
        self.zombiebloodshader DestroyElement();
        self.zombiebloodshader = CreateShader("menu_mp_bonuscard_overkill", "center", "center", "user_center", "user_bottom", 30, -30, 30, 30, undefined, 1, true, false, 0);
        self.zombiebloodshader thread PowerUpShaderDeath(level.zombiebloodduration);
        self SetVisibleToAllExceptTeam("axis");
        self UseServerVisionSet(true);
        self SetVisionSetForPlayer("mpintro", true);
        
        for (i = 0; i < level.zombiebloodduration; i += 0.05)
        {
            foreach (player in level.players)
            {
                if (player Is_Bot() && IsDefined(player.bot.threat.entity) && player.bot.threat.entity == self)
                {
                    player CancelGoal("enemy_patrol");
                    player maps/mp/bots/_bot_combat::Bot_Clear_Enemy();
                    player maps/mp/bots/_bot_combat::Threat_Ignore(self, (level.zombiebloodduration - i));
                }
            }
            
            wait 0.05;
        }
        
        self SetVisibleToAll();
        self UseServerVisionSet(false);
    }
}

DeathMachine()
{
    self Notify("end_deathmachine");
    self Endon("end_deathmachine");
    self Endon("death");
    self Endon("disconnect");
    
    self.deathmachineshader DestroyElement();
    self.deathmachineshader = CreateShader("hud_icon_minigun", "center", "center", "user_center", "user_bottom", 60, -30, 30, 30, undefined, 1, true, false, 0);
    self.deathmachineshader thread PowerUpShaderDeath(level.deathmachineduration);
    
    if (!self HasWeapon("minigun_wager_mp"))
    {
        self GiveWeapon("minigun_wager_mp");
        self GiveMaxAmmo("minigun_wager_mp");
        self SwitchToWeapon("minigun_wager_mp");
    }   
    else
        self GiveMaxAmmo("minigun_wager_mp");
       
    wait level.deathmachineduration;
    self TakeWeapon("minigun_wager_mp");
}

GetRandomRarity()
{
    commonrarityrange = level.commonitemrarity;
    uncommonrarityrange = (level.commonitemrarity + level.uncommonitemrarity);
    rarerarityrange = (level.commonitemrarity + level.uncommonitemrarity + level.rareitemrarity);
    epicrarityrange = (level.commonitemrarity + level.uncommonitemrarity + level.rareitemrarity + level.epicitemrarity);
    legendaryrarityrange = (level.commonitemrarity + level.uncommonitemrarity + level.rareitemrarity + level.epicitemrarity + level.legendaryitemrarity);
    randomrarity = Clamp(RandomFloat(legendaryrarityrange), 0, 100);
    
    if (randomrarity >= 0 && randomrarity < commonrarityrange)
        rarity = "Common";
    if (randomrarity >= commonrarityrange && randomrarity < uncommonrarityrange)
        rarity = "Uncommon";
    if (randomrarity >= uncommonrarityrange && randomrarity < rarerarityrange)
        rarity = "Rare";
    if (randomrarity >= rarerarityrange && randomrarity < epicrarityrange)
        rarity = "Epic";
    if (randomrarity >= epicrarityrange && randomrarity < legendaryrarityrange)
        rarity = "Legendary";
        
    return rarity;
}

GetHostName()
{
    foreach (player in level.players)
    {
        if (player IsHost())
            return GetAbbreviatedPlayerName(player);
    }
    
    return "undefined";
}

GetStatusColor(player)
{
    if (player.status == "Human")
        return "^5";
    if (player.status == "Zombie")
        return "^1";
}

PlayerSellItem(item)
{
    //Defaults
    if (IsWeaponPrimary(item))
    {
        item = self GetWeaponFromInventory(item);
        itemid = GetWeaponStringID(item);
        itemprice = ((level.price[itemid] * RarityPriceMultiplier(self.inventory[itemid].rarity)) / level.itemsellbackdivider);
    }
    else
    {
        itemid = item;
        itemprice = (level.price[itemid] / level.itemsellbackdivider);
    }

    //Consumables
    if (!IsWeaponPrimary(item) && !IsWeaponEquipment(item) && self.inventory[itemid].quantity > 0)
    {
        self.points += itemprice;
        
        if (self.inventory[itemid].quantity > 0)
            self.inventory[itemid].quantity --;
        else
            self TakePlayerItem(item);
            
        self IPrintLn(item + " ^2Sold");
    }
    //Equipment
    if (IsWeaponEquipment(item) && self GetModWeaponStock(item) > 0)
    {
        self.points += itemprice;
        self SetModWeaponStock(item, (self GetModWeaponStock(item) - 1));
        self IPrintLn(GetEquipmentDisplayName(item) + " ^2Sold");
    }
    //Weapons
    if (IsWeaponPrimary(item))
    {
        if (IsDefined(self.inventory[itemid].upgrade))
            itemprice += (level.packapunchprice / 2);
        if (IsDefined(self.inventory[itemid].upgrade) && self.inventory[itemid].upgrade != "Vanilla")
            itemprice += (level.packapunchprice / 2);
        
        for (i = 1; i < StrTok(item, "+").size; i ++)
        {    
            if (IsDefined(StrTok(item, "+")[i]))
            {
                attachment = StrTok(item, "+")[i];
                itemprice += (level.price[attachment] / 2);
            }
        }
            
        self.points += itemprice;
        self TakePlayerItem(item);
        self IPrintLn(GetWeaponDisplayName(item) + " ^2Sold");
    }
    //Update Menu Option/Back Out Of Menu
    if (IsDefined(self.menu) && self.menuopen)
        checkedSubmenuPreviousMenu();
}

DropPowerUp()
{
    level thread PowerUp((self GetOrigin() + ((AnglesToForward(self GetPlayerAngles())[0] * 100), (AnglesToForward(self GetPlayerAngles())[1] * 100), 0)), true);
}

// PERKS

// changed submenu

Juggernog()
{
    if (!IsDefined(self.juggernog))
    {
        if (self.points >= level.pricejuggernog)
        {
            self.juggernog = true;
            self.points -= level.pricejuggernog;
            self SetPerk("specialty_healthregen");
            self.health = 750;
            self.maxhealth = self.health;
            self IPrintLn("^2Juggernog ^7Purchased Successfully");
            self IPrintLnBold("^2Juggernog ^7Obtained");
            
            UpdateSelfSubMenu();
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
    }
    else
        self IPrintLn("^1Error: ^7You Already Have This Perk");
}

// changed submenu

DoubleTapII()
{
    self Endon("death");
    self Endon("disconnect");
    
    if (!IsDefined(self.doubletapii))
    {
        if (self.points >= level.pricedoubletapii)
        {
            self.doubletapii = true;
            self.points -= level.pricedoubletapii;
            self SetPerk("specialty_armorpiercing");
            self SetPerk("specialty_bulletdamage");
            self SetPerk("specialty_bulletpenetration");
            self SetPerk("specialty_rof");
            self IPrintLn("^2Double Tap II ^7Purchased Successfully");
            self IPrintLnBold("^2Double Tap II ^7Obtained");
            
            UpdateSelfSubMenu();
            
            for (;;)
            {
                self Waittill("weapon_fired", weapon);
                MagicBullet(weapon, self GetWeaponMuzzlePoint(), self GetEyeTraceOrigin(), self);
            }
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");    
    }
    else
        self IPrintLn("^1Error: ^7You Already Have This Perk");
}

// changed

SpeedCola()
{
    if (!IsDefined(self.speedcola))
    {
        if (self.points >= level.pricespeedcola)
        {
            self.speedcola = true;
            self.points -= level.pricespeedcola;
            self SetPerk("specialty_fastads");
            self SetPerk("specialty_fastequipmentuse");
            self SetPerk("specialty_fastmeleerecovery");
            self SetPerk("specialty_fastreload");
            self SetPerk("specialty_fasttoss");
            self SetPerk("specialty_fastweaponswitch");
            self IPrintLn("^2Speed Cola ^7Purchased Successfully");
            self IPrintLnBold("^2Speed Cola ^7Obtained");
            
            UpdateSelfSubMenu();
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
    }
    else
        self IPrintLn("^1Error: ^7You Already Have This Perk");
}

// changed

StaminUp()
{
    if (!IsDefined(self.staminup))
    {
        if (self.points >= level.pricestaminup)
        {
            self.staminup = true;
            self.points -= level.pricestaminup;
            self SetPerk("specialty_fastladderclimb");
            self SetPerk("specialty_fastmantle");
            self SetPerk("specialty_movefaster");
            self SetPerk("specialty_unlimitedsprint");
            self SetMoveSpeedScale((self GetMoveSpeedScale() + 0.2));
            self IPrintLn("^2Stamin-Up ^7Purchased Successfully");
            self IPrintLnBold("^2Stamin-Up ^7Obtained");
            
           UpdateSelfSubMenu();
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
    }
    else
        self IPrintLn("^1Error: ^7You Already Have This Perk");
}

// changeed

MuleKick()
{
    if (!IsDefined(self.mulekick))
    {
        if (self.points >= level.pricemulekick)
        {
            self.mulekick = true;
            self.points -= level.pricemulekick;
            self.inventoryitemlimit ++;
            self SetPerk("specialty_additionalprimaryweapon");
            self IPrintLn("^2Mule Kick ^7Purchased Successfully");
            self IPrintLnBold("^2Mule Kick ^7Obtained");
            
            UpdateSelfSubMenu();
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
    }
    else
        self IPrintLn("^1Error: ^7You Already Have This Perk");
}

// changed

ElectricCherry()
{
    self Endon("death");
    self Endon("disconnect");
    
    if (!IsDefined(self.electriccherry))
    {
        if (self.points >= level.priceelectriccherry)
        {
            self.electriccherry = true;
            self.points -= level.priceelectriccherry;
            self SetPerk("specialty_proximityprotection");
            self SetPerk("specialty_shellshock");
            self IPrintLn("^2Electric Cherry ^7Purchased Successfully");
            self IPrintLnBold("^2Electric Cherry ^7Obtained");
            
            UpdateSelfSubMenu();
            
            for (;;)
            {
                self Waittill("reload_start");

                if (!IsDefined(self.reloadwait[GetWeaponStringID(self GetDefaultCurrentWeapon())]))
                {
                    self.reloadwait[GetWeaponStringID(self GetDefaultCurrentWeapon())] = true;
                    self thread ReloadWait(self GetDefaultCurrentWeapon());
                    PlayFXOnTag(level._effect["prox_grenade_player_shock"], self, "j_head");
                    PlayFXOnTag(level._effect["prox_grenade_player_shock"], self, "j_spine1");
                    PlayFXOnTag(level._effect["prox_grenade_player_shock"], self, "j_spine4");
                    PlayFXOnTag(level._effect["prox_grenade_player_shock"], self, "pelvis");
                    PlaySoundAtPosition("wpn_taser_mine_zap", self GetOrigin());
                    currentweapon = self GetDefaultCurrentWeapon();
                    distance = (self GetModWeaponClip(currentweapon) / self GetModWeaponClipSize(currentweapon));
                    distance = Int((300 - (distance * 300)));

                    foreach (player in level.players)
                    {
                        if (IsAlive(player) && player.status == "Zombie" && player.zombietype != "Electric" && Distance(self GetOrigin(), player GetOrigin()) <= distance)
                        {   
                            player maps/mp/_proximity_grenade::ProximityGrenadeDamagePlayer(self, self);
                            player DoDamage(RandomIntRange(450, 500), self GetOrigin(), self, self, "none", "MOD_BURNED", 0, "none");
                        }
                    }
                }
            }
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
    }
    else
        self IPrintLn("^1Error: ^7You Already Have This Perk");
}

ReloadWait(weapon)
{
    while (self HasWeaponDespiteAttachments(weapon) && IsDefined(self.reloadwait[GetWeaponStringID(weapon)]))
    {
        self Waittill("reload");
        
        if (self GetDefaultCurrentWeapon() == weapon)
            self.reloadwait[GetWeaponStringID(weapon)] = undefined;
    }
}

// changed

PhDFlopper()
{
    self Endon("death");
    self Endon("disconnect");
    
    if (!IsDefined(self.phdflopper))
    {

        if (self.points >= level.pricephdflopper)
        {
            self.phdflopper = true;
            self.points -= level.pricephdflopper;
            self SetPerk("specialty_armorvest");
            self SetPerk("specialty_explosivedamage");
            self SetPerk("specialty_fallheight");
            self SetPerk("specialty_fireproof");
            self SetPerk("specialty_flakjacket");
            self SetPerk("specialty_flashprotection");
            self SetPerk("specialty_stunprotection");
            self SetPerk("specialty_quickrevive");
            self IPrintLn("^2PhD Flopper ^7Purchased Successfully");
            self IPrintLnBold("^2PhD Flopper ^7Obtained");
            self thread ExplosiveDamageRegenMonitor();
            
            UpdateSelfSubMenu();
            
            for (;;)
            {
                if (IsDefined(self.divetoprone) && self.divetoprone)
                {
                    height = self GetOrigin()[2];
                    
                    while (!self IsOnGround())
                        wait 0.05;
                        
                    if (height > (self GetOrigin()[2] + 20))
                    {
                        PlayFX(level.explosionfx, self GetOrigin());
                        PlaySoundAtPosition("wpn_rocket_explode_rock", self GetOrigin());
                        
                        foreach (player in level.players)
                        {
                            if (IsAlive(player) && player.status == "Zombie" && player.zombietype != "Napalm" && Distance(self GetOrigin(), player GetOrigin()) <= 300)
                                player DoDamage(RandomIntRange(450, 500), self GetOrigin(), self, self, "none", "MOD_BURNED", 0, "none");
                        }
                    }
                    
                    while(self GetStance() != "stand")
                        wait 0.5;
                }
                
                wait 0.05;
            }
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
    }
    else
        self IPrintLn("^1Error: ^7You Already Have This Perk");
}

//changed

DeadshotDaiquiri()
{
    self Endon("death");
    self Endon("disconnect");
    
    if (!IsDefined(self.deadshotdaiquiri))
    {
        if (self.points >= level.pricedeadshotdaiquiri)
        {
            self.deadshotdaiquiri = true;
            self.points -= level.pricedeadshotdaiquiri;
            self SetPerk("specialty_bulletaccuracy");
            self SetPerk("specialty_deadshot");
            self IPrintLn("^2Deadshot Daiquiri ^7Purchased Successfully");
            self IPrintLnBold("^2Deadshot Daiquiri ^7Obtained");
            self thread DeadshotDaiquriAutomaticFire();
            
            UpdateSelfSubMenu();
            
            for (;;)
            {
                while (self AdsButtonPressed() && !IsDefined(self.forgemode) && !self IsUsingRemote())
                {
                    trace = BulletTrace(self GetEye(), self GetEye() + (AnglesToForward(self GetPlayerAngles()) * 10000000), true, self);
                
                    if (IsDefined(trace["entity"]) && IsPlayer(trace["entity"]) && trace["entity"].status == "Zombie")
                    {
                        while (self AdsButtonPressed() && IsAlive(trace["entity"]) && trace["entity"])
                        {
                            self SetPlayerAngles(VectorToAngles(trace["entity"] GetTagOrigin("j_head") - self GetTagOrigin("j_head")));
                            wait 0.01;
                        }
                    }
                    
                    wait 0.05;
                }
                
                wait 0.05;
            }
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
    }
    else
        self IPrintLn("^1Error: ^7You Already Have This Perk");
}

DeadshotDaiquriAutomaticFire()
{
    self Endon("death");
    self Endon("disconnect");
    
    while (IsAlive(self))
    {
        self Waittill("weapon_fired", weaponid);
        wait 0.1;
        
        foreach (weapon in StrTok("fiveseven,fnp45,beretta93r,judge,saiga12,svu,as50,m32_wager", ","))
        {
            if (IsSubStr(weaponid, weapon) && !IsSubStr(weaponid, "dw_") && !IsSubStr(weaponid, "sf_"))
            {
                if (self WeaponUsesModWeaponAmmo(weaponid))
                    end = 1;
                else
                    end = 0;
                
                    while (self AttackButtonPressed() && self GetCurrentWeapon() == weaponid && self GetModWeaponClip(weaponid) > end && !self IsReloading())
                {
                    wait 0.1;
                    MagicBullet(weaponid, self GetWeaponMuzzlePoint(), self GetEyeTraceOrigin(), self);
                    
                    if (!IsSubStr(weaponid, "silencer"))
                    {
                        PlayFX(level.muzzleflashfx, self GetWeaponMuzzlePoint() + (AnglesToForward(self GetPlayerAngles()) * 20), AnglesToForward(self GetPlayerAngles()));
                        PlaySoundAtPosition(GetWeaponFireSound(weaponid), self GetOrigin());
                        self PlaySoundToPlayer(GetWeaponFireSoundPlayer(GetWeaponIndexFromName(weaponid)), self);
                    }
                    else
                    {
                        PlayFX(level.muzzleflashsilencerfx, self GetWeaponMuzzlePoint() + (AnglesToForward(self GetPlayerAngles()) * 20), AnglesToForward(self GetPlayerAngles()));
                        PlaySoundAtPosition(GetWeaponSilencerSound(GetWeaponStringID(weaponid)), self GetOrigin());
                        self PlaySoundToPlayer(GetWeaponSilencerSound(GetWeaponStringID(weaponid)), self);
                    }
                
                    if (!self WeaponUsesModWeaponAmmo(weaponid))
                        self SetWeaponAmmoClip(GetDefaultWeaponStringID(weaponid), self GetWeaponAmmoClip(GetDefaultWeaponStringID(weaponid)) - 1);
                        
                    self Notify("weapon_fired", weaponid);
                }
            }
        }
    }
}

// cahnged

StealthAid()
{
    self Endon("death");
    self Endon("disconnect");
    
    if (!IsDefined(self.stealthaid))
    {
        if (self.points >= level.pricestealthaid)
        {
            self.stealthaid = true;
            self.points -= level.pricestealthaid;
            self SetPerk("specialty_gpsjammer");
            self SetPerk("specialty_holdbreath");
            self SetPerk("specialty_immunecounteruav");
            self SetPerk("specialty_immuneemp");
            self SetPerk("specialty_immunemms");
            self SetPerk("specialty_immunenvthermal");
            self SetPerk("specialty_immunerangefinder");
            self SetPerk("specialty_loudenemies");
            self SetPerk("specialty_nomotionsensor");
            self SetPerk("specialty_quieter");
            self SetPerk("specialty_reconnaissance");
            self SetPerk("specialty_showenemyequipment");
            self SetPerk("specialty_showonradar");
            self SetPerk("specialty_stalker");
            self SetClientUIVisibilityFlag("g_compassShowEnemies", 1);
            self IPrintLn("^2Stealth Aid ^7Purchased Successfully");
            self IPrintLnBold("^2Stealth Aid ^7Obtained");
            
            UpdateSelfSubMenu();
            
            for (;;)
            {
                if (!self.menuopen && self ActionSlotTwoButtonPressed())
                {
                    if (!IsDefined(infrared))
                    {
                        infrared = true;
                        self.vision = undefined;
                        self SetInfraredVision(true);
                        
                    }
                    else
                    {
                        infrared = undefined;
                        self SetInfraredVision(false);  
                    }
                }
                
                wait 0.05;
            }
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
    }
    else
        self IPrintLn("^1Error: ^7You Already Have This Perk");
}

// changed

Scavenger()
{
    if (!IsDefined(self.ammoficiency))
    {
        if (self.points >= level.pricescavenger)
        {
            self.scavenger = true;
            self.points -= level.pricescavenger;
            self SetPerk("specialty_extraammo");
            self IPrintLn("^2Scavenger ^7Purchased Successfully");
            self IPrintLnBold("^2Scavenger ^7Obtained");
            
            UpdateSelfSubMenu();
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
    }
    else
        self IPrintLn("^1Error: ^7You Already Have This Perk");
}


PlayLoopFXOnPlayer(fx, xoffset, interval, duration)
{
    level Endon("game_ended");
    
    if (IsDefined(duration))
    {
        for (i = 0; i < duration; i += interval)
        {
            effect = SpawnFX(fx, self GetTagOrigin("tag_origin") + (AnglesToForward(self GetPlayerAngles()) * xoffset));
            effect.angles = self.angles;
            TriggerFX(effect);
            wait interval;  
            effect Delete();
        }
    }
    else
    {
        while (IsAlive(self))
        {
            effect = SpawnFX(fx, self GetTagOrigin("tag_origin") + (AnglesToForward(self GetPlayerAngles()) * xoffset));
            effect.angles = self.angles;
            TriggerFX(effect);
            wait interval;  
            effect Delete();
        }
    }
}

PlaySoundToAll(sound)
{
    foreach (player in level.players)
        player PlaySoundToPlayer(sound, player);
}

PlayLoopFX(fx, origin, angles, interval, duration)
{
    for (i = 0; i < duration; i += interval)
    {
        effect = SpawnFX(fx, origin);
        effect.angles = angles;
        TriggerFX(effect);
        wait interval;  
        effect Delete();
    }
}

BulletFX(bulletfx, impactfx, target, speed, interval)
{
    self Endon("death");
    self Endon("disconnect");
    
    projectile = Spawn("script_origin", self GetWeaponMuzzlePoint());
    projectile MoveTo(target, speed);

    while (projectile GetOrigin() != target)
    {
        bulleteffect = SpawnFX(bulletfx, projectile GetOrigin(), AnglesToForward(VectorToAngles(projectile GetOrigin() - target)));
        TriggerFX(bulleteffect);
        wait interval;
        bulleteffect Delete();
    }
    
    if (IsDefined(impactfx))
        PlayFX(impactfx, target);
        
    projectile Delete();
}

DecayDamagePlayer(decayfx, tags, target, decayduration, decayinterval, decaydamage, owner)
{
    for (i = 0; i < decayduration; i += decayinterval)
    {
        if (IsAlive(self))
        {
            self DoDamage(decaydamage, target, owner, owner, "none", "MOD_BURNED", 0, "none");
            
            foreach (tag in StrTok(tags, ","))
                PlayFXOnTag(decayfx, self, tag);
        }
        else
            break;
        
        wait decayinterval;
    }
}

ExplosiveDamageRegenMonitor()
{
    self Endon("death");
    self Endon("disconnect");
    
    while (IsAlive(self))
    {
        self Waittill("damage", damage, attacker, undefinedVar, undefinedVar, type);
        
        if (type == "MOD_FALLING" || type == "MOD_EXPLOSIVE" || type == "MOD_GRENADE" || type == "MOD_GRENADE_SPLASH" || type == "MOD_PROJECTILE_SPLASH" || type == "MOD_BURNED" || type == "MOD_GAS")
            self.health += damage;
    }
}

RiotZombie()
{
    if (!IsDefined(self.zombietype))
    {
        if (self.points >= level.priceriotzombie)
        {
            self.zombietype = "Riot";
            self.points -= level.priceriotzombie;
            self.health += level.zombiesstartinghealth * 3;
            self.maxhealth = self.health;
            self UnsetPerk("specialty_fastmantle");
            self UnsetPerk("specialty_movefaster");
            self UnsetPerk("specialty_unlimitedsprint");
            self GiveWeapon("riotshield_mp");
            self SwitchToWeapon("riotshield_mp");
            
            self IPrintLn("^2Riot Zombie ^7Purchased Successfully");
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
    }
    else
        self IPrintLn("^1Error: ^7You Already Have A Zombie Type");
}

CrawlerZombie()
{
    if (!IsDefined(self.zombietype))
    {
        if (self.points >= level.priceriotzombie)
        {
            self.zombietype = "Crawler";
            self.points -= level.pricecrawlerzombie;
            self SetMoveSpeedScale((self GetMoveSpeedScale() + 10));
            self AllowSprint(false);
            self SetStance("prone");
            self TakeWeapon(self GetWeaponsListEquipment()[0]);
            self GiveWeapon("sensor_grenade_mp");
            self Notify("weapon_change");
            self IPrintLn("^2Crawler Zombie ^7Purchased Successfully");
            self thread CrawlerZombieProjectiles();
            
            while (IsAlive(self))
            {
                if (self GetStance() != "prone")
                    self SetStance("prone");
                wait 0.01;
            }
            
            self MagicGrenadeType("flash_grenade_mp", self GetOrigin() + (0, 0, 20), (0, 0, 0), 2);
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
    }
    else
        self IPrintLn("^1Error: ^7You Already Have A Zombie Type");
}

CrawlerZombieProjectiles()
{
    self Endon("disconnect");
    self Endon("game_ended");
    
    while (IsAlive(self) && self HasWeapon("sensor_grenade_mp"))
    {
        self Waittill("grenade_fire", grenade, weaponid);
                    
        if (weaponid == "sensor_grenade_mp")
        {
            wait 2;

            foreach (player in level.players)
            {
                if (IsAlive(player) && player.status == "Human" && Distance(grenade GetOrigin(), player GetOrigin()) <= 400)
                    player DoDamage(50, player GetOrigin(), self, self, "none", "MOD_GRENADE_SPLASH", 0, "sensor_grenade_mp");
            }
            
            grenade Delete();
            self GiveMaxAmmo("sensor_grenade_mp");
            self Notify("weapon_change");
        }
    }
}

ElectricZombie()
{
    self Endon("disconnect");
    
    if (!IsDefined(self.zombietype))
    {
        if (self.points >= level.priceelectriczombie)
        { 
            self.zombietype = "Electric";
            self.points -= level.priceelectriczombie;
            self.health += level.zombiesstartinghealth / 3;
            self.maxhealth = self.health;
            self SetPerk("specialty_immuneemp");
            self SetPerk("specialty_immunemms");
            self SetPerk("specialty_proximityprotection");
            self SetPerk("specialty_shellshock");
            self SetPerk("specialty_nottargetedbyairsupport");
            self SetPerk("specialty_nottargettedbysentry");
            self IPrintLn("^2Electric Zombie ^7Purchased Successfully");
            self IPrintLn("Press [{+usereload}] To Explode");
            self IPrintLn("Press [{+speed_throw}] To Teleport");
            self thread ElectricZombieTeleport();
            
            while (IsAlive(self))
            {
                foreach (tag in StrTok("j_head,j_mainroot,j_ankle_ri", ","))
                    PlayFXOnTag(level._effect["prox_grenade_player_shock"], self, tag);
            
                if (self UseButtonPressed())
                {
                    wait 0.2;
                    SpawnTimedFX("proximity_grenade_mp", self GetTagOrigin("tag_origin"), (0, 0, 0), 0);
                    
                    foreach (player in level.players)
                    {
                        if (IsAlive(player) && player.status == "Human" && !IsDefined(player.electriccherry) && Distance(self GetOrigin(), player GetOrigin()) <= 200)
                            player maps/mp/_proximity_grenade::ProximityGrenadeDamagePlayer(self, self);
                    }   
                    
                    self Suicide();
                    break;
                }
                    
                wait 0.05;
            }
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
    }
    else
        self IPrintLn("^1Error: ^7You Already Have A Zombie Type");
}   

ElectricZombieTeleport()
{
    self Endon("disconnect");
    
    while (IsAlive(self))
    {
        if (self AdsButtonPressed())
        {
            self Hide();
            self UseServerVisionSet(true);
            self SetVisionSetForPlayer("mpintro", true);
            startfx = SpawnTimedFX("sensor_grenade_mp", self GetTagOrigin("tag_origin"), (0, 0, 0), 6);
            self SetOrigin(BulletTrace(self GetEye(), self GetEye() + (AnglesToForward(self GetPlayerAngles()) * 150), false, self)["position"]);
            wait 0.3;
            self Show();
            self UseServerVisionSet(false);
            startfx Delete();
            endfx = SpawnTimedFX("proximity_grenade_mp", self GetTagOrigin("tag_origin"), (0, 0, 0), 6);
            wait 0.4;
            endfx Delete();
            node = GetNearestNode(self GetOrigin());
            
            if (!IsDefined(node.origin) || Distance(self GetOrigin(), node.origin) > 1000)
            {
                foreach (scriptmodel in GetEntArray("script_model", "classname"))
                {
                    if (Distance(self GetOrigin(), scriptmodel GetOrigin()) <= 1000)
                    {
                        playablearea = true;
                        break;
                    }
                }

                if (!IsDefined(playablearea))
                    self SetOrigin(Random(level.spawnpoints) GetOrigin());
            }
            
            playablearea = undefined;
            wait 1.2;
        }
        
        wait 0.05;
    }
}

NapalmZombie()
{
    self Endon("disconnect");
    
    if (!IsDefined(self.zombietype))
    {
        if (self.points >= level.pricenapalmzombie)
        { 
            self.zombietype = "Napalm";
            self.points -= level.pricenapalmzombie;
            self.health += level.zombiesstartinghealth / 3;
            self.maxhealth = self.health;
            self SetPerk("specialty_armorvest");
            self SetPerk("specialty_explosivedamage");
            self SetPerk("specialty_fireproof");
            self SetPerk("specialty_flakjacket");
            self IPrintLn("^2Napalm Zombie ^7Purchased Successfully");
            self IPrintLn("Press [{+usereload}] To Explode");
            self thread NapalmZombieBurnDamage();
            self thread ExplosiveDamageRegenMonitor();
            self thread PlayLoopFXOnPlayer(level.heatfx, -100, 0.1);
            damageradius = 400;
            maxdamage = 150;
            maxdamageradius = 200;
            
            while (IsAlive(self))
            {
                foreach (tag in StrTok("j_head,j_mainroot,j_ankle_ri", ","))
                    PlayFXOnTag(level.firefx, self, tag);
                    
                if (self UseButtonPressed())
                {
                    wait 0.2;
                    PlayFX(level.explosionfx, self GetOrigin());
                    
                    foreach (player in level.players)
                    {
                        if (IsAlive(player) && player.status == "Human" && !IsDefined(player.phdflopper) && Distance(self GetOrigin(), player GetOrigin()) <= damageradius)
                            player DoDamage(Min(maxdamage, Int(maxdamage * (maxdamageradius / Distance(self GetOrigin(), player GetOrigin())))), self GetOrigin(), self, self, "none", "MOD_BURNED", 0, "none");
                    }   
                    
                    PlaySoundAtPosition("wpn_rocket_explode_rock", self GetOrigin());
                    self Suicide();
                    break;
                }
                    
                wait 0.05;
            }
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
    }
    else
        self IPrintLn("^1Error: ^7You Already Have A Zombie Type");
}   

NapalmZombieBurnDamage()
{
    self Endon("disconnect");
    self Endon("game_ended");

    while (IsAlive(self))
    {
        foreach (player in level.players)
        {
            if (IsAlive(player) && player.status == "Human" && !IsDefined(player.phdflopper) && Distance(self GetOrigin(), player GetOrigin()) <= 400)
                player thread DecayDamagePlayer(level.firefx, "j_mainroot", self GetOrigin(), 0.2, 0.2, 1, self);
        }   

        wait 0.2;
    }
}

CyborgZombie()
{
    if (!IsDefined(self.zombietype))
    {
        if (self.points >= level.pricecyborgzombie)
        {
            self.zombietype = "Cyborg";
            self.points -= level.pricecyborgzombie;
            self.health += level.zombiesstartinghealth / 2;
            self.maxhealth = self.health;
            self SetPerk("specialty_fastladderclimb");
            self SetMoveSpeedScale((self GetMoveSpeedScale() + 0.4));
            
            foreach (tag in StrTok("j_ball_le,j_ball_ri,j_head,j_spineupper,j_spinelower,j_spine1,j_spine4,j_ankle_le,j_ankle_ri", ","))
                self Attach("t5_veh_rcbomb_gib_large", tag);
                
            self IPrintLn("^2Cyborg Zombie ^7Purchased Successfully");
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
    }
    else
        self IPrintLn("^1Error: ^7You Already Have A Zombie Type");
}

MistZombie()
{
    self Endon("death");
    self Endon("disconnect");
    self Endon("game_ended");
    
    if (!IsDefined(self.zombietype))
    {
        if (self.points >= level.pricemistzombie)
        { 
            self.zombietype = "Mist";
            self.points -= level.pricemistzombie;
            self.health += level.zombiesstartinghealth * 3;
            self.maxhealth = self.health;
            self SetPerk("specialty_fastequipmentuse");
            self SetPerk("specialty_showenemyequipment");
            self SetMoveSpeedScale((self GetMoveSpeedScale() - 0.3));
            self SetInfraredVision(true);
            self TakeWeapon(self GetWeaponsListEquipment()[0]);
            self GiveWeapon("claymore_mp");
            self SetWeaponAmmoStock("claymore_mp", WeaponMaxAmmo("claymore_mp"));
            self SwitchToWeapon("claymore_mp"); 
            self Notify("weapon_change");
            self IPrintLn("^2Mist Zombie ^7Purchased Successfully");
            
            while (IsAlive(self))
            {
                if (self HasWeapon("claymore_mp") && self GetWeaponAmmoStock("claymore_mp") == 0)
                {
                    self SetWeaponAmmoStock("claymore_mp", WeaponMaxAmmo("claymore_mp"));
                    self Notify("weapon_change");
                }
                
                frontleft = ((AnglesToForward((self GetPlayerAngles() + (0, 45, 0)))[0] * 100), (AnglesToForward((self GetPlayerAngles() + (0, 45, 0)))[1] * 100), 0);
                backleft = ((AnglesToBackward((self GetPlayerAngles() + (0, 135, 0)))[0] * 100), (AnglesToForward((self GetPlayerAngles() + (0, 135, 0)))[1] * 100), 0);
                frontright = ((AnglesToLeft((self GetPlayerAngles() + (0, -45, 0)))[0] * 100), (AnglesToForward((self GetPlayerAngles() + (0, -45, 0)))[1] * 100), 0);
                backright = ((AnglesToRight((self GetPlayerAngles() + (0, -135, 0)))[0] * 100), (AnglesToForward((self GetPlayerAngles() + (0, -135, 0)))[1] * 100), 0);
                SpawnTimedFX("smoke_center_mp", self GetOrigin() + frontleft, (RandomInt(180), RandomInt(180), RandomInt(180)), 0);
                SpawnTimedFX("smoke_center_mp", self GetOrigin() + backleft, (RandomInt(180), RandomInt(180), RandomInt(180)), 0);
                SpawnTimedFX("smoke_center_mp", self GetOrigin() + frontright, (RandomInt(180), RandomInt(180), RandomInt(180)), 0);
                SpawnTimedFX("smoke_center_mp", self GetOrigin() + backright, (RandomInt(180), RandomInt(180), RandomInt(180)), 0);
                wait 3;
            }
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item"); 
    }
    else
        self IPrintLn("^1Error: ^7You Already Have A Zombie Type");
}

SummonerZombie()
{
    self Endon("disconnect");
    self Endon("game_ended");
    
    if (!IsDefined(self.zombietype))
    {
        if (self.points >= level.pricesummonerzombie)
        { 
            self.zombietype = "Summoner";
            self.points -= level.pricesummonerzombie;
            self.health += level.zombiesstartinghealth * 8;
            self.maxhealth = self.health;
            self SetMoveSpeedScale((self GetMoveSpeedScale() + 0.3));
            self AllowSprint(false);
            self GiveWeapon("knife_ballistic_mp");
            self SwitchToWeapon("knife_ballistic_mp");
            self Attach("projectile_s5rocket", "j_wrist_ri");
            self IPrintLn("^2Summoner Zombie ^7Purchased Successfully");
            self IPrintLn("Press [{+speed_throw}] To Request Zombies To Summon");
            self thread SummonerZombieFX();
            
            while (IsAlive(self))
            {
                if (self AdsButtonPressed())
                {
                    if (!IsDefined(self.summonamount))
                    {
                        self IPrintLnBold("Zombies Requested For Summoning");
                        level thread SummonZombies();
                    }
                    else
                        self IPrintLn("^1Error: ^7Summon Request Currently Not Available"); 
                }
                
                wait 0.05;
            }
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item"); 
    }
    else
        self IPrintLn("^1Error: ^7You Already Have A Zombie Type");
}

SummonZombies()
{
    self Endon("disconnect");
    self Endon("game_ended");
    
    self.summonamount = 0;
                        
    foreach (player in level.players)
    {
        if (IsAlive(player) && player.status == "Zombie" && player.zombietype != "Summoner")
            player thread SummonerZombieRequest(self);
    }
    
    wait 10;
    self.summonamount = undefined;
}

SummonerZombieRequest(summoner)
{
    self Endon("disconnect");
    self Endon("game_ended");
    
    self IPrintLnBold("Press [{+actionslot 4}] To Summon To " + GetAbbreviatedPlayerName(summoner));
    
    for (i = 0; i < 10; i += 0.05)
    {
        if (self ActionSlotFourButtonPressed() && !self.menuopen)   
        {
            if (IsAlive(summoner) && summoner.summonamount < 3)
            {
                summoner.summonamount ++;
                self Hide();
                self SetOrigin(summoner GetOrigin());
                self SetPlayerAngles(summoner.angles);
                wait 1;
                self Show();
                PlayFX(level.bloodfx, self GetTagOrigin("tag_origin"));
                
                break;
            }
            else
            {
                self IPrintLn("^1Error: ^7Summon Not Available Anymore");
                
                break;
            }
        }
        
        wait 0.05;
    }
}

SummonerZombieFX()
{
    self Endon("death");
    self Endon("disconnect");
    self Endon("game_ended");
    
    for (;;)
    {
        if (self IsOnGround() && previousorigin != self GetOrigin())
        {
            PlayFX(level.bloodfx, self GetTagOrigin("j_ankle_le") + (0, 0, 10));
            wait 0.1;
            PlayFX(level.bloddfx, self GetTagOrigin("j_ankle_ri") + (0, 0, 10));
        }
        
        previousorigin = self GetOrigin();
        wait 0.05;
    }
}

JuggernautZombie()
{
    self Endon("disconnect");
    
    if (!IsDefined(self.zombietype))
    {
        if (self.points >= level.pricejuggernautzombie)
        { 
            self.zombietype = "Juggernaut";
            self.points -= level.pricejuggernautzombie;
            self.health += level.zombiesstartinghealth * 50;
            self.maxhealth = self.health;
            self SetPerk("specialty_pin_back");
            self SetPerk("specialty_fasttoss");
            self SetPerk("specialty_fastequipmentuse");
            self SetMoveSpeedScale((self GetMoveSpeedScale() - 0.5));
            
            foreach (tag in StrTok("j_wrist_le,j_wrist_ri", ","))
                self Attach("t6_wpn_trophy_system_world", tag);

            self IPrintLn("^2Juggernaut Zombie ^7Purchased Successfully");
            self IPrintLn("Press [{+speed_throw}] To Pick Up Objects");
            self IPrintLn("Press [{+frag}] To Throw Objects");
            self thread JuggernautZombieFX();
            
            while (IsAlive(self))
            {
                if (self AdsButtonPressed())
                {
                    trace = BulletTrace(self GetEye(), self GetEye() + (AnglesToForward(self GetPlayerAngles()) * 100), false, self);
                    
                    if (IsDefined(trace["entity"]) && IsDefined(trace["entity"].model) && !IsDefined(trace["entity"].custom) && trace["entity"].model != "t6_wpn_turret_sentry_gun" && trace["entity"].model != "t6_wpn_tac_insert_world")
                    {
                        trace["entity"] Hide();
                        trace["entity"] NotSolid();
                        self TakeWeapon(self GetWeaponsListEquipment()[0]);
                        self GiveWeapon("sensor_grenade_mp");
                        self Notify("weapon_change");
                        
                        while (IsAlive(self) && self HasWeapon("sensor_grenade_mp"))
                        {
                            self Waittill("grenade_fire", grenade, weaponid);
                            
                            if (weaponid == "sensor_grenade_mp")
                            {
                                grenade Hide();
                                trace["entity"] Show();
                                trace["entity"].origin = grenade GetOrigin();
                                trace["entity"] LinkTo(grenade);
                                
                                while (previousorigin != trace["entity"] GetOrigin())
                                {
                                    foreach (player in level.players)
                                    {
                                        if (IsAlive(player) && player.status == "Human" && !IsDefined(player.juggernaughtdamage[self.name]) && player IsTouching(trace["entity"]))
                                        {
                                            player DoDamage(300, trace["entity"] GetOrigin(), self, self, "none", "MOD_CRUSH", 0, "none");
                                            player.juggernaughtdamage[self.name] = true;
                                        }
                                    }
                                    
                                    previousorigin = trace["entity"] GetOrigin();
                                    wait 0.05;
                                }
                                
                                foreach (player in level.players)
                                    player.juggernaughtdamage[self.name] = undefined;
                                    
                                trace["entity"] Unlink();
                                trace["entity"] Solid();
                                grenade Delete();
                                self TakeWeapon("sensor_grenade_mp");
                                
                                break;
                            }
                            
                            wait 0.05;
                        }
                    }
                }
                
                wait 0.05;
            }
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item"); 
    }
    else
        self IPrintLn("^1Error: ^7You Already Have A Zombie Type");
}

JuggernautZombieFX()
{
    self Endon("death");
    self Endon("disconnect");
    self Endon("game_ended");
    
    for (;;)
    {
        if (self IsOnGround() && previousorigin != self GetOrigin())
        {
            PlayFX(level.dustfx, self GetTagOrigin("j_ankle_le"));
            wait 0.2;
            PlayFX(level.dustfx, self GetTagOrigin("j_ankle_ri"));
        }
        
        previousorigin = self GetOrigin();
        wait 0.05;
    }
}

GoliathZombie()
{
    self Endon("death");
    self Endon("disconnect");
    
    if (!IsDefined(self.zombietype))
    {
        if (self.points >= level.pricegoliathzombie)
        {
            self.zombietype = "Goliath";
            self.points -= level.pricegoliathzombie;
            self.health += level.zombiesstartinghealth * 50;
            self.maxhealth = self.health;
            self UnsetPerk("specialty_fastmantle");
            self UnsetPerk("specialty_movefaster");
            self UnsetPerk("specialty_unlimitedsprint");
            self SetMoveSpeedScale((self GetMoveSpeedScale() - 0.3));
            self AllowSprint(false);
            self GiveWeapon("saritch_mp+holo+stalker+steadyaim", 0, self CalcWeaponOptions(7, 0, RandomInt(38), 0));
            self GiveMaxAmmo("saritch_mp+holo+stalker+steadyaim");
            self SwitchToWeapon("saritch_mp+holo+stalker+steadyaim");   
            self IPrintLn("^2Goliath Zombie ^7Purchased Successfully");
            
            while (IsAlive(self))
            {
                self Waittill("reload");
                self GiveMaxAmmo("saritch_mp+holo+stalker+steadyaim");
            }
        }
        else
            self IPrintLn("^1Error: ^7You Do Not Have Enough Points For This Item");
    }
    else
        self IPrintLn("^1Error: ^7You Already Have A Zombie Type");
}

ChangeToHuman(player)
{
    if (level.infectiontime == 0 || level.players.size < 2)
    {
        if (player.status == "Zombie")
        {
            spawnorigin = player GetOrigin();
            player.changingtohuman = true;
            level.infectedplayer[GetAbbreviatedPlayerName(player)] = undefined;
            player ChangeTeam("allies");
            player.status = "Human";
            // player thread CloseMenus();
            player Waittill("spawned_player");
            // player thread ResetTheMenu();
            player.pers["score"] = 0;
            player.pers["kills"] = 0;
            player.pers["assists"] = 0;
            player.pers["deaths"] = 0; 
            player.score   = 0;
            player.kills   = 0;
            player.assists = 0;
            player.deaths  = 0;
            player SetOrigin(spawnorigin);
            player.changingtohuman = undefined;
            IPrintLn(GetAbbreviatedPlayerName(player) + " Is Now A ^5Human");
        }
        else
            self IPrintLn("^1Error: ^7" + GetAbbreviatedPlayerName(player) + " Is Not A ^1Zombie");
    }
    else
        self IPrintLn("^1Error: ^7Cannot Change Status Right Now");
}

ChangeToZombie(player)
{
    if (level.infectiontime == 0 || level.players.size < 2)
    {
        if (player.status == "Human")
        {
            spawnorigin = player GetOrigin();
            player Suicide();
            player Waittill("spawned_player");
            player SetOrigin(spawnorigin);
            IPrintLn(GetAbbreviatedPlayerName(player) + " Is Now A ^1Zombie");
        }
        else
            self IPrintLn("^1Error: ^7" + GetAbbreviatedPlayerName(player) + " Is Not A ^5Human");  
    }
    else
        self IPrintLn("^1Error: ^7Cannot Change Status Right Now"); 
}

// changed

ThirdPerson()
{
    if (!IsDefined(self.thirdperson))
    {
        self.thirdperson = true;
        self SetClientThirdPerson(true);
        self IPrintLn("Third Person: ^2Enabled");
    }
    else
    {
        self.thirdperson = undefined;
        self SetClientThirdPerson(false);
        self IPrintLn("Third Person: ^1Disabled");
    }

    UpdateSelfSubMenu(); 
}

EquipmentMonitor()
{
    self Endon("disconnect");
    level Endon("game_ended");
    
    checkstock = 0;
    
    for (;;)
    {
        if (self GetWeaponsListEquipment().size > 0 && checkstock != self GetModWeaponStock(self GetWeaponsListEquipment()[0]))
        {
            checkstock = self GetModWeaponStock(self GetWeaponsListEquipment()[0]);   
            self Notify("weapon_check");
            
            //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
            //██ Update Menu Options                                                                                                                                
            //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
            
            // if (IsDefined(self.menu) && self.menuopen)
            // {
            //     if (self.menu.currentmenu == "Equipment" || IsSubStr(self.menu.currentmenu, GetEquipmentDisplayName(self GetWeaponsListEquipment()[0])))
            //         self SubMenu(self.menu.currentmenu);
            // }
        }
        
        wait 0.05;
    }
}    

UpdateModWeaponsHud(fadetime)
{
    self Notify("update_weapons_hud");
    self Endon("update_weapons_hud");
    self Endon("disconnect");
    self Endon("game_ended");
    
    if (!IsDefined(self.menuopening) && !self.menuopen)
    {
        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Valid Weapons                                                                                                                               
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

        if (IsAlive(self) && self GetCurrentWeapon() != "none" && !IsWeaponEquipment(self GetCurrentWeapon()))
        {  
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Create Weapon Name Hud                                                               
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (!IsDefined(self.weaponname))
            {
                self.weaponname = CreateText(self GetItemDisplayString(undefined, undefined, self GetCurrentWeapon()), "objective", 1.5, "center", "center", "user_right", "user_bottom", -50, -53, undefined, 0, undefined, undefined, true, false, 1);
                self.weaponname.archived = false;
                self.weaponname.alignx = "right";
            }

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Show Weapon Name Hud                                                              
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (self.weaponname.alpha == 0)
            {
                self.weaponname FadeOverTime(fadetime);
                self.weaponname.alpha = 1;
            }

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Update Weapon Name Hud                                                              
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (!IsSubStr(self.weaponname.text, self GetItemDisplayString(undefined, undefined, self GetCurrentWeapon())))
                self.weaponname SetElementText(self GetItemDisplayString(undefined, undefined, self GetCurrentWeapon()));
        }

        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Non-Valid Weapons                                                                                                                               
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

        else
        {
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Hide Weapon Name Hud                                                               
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            self.weaponname FadeOverTime(fadetime);
            self.weaponname.alpha = 0;
        }
        
        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ If Has Equipment                                                                                                                               
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

        if (IsAlive(self) && self GetWeaponsListEquipment().size > 0)
        {
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Create Equipment Icon Hud                                                              
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (!IsDefined(self.equipmenticon[0]) && self GetModWeaponStock(self GetWeaponsListEquipment()[0]) > 0)
            {
                for (i = 0; i < self GetModWeaponStock(self GetWeaponsListEquipment()[0]); i ++)
                {
                    self.equipmenticon[i] = CreateShader(GetEquipmentShader(self GetWeaponsListEquipment()[0]), "center", "center", "user_right", "user_bottom", (-50 - (20 * i)), -110, 20, 20, undefined, 0, true, false, 0);
                    self.equipmenticon[i] FadeOverTime(fadetime);
                    self.equipmenticon[i].alpha = 1;
                }
            }

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Update Equipment Icon Hud                                                             
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (self.equipmenticon[self.equipmenticon.size].shader != GetEquipmentShader(self GetWeaponsListEquipment()[0]))
            {
                foreach (shader in self.equipmenticon)
                    shader SetShader(GetEquipmentShader(self GetWeaponsListEquipment()[0]), 20, 20);
            }
            while (self.equipmenticon.size != self GetModWeaponStock(self GetWeaponsListEquipment()[0]))
            {
                if (self.equipmenticon.size < self GetModWeaponStock(self GetWeaponsListEquipment()[0]))
                    self.equipmenticon[self.equipmenticon.size] = CreateShader(GetEquipmentShader(self GetWeaponsListEquipment()[0]), "center", "center", "user_right", "user_bottom", (-50 - (20 * self.equipmenticon.size)), -110, 20, 20, undefined, self.menuopen ? 0 : 1, true, false, 0);
                if (self.equipmenticon.size > self GetModWeaponStock(self GetWeaponsListEquipment()[0]))
                {
                    self.equipmenticon[self.equipmenticon.size - 1] DestroyElement();
                    self.equipmenticon[self.equipmenticon.size - 1] = undefined;
                }
            }
        }
        
        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ If Doesnt Have Equipment                                                                                                                               
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

        else
        {
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Destroy Equipment Hud                                                           
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (IsDefined(self.equipmenticon[0]))
            {
                foreach (shader in self.equipmenticon)
                {
                    shader DestroyElement();
                    shader = undefined;
                } 
            }  
        }
        
        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Valid Ammo Type                                                                                                                               
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

        if (self GetCurrentWeapon() != "riotshield_mp" && self GetCurrentWeapon() != "knife_held_mp" && self GetCurrentWeapon() != "knife_mp" && self GetCurrentWeapon() != "none")
        {
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Create Ammo Hud                                                          
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (!IsDefined(self.ammodualclipvalue) && IsWeaponDualWield(self GetCurrentWeapon()))
            {
                self.ammodualclipvalue = CreateText(undefined, "bigfixed", 1.5, "center", "center", "user_right", "user_bottom", -120, -80, undefined, 0, (0.5, 0, 0), 0.5, true, false, 1);
                self.ammodualclipvalue SetValue(self GetModWeaponDualClip(self GetCurrentWeapon()));
                self.ammodualclipvalue.archived = false;
                self.ammodualclipvalue.alignx = "right";
            }
            if (!IsDefined(self.ammoclipvalue))
            {
                self.ammoclipvalue = CreateText(undefined, "bigfixed", 1.5, "center", "center", "user_right", "user_bottom", -80, -80, undefined, 0, (0.5, 0, 0), 0.5, true, false, 1);
                self.ammoclipvalue SetValue(self GetModWeaponClip(self GetCurrentWeapon()));
                self.ammoclipvalue.archived = false;
                self.ammoclipvalue.alignx = "right";
            }
            if (!IsDefined(self.ammostockvalue))
            {
                self.ammostockvalue = CreateText(undefined, "bigfixed", 1, "center", "center", "user_right", "user_bottom", -70, -80, undefined, 0, (0.5, 0, 0), 0.5, true, false, 1);
                self.ammostockvalue SetValue(self GetModWeaponStock(self GetCurrentWeapon()));
                self.ammostockvalue.archived = false;
                self.ammostockvalue.alignx = "left";
            }

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Show Ammo Hud                                                          
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (self.ammodualclipvalue.alpha == 0 && IsWeaponDualWield(self GetCurrentWeapon()))
            {
                self.ammodualclipvalue FadeOverTime(fadetime);
                self.ammodualclipvalue.alpha = 1;
            }
            if (self.ammoclipvalue.alpha == 0)
            {
                self.ammoclipvalue FadeOverTime(fadetime);
                self.ammoclipvalue.alpha = 1;
            }
            if (self.ammostockvalue.alpha == 0)
            {
                self.ammostockvalue FadeOverTime(fadetime);
                self.ammostockvalue.alpha = 1;
            }

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Hide Dual Wield Ammo Hud                                                        
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (IsDefined(self.ammodualclipvalue) && self.ammodualclipvalue.alpha == 1 && !IsWeaponDualWield(self GetCurrentWeapon()))
            {
                self.ammodualclipvalue FadeOverTime(fadetime);
                self.ammodualclipvalue.alpha = 0;
            }

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Dual Wield Low Ammo Indicator                                                        
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (self GetModWeaponDualClip(self GetCurrentWeapon()) <= RoundOffFloat(((self GetModWeaponClipSize(self GetCurrentWeapon()) / 100) * 32)))
                self.ammodualclipvalue.color = (1, 0, 0);
            else
                self.ammodualclipvalue.color = (1, 1, 1);

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Low Ammo Indicator                                                       
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (self GetModWeaponClip(self GetCurrentWeapon()) <= RoundOffFloat(((self GetModWeaponClipSize(self GetCurrentWeapon()) / 100) * 32)))
                self.ammoclipvalue.color = (1, 0, 0);
            else
                self.ammoclipvalue.color = (1, 1, 1);

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Update Ammo Hud Values                                                      
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (IsWeaponDualWield(self GetCurrentWeapon()))
                self.ammodualclipvalue SetValue(self GetModWeaponDualClip(self GetCurrentWeapon()));
                
            self.ammoclipvalue SetValue(self GetModWeaponClip(self GetCurrentWeapon()));
            self.ammostockvalue SetValue(self GetModWeaponStock(self GetCurrentWeapon()));
        }

        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Non-Valid Ammo Type                                                                                                                               
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

        else
        {
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Hide Ammo Hud                                                     
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            self.ammodualclipvalue FadeOverTime(fadetime);
            self.ammodualclipvalue.alpha = 0;
            self.ammoclipvalue FadeOverTime(fadetime);
            self.ammoclipvalue.alpha = 0;
            self.ammostockvalue FadeOverTime(fadetime);
            self.ammostockvalue.alpha = 0;
        }
    }
    else
    {
        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Destroy Huds                                                                                                                             
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

        self.weaponname FadeOverTime(fadetime);
        self.weaponname.alpha = 0;
        self.ammodualclipvalue FadeOverTime(fadetime);
        self.ammodualclipvalue.alpha = 0;
        self.ammoclipvalue FadeOverTime(fadetime);
        self.ammoclipvalue.alpha = 0;
        self.ammostockvalue FadeOverTime(fadetime);
        self.ammostockvalue.alpha = 0;
        
        foreach (shader in self.equipmenticon)
        {
            shader FadeOverTime(fadetime);
            shader.alpha = 0;
        }
        
        wait fadetime;
        self.weaponname DestroyElement();
        self.ammodualclipvalue DestroyElement();
        self.ammoclipvalue DestroyElement();
        self.ammostockvalue DestroyElement();
                
        foreach (shader in self.equipmenticon)
        {
            shader DestroyElement();
            shader = undefined;
        }
    }
}

FixHudDisturbance(damagetype)
{
    self Notify("end_fix_hud_disturbance");
    self Endon("end_fix_hud_disturbance");
    self Endon("disconnect");
    self Endon("game_ended");
    
    if (damagetype == "MOD_GRENADE_SPLASH" || damagetype == "MOD_GAS")
    {
        while (self GetClientFieldToPlayer("tazered") == 0)
            wait 0.05;
        
        while (self GetClientFieldToPlayer("tazered") == 1)
            wait 0.05;

        self SetClientUIVisibilityFlag("hud_visible", false);
    }
}


NotifyMessage(title, subtitle, color, glowcolor, glowalpha)
{
    self Notify("end_notify_message");
    self Endon("end_notify_message");
    self Endon("disconnect");
    self Endon("game_ended");
    
    if (!level.gameended)
    {
        if (IsDefined(self.notifymessagetitle) || IsDefined(self.notifymessagesubtitle))
        {
            self.notifymessagetitle FadeOverTime(0.2);
            self.notifymessagetitle.alpha = 0;
            self.notifymessagesubtitle FadeOverTime(0.2);
            self.notifymessagesubtitle.alpha = 0;
            wait 0.2;
            self.notifymessagetitle DestroyElement();
            self.notifymessagesubtitle DestroyElement();
        }
        
        self.notifymessagetitle = CreateText(title, "bigfixed", 1.4, "center", "center", "user_center", "user_top", 0, 60, color, 0, glowcolor, glowalpha, false, false, 9998);
        self.notifymessagetitle FadeOverTime(1);
        self.notifymessagetitle.alpha = 1;
        self.notifymessagesubtitle = CreateText(subtitle, "small", 1.4, "center", "center", "user_center", "user_top", 0, 85, color, 0, glowcolor, glowalpha, false, false, 9998);
        self.notifymessagesubtitle FadeOverTime(1);
        self.notifymessagesubtitle.alpha = 1;
        wait 3;
        self.notifymessagetitle FadeOverTime(1);
        self.notifymessagetitle.alpha = 0;
        self.notifymessagesubtitle FadeOverTime(1);
        self.notifymessagesubtitle.alpha = 0;
        wait 1;
        self.notifymessagetitle DestroyElement();
        self.notifymessagesubtitle DestroyElement();
    }
}

SetSpawnPoint(origin, angles)
{
    if (!IsDefined(self.tacticalinsertion))
    {
        self.tacticalinsertion = Spawn("script_origin", origin);
        self.tacticalinsertion.angles = angles;
        self.tacticalinsertion.owner = self;
        self.tacticalinsertion.team = self.team;
        self.tacticalinsertion SetOwner(self);
        self.tacticalinsertion SetTeam(self.team);
    }
}

EndScorestreaks()
{
    self.usingsupport = undefined;
    
    if (IsDefined(self.rcbomb))
    {
        watcher = maps\mp\gametypes\_weaponobjects::GetWeaponObjectWatcher("rcbomb");
        watcher thread maps\mp\gametypes\_weaponobjects::WaitAndDetonate(self.rcbomb , 0);
        self thread maps\mp\gametypes\_hud::FadeToBlackForXSec(GetDvarFloat(#"CDE26736"), GetDvarFloat(#"AFCAD5CD"), GetDvarFloat(#"88490433"), GetDvarFloat(#"A925AA4E"));
    }
    
    foreach (remotemissile in GetEntArray("remote_missile", "targetname"))
    {
        if (remotemissile.owner == self)
        {
            self maps\mp\killstreaks\_remotemissile::Missile_End_Sounds(remotemissile, remotemissile.snd_first, remotemissile.snd_third);
            self maps\mp\killstreaks\_remotemissile::Player_Missile_End(remotemissile, 1, 1);
            remotemissile Delete();
            self Notify("Remotemissle_killstreak_done");
        }
    }
    
    foreach (warthog in GetEntArray("straferun", "targetname"))
    {
        if (warthog.owner == self)
        {
            warthog.leavenexttime = 1;
            warthog maps\mp\killstreaks\_straferun::StopStrafe();
        }
    }
}

SetStat(stat, value)
{
    //if (stat == "rank")
    //self SetDStat("PlayerStatsByGameType", "hconeflag", "win_streak", "StatValue", value);
    if (stat == "longest_time_survived")
        self SetDStat("combatTrainingWins", value);
    //if (stat == "career_human_kills")
    //self SetDStat("PlayerStatsByGameType", "hconeflag", "kill_streak", "StatValue", value);
    //if (stat == "career_zombie_kills")
    //self SetDStat("PlayerStatsByGameType", "hconeflag", "score", "StatValue", value);
}

GetStat(stat)
{
    if (stat == "rank")
        return self GetDStat("PlayerStatsByGameType", "hconeflag", "win_streak", "StatValue");
    if (stat == "longest_time_survived")
        return self GetDStat("combatTrainingWins");
    if (stat == "career_human_kills")
        return self GetDStat("PlayerStatsByGameType", "hconeflag", "kill_streak", "StatValue");
    if (stat == "career_zombie_kills")
        return self GetDStat("PlayerStatsByGameType", "hconeflag", "score", "StatValue");
    
    return 0;
}

ZombieSpawnPoint()
{
    self Endon("disconnect");
    self Endon("game_ended");
    
    if (IsDefined(level.infectedplayer[GetAbbreviatedPlayerName(self)]) && !IsDefined(self.tacticalinsertion) && level.players.size > 1 && !IsDefined(self.changingtohuman))
    {
        while (!IsDefined(target))
        {
            randomplayer = Random(level.players);
            
            if (IsAlive(randomplayer) && randomplayer.status == "Human" && IsDefined(randomplayer.gameready))
                target = randomplayer;
            
            wait 0.01;
        }
        
        zombiespawns = ArraySort(level.spawnpoints, target GetOrigin(), true, 6);
        randomzombiespawn = Random(zombiespawns);
        self SetSpawnPoint(randomzombiespawn GetOrigin(), randomzombiespawn.angles);
    }
}

BotZombiePathing()
{
    self Endon("disconnect");
    self Endon("game_ended");
    
    SetDvar("bot_MinDeathTime", "0");
    SetDvar("bot_MaxDeathTime", "0");
    SetDvar("bot_MinFireTime", "100");
    SetDvar("bot_MaxFireTime", "250");
    SetDvar("bot_PitchUp", "-5");
    SetDvar("bot_PitchDown", "10");
    SetDvar("bot_Fov", "360");
    SetDvar("bot_MinAdsTime", "3000");
    SetDvar("bot_MaxAdsTime", "5000");
    SetDvar("bot_MinCrouchTime", "0");
    SetDvar("bot_MaxCrouchTime", "0");
    SetDvar("bot_TargetLeadBias", "0");
    SetDvar("bot_MinReactionTime", "0");
    SetDvar("bot_MaxReactionTime", "0");
    SetDvar("bot_StrafeChance", "1");
    SetDvar("bot_MinStrafeTime", "3000");
    SetDvar("bot_MaxStrafeTime", "6000");
    SetDvar("scr_help_dist", "0");
    SetDvar("bot_AllowGrenades", "1");
    SetDvar("bot_MinGrenadeTime", "1500");
    SetDvar("bot_MaxGrenadeTime", "4000");
    SetDvar("bot_MeleeDist", "140");
    SetDvar("bot_YawSpeed", "4");
    SetDvar("bot_SprintDistance", "256");

    while (self.status == "Zombie")
    {
        if (!IsDefined(self.hassatellite) || !self.hassatellite)
            self.hassatellite = true;
        if (IsDefined(self.bot.ignore_entity))
            self.bot.ignore_entity = undefined;

        /*
        if (self HasGoal("enemy_patrol"))
        {
            trace = BulletTrace(self GetEye(), self GetEye() + (AnglesToForward(self GetPlayerAngles()) * 100), false, self);
            
            if (IsDefined(trace["entity"]) && IsDefined(trace["entity"].model) && IsDefined(trace["entity"].custom))
            {
                if (trace["entity"].model == "t6_wpn_supply_drop_trap" || trace["entity"].model == "t6_wpn_supply_drop_axis")
                {
                    self AllowAttack(true);
                    self PressAttackButton(1);
                }
            }
        }
        */
        wait 0.5;
    }
}

ZombieTypeRefund()
{
    if (IsDefined(self.zombietype))
    {
        if (self.zombietype == "Riot")
            self.points += level.priceriotzombie;
        if (self.zombietype == "Crawler")
            self.points += level.pricecrawlerzombie;
        if (self.zombietype == "Electric")
            self.points += level.priceelectriczombie;
        if (self.zombietype == "Napalm")
            self.points += level.pricenapalmzombie;
        if (self.zombietype == "Cyborg")
            self.points += level.pricecyborgzombie;
        if (self.zombietype == "Mist")
            self.points += level.pricemistzombie;
        if (self.zombietype == "Summoner")
            self.points += level.pricesummonerzombie;
        if (self.zombietype == "Juggernaut")
            self.points += level.pricejuggernautzombie;
        if (self.zombietype == "Goliath")
            self.points += level.pricegoliathzombie;
    }
}

UpdateModWeaponsHud(fadetime)
{
    self Notify("update_weapons_hud");
    self Endon("update_weapons_hud");
    self Endon("disconnect");
    self Endon("game_ended");
    
    if (!IsDefined(self.menuopening) && !self.menuopen)
    {
        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Valid Weapons                                                                                                                               
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

        if (IsAlive(self) && self GetCurrentWeapon() != "none" && !IsWeaponEquipment(self GetCurrentWeapon()))
        {  
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Create Weapon Name Hud                                                               
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (!IsDefined(self.weaponname))
            {
                self.weaponname = CreateText(self GetItemDisplayString(undefined, undefined, self GetCurrentWeapon()), "objective", 1.5, "center", "center", "user_right", "user_bottom", -50, -53, undefined, 0, undefined, undefined, true, false, 1);
                self.weaponname.archived = false;
                self.weaponname.alignx = "right";
            }

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Show Weapon Name Hud                                                              
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (self.weaponname.alpha == 0)
            {
                self.weaponname FadeOverTime(fadetime);
                self.weaponname.alpha = 1;
            }

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Update Weapon Name Hud                                                              
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (!IsSubStr(self.weaponname.text, self GetItemDisplayString(undefined, undefined, self GetCurrentWeapon())))
                self.weaponname SetElementText(self GetItemDisplayString(undefined, undefined, self GetCurrentWeapon()));
        }

        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Non-Valid Weapons                                                                                                                               
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

        else
        {
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Hide Weapon Name Hud                                                               
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            self.weaponname FadeOverTime(fadetime);
            self.weaponname.alpha = 0;
        }
        
        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ If Has Equipment                                                                                                                               
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

        if (IsAlive(self) && self GetWeaponsListEquipment().size > 0)
        {
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Create Equipment Icon Hud                                                              
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (!IsDefined(self.equipmenticon[0]) && self GetModWeaponStock(self GetWeaponsListEquipment()[0]) > 0)
            {
                for (i = 0; i < self GetModWeaponStock(self GetWeaponsListEquipment()[0]); i ++)
                {
                    self.equipmenticon[i] = CreateShader(GetEquipmentShader(self GetWeaponsListEquipment()[0]), "center", "center", "user_right", "user_bottom", (-50 - (20 * i)), -110, 20, 20, undefined, 0, true, false, 0);
                    self.equipmenticon[i] FadeOverTime(fadetime);
                    self.equipmenticon[i].alpha = 1;
                }
            }

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Update Equipment Icon Hud                                                             
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (self.equipmenticon[self.equipmenticon.size].shader != GetEquipmentShader(self GetWeaponsListEquipment()[0]))
            {
                foreach (shader in self.equipmenticon)
                    shader SetShader(GetEquipmentShader(self GetWeaponsListEquipment()[0]), 20, 20);
            }
            while (self.equipmenticon.size != self GetModWeaponStock(self GetWeaponsListEquipment()[0]))
            {
                if (self.equipmenticon.size < self GetModWeaponStock(self GetWeaponsListEquipment()[0]))
                    self.equipmenticon[self.equipmenticon.size] = CreateShader(GetEquipmentShader(self GetWeaponsListEquipment()[0]), "center", "center", "user_right", "user_bottom", (-50 - (20 * self.equipmenticon.size)), -110, 20, 20, undefined, self.menuopen ? 0 : 1, true, false, 0);
                if (self.equipmenticon.size > self GetModWeaponStock(self GetWeaponsListEquipment()[0]))
                {
                    self.equipmenticon[self.equipmenticon.size - 1] DestroyElement();
                    self.equipmenticon[self.equipmenticon.size - 1] = undefined;
                }
            }
        }
        
        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ If Doesnt Have Equipment                                                                                                                               
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

        else
        {
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Destroy Equipment Hud                                                           
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (IsDefined(self.equipmenticon[0]))
            {
                foreach (shader in self.equipmenticon)
                {
                    shader DestroyElement();
                    shader = undefined;
                } 
            }  
        }
        
        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Valid Ammo Type                                                                                                                               
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

        if (self GetCurrentWeapon() != "riotshield_mp" && self GetCurrentWeapon() != "knife_held_mp" && self GetCurrentWeapon() != "knife_mp" && self GetCurrentWeapon() != "none")
        {
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Create Ammo Hud                                                          
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (!IsDefined(self.ammodualclipvalue) && IsWeaponDualWield(self GetCurrentWeapon()))
            {
                self.ammodualclipvalue = CreateText(undefined, "bigfixed", 1.5, "center", "center", "user_right", "user_bottom", -120, -80, undefined, 0, (0.5, 0, 0), 0.5, true, false, 1);
                self.ammodualclipvalue SetValue(self GetModWeaponDualClip(self GetCurrentWeapon()));
                self.ammodualclipvalue.archived = false;
                self.ammodualclipvalue.alignx = "right";
            }
            if (!IsDefined(self.ammoclipvalue))
            {
                self.ammoclipvalue = CreateText(undefined, "bigfixed", 1.5, "center", "center", "user_right", "user_bottom", -80, -80, undefined, 0, (0.5, 0, 0), 0.5, true, false, 1);
                self.ammoclipvalue SetValue(self GetModWeaponClip(self GetCurrentWeapon()));
                self.ammoclipvalue.archived = false;
                self.ammoclipvalue.alignx = "right";
            }
            if (!IsDefined(self.ammostockvalue))
            {
                self.ammostockvalue = CreateText(undefined, "bigfixed", 1, "center", "center", "user_right", "user_bottom", -70, -80, undefined, 0, (0.5, 0, 0), 0.5, true, false, 1);
                self.ammostockvalue SetValue(self GetModWeaponStock(self GetCurrentWeapon()));
                self.ammostockvalue.archived = false;
                self.ammostockvalue.alignx = "left";
            }

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Show Ammo Hud                                                          
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (self.ammodualclipvalue.alpha == 0 && IsWeaponDualWield(self GetCurrentWeapon()))
            {
                self.ammodualclipvalue FadeOverTime(fadetime);
                self.ammodualclipvalue.alpha = 1;
            }
            if (self.ammoclipvalue.alpha == 0)
            {
                self.ammoclipvalue FadeOverTime(fadetime);
                self.ammoclipvalue.alpha = 1;
            }
            if (self.ammostockvalue.alpha == 0)
            {
                self.ammostockvalue FadeOverTime(fadetime);
                self.ammostockvalue.alpha = 1;
            }

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Hide Dual Wield Ammo Hud                                                        
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (IsDefined(self.ammodualclipvalue) && self.ammodualclipvalue.alpha == 1 && !IsWeaponDualWield(self GetCurrentWeapon()))
            {
                self.ammodualclipvalue FadeOverTime(fadetime);
                self.ammodualclipvalue.alpha = 0;
            }

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Dual Wield Low Ammo Indicator                                                        
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (self GetModWeaponDualClip(self GetCurrentWeapon()) <= RoundOffFloat(((self GetModWeaponClipSize(self GetCurrentWeapon()) / 100) * 32)))
                self.ammodualclipvalue.color = (1, 0, 0);
            else
                self.ammodualclipvalue.color = (1, 1, 1);

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Low Ammo Indicator                                                       
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (self GetModWeaponClip(self GetCurrentWeapon()) <= RoundOffFloat(((self GetModWeaponClipSize(self GetCurrentWeapon()) / 100) * 32)))
                self.ammoclipvalue.color = (1, 0, 0);
            else
                self.ammoclipvalue.color = (1, 1, 1);

            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Update Ammo Hud Values                                                      
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            if (IsWeaponDualWield(self GetCurrentWeapon()))
                self.ammodualclipvalue SetValue(self GetModWeaponDualClip(self GetCurrentWeapon()));
                
            self.ammoclipvalue SetValue(self GetModWeaponClip(self GetCurrentWeapon()));
            self.ammostockvalue SetValue(self GetModWeaponStock(self GetCurrentWeapon()));
        }

        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Non-Valid Ammo Type                                                                                                                               
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

        else
        {
            //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
            //║ Hide Ammo Hud                                                     
            //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

            self.ammodualclipvalue FadeOverTime(fadetime);
            self.ammodualclipvalue.alpha = 0;
            self.ammoclipvalue FadeOverTime(fadetime);
            self.ammoclipvalue.alpha = 0;
            self.ammostockvalue FadeOverTime(fadetime);
            self.ammostockvalue.alpha = 0;
        }
    }
    else
    {
        //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
        //██ Destroy Huds                                                                                                                             
        //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

        self.weaponname FadeOverTime(fadetime);
        self.weaponname.alpha = 0;
        self.ammodualclipvalue FadeOverTime(fadetime);
        self.ammodualclipvalue.alpha = 0;
        self.ammoclipvalue FadeOverTime(fadetime);
        self.ammoclipvalue.alpha = 0;
        self.ammostockvalue FadeOverTime(fadetime);
        self.ammostockvalue.alpha = 0;
        
        foreach (shader in self.equipmenticon)
        {
            shader FadeOverTime(fadetime);
            shader.alpha = 0;
        }
        
        wait fadetime;
        self.weaponname DestroyElement();
        self.ammodualclipvalue DestroyElement();
        self.ammoclipvalue DestroyElement();
        self.ammostockvalue DestroyElement();
                
        foreach (shader in self.equipmenticon)
        {
            shader DestroyElement();
            shader = undefined;
        }
    }
}

GetModWeaponDualClip(weapon)
{
    return self GetWeaponAmmoClip(WeaponDualWieldWeaponName(weapon));
}

GetEquipmentShader(equipment)
{
    if (equipment == "frag_grenade_mp")
        return "hud_grenadeicon_256";
    if (equipment == "sticky_grenade_mp")   
        return "hud_icon_sticky_grenade_256";
    if (equipment == "bouncingbetty_mp")
        return "hud_bounce_betty_256";
    if (equipment == "satchel_charge_mp")   
        return "hud_icon_satchelcharge_256";
    if (equipment == "claymore_mp")     
        return "hud_icon_claymore_256"; 
    if (equipment == "concussion_grenade_mp")       
        return "hud_us_stungrenade_256";
    if (equipment == "sensor_grenade_mp")       
        return "hud_sensor_grenade_256";
    if (equipment == "emp_grenade_mp")  
        return "hud_empgrenade_256";
    if (equipment == "proximity_grenade_mp")    
        return "hud_proximitymine_256";
    if (equipment == "flash_grenade_mp")    
        return "hud_us_flashgrenade_256";
    if (equipment == "trophy_system_mp")
        return "hud_trophy_system_256";
    if (equipment == "hatchet_mp")
        return "hud_hatchet_256";
    if (equipment == "willy_pete_mp")
        return "hud_us_smokegrenade_256";
    if (equipment == "tactical_insertion_mp")
        return "hud_tact_insert_256";
}

GetWeaponsListEquipment()
{
    equipment = [];
    
    foreach (weapon in self GetWeaponsList())
    {
        if (IsWeaponEquipment(weapon))
            equipment[equipment.size] = weapon;
    }
    
    return equipment;
}

IsWeaponDualWield(weapon)
{
    if (IsSubStr(weapon, "_dw") || IsSubStr(weapon, "_lh"))
        return true;
    
    return false;
}

GetEquipmentDisplayName(equipment)
{
    if (equipment == "bouncingbetty_mp")
        return "Bouncing Betty";    
    if (equipment == "concussion_grenade_mp")
        return "Concussion";
    if (equipment == "emp_grenade_mp")
        return "EMP Grenade";
    if (equipment == "flash_grenade_mp")
        return "Flashbang";
        
    return GetWeaponDisplayName(equipment);
}

GetModWeaponStockSize(weapon)
{
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ SMAW                                                                         
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetWeaponStringID(weapon) == "smaw_mp")
        stocksize = 20;

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ RPG                                                                         
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetWeaponStringID(weapon) == "usrpg_mp")
        stocksize = 10;

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Ballistic Knife                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetWeaponStringID(weapon) == "knife_ballistic_mp")
        stocksize = 20;

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Crossbow                                                                         
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetWeaponStringID(weapon) == "crossbow_mp")
        stocksize = 30; 
    if (!IsDefined(stocksize) && !IsWeaponDualWield(weapon))
        stocksize = WeaponMaxAmmo(weapon);
    if (!IsDefined(stocksize) && IsWeaponDualWield(weapon))
        stocksize = WeaponMaxAmmo(weapon) + 16;   

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Upgraded Weapons                                                                         
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (IsDefined(self.inventory[GetWeaponStringID(weapon)].upgrade) && !IsSubStr(weapon, "gl_"))
        return stocksize * level.upgradedweaponstockmultiplier;
        
    return stocksize;
}

GetItemStockSize(item)    
{
    if (IsWeaponPrimary(item) || IsWeaponEquipment(item))
        return self GetModWeaponStockSize(item);
}

GetDefaultCurrentWeapon()
{
    return GetDefaultWeaponStringID(self GetCurrentWeapon());
}

GetDefaultWeaponStringID(weapon)
{
    if (IsSubStr(weapon, "gl_") || IsSubStr(weapon, "sf_"))
        return GetSubStr(weapon, 3, weapon.size);
    if (IsSubStr(weapon, "dualoptic_"))
        return GetSubStr(weapon, 10, weapon.size);
    
    return weapon;
}

GetWeaponCenterOrigin()
{
    if (IsDefined(self GetTagOrigin("tag_brass")))
        return (VectorAdd(self GetTagOrigin("tag_brass"), self GetOrigin()) / 2);
    if (IsDefined(self GetTagOrigin("tag_clip")))   
        return (VectorAdd(self GetTagOrigin("tag_clip"), self GetOrigin()) / 2);    
    if (IsDefined(self GetTagOrigin("tag_weapon"))) 
        return (VectorAdd(self GetTagOrigin("tag_weapon"), self GetOrigin()) / 2);  

    return self GetOrigin();
}

GetItemDescription(item)
{
    if (item == "Scavenger Pack")
        return "Gives Additional Ammo (5% Of Your Current Weapons Stock Size)";
    
    return "";
}    

GetModWeaponDamageOffset(rarity, weapon)
{
    damageoffset = 0;
    
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Pistols                                                                         
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════
    
    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ Five-seven
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "fiveseven_mp")
        damageoffset += 0;

    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ Tac-45
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "fnp45_mp")
        damageoffset += 0;
    
    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ B23R
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "beretta93r_mp")
        damageoffset += 0;

    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ Executioner
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "judge_mp")
        damageoffset += 0;
    
    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ KAP-40
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "kard_mp")
        damageoffset += 0;
        
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Submachine Guns                                                                        
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ MP7
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "mp7_mp")
        damageoffset += 0;

    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ PDW-57
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "pdw57_mp")
        damageoffset += 0;

    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ Vector-K10
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "vector_mp")
        damageoffset += 0;

    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ MSMC
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "insas_mp")
        damageoffset += 0;

    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ Chicom CQB
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "qcw05_mp")
        damageoffset += 0;

    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ Skorpion EVO
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "evoskorpion_mp")
        damageoffset += 0;

    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ Peacekeeper
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "peacekeeper_mp")
        damageoffset += 0;
        
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Assault Rifles                                                                       
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════
    
    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ MTAR
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "tar21_mp")
        damageoffset += 0;

    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ Type 25
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "type95_mp")
        damageoffset += 0;
    
    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ SWAT-556
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "sig556_mp")
        damageoffset += 0;

    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ FAL OSW
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "sa58_mp")
        damageoffset += 0;
    
    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ M27
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "hk416_mp")
        damageoffset += 0;
    
    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ SCAR-H
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "scar_mp")
        damageoffset += 0;
    
    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ SMR
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "saritch_mp")
        damageoffset += 0;
    
    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ M8A1
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "xm8_mp")
        damageoffset += 0;

    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ AN-94
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "an94_mp")
        damageoffset += 0;
        
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Shotguns                                                                        
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════
    
    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ R870 MCS
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "870mcs_mp")
        damageoffset += 0;
    
    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ S12
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "saiga12_mp")
        damageoffset += 0;
    
    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ KSG
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "ksg_mp")
        damageoffset += 0;
    
    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ M1216
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "srm1216_mp")
        damageoffset += 0;
        
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Lightmachine Guns                                                                        
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════
    
    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ Mk 48
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "mk48_mp")
        damageoffset += 0;
    
    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ QBB LSW
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "qbb95_mp")
        damageoffset += 0;
    
    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ LSAT
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "lsat_mp")
        damageoffset += 0;
    
    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ HAMR
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "hamr_mp")
        damageoffset += 0;
        
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Sniper Rifles                                                                        
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ SVU-AS
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "svu_mp")
        damageoffset += 0;
    
    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ DSR 50
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "dsr50_mp")
        damageoffset += 0;
    
    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ Ballista
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "ballista_mp")
        damageoffset += 0;
    
    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ XPR-50
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "as50_mp")
        damageoffset += 0;
        
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Launchers                                                                        
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════
        
    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ SMAW
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "smaw_mp")
        damageoffset -= 0;
    
    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ RPG
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "usrpg_mp")
        damageoffset += 0;
    
    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ War Machine
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "m32_wager_mp")
        damageoffset += 0;
        
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Specials                                                                        
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════
    
    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ Crossbow Bolt Impact
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "crossbow_mp")
        damageoffset += 0;

    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ Death Machine
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "minigun_wager_mp")
        damageoffset += 0;
        
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Equipment                                                                        
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════
    
    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ Grenade
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "frag_grenade_mp")
        damageoffset += 0;

    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ Semtex
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "sticky_grenade_mp")
        damageoffset += 0;

    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ Bouncing Betty
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "bouncingbetty_mp")
        damageoffset += 0;

    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ C4
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "satchel_charge_mp")
        damageoffset += 0;

    // ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    //┃ Claymore
    //┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    if (GetWeaponStringID(weapon) == "claymore_mp")
        damageoffset += 0;

    return damageoffset;
}

GetWeaponStringID(weapon)
{
    if (IsSubStr(weapon, "gl_") || IsSubStr(weapon, "sf_"))
        weapon = GetSubStr(weapon, 3, weapon.size);
    if (IsSubStr(weapon, "dualoptic_"))
        weapon = GetSubStr(weapon, 10, weapon.size);
    if (IsSubStr(weapon, "_dw") || IsSubStr(weapon, "_lh"))
        weapon = StrTok(weapon, "_")[0] + "_mp";
    if (IsSubStr(weapon, "+"))
        weapon = StrTok(weapon, "+")[0];
    
    return weapon;
}

GetModWeaponMinDamage(rarity, upgrade, weapon, damagetype)
{
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Combat Axe                                                                        
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetWeaponStringID(weapon) == "hatchet_mp")
        mindamage = 100;

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Crossbow Explosive Bolt                                                                      
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (weapon == "explosive_bolt_mp")
        mindamage = 100; 

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ General Damage                                                                     
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (!IsDefined(mindamage))
        mindamage = RoundOffFloat((GetWeaponMinDamage(GetWeaponStringID(weapon)) + GetModWeaponDamageOffset(rarity, weapon)));

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Impact Damage                                                                     
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (IsDefined(damagetype) && damagetype == "MOD_IMPACT" && weapon != "hatchet_mp")
        mindamage = 10;

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Headshot Damage                                                                     
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (IsDefined(damagetype) && damagetype == "MOD_HEAD_SHOT")
        mindamage += 10;

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Rarity Damage                                                                     
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (IsDefined(rarity) && !IsWeaponEquipment(weapon))
    {
        if (rarity == "Common")
            mindamage = RoundOffFloat((mindamage * level.commonweapondamagemultiplier));
        if (rarity == "Uncommon")
            mindamage = RoundOffFloat((mindamage * level.uncommonweapondamagemultiplier));
        if (rarity == "Rare")
            mindamage = RoundOffFloat((mindamage * level.rareweapondamagemultiplier));
        if (rarity == "Epic")
            mindamage = RoundOffFloat((mindamage * level.epicweapondamagemultiplier));
        if (rarity == "Legendary")
            mindamage = RoundOffFloat((mindamage * level.legendaryweapondamagemultiplier));
    }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Upgrade Damage                                                                     
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (IsDefined(upgrade))
        mindamage = RoundOffFloat((mindamage * level.upgradedweapondamagemultiplier));
       
    mindamage = RoundOffFloat((mindamage * level.damagemultiplier));

    return mindamage;
}
    
GetModWeaponMaxDamage(rarity, upgrade, weapon, damagetype)
{
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Combat Axe                                                                        
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetWeaponStringID(weapon) == "hatchet_mp")
        maxdamage = 100;

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Crossbow Explosive Bolt                                                                      
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (weapon == "explosive_bolt_mp")
        maxdamage = 100;

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ General Damage                                                                     
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════  

    if (!IsDefined(maxdamage))
        maxdamage = RoundOffFloat((GetWeaponMaxDamage(GetWeaponStringID(weapon)) + GetModWeaponDamageOffset(rarity, weapon)));

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Impact Damage                                                                     
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (IsDefined(damagetype) && damagetype == "MOD_IMPACT" && weapon != "hatchet_mp")
        maxdamage = 10;

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Headshot Damage                                                                     
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (IsDefined(damagetype) && damagetype == "MOD_HEAD_SHOT")
        maxdamage += 10;

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Rarity Damage                                                                     
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (IsDefined(rarity) && !IsWeaponEquipment(weapon))
    {
        if (rarity == "Common")
            maxdamage = RoundOffFloat((maxdamage * level.commonweapondamagemultiplier));
        if (rarity == "Uncommon")
            maxdamage = RoundOffFloat((maxdamage * level.uncommonweapondamagemultiplier));
        if (rarity == "Rare")
            maxdamage = RoundOffFloat((maxdamage * level.rareweapondamagemultiplier));
        if (rarity == "Epic")
            maxdamage = RoundOffFloat((maxdamage * level.epicweapondamagemultiplier));
        if (rarity == "Legendary")
            maxdamage = RoundOffFloat((maxdamage * level.legendaryweapondamagemultiplier));
    }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Upgrade Damage                                                                     
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (IsDefined(upgrade))
        maxdamage = RoundOffFloat((maxdamage * level.upgradedweapondamagemultiplier));
   
    maxdamage = RoundOffFloat((maxdamage * level.damagemultiplier));
    
    return maxdamage;
}

GetModWeaponBulletSpreadString(weapon)
{
    if (GetWeaponStringID(weapon) == "crossbow_mp" && IsSubStr(weapon, "stackfire"))
        return "x 3";
    if (GetWeaponStringID(weapon) == "judge_mp" || GetWeaponStringID(weapon) == "870mcs_mp" || GetWeaponStringID(weapon) == "saiga12_mp" || GetWeaponStringID(weapon) == "srm1216_mp")
        return "x 8";
    
    return "";
}

GetModWeaponBulletSpread(weapon)
{
    if (GetWeaponStringID(weapon) == "crossbow_mp" && IsSubStr(weapon, "stackfire"))
        return 3;
    if (GetWeaponStringID(weapon) == "judge_mp" || GetWeaponStringID(weapon) == "870mcs_mp" || GetWeaponStringID(weapon) == "saiga12_mp" || GetWeaponStringID(weapon) == "srm1216_mp")
        return 8;
    
    return 1;
}

GetModWeaponMaxDamageRange(weapon)
{
    if (!IsDefined(maxrange))
        maxrange = Int(Clamp(GetWeaponMinDamageRange(weapon), 0, 9999));

    return maxrange;
}

GetModWeaponMinDamageRange(weapon)
{
    if (!IsDefined(minrange))
        minrange = Int(Clamp(GetWeaponMaxDamageRange(weapon), 0, 9999));

    return minrange;
}

GetAttachmentDisplayName(attachment)
{
    if (attachment == "acog")
        return "ACOG Sight";
    if (attachment == "stalker")
        return "Adjustable Stock";
    if (attachment == "swayreduc")
        return "Ballistics CPU";
    if (attachment == "ir")
        return "Dual Band Scope";
    if (attachment == "dw")
        return "Dual Wield";
    if (attachment == "holo")   
        return "EOTech Sight";
    if (attachment == "extclip")
        return "Extended Clip";
    if (attachment == "dualclip")
        return "Fast Mag";
    if (attachment == "fmj")
        return "Full Metal Jacket";
    if (attachment == "grip")
        return "Fore Grip";
    if (attachment == "gl")
        return "Grenade Launcher";
    if (attachment == "dualoptic")
        return "Hybrid Optic";
    if (attachment == "is")
        return "Iron Sight";
    if (attachment == "steadyaim")
        return "Laser Sight";
    if (attachment == "extbarrel")
        return "Long Barrel";
    if (attachment == "mms")
        return "Millimeter Scanner";
    if (attachment == "fastads")
        return "Quickdraw Handle";
    if (attachment == "rf")
        return "Rapid Fire";
    if (attachment == "reflex")
        return "Reflex Sight";
    if (attachment == "sf")
        return "Select Fire";
    if (attachment == "silencer")
        return "Suppressor";
    if (attachment == "tacknife")
        return "Tactical Knife";
    if (attachment == "rangefinder")
        return "Target Finder";
    if (attachment == "stackfire")  
        return "Tri-Bolt";
    if (attachment == "vzoom")
        return "Variable Zoom";
}


GetItemDisplayString(rarity, upgrade, item, clip, stock, weaponinfo)
{
    if (IsDefined(self.inventory[GetWeaponStringID(item)].rarity))
        rarity = self.inventory[GetWeaponStringID(item)].rarity;
    if (IsDefined(self.inventory[GetWeaponStringID(item)].upgrade))
        upgrade = self.inventory[GetWeaponStringID(item)].upgrade;
    if (!IsWeaponPrimary(item) && !IsWeaponEquipment(item))
        itemname = item;
    if (IsWeaponEquipment(item))
        itemname = GetEquipmentDisplayName(item);
    if (IsWeaponPrimary(item))
        itemname = GetWeaponDisplayName(item);
    if (IsWeaponPrimary(item))
    {
        if (IsSubStr(item, "+"))
        {
            for (i = 1; i < StrTok(item, "+").size; i ++)
                itemname += " + " + GetAttachmentDisplayName((StrTok(item, "+")[i]));
        }
    }
    else
    {
        if (IsDefined(stock))
            itemname += " x" + stock;
    }
    if (IsDefined(rarity))
        itemname += "\nRarity: " + rarity;    
    if (!IsWeaponPrimary(item) && !IsWeaponEquipment(item))
        itemname += "\n" + GetItemDescription(item);
    if (IsDefined(upgrade))
        itemname += "\nUpgrade: " + upgrade;
    if (IsDefined(weaponinfo))
        itemname += "\nDamage: " + RoundOffFloat((GetModWeaponMinDamage(rarity, upgrade, item) / GetModWeaponBulletSpread(item))) + " - " + RoundOffFloat((GetModWeaponMaxDamage(rarity, upgrade, item) / GetModWeaponBulletSpread(item))) + " " + GetModWeaponBulletSpreadString(item) + "\nRange: " + (GetModWeaponMinDamageRange(item) / 100) + "m - " + (GetModWeaponMaxDamageRange(item) / 100) + "m";
        
    return itemname;
}  

CreateWaypoint(shader, origin, scale, color, alpha, entity, constantsize, visibility)
{
    if (visibility == "allplayers")
        createwaypoint = NewHudElem();
    if (visibility == "allies" || visibility == "axis")
         createwaypoint = NewTeamHudElem(visibility);
    if (IsPlayer(visibility))
        createwaypoint = NewClientHudElem(visibility); 
    
    createwaypoint SetShader(shader, scale, scale);
    createwaypoint SetWayPoint(constantsize);   
    createwaypoint.x = origin[0];
    createwaypoint.y = origin[1];
    createwaypoint.z = origin[2];
    
    if (IsDefined(color))
        createwaypoint.color = color;
        
    createwaypoint.alpha = alpha;
    
    if (IsDefined(entity))
        createwaypoint SetTargetEnt(entity);
        
    createwaypoint.archived = false;

    return createwaypoint;
}

IsClosestItem(item)
{
    if (IsSubStr(item.model, "t6_wpn"))
        itemorigin = item GetWeaponCenterOrigin();
    else
        itemorigin = item GetOrigin();
    
    foreach (item in level.itementity)
    {
        if(IsSubStr(item.model, "t6_wpn"))
        {
            if (Distance(self GetOrigin(), itemorigin) > Distance(self GetOrigin(), item GetWeaponCenterOrigin()))
                return false;
        }
        else
        {
            if (Distance(self GetOrigin(), itemorigin) > Distance(self GetOrigin(), item GetOrigin()))
                return false;
        }
    }
    
    return true;
} 

WorldToScreenScaler(player, location, mindistance, maxdistance, minsize, maxsize)
{
    distance = Int(Distance(location, player GetPlayerCameraPos()));
    scale = RemapRange(distance, mindistance, maxdistance, minsize, maxsize);
    return scale;
}

WorldToScreen(player, location)
{
    resolution = (1280, 720, 0);
    screencenter = ((resolution[0] / 2), (resolution[1] / 2), 0);
    position = VectorSubtract(location, player GetPlayerCameraPos());
    playerangles = player GetPlayerAngles();
    transform = (VectorDot(position, AnglesToRight(playerangles)), VectorDot(position, AnglesToUp(playerangles)), VectorDot(position, AnglesToForward(playerangles)));
 
    if (transform[2] < 0.01)
        return (9999, 9999, 0);
    if (!IsDefined(player.fov))
        fovx = 65;
    else
        fovx = player.fov;
    if (player AdsButtonPressed() && player GetCurrentWeapon() != "knife_held_mp" && player GetCurrentWeapon() != "none")
        fovx -= 10;

    fovy = Atan((Tan(fovx / 2) * (resolution[1] / resolution[0]))) * 2;
    fovx = Tan((fovx / 2));
    fovy = Tan((fovy / 2));
    screenx = (((screencenter[0] * (1 - ((transform[0] / fovx) / transform[2]))) - screencenter[0]) / 2) * -1;
    screeny = ((screencenter[1] * (1 - ((transform[1] / fovy) / transform[2]))) - screencenter[1]) / 2;

    return (screenx, screeny, 0);
}

SetTextWaypoint(location, mindistance, maxdistance, minsize, maxsize, constantsize, element)
{
    previousorigin = self GetPlayerCameraPos();
    previousangles = self GetPlayerAngles();
            
    while (IsDefined(element))
    {
        screenposition = WorldToScreen(self, location);
        fontscale = WorldToScreenScaler(self, location, mindistance, maxdistance, minsize, maxsize);

        if (element.x != screenposition[0] || element.y != screenposition[1])
        {
            element MoveOverTime(0.01);
            element.x = screenposition[0];
            element.y = screenposition[1];
        }
        if (!constantsize && element.fontscale != fontscale)
        {
            element ChangeFontScaleOverTime(0.01);
            element.fontscale = fontscale;
        }
        if (IsDefined(self.thirdperson) && element.alpha != 0)
            element.alpha = 0;
        if (!IsDefined(self.thirdperson) && element.alpha == 0)
            element.alpha = 1;
        
        previousorigin = self GetPlayerCameraPos();
        previousangles = self GetPlayerAngles();
        
        wait 0.01;
    } 
}

SpawnItem(rarity, upgrade, item, clip, stock, camo, reticle, origin)
{
    level Endon("game_ended");
  
    //Unique Item Number
    if (!IsDefined(level.uniqueitemnumber))
        level.uniqueitemnumber = 0;
    else
        level.uniqueitemnumber ++;
        
    itemnumber = level.uniqueitemnumber;

    //Item Models
    if (item == "Scavenger Pack")
    {
        itemmodel = "p_glo_scavenger_pack";
        itemangles = (0, RandomIntRange(-180, 180), 90);
        itemrunover = true;
    }
    if (IsWeaponPrimary(item) || IsWeaponEquipment(item))
    {
        itemmodel = GetWeaponModel(item);
        itemangles = (0, RandomIntRange(-180, 180), 0);

        if (item == "bouncingbetty_mp" || item == "satchel_charge_mp")
            itemangles = (0, RandomIntRange(-180, 180), 30);
        if (item == "hatchet_mp")
            itemangles = (0, RandomIntRange(-180, 180), 0);
        if (item == "claymore_mp")
            itemangles = (90, 0, RandomIntRange(-180, 180));
    }
    if (IsWeaponDualWield(item)) 
        additionalentity1 = SpawnEntity("script_model", itemmodel, (origin + ((AnglesToBackward(itemangles) * 5) + (AnglesToLeft(itemangles) * 5))), itemangles);
    
    //Spawn Item
    level.itementity[itemnumber] = SpawnEntity("script_model", itemmodel, origin, itemangles);
    level.itementity[itemnumber] NotSolid();
    
    //Item Visibility
    if (IsDefined(clip) && IsPlayer(clip))
    {
        level.itementity[itemnumber] Hide();
        level.itementity[itemnumber] ShowToPlayer(clip);
    }
       
    //Item Offset Origin
    if (IsWeaponPrimary(item))
        level.itementity[itemnumber].origin = level.itementity[itemnumber] GetWeaponCenterOrigin();
    
    //Additional Entities Link
    if (IsDefined(additionalentity1))
    {
        level.itementity[itemnumber].additionalentity1 = additionalentity1;
        additionalentity1 LinkTo(level.itementity[itemnumber]);
    }
    
    //Item Spawn Animation
    fallposition = BulletTrace(level.itementity[itemnumber] GetOrigin(), (level.itementity[itemnumber] GetOrigin()[0], level.itementity[itemnumber] GetOrigin()[1], -10000), false, level.itementity[itemnumber])["position"];
    distance = Distance(level.itementity[itemnumber] GetOrigin(), fallposition);
    fallduration = (distance / 200);            
    level.itementity[itemnumber] MoveTo((fallposition + (0, 0, 40)), fallduration);
    wait fallduration;
    
    //Item Drop FX
    if (!IsWeaponPrimary(item) && !IsWeaponEquipment(item))
        level.itementity[itemnumber].itemdropfx = SpawnFX(level.consumabledropfx, fallposition);
    if (IsWeaponPrimary(item) || IsWeaponEquipment(item))
        level.itementity[itemnumber].itemdropfx = SpawnFX(level.weapondropfx, (level.itementity[itemnumber] GetWeaponCenterOrigin()[0], level.itementity[itemnumber] GetWeaponCenterOrigin()[1], fallposition[2]));
    if (IsDefined(level.itementity[itemnumber].itemdropfx))
        TriggerFX(level.itementity[itemnumber].itemdropfx);

    //Consumable/Equipment Text
    if (!IsWeaponPrimary(item))
        itemtext = GetItemDisplayString(rarity, undefined, item, undefined, stock, true);
    //Weapon Text
    if (IsWeaponPrimary(item))
        itemtext = GetItemDisplayString(rarity, upgrade, item, undefined, undefined, true);
        
    itemtext += "\n\n^3Press [{+usereload}] To Pickup";
    
    //World To Screen Item Text Background Shader
    if (Is_PC())
        itemdatilsboxshader = "menu_mp_popup";
    else
        itemdatilsboxshader = "white"; 

    wait 0.5;
    
    while (IsDefined(level.itementity[itemnumber]))
    {
        foreach (player in level.players)
        {
            if (IsAlive(player) && player.status == "Human" && !player Is_Bot() && !IsDefined(player.exchangingitems) && Distance((level.itementity[itemnumber] GetOrigin() + (0, 0, 28)), player GetPlayerCameraPos()) <= (level.itempickuprange * 100))
            {
                if (player IsClosestItem(level.itementity[itemnumber]) || IsDefined(itemrunover))
                {
                    if (!IsDefined(player.itemdetails) && player IsClosestItem(level.itementity[itemnumber]))
                    {
                        screenposition = WorldToScreen(player, (level.itementity[itemnumber] GetOrigin() + (0, 0, 28)));
                        player.itemdetails = player CreateText(itemtext, "objective", 1, "center", "center", "center", "center", screenposition[0], screenposition[1], undefined, 1, undefined, undefined, false, false, 0);
                        player thread SetTextWaypoint((level.itementity[itemnumber] GetOrigin() + (0, 0, 28)), 100, 0, 1, 3, false, player.itemdetails);
                        player.itemdetailsbox = player CreateWaypoint(itemdatilsboxshader, (level.itementity[itemnumber] GetOrigin() + (0, 0, 20)), 28, GetItemRarityColor(rarity), 0.5, undefined, false, player);
                        player.itemdetails.itemnumber = itemnumber;
                    }
                    else if (!player IsClosestItem(level.itementity[itemnumber]) && IsDefined(player.itemdetails) && player.itemdetails.itemnumber == itemnumber)
                    {
                        player.itemdetails DestroyElement();
                        player.itemdetailsbox DestroyElement();
                    }
                    if (player UseButtonPressed() || Distance((level.itementity[itemnumber] GetOrigin() + (0, 0, 28)), player GetPlayerCameraPos()) <= (level.itempickuprange * 100))
                    {
                        if (!player IsSwitchingWeapons() || IsDefined(itemrunover))
                        {
                            if (!player UseButtonPressed() && !IsDefined(itemrunover))
                                continue;
                            if (IsDefined(clip) && IsPlayer(clip) && player != clip)
                                continue;
                                
                            player.exchangingitems = true;
                            player thread GivePlayerItem(rarity, upgrade, item, clip, stock, camo, reticle, (fallposition + (0, 0, 80)));
                            owner = player;
                            
                            foreach (player in level.players)
                            {
                                if (IsDefined(player.itemdetails) && player.itemdetails.itemnumber == itemnumber)
                                {
                                    player.itemdetails DestroyElement();
                                    player.itemdetailsbox DestroyElement();
                                }   
                            }
                            
                            level.itementity[itemnumber] MoveTo(owner GetTagOrigin("j_mainroot"), 0.2);
                            wait 0.2;
                            DeleteItem(itemnumber);
                            owner.exchangingitems = undefined;
                            
                            break;
                        }
                    }
                }
                else if (IsDefined(player.itemdetails) && player.itemdetails.itemnumber == itemnumber)
                {
                    player.itemdetails DestroyElement();
                    player.itemdetailsbox DestroyElement();
                }
            }
            else if (IsDefined(player.itemdetails) && player.itemdetails.itemnumber == itemnumber)
            {
                player.itemdetails DestroyElement();
                player.itemdetailsbox DestroyElement();
            }
        }

        wait 0.05;
    }
    
    foreach (player in level.players)
    {
        if (IsDefined(player.itemdetails))
        {
            player.itemdetails DestroyElement();
            player.itemdetailsbox DestroyElement();
        }
    }
}

GetModWeaponStock(weapon)
{
    if (IsDefined(self.modweaponstock[GetWeaponStringID(weapon)]) && !IsSubStr(weapon, "gl_"))
        return self.modweaponstock[GetWeaponStringID(weapon)];
    if (IsSubStr(weapon, "gl_"))
        return self GetWeaponAmmoStock(weapon);

    return self GetWeaponAmmoStock(GetDefaultWeaponStringID(weapon));
}

GetWeaponFromInventory(weapon)
{
    weapon = GetWeaponStringID(weapon);

    foreach (inventoryweapon in self GetWeaponsList())
    {
        if (IsSubStr(inventoryweapon, EraseSubStr(weapon, "_mp", 0, 1)))
            return inventoryweapon;
    }
    
    return weapon;
}

TakePlayerItem(item, updatemenu)
{
    if (IsWeaponPrimary(item) || IsWeaponEquipment(item))
    {
        item = self GetWeaponFromInventory(item);
        self TakeModWeapon(item);
        itemid = GetWeaponStringID(item);
    }
    else
        itemid = item;

    self.inventory[itemid] = undefined;

    if (item == "knife_held_mp")
        self TakeWeapon("knife_mp");
    
    //Update Menu Options

    // if (IsDefined(updatemenu) && IsDefined(self.menu) && self.menuopen)
    // {
    //     if (self.menu.currentmenu == "Consumables" || self.menu.currentmenu == "Equipment" || self.menu.currentmenu == "Weapons"){
    //         self Submenu(self.menu.currentmenu);
    //     }    
    //     else if (IsSubStr(self.menu.currentmenu, item) || IsSubStr(self.menu.currentmenu, GetEquipmentDisplayName(item)) || IsSubStr(self.menu.currentmenu, GetWeaponDisplayName(item))){
    //         self Submenu(self.menu.previousmenu[self.menu.currentmenu]);
    //     }    
    // }
}

PlayerDropConsuamble(consumable, quantity, origin)
{
    rarity = self.inventory[consumable].rarity;
    
    //Drop All Consumables
    if (quantity >= self.inventory[consumable].quantity)
    {
        quantity = self.inventory[consumable].quantity;
        self TakePlayerItem(consumable);
        
        // //Update Menu Options/Back Out Of Menu
        // if (IsDefined(self.menu) && self.menuopen && IsSubStr(self.menu.currentmenu, consumable)) 
        //     self Submenu("Consumables");
    }

    //Drop Quantity Of Consumables
    else
    {
        self.inventory[consumable].quantity -= quantity;
        
        // //Update Menu Options/Back Out Of Menu
        // if (IsDefined(self.menu) && self.menuopen && IsSubStr(self.menu.currentmenu, consumable)) 
        //     self Submenu("Consumables");
    }
    //Drop Location
    if (!IsDefined(origin))
        origin = self GetOrigin() + ((AnglesToForward(self GetPlayerAngles())[0] * 50), (AnglesToForward(self GetPlayerAngles())[1] * 50), 100);
        
    level thread SpawnItem(rarity, undefined, consumable, undefined, quantity, undefined, undefined, origin);
}

HasWeaponDespiteAttachments(weapon)
{
    foreach (inventoryweapon in self GetWeaponsListPrimaries())
    {
        if (GetWeaponStringID(inventoryweapon) == GetWeaponStringID(weapon))
            return true;
    }
    
    return false;
}

PlayerDropWeapon(weapon, origin)
{
    weapon = self GetWeaponFromInventory(weapon);
    
    //Drop Location
    if (!IsDefined(origin))
        origin = self GetOrigin() + ((AnglesToForward(self GetPlayerAngles())[0] * 50), (AnglesToForward(self GetPlayerAngles())[1] * 50), 100);
    
    //Drop Weapon
    if (IsWeaponPrimary(weapon))
    {
        level thread SpawnItem(self.inventory[GetWeaponStringID(weapon)].rarity, self.inventory[GetWeaponStringID(weapon)].upgrade, weapon, self GetModWeaponClip(weapon), self GetModWeaponStock(weapon), self.inventory[GetWeaponStringID(weapon)].camo, self.inventory[GetWeaponStringID(weapon)].reticle, origin);
        self TakePlayerItem(weapon);
    }

    //Update Menu Option/Back Out Of Menu

    // if (IsDefined(self.menu) && self.menuopen && IsSubStr(self.menu.currentmenu, GetWeaponDisplayName(weapon)))
    //     checkSelfSubMenu("Weapons");
}

GershDeviceMonitor()
{
    self Endon("trophy_system_mp_removed");
    self Endon("death");
    self Endon("disconnect");
    
    while (IsAlive(self) && self HasWeapon("trophy_system_mp"))
    {
        self Waittill("grenade_fire", grenade, weaponid);
        
        if (weaponid == "trophy_system_mp")
            level thread GershDevicePullMonitor(self, grenade);
    }
}
    
GershDevicePullMonitor(owner, grenade)
{
    gershdevicelocation = owner GetOrigin();
                        
    while (gershdevicelocation != grenade GetOrigin())
    {
        gershdevicelocation = grenade GetOrigin();
        wait 0.05;
    }
    
    if (!IsDefined(level.gershdevicesactive))
        level.gershdevicesactive = 1;
    else
        level.gershdevicesactive ++;
    
    SetDvar("timescale", "0.5");
    blackhole = SpawnEntity("script_model", "t6_wpn_trophy_system_world", gershdevicelocation, grenade.angles);
    grenade Delete();
    blackhole thread GershDevicePortalMonitor();
    thread PlayLoopFX(level.afterburnerfx, blackhole GetOrigin() + (0, 0, -300), (90, 0, 0), 0.1, 4);
    
    for (i = 0; i < 4; i += 0.05)
    {
        foreach (player in level.players)
        {                       
            if (IsAlive(player) && player.status == "Zombie" && !IsDefined(player.gershpull) && !IsDefined(player.scorchinginferno) && !IsDefined(player.goliathzombie) && Distance(blackhole GetOrigin(), player GetOrigin()) <= 800)
                player thread GershDevicePlayerPullMonitor(blackhole, owner);
        }
        
        wait 0.05;
    }

    level.gershdevicesactive --;
    blackhole Delete();
    
    if (level.gershdevicesactive == 0)
        SetDvar("timescale", "1.0");
}

GershDevicePlayerPullMonitor(blackhole, owner)
{
    self Endon("disconnect");
    
    self.gershpull = Spawn("script_origin", self GetOrigin());
    self PlayerLinkTo(self.gershpull);
    
    while (IsAlive(self) && IsDefined(blackhole) && Distance(self GetOrigin(), blackhole GetOrigin()) > 30)
    {
        if (self IsSprinting())
            self.gershpull MoveTo(blackhole GetOrigin(), (Distance(self GetOrigin(), blackhole GetOrigin()) / 150));
        else    
            self.gershpull MoveTo(blackhole GetOrigin(), (Distance(self GetOrigin(), blackhole GetOrigin()) / 250));
            
        wait 0.1;
    }   

    self Unlink();

    if (IsAlive(self) && IsDefined(blackhole))
    {
        self DoDamage(1000000, blackhole GetOrigin(), owner, owner, "none", "MOD_BURNED", 0, "none");
        PlayFX(level.bloodfx, self GetTagOrigin("j_mainroot"));
    }

    self.gershpull Delete();
}

GershDevicePortalMonitor()
{
    while (IsDefined(self))
    {
        foreach (player in level.players)
        {
            if (IsAlive(player) && player.status == "Human" && Distance(self GetOrigin(), player GetOrigin()) < 30)
            {
                player SetOrigin(Random(level.spawnpoints) GetOrigin());
                thread PlayLoopFX(level.afterburnerfx, player GetOrigin() + (0, 0, -300), player GetPlayerAngles() + (90, 0, 0), 0.1, 2);
            }
        }
        
        wait 0.05;
    }
}

GetPackaPunchCamo(ability)
{
    if (ability == "Vanilla")
        return 39;
    if (ability == "Blast Furnace")
        return 12;
    if (ability == "Dead Wire") 
        return 44;
    if (ability == "Thunder Wall")
        return 10;
    if (ability == "Fireworks")
        return 22;
    if (ability == "Scorching Inferno") 
        return 32;
    if (ability == "Doomsday Devastation")
        return 45;
    if (ability == "Buzz Saw")
        return 26;
    if (ability == "Poseidons Wrath")
        return 34;
        
    return 0;
}

IsWeaponUpgradeSupported(weapon)
{
    if (!IsInArray(StrTok("m32_wager_mp,knife_held_mp,knife_mp,riotshield_mp,minigun_wager_mp,none", ","), GetWeaponStringID(weapon)))
        return true;
        
    return false;
}

PackaPunchBullets(weapon)
{
    self Endon(GetWeaponStringID(weapon) + "_removed");
    self Endon("death");
    self Endon("disconnect");
    
    while (self HasWeaponDespiteAttachments(weapon) && IsDefined(self.inventory[GetWeaponStringID(weapon)].upgrade))
    {
        self Waittill("weapon_fired", weaponfired);
        
        if (GetWeaponStringID(weaponfired) == GetWeaponStringID(weapon))
        {
            thread BulletFX(level.redlightfx, undefined, self GetEyeTraceOrigin(), 0.2, 0.05);
            
            if (IsSubStr(GetWeaponStringID(weapon), "fnp45"))
                MagicBullet("m32_wager_mp", self GetWeaponMuzzlePoint(), self GetEyeTraceOrigin(), self);
        }
        
        while (IsDefined(self.weaponinpackapunch) && self.weaponinpackapunch == GetWeaponStringID(weapon))
            wait 0.05;
    }
}

GivePlayerItem(rarity, upgrade, item, clip, stock, camo, reticle, swapitemorigin)
{
    //Defaults
    if (!IsDefined(self.inventory))
        self.inventory = [];
    if (!IsDefined(rarity))
        rarity = GetItemRarities(item)[0];
    if (!IsDefined(clip) && IsWeaponPrimary(item) && !IsDefined(upgrade))
        clip = self GetModWeaponClipSize(item);
    if (!IsDefined(stock) && !IsDefined(upgrade))
        stock = self GetItemStockSize(item);
    if (!IsDefined(camo))
        camo = 0;
    if (!IsDefined(reticle))
        reticle = 0;
    if (!IsDefined(swapitemorigin))
        swapitemorigin = self GetOrigin() + ((AnglesToForward(self GetPlayerAngles())[0] * 50), (AnglesToForward(self GetPlayerAngles())[1] * 50), 100);
    
    //Give Scavenger Pack Item
    if (item == "Scavenger Pack")
    {
        if (IsWeaponPrimary(self GetDefaultCurrentWeapon()))
        {
            amountofammo = Ceil((self GetModWeaponStockSize(self GetDefaultCurrentWeapon()) / 100) * 5);
            self SetModWeaponStock(self GetDefaultCurrentWeapon(), Int(self GetModWeaponStock(self GetDefaultCurrentWeapon()) + amountofammo));
        }
        
        self Notify("weapon_check");
        return;
    }

    //Consumable Swap Out Quantity Remainder
    if (!IsWeaponPrimary(item) && !IsWeaponEquipment(item) && IsDefined(self.inventory[item]) && (self.inventory[item].quantity + stock) > self GetItemStockSize(item))
    {
        if (self.inventory[item].quantity < self GetItemStockSize(item))
        {
            swapquantity = (self GetItemStockSize(item) - self.inventory[item].quantity);
            self.inventory[item].quantity += swapquantity;
            level thread SpawnItem(self.inventory[item].rarity, upgrade, item, undefined, (stock - swapquantity), undefined, undefined, swapitemorigin);
            
            // //Update Menu Options/Back Out Of Menu    
            // if (IsDefined(self.menu) && self.menuopen)
            // {
            //     if (self.menu.currentmenu == "Consumables" || IsSubStr(self.menu.currentmenu, item))
            //         self Submenu("Consumables");
            // }
            
            self Notify("weapon_check");
            return;
        }
        else
            self PlayerDropConsuamble(item, self.inventory[item].quantity, swapitemorigin);
    }

    //Equipment Swap Out Quantity Remainder
    if (IsWeaponEquipment(item) && IsDefined(self.inventory[item]) && (self GetModWeaponStock(item) + stock) > self GetItemStockSize(item))
    {
        if (self GetModWeaponStock(item) < GetModWeaponStockSize(item))
        {
            swapquantity = (self GetItemStockSize(item) - self GetModWeaponStock(item));
            self SetModWeaponStock(item, (self GetModWeaponStock(item) + swapquantity));
            level thread SpawnItem(self.inventory[item].rarity, upgrade, item, undefined, (stock - swapquantity), undefined, undefined, swapitemorigin);
            
            // //Update Menu Options/Back Out Of Menu    
            // if (IsDefined(self.menu) && self.menuopen)
            // {
            //     if (self.menu.currentmenu == "Equipment" || IsSubStr(self.menu.currentmenu, GetEquipmentDisplayName(item)))
            //         self Submenu("Equipment");
            // }
                
            self Notify("weapon_check"); 
            return;
        }
        else
            self PlayerDropEquipment(item, self GetModWeaponStock(item), swapitemorigin);
    }

    //Equipment Exchange (1 Equipment Type Limit)
    else if (IsWeaponEquipment(item))
    {
        foreach (inventoryitem in self.inventory)
        {
            if (IsWeaponEquipment(inventoryitem.itemid) && item != inventoryitem.itemid && self GetModWeaponStock(inventoryitem.itemid) > 0)
                self PlayerDropEquipment(inventoryitem.itemid, self GetModWeaponStock(inventoryitem.itemid), swapitemorigin);
            else if (IsWeaponEquipment(inventoryitem.itemid) && item != inventoryitem.itemid && self GetModWeaponStock(inventoryitem.itemid) <= 0)
                self TakePlayerItem(inventoryitem.itemid);
        }
    }

    //Weapon Exchange
    else if (IsWeaponPrimary(item) && self HasWeaponDespiteAttachments(item))
        self PlayerDropWeapon(self GetWeaponFromInventory(item), swapitemorigin);

    //Weapon/Equipment/Consumable Priority Swap Out
    else if (self.inventory.size >= self.inventoryitemlimit)
    {
        if (IsWeaponPrimary(self GetCurrentWeapon()))
            self PlayerDropWeapon(self GetCurrentWeapon(), swapitemorigin);
        else if (IsWeaponEquipment(self GetCurrentWeapon()))
            self PlayerDropEquipment(self GetCurrentWeapon(), self GetModWeaponStock(self GetCurrentWeapon()), swapitemorigin);
        else
        {
            randomconsumable = Random(self.inventory);
            self PlayerDropConsuamble(randomconsumable.itemid, randomconsumable.quantity, swapitemorigin);
        }
    }

    //Give Consumable Item
    if (!IsWeaponPrimary(item) && !IsWeaponEquipment(item))
    {
        if (!IsDefined(self.inventory[item]))
        {
            self.inventory[item] = SpawnStruct();
            self.inventory[item].itemid = item;
            self.inventory[item].rarity = rarity;
            self.inventory[item].quantity = stock;
        }
        else
            self.inventory[item].quantity += stock;
    }

    //Give Equipment Item
    if (IsWeaponEquipment(item))
    {
        if (!IsDefined(self.inventory[item]))
        {
            self GiveWeapon(item);
            self SetModWeaponStock(item, stock);
            self.inventory[item] = SpawnStruct();
            self.inventory[item].itemid = GetWeaponStringID(item);
            self.inventory[item].rarity = rarity;
            
            if (item == "trophy_system_mp")
                self thread GershDeviceMonitor();
        }
        else
            self SetModWeaponStock(item, (self GetModWeaponStock(item) + stock));
    }

    //Give Weapon Item
    if (IsWeaponPrimary(item))
    {
        if (IsDefined(upgrade))
            camo = GetPackaPunchCamo(upgrade);
            
        self GiveWeapon(item, 0, self CalcWeaponOptions(camo, 0, reticle, 0)); 
        self.inventory[GetWeaponStringID(item)] = SpawnStruct();
        self.inventory[GetWeaponStringID(item)].itemid = GetWeaponStringID(item);
        self.inventory[GetWeaponStringID(item)].rarity = rarity;
        self.inventory[GetWeaponStringID(item)].camo = camo;
        
        if (!IsInArray(StrTok("smaw_mp,usrpg_mp,m32_wager_mp,knife_held_mp,knife_ballistic_mp,riotshield_mp,crossbow_mp,minigun_wager_mp", ","), item))
            self.inventory[GetWeaponStringID(item)].reticle = reticle;
            
        if (IsDefined(upgrade) && IsWeaponUpgradeSupported(item))
        {
            self.inventory[GetWeaponStringID(item)].upgrade = upgrade;
            self thread PackaPunchBullets(item);
            self GivePackaPunchAbility(item, upgrade);
            
            if (!IsDefined(clip))
                clip = self GetModWeaponClipSize(item);
            if (!IsDefined(stock))
                stock = self GetModWeaponStockSize(item);
        }
        
        self SetModWeaponClip(item, clip);
        self SetModWeaponStock(item, stock);
        self SwitchToWeapon(item);
        
        if (item == "knife_held_mp")
            self GiveWeapon("knife_mp");
    }

    //Update Menu Options
    
    // if (IsDefined(self.menu) && self.menuopen)
    // {
    //     if (self.menu.currentmenu == "Consumables" || self.menu.currentmenu == "Equipment" || self.menu.currentmenu == "Weapons"){
    //         self Submenu(self.menu.currentmenu);
    //     }    
    //     else if (IsSubStr(self.menu.currentmenu, item) || IsSubStr(self.menu.currentmenu, GetEquipmentDisplayName(item))){
    //         self Submenu(self.menu.previousmenu[self.menu.currentmenu]);
    //     }    
    // }
        
    self Notify("weapon_check");
}

BlastFurnace(weapon)
{
    self Endon(GetWeaponStringID(weapon) + "_removed");
    self Endon("death");
    self Endon("disconnect");
    
    while (self HasWeaponDespiteAttachments(weapon) && self.inventory[GetWeaponStringID(weapon)].upgrade == "Blast Furnace")
    {
        self Waittill("weapon_hit", weaponid, target);
        
        if (IsSubStr(weaponid, GetWeaponStringID(weapon)) && self.inventory[GetWeaponStringID(weapon)].upgrade == "Blast Furnace")
        {
            thread BulletFX(level.firefx, level.firefx, target GetOrigin(), 0.2, 0.05);
            wait 0.2;

            foreach (player in level.players)
            {
                if (IsAlive(player) && player.status == "Zombie" && player.zombietype != "Napalm" && Distance(target GetOrigin(), player GetOrigin()) <= 300)
                    player thread DecayDamagePlayer(level.firefx, "j_head", target GetOrigin(), 7, 0.5, 50, self);
            }
            
            wait 5;
        }
    }
}

DeadWire(weapon)
{
    self Endon(GetWeaponStringID(weapon) + "_removed");
    self Endon("death");
    self Endon("disconnect");
    
    while (self HasWeaponDespiteAttachments(weapon) && self.inventory[GetWeaponStringID(weapon)].upgrade == "Dead Wire")
    {
        self Waittill("weapon_hit", weaponid, target);
        
        if (IsSubStr(weaponid, GetWeaponStringID(weapon)) && self.inventory[GetWeaponStringID(weapon)].upgrade == "Dead Wire")
        {
            thread BulletFX(level._effect["prox_grenade_player_shock"], level._effect["prox_grenade_player_shock"], target GetOrigin(), 0.2, 0.05);
            wait 0.2;
            
            foreach (player in level.players)
            {
                if (IsAlive(player) && player.status == "Zombie" && player.zombietype != "Electric" && Distance(target GetOrigin(), player GetOrigin()) <= 300)
                    player thread DecayDamagePlayer(level._effect["prox_grenade_player_shock"], "j_head", target GetOrigin(), 5, 0.3, 30, self);
            }
            
            wait 5;
        }
    }
}

ThunderWall(weapon)
{
    self Endon(GetWeaponStringID(weapon) + "_removed");
    self Endon("death");
    self Endon("disconnect");
    
    while (self HasWeaponDespiteAttachments(weapon) && self.inventory[GetWeaponStringID(weapon)].upgrade == "Thunder Wall")
    {
        self Waittill("weapon_hit", weaponid, target);
        
        if (IsSubStr(weaponid, GetWeaponStringID(weapon)) && self.inventory[GetWeaponStringID(weapon)].upgrade == "Thunder Wall" && Distance(self GetOrigin(), target GetOrigin()) <= 1000)
            ThunderWallMonitor(self, target);
    }
}

SpawnRagdoll(model, origin, angles, duration)
{
    if (!IsDefined(level.ragdoll))
        level.ragdoll = [];
    else if (level.ragdoll.size >= 18)
    {
        level.ragdoll[0] Delete();
        level.ragdoll = SortArray(level.ragdoll);
    }
    
    level.ragdoll[level.ragdoll.size] = SpawnEntity("script_model", model, origin, angles);
    level.ragdoll[level.ragdoll.size - 1] StartRagDoll(true);
    level.ragdoll[level.ragdoll.size - 1] thread RagdollDeathMonitor(duration);
    
    return level.ragdoll[level.ragdoll.size - 1];
}

RagdollDeathMonitor(duration)
{
    wait duration;
    level.amountofragdolls --;
    self Delete();
    // self = undefined;
}

ThunderWallMonitor(owner, target)
{
    Earthquake(1, 1, target GetOrigin(), 300);

    foreach (player in level.players)
    {
        if (IsAlive(player) && player.status == "Zombie" && !IsDefined(player.thunderwall[owner]) && Distance(owner GetOrigin(), player GetOrigin()) <= 1000 && player SightConeTrace(owner GetOrigin(), owner, AnglesToForward(owner.angles)) > 0.3)
        {
            if (player.health <= 800)
            {
                player.thunderwall[owner] = true;
                player Hide();
            }
                
            player DoDamage(800, player GetOrigin(), owner, owner, "none", "MOD_BURNED", 0, "none");

            if (!IsAlive(player))
            {
                foreach (corpse in GetCorpseArray())
                    corpse Delete();
                
                ragdoll = SpawnRagdoll(player.model, player GetOrigin(), player.angles, 3);
                ragdoll LaunchRagDoll(((AnglesToForward(owner GetPlayerAngles())[0] * RandomIntRange(100, 200)), (AnglesToForward(owner GetPlayerAngles())[1] * RandomIntRange(100, 200)), RandomIntRange(100, 200)));
                player.thunderwall[owner] = undefined;
            }
        }
    }
    
    wait 8;
}

Fireworks(weapon)
{
    self Endon(GetWeaponStringID(weapon) + "_removed");
    self Endon("death");
    self Endon("disconnect");

    while (self HasWeaponDespiteAttachments(weapon) && self.inventory[GetWeaponStringID(weapon)].upgrade == "Fireworks")
    {
        self Waittill("weapon_hit", weaponid, target);
        
        if (IsSubStr(weaponid, GetWeaponStringID(weapon)) && self.inventory[GetWeaponStringID(weapon)].upgrade == "Fireworks")
            FireworksMonitor(self, target, weapon);
    }
}

FireworksMonitor(owner, target, weapon)
{
    fireworksweapon = SpawnEntity("script_model", GetWeaponModel(weapon), target GetOrigin(), owner.angles);
    fireworksweapon MoveTo(target GetOrigin() + (0, 0, 60), 2);
    fireworksweapon thread FireworksWeaponHeatSeeking(target, owner);
    currentkills = owner.pers["kills"];
    duration = 300;
    
    for (i = 0; i < duration; i ++)
    {
        if (IsDefined(owner) && IsAlive(owner) && owner.status == "Human")
        {
            fireworksweapon RotateTo(fireworksweapon.angles + (0, 22.5, 0), 0.04);
            MagicBullet(weapon, fireworksweapon GetOrigin(), fireworksweapon GetOrigin() + (AnglesToForward(fireworksweapon.angles) * 10000000), owner);
            
            if (IsDefined(owner.doubletapii))
                MagicBullet(weapon, fireworksweapon GetOrigin(), fireworksweapon GetOrigin() + (AnglesToForward(fireworksweapon.angles) * 10000000), owner);
            if (currentkills != owner.pers["kills"])
            {
                currentkills = owner.pers["kills"];
                duration += 2;
            }
        }
        else
            break;
        
        wait 0.05;
    }
    
    fireworksweapon Delete();
    wait 7;
}

FireworksWeaponHeatSeeking(target, owner)
{
    owner Endon("death");
    owner Endon("disconnect");
    
    wait 2;
    
    while (IsDefined(self))
    {
        foreach (player in level.players)
        {
            if (IsAlive(player) && player.status == "Zombie" && Distance(self GetOrigin(), player GetOrigin()) <= 500 && Closer(self GetOrigin(), player GetOrigin(), target GetOrigin()))
                target = player;
        }
        
        if (IsAlive(target) && target.status == "Zombie" && Distance(self GetOrigin(), target GetOrigin()) <= 800)
            self MoveTo(target GetOrigin() + (0, 0, 60), Distance(self GetOrigin(), target GetOrigin()) / 200);
            
        wait 0.2;
    }
}

ScorchingInferno(weapon)
{
    self Endon(GetWeaponStringID(weapon) + "_removed");
    self Endon("death");
    self Endon("disconnect");
    
    while (self HasWeaponDespiteAttachments(weapon) && self.inventory[GetWeaponStringID(weapon)].upgrade == "Scorching Inferno")
    {
        self Waittill("weapon_hit", weaponid, target);
        
        if (IsSubStr(weaponid, GetWeaponStringID(weapon)) && self.inventory[GetWeaponStringID(weapon)].upgrade == "Scorching Inferno")
            ScorchingInfernoMonitor(self, target);
    }
}

ScorchingInfernoMonitor(owner, target)
{
    scorchinginferno = SpawnEntity("script_model", "tag_origin", target GetOrigin() + (0, 0, 30), undefined);
    scorchinginferno MoveTo(scorchinginferno GetOrigin() + (0, 0, 500), 10); 
    
    for (i = 0; i < 20; i ++)
    {
        foreach (player in level.players)
        {                       
            if (IsAlive(player) && player.status == "Zombie" && !IsDefined(player.scorchinginferno) && !IsDefined(player.gershpull) && player.zombietype != "Napalm" && player.zombietype != "Goliath" && Distance(scorchinginferno GetOrigin(), player GetOrigin()) <= 200)
                player thread ScorchingInfernoPlayerMonitor(scorchinginferno);
            if (IsAlive(player) && player.status == "Zombie" && player.zombietype != "Napalm" && Distance(scorchinginferno GetOrigin(), player GetOrigin()) <= 200)
                player DoDamage(25, scorchinginferno GetOrigin(), owner, owner, "none", "MOD_BURNED", 0, "none");
        }
        
        PlayFX(level.chopper_fx["explode"]["large"], scorchinginferno GetOrigin());
        PlaySoundAtPosition("wpn_rocket_explode_rock", scorchinginferno GetOrigin());
        wait 0.4;
    }
    
    scorchinginferno Delete();
    wait 7;
}

ScorchingInfernoPlayerMonitor(scorchinginferno)
{
    self Endon("death");
    self Endon("disconnect");
    
    startorigin = self GetOrigin();
    self.scorchinginferno = Spawn("script_origin", self GetOrigin());
    self PlayerLinkTo(self.scorchinginferno);
    self FreezeControls(true);
    randommovetime = RandomFloatRange(0.5, 1.5);
    self.scorchinginferno MoveTo(scorchinginferno GetOrigin(), randommovetime);
    wait randommovetime;
    i = 0;
    
    while (IsAlive(self) && IsDefined(scorchinginferno))
    {
        self.scorchinginferno MoveTo(scorchinginferno GetOrigin() + (Cos(i * 36) * 50, Sin(i * 36) * 50, i * 5), 0.2);
        self.scorchinginferno RotateTo(self.angles + (0, 10, 0), 0.2);
        i ++;
        wait 0.2;
    }
    
    if (IsAlive(self))
    {
        self.scorchinginferno MoveTo(startorigin, 0.5);
        wait 0.5;
    }
    
    self Unlink();
    self.scorchinginferno Delete();
    self FreezeControls(false);
}

DoomsdayDevastation(weapon)
{
    self Endon(GetWeaponStringID(weapon) + "_removed");
    self Endon("death");
    self Endon("disconnect");
    
    while (self HasWeaponDespiteAttachments(weapon) && self.inventory[GetWeaponStringID(weapon)].upgrade == "Doomsday Devastation")
    {
        self Waittill("weapon_hit", weaponid, target);
        
        if (IsSubStr(weaponid, GetWeaponStringID(weapon)) && self.inventory[GetWeaponStringID(weapon)].upgrade == "Doomsday Devastation")
        {
            for (i = 0; i < 20; i ++)
            {
                self MagicGrenadeType("sticky_grenade_mp", target GetOrigin() + (0, 0, 100), (0, 0, 0), 2);
                wait 0.1;
            }
            
            wait 7;
        }
    }
}

BuzzSaw(weapon)
{
    self Endon(GetWeaponStringID(weapon) + "_removed");
    self Endon("death");
    self Endon("disconnect");
    
    while (self HasWeaponDespiteAttachments(weapon) && self.inventory[GetWeaponStringID(weapon)].upgrade == "Buzz Saw")
    {
        self Waittill("weapon_hit", weaponid, target);
        
        if (IsSubStr(weaponid, GetWeaponStringID(weapon)) && self.inventory[GetWeaponStringID(weapon)].upgrade == "Buzz Saw")
            BuzzSawMonitor(self, target);
    }
}

BuzzSawMonitor(owner, target)
{
    startorigin = owner GetWeaponMuzzlePoint() + (AnglesToForward(owner GetPlayerAngles()) * 100);
    targetorigin = target GetTagOrigin("j_mainroot");
    angles = VectorToAngles(targetorigin - startorigin);
    distance = Distance(startorigin, targetorigin);
    buzzsaw = SpawnEntity("script_model", "vehicle_mi24p_hind_desert_d_piece02", startorigin, angles);
    buzzsaw MoveTo(targetorigin, (distance / 400));
    buzzsaw RotateYaw(((360 / 100) * distance), (distance / 400));
    
    while (IsDefined(owner) && IsAlive(owner) && owner.status == "Human" && buzzsaw GetOrigin() != targetorigin)
    {
        foreach (player in level.players)
        {
            if (IsAlive(player) && player.status == "Zombie" && !IsDefined(player.buzzsaw[owner]) && Distance(buzzsaw GetOrigin(), player GetOrigin()) <= 150 && player GetStance() != "prone")
            {
                player.buzzsaw[owner] = true;
                player DoDamage(400, player GetOrigin(), owner, owner, "none", "MOD_BURNED", 0, "none");
            }
        }
        
        wait 0.05;
    }
    
    foreach (player in level.players)
        player.buzzsaw[owner] = undefined;
        
    buzzsaw MoveTo(startorigin, (distance / 400));
    buzzsaw RotateYaw(((360 / 100) * distance), (distance / 400));
    
    while (IsDefined(owner) && IsAlive(owner) && owner.status == "Human" && buzzsaw GetOrigin() != startorigin)
    {
        foreach (player in level.players)
        {
            if (IsAlive(player) && player.status == "Zombie" && !IsDefined(player.buzzsaw[owner]) && Distance(buzzsaw GetOrigin(), player GetOrigin()) <= 150 && player GetStance() == "stand")
            {
                player.buzzsaw[owner] = true;
                player DoDamage(400, player GetOrigin(), owner, owner, "none", "MOD_BURNED", 0, "none");
            }
        }
        
        wait 0.05;
    }
    
    buzzsaw Delete();
    wait 3;
}

PoseidonsWrath(weapon)
{
    self Endon(GetWeaponStringID(weapon) + "_removed");
    self Endon("death");
    self Endon("disconnect");
    
    while (self HasWeaponDespiteAttachments(weapon) && self.inventory[GetWeaponStringID(weapon)].upgrade == "Poseidons Wrath")
    {
        self Waittill("weapon_hit", weaponid, target);
        
        if (IsSubStr(weaponid, GetWeaponStringID(weapon)) && self.inventory[GetWeaponStringID(weapon)].upgrade == "Poseidons Wrath")
            PoseidonsWrathMonitor(self, target);
    }
}
    
PoseidonsWrathMonitor(owner, target)
{
    foreach (player in level.players)
    {
        if (IsAlive(player) && player.status == "Zombie" && player.zombietype != "Goliath" && Distance(target GetOrigin(), player GetOrigin()) <= 300)
        {
            player.poseidonswraith[owner] = true;
            player SetMoveSpeedScale((player GetMoveSpeedScale() - 0.8));
            player thread PlayLoopFXOnPlayer(level.waterfx, 0, 0.5, 7);
        }
    }
    
    wait 7;
    
    foreach (player in level.players)
    {
        if (IsDefined(player.poseidonswraith[owner]))
            player SetMoveSpeedScale(player GetMoveSpeedScale() + 0.8);
            
        player.poseidonswraith[owner] = undefined;
    }
    
    wait 3;
}

GivePackaPunchAbility(weapon, ability)
{
    if (!IsDefined(ability))
        return;
    if (ability == "Blast Furnace")
        self thread BlastFurnace(weapon);
    if (ability == "Dead Wire") 
        self thread DeadWire(weapon);
    if (ability == "Thunder Wall")
        self thread ThunderWall(weapon);
    if (ability == "Fireworks")
        self thread Fireworks(weapon);
    if (ability == "Scorching Inferno") 
        self thread ScorchingInferno(weapon);
    if (ability == "Doomsday Devastation")
        self thread DoomsdayDevastation(weapon);
    if (ability == "Buzz Saw")
        self thread BuzzSaw(weapon);
    if (ability == "Poseidons Wrath")
        self thread PoseidonsWrath(weapon);
}

GetModWeaponClipSize(weapon)
{
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ SMAW                                                                         
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetWeaponStringID(weapon) == "smaw_mp")
        clipsize = 1;

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ RPG                                                                         
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetWeaponStringID(weapon) == "usrpg_mp")
        clipsize = 2;

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Ballistic Knife                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetWeaponStringID(weapon) == "knife_ballistic_mp")
        clipsize = 1;

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Crossbow                                                                         
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetWeaponStringID(weapon) == "crossbow_mp")
        clipsize = 5;
    if (!IsDefined(clipsize))
        clipsize = WeaponClipSize(weapon);

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Upgraded Weapons                                                                         
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (IsDefined(self.inventory[GetWeaponStringID(weapon)].upgrade) && !IsSubStr(weapon, "gl_") && !IsWeaponDualWield(weapon))
        return (clipsize + RoundOffFloat(((clipsize / 100) * level.upgradedweaponclippercentagemultiplier)));

    return clipsize;
}


GetItemRarities(item)
{
    //Grenade, Semtex, Combat Axe, Sensor Grenade, EMP Grenade
    if (item == "frag_grenade_mp" || item == "sticky_grenade_mp" || item == "hatchet_mp" || item == "concussion_grenade_mp" || item == "emp_grenade_mp")
        itemrarities = Array("Uncommon");
    //Bouncing Betty, C4, Claymore, Concussion, Shock Charge, Flashbang
    if (item == "bouncingbetty_mp" || item == "satchel_charge_mp" || item == "claymore_mp" || item == "concussion_grenade_mp" || item == "proximity_grenade_mp" || item == "flash_grenade_mp")
        itemrarities = Array("Rare");
    //Other
    if (!IsDefined(itemrarities))
        itemrarities = Array("Common", "Uncommon", "Rare", "Epic", "Legendary");
        
    return itemrarities;
}

CreateShader(shader, point, relative, horzalign, vertalign, x, y, width, height, color, alpha, hidewheninmenu, allplayers, sort)
{
	if (allplayers)
    	createshader = NewHudElem();
    else
        createshader = NewClientHudElem(self);  
        
	createshader.elemtype = "bar";
	createshader.children = [];
    createshader SetParent(level.uiparent); 
    createshader.type = "shader";
    createshader SetShader(shader, width, height);  
    createshader SetPoint(point, relative, x, y);
    createshader.horzalign = horzalign;
    createshader.vertalign = vertalign;
    
    if (IsDefined(color))
    	createshader.color = color;
    	
	createshader.alpha = alpha;
	
    if (IsDefined(hidewheninmenu))	
    	createshader.hidewheninmenu = hidewheninmenu;
    	
    createshader.sort = sort;
   	createshader.archived = false;
   	
    return createshader;
}

OverflowFix()
{
    println("empece overfloxfix");
    level.stringtable = [];
    level.textelementtable = [];
    textanchor = CreateServerFontString("default", 1);
    textanchor SetElementText("Anchor");
    textanchor.alpha = 0; 
    
    if (GetDvar("g_gametype") == "tdm" || GetDvar("g_gametype") == "hctdm")
        limit = 54;
    if (GetDvar("g_gametype") == "dm" || GetDvar("g_gametype") == "hcdm")
        limit = 54;
    if (GetDvar("g_gametype") == "dom" || GetDvar("g_gametype") == "hcdom")
        limit = 38;
    if (GetDvar("g_gametype") == "dem" || GetDvar("g_gametype") == "hcdem")
        limit = 41;
    if (GetDvar("g_gametype") == "conf" || GetDvar("g_gametype") == "hcconf")
        limit = 53;
    if (GetDvar("g_gametype") == "koth" || GetDvar("g_gametype") == "hckoth")
        limit = 41;
    if (GetDvar("g_gametype") == "hq" || GetDvar("g_gametype") == "hchq")
        limit = 43;
    if (GetDvar("g_gametype") == "ctf" || GetDvar("g_gametype") == "hcctf")
        limit = 32;
    if (GetDvar("g_gametype") == "sd" || GetDvar("g_gametype") == "hcsd")
        limit = 38;
    if (GetDvar("g_gametype") == "oneflag" || GetDvar("g_gametype") == "hconeflag")
        limit = 25;
    if (GetDvar("g_gametype") == "gun")
        limit = 48;
    if (GetDvar("g_gametype") == "oic")
        limit = 51;
    if (GetDvar("g_gametype") == "shrp")
        limit = 48;
    if (GetDvar("g_gametype") == "sas")
        limit = 50;
    if (IsDefined(level.stringoptimization))
        limit += 172;

    while (!level.gameended)
    {      
        if (IsDefined(level.stringoptimization) && level.stringtable.size >= 100 && !IsDefined(textanchor2))
        {
            textanchor2 = CreateServerFontString("default", 1);
            textanchor2 SetElementText("Anchor2");                
            textanchor2.alpha = 0; 
        }
        if (level.stringtable.size >= limit)
        {
            if (IsDefined(textanchor2))
            {
                textanchor2 ClearAllTextAfterHudElem();
                textanchor2 DestroyElement();
            }
            
            textanchor ClearAllTextAfterHudElem();
            level.stringtable = [];
            
            foreach (textelement in level.textelementtable)
            {
                if (!IsDefined(self.label))
                    textelement SetElementText(textelement.text);
                else
                    textelement SetElementValueText(textelement.text);
            }
        }       
        
        wait 0.01;
    }
}

Precaches()
{

    PrecacheShader("white");

    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Map Models                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Aftermath                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_la")
    {
        PrecacheModel("p6_concrete_pillarchunk_large");
        PrecacheModel("iw_ny_barrier_construction_01");
        PrecacheModel("iw_ny_barrier_pedestrian_01");
        PrecacheModel("me_dumpster_close_green");
        PrecacheModel("veh_iw_civ_firetruck");
    }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Cargo                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_dockside")
    { 
        PrecacheModel("p6_stainless_refrigerator");
        PrecacheModel("p6_lunch_table");
        PrecacheModel("p6_dockside_container_lrg_blue");
        PrecacheModel("p6_dockside_container_lrg_orange");
        PrecacheModel("p6_dockside_container_lrg_red");
        PrecacheModel("p6_dockside_container_lrg_white");
        PrecacheModel("veh_t6_civ_future_forklift");
    }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Carrier                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_carrier")
    { }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Drone                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_drone")
    { 
        PrecacheModel("p6_door_automatic_mp_drone");
        PrecacheModel("p6_crate_container_cooler");
        PrecacheModel("p6_metal_tank_set_01");
        PrecacheModel("p6_vending_machine01");
        PrecacheModel("p6_drone_gas_silo");
        PrecacheModel("p6_dockside_container_lrg_orange");
    }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Express                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_express")
    {
        PrecacheModel("p6_bullet_train_car");
        PrecacheModel("p6_train_barricade_door");
        PrecacheModel("p6_vending_machine01");
        PrecacheModel("p6_vending_machine02");
        PrecacheModel("me_dumpster_close_green");
        PrecacheModel("utility_luggage_cart");
    }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Hijacked                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_hijacked")
    { 
        PrecacheModel("p6_stainless_refrigerator");
        PrecacheModel("p6_door_hijacked_wood");
        PrecacheModel("p6_door_hijacked_white");
        PrecacheModel("p6_barrel_boat");
    }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Meltdown                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_meltdown")
    { }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Overflow                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_overflow")
    { } 

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Plaza                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_nightclub")
    { }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Raid                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_raid")
    { }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Slums                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_slums")
    { } 

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Standoff                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_village")
    {
        PrecacheModel("p_rus_dumpster_grn_nrv");
        PrecacheModel("p_rus_dumpster_lid_grn_nrv");
        PrecacheModel("p6_pak_barrier_01_no_mud");
        PrecacheModel("p6_shipping_boxes_02");
        PrecacheModel("p6_pak_barrier_01_no_mud");
    }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Turbine                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_turbine")
    { 
        PrecacheModel("p_rus_fp_sniper_catwalk_152_stair");
        PrecacheModel("p6_crate_container_cooler");
        PrecacheModel("p6_cubicle_desk");
        PrecacheModel("p6_metal_fence");
        PrecacheModel("p6_pak_barrier_01");
        PrecacheModel("p6_turbine_tube");
        PrecacheModel("p6_wind_turbine_fallen_blade");
    }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Yemen                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_socotra")
    { } 

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Nuketown                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_nuketown_2020")
    { 
        PrecacheModel("nt_2020_foliage_hedge_boxy01");
        PrecacheModel("nt_2020_street_gate_01");
        PrecacheModel("nt_2020_street_gate_02");
        PrecacheModel("nt_2020_street_gate_03");
        PrecacheModel("nt_2020_robot_01");
        PrecacheModel("nt_2020_door_raid_white");
    }

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Downhill                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_downhill")
    { } 

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Mirage                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_mirage")
    { } 

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Hydro                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_hydro")
    { } 

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Grind                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_skate")
    { } 

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Encore                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_concert")
    { } 

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Magma                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_magma")
    { } 

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Vertigo                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_vertigo")
    { } 

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Studio                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_studio")
    { } 

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Uplink                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_uplink")
    { } 

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Detour                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_bridge")
    { } 

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Cove                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_castaway")
    { } 

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Rush                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_paintball")
    { } 

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Dig                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_dig")
    { } 

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Frost                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_frostbite")
    { } 

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Pod                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_pod")
    { } 

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Takeoff                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    if (GetDvar("mapname") == "mp_takeoff")
    { } 
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Gamemode Items                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    foreach (item in StrTok("m32_wager_mp,minigun_wager_mp", ","))
        PrecacheItem(item);
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Gamemode Vehicles                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    foreach (vehicle in StrTok("heli_supplydrop_mp", ","))
        PrecacheVehicle(vehicle);
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Gamemode Models                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    foreach (model in StrTok("veh_t6_drone_supply,p_glo_bomb_stack,t6_wpn_drop_box,t5_veh_rcbomb_gib_large,t6_wpn_trophy_system_world,projectile_s5rocket,vehicle_mi24p_hind_desert_d_piece02", ","))
        PrecacheModel(model);
        
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Gamemode Shaders                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    foreach (shader in StrTok("white,gradient", ","))
        PrecacheShader(shader); 
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Menu Shaders                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    foreach (shader in StrTok("ui_scrollbar_arrow_up_a,ui_scrollbar_arrow_dwn_a,fullscreen_proximity_vertical0,fullscreen_proximity_vertical1,fullscreen_proximity_vertical2,fullscreen_proximity_horizontal0,fullscreen_proximity_horizontal1", ","))
        PrecacheShader(shader);
 
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Menu Header Shaders                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    foreach (shader in StrTok("em_bg_ani_armor,emblem_bg_streak_sentry,emblem_bg_chain_killer,emblem_bg_trophy_v,emblem_bg_career_mastery_primary,emblem_bg_prestige_sfighter,emblem_bg_career_mastery_smg,emblem_bg_career_mastery_ar,emblem_bg_career_mastery_shotgun,emblem_bg_career_mastery_lmg,emblem_bg_career_mastery_sniper,emblem_bg_anti_air_iv,emblem_bg_prestige_overkill,emblem_bg_att_adj_stock,emblem_bg_streak_stealth_heli,emblem_bg_snd_bomb_defuser,emblem_bg_combat_master,emblem_bg_ovsat_support,em_bg_ani_afterlife,emblem_bg_master,emblem_bg_equip_ax", ","))
        PrecacheShader(shader);
        
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Equipment Shaders                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    foreach (shader in StrTok("hud_grenadeicon_256,hud_icon_sticky_grenade_256,hud_hatchet_256,hud_bounce_betty_256,hud_icon_satchelcharge_256,hud_icon_claymore_256,hud_us_stungrenade_256,hud_us_smokegrenade_256,hud_sensor_grenade_256,hud_empgrenade_256,hud_proximitymine_256,hud_us_flashgrenade_256,hud_trophy_system_256", ","))
        PrecacheShader(shader); 
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Weapon Shaders                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    foreach (shader in StrTok("menu_mp_weapons_five_seven,menu_mp_weapons_fnp45,menu_mp_weapons_baretta,menu_mp_weapons_judge,menu_mp_weapons_kard,menu_mp_weapons_mp7,menu_mp_weapons_ar57,menu_mp_weapons_kriss,menu_mp_weapons_insas,menu_mp_weapons_qcw,menu_mp_weapons_evoskorpion,menu_mp_weapons_pm,menu_mp_weapons_tar21,menu_mp_weapons_type95,menu_mp_weapons_sig556,menu_mp_weapons_sa58,menu_mp_weapons_hk416,menu_mp_weapons_scar,menu_mp_weapons_saritch,menu_mp_weapons_xm8,menu_mp_weapons_an94,menu_mp_weapons_870mcs,menu_mp_weapons_saiga12,menu_mp_weapons_ksg,menu_mp_weapons_srm,menu_mp_weapons_mk48,menu_mp_weapons_qbb95,menu_mp_weapons_lsat,menu_mp_weapons_hamr,menu_mp_weapons_svu,menu_mp_weapons_dsr1,menu_mp_weapons_ballista,menu_mp_weapons_as50,menu_mp_weapons_smaw,menu_mp_weapons_rpg,menu_mp_weapons_riot_shield,menu_mp_weapons_ballistic_knife,menu_mp_weapons_crossbow,hud_ks_m32", ","))
        PrecacheShader(shader);
        
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Attachment Shaders                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    foreach (shader in StrTok("cac_mods_acog,cac_mods_dual_band,cac_mods_holographic,cac_mods_combo_r_a,cac_mods_ironsight,cac_mods_mms,cac_mods_red_dot,cac_mods_rangefinder,cac_mods_var_zoom,cac_mods_extended_mag,cac_mods_dual_clip,cac_mods_extended_stock,cac_mods_bors,cac_mods_dual_wield,cac_mods_fmj,cac_mods_foregrip,hud_grenade_launcher_256,cac_mods_laser,cac_mods_barrel_extend,cac_mods_pistol_grip,cac_mods_rapid_fire,cac_mods_trigger_group,cac_mods_suppressor,cac_mods_tact_knife,cac_mods_tribolt", ","))
        PrecacheShader(shader);

    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Power-Up Shaders                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    foreach (shader in StrTok("hud_status_dead,perk_times_two,hud_ks_predator,perk_hardline,ui_host,menu_mp_bonuscard_overkill,hud_icon_minigun,", ","))
        PrecacheShader(shader);
                 
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Gamemode FX                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    if (GetDvar("mapname") != "mp_hydro")
    {
        level.muzzleflashfx = LoadFX("weapon/muzzleflashes/fx_pistol_flash_base");
        level.muzzleflashsilencerfx = LoadFX("weapon/muzzleflashes/fx_muz_silencer_md");
        level.redlightfx = LoadFX("misc/fx_equip_tac_insert_light_red");
        level.paintbrushfx = LoadFX("weapon/remote_mortar/fx_rmt_mortar_laser_loop");
        level.afterburnerfx = LoadFX("vehicle/exhaust/fx_exhaust_f35_afterburner");
        level.mysteryboxactivefx = LoadFX("misc/fx_ui_oneflag_flagbase");
        level.explosionfx = LoadFX("weapon/talon/fx_talon_exp");
        level.heatfx = LoadFX("weapon/silent_gaurdian/fx_sg_distortion_cone_ash");
        level.firefx = LoadFX("weapon/talon/fx_muz_talon_rocket_flash_1p");
        level.dustfx = LoadFX("weapon/bouncing_betty/fx_betty_launch_dust");
        level.bloodfx = LoadFX("impacts/fx_flesh_hit_body_fatal_lg_exit");
        level.waterfx = LoadFX("impacts/fx_xtreme_water_hit_mp");
        level.consumabledropfx = LoadFX("misc/fx_equip_tac_insert_light_grn");
        level.weapondropfx = LoadFX("misc/fx_equip_tac_insert_light_red");
    }

    println("Acabe precache");
}

ItemPrices()
{
    //████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
    //███                                                                                                                                                                                                                                
    //███ Human (Item Prices)                                                                                                                                                                                                                       
    //███                                                                                                                                                                                                                                    
    //████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
                          
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Structures                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    level.pricebuildingblock = 100; //Building Block
    level.pricemanualturret = 2000; //Manual Turret
    level.priceautoturret = 3000; //Auto Turret
    level.priceguardian = 3500; //Guardian
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Perks                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    level.pricejuggernog = 2500; //Juggernog
    level.pricedoubletapii = 2000; //Double Tap II
    level.pricespeedcola = 3000; //Speed Cola
    level.pricestaminup = 2000; //Stamin-Up
    level.pricemulekick = 4000; //Mule Kick
    level.priceelectriccherry = 2000; //Electric Cherry
    level.pricephdflopper = 2000; //PhD Flopper
    level.pricedeadshotdaiquiri = 1500; //Deadshot Daiquiri
    level.pricestealthaid = 1500; //Stealth Aid
    level.pricescavenger = 4000; //Ammo-Ficiency
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Equipment                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    level.price["frag_grenade_mp"] = 50; //Grenade
    level.price["sticky_grenade_mp"] = 50; //Semtex
    level.price["bouncingbetty_mp"] = 200; //Bouncing Betty
    level.price["satchel_charge_mp"] = 100; //C4
    level.price["claymore_mp"] = 200; //Claymore
    level.price["concussion_grenade_mp"] = 200; //Concussion
    level.price["sensor_grenade_mp"] = 50; //Sensor Grenade
    level.price["proximity_grenade_mp"] = 200; //Shock Charge
    level.price["flash_grenade_mp"] = 200; //Flashbang
    level.price["trophy_system_mp"] = 5000; //Gersh Device

    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Weapons                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Pistols                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.price["fiveseven_mp"] = 500; //Five-seven
    level.price["fnp45_mp"] = 600; //Tac-45
    level.price["beretta93r_mp"] = 700; //B23R
    level.price["judge_mp"] = 800; //Executioner
    level.price["kard_mp"] = 500; //KAP-40

    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Submachine Guns                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.price["mp7_mp"] = 1100; //MP7
    level.price["pdw57_mp"] = 1200; //PDW-57
    level.price["vector_mp"] = 1000; //Vector K10
    level.price["insas_mp"] = 1000; //MSMC
    level.price["qcw05_mp"] = 1000; //Chicom CQB
    level.price["evoskorpion_mp"] = 1200; //Skorpion EVO
    level.price["peacekeeper_mp"] = 1000; //Peacekeeper
    
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Assault Rifles                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.price["tar21_mp"] = 1100; //MTAR
    level.price["type95_mp"] = 1100; //Type 25
    level.price["sig556_mp"] = 1000; //SWAT-556
    level.price["sa58_mp"] = 1500; //FAL OSW
    level.price["hk416_mp"] = 1100; //M27
    level.price["scar_mp"] = 1300; //SCAR-H
    level.price["saritch_mp"] = 1300; //SMR
    level.price["xm8_mp"] = 1000; //M8A1
    level.price["an94_mp"] = 1200; //AN-94
    
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Shotguns                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.price["870mcs_mp"] = 1200; //R870 MCS
    level.price["saiga12_mp"] = 1200; //S12
    level.price["ksg_mp"] = 1300; //KSG
    level.price["srm1216_mp"] = 1400; //M1216
    
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Lightmachine Guns                                                                         
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.price["mk48_mp"] = 2000; //Mk 48
    level.price["qbb95_mp"] = 2200; //QBB LSW
    level.price["lsat_mp"] = 2100; //LSAT
    level.price["hamr_mp"] = 2200; //HAMR
    
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Sniper Rifles                                                                         
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.price["svu_mp"] = 1000; //SVU-AS
    level.price["dsr50_mp"] = 800; //DSR 50
    level.price["ballista_mp"] = 900; //Ballista
    level.price["as50_mp"] = 1200; //XPR-50
    
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Launchers                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.price["smaw_mp"] = 4000; //SMAW
    level.price["usrpg_mp"] = 4000; //RPG
    level.price["m32_wager_mp"] = 4500; //War Machine
    
    //╔══════════════════════════════════════════════════════════════════════════════════════════════════════════
    //║ Specials                                                                          
    //╚══════════════════════════════════════════════════════════════════════════════════════════════════════════

    level.price["riotshield_mp"] = 3000; //Assault Shield
    level.price["knife_held_mp"] = 500; //Knife
    level.price["knife_ballistic_mp"] = 1000; //Ballistic Knife
    level.price["crossbow_mp"] = 1500; //Crossbow
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Attachments                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    level.price["acog"] = 300; //ACOG
    level.price["ir"] = 300; //Dual Band
    level.price["holo"] = 300; //EOTech
    level.price["dualoptic"] = 400; //Hybrid Optic
    level.price["is"] = 300; //Iron Sight
    level.price["mms"] = 300; //MMS
    level.price["reflex"] = 300; //Reflex
    level.price["rangefinder"] = 400; //Target Finder
    level.price["vzoom"] = 200; //Zoom
    level.price["extclip"] = 500; //Extended Clip
    level.price["dualclip"] = 500; //Fast Mag
    level.price["stalker"] = 300; //Stock
    level.price["swayreduc"] = 200; //Ballistics CPU
    level.price["dw"] = 1000; //Dual Wield
    level.price["fmj"] = 300; // FMJ
    level.price["grip"] = 400; //Fore Grip
    level.price["gl"] = 200; //Launcher
    level.price["steadyaim"] = 200; //Laser Sight
    level.price["extbarrel"] = 400; //Long Barrel
    level.price["fastads"] = 300; //Quickdraw
    level.price["rf"] = 500; //Rapid Fire
    level.price["sf"] = 500; //Select Fire
    level.price["silencer"] = 300; //Suppressor
    level.price["tacknife"] = 200; //Knife
    level.price["stackfire"] = 500; //Tri-Bolt
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Support                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    level.pricekamikaze = 200; //Kamikaze Bomber
    level.price["killstreak_rcbomb"] = 200; //RC-XD
    level.price["killstreak_remote_missile"] = 300; //Hellstorm Missile
    level.price["killstreak_planemortar"] = 600; //Lightning Strike
    level.price["killstreak_straferun"] = 1800; //Warthog
    level.priceguarddog = 4000; //Guard Dog
    level.priceagr = 4000; //A.G.R
    
    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Miscellaneous                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    level.mysteryboxprice = 950; //Mystery Box
    level.packapunchprice = 5000; //Pack-a-Punch
    level.packapunchammoprice = 4500; //Pack-a-Punch Ammo
    
    //████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
    //███                                                                                                                                                                                                                                
    //███ Zombie (Item Prices)                                                                                                                                                                                                                       
    //███                                                                                                                                                                                                                                    
    //████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████

    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Equipment                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    level.price["hatchet_mp"] = 100; //Combat Axe
    level.price["willy_pete_mp"] = 100; //Smoke Grenade
    level.price["emp_grenade_mp"] = 50; //EMP Grenade

    //██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    //██ Zombie Types                                                                                                                                         
    //██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

    level.priceriotzombie = 50; //Riot Zombie
    level.pricecrawlerzombie = 100; //Crawler Zombie
    level.priceelectriczombie = 100; //Electric Zombie
    level.pricenapalmzombie = 150; //Napalm Zombie
    level.pricecyborgzombie = 200; //Cyborg Zombie
    level.pricemistzombie = 400; //Mist Zombie
    level.pricesummonerzombie = 700; //Summoner Zombie
    level.pricejuggernautzombie = 1000; //Juggernaut Zombie
    level.pricegoliathzombie = 5000; //Goliath Zombie
}

UpdateSelfSubMenu(){
    if (IsDefined(self.menu) && self.menuopen){
        checkSelfSubMenu(1);
    }
}

UpdateSelfSubMenuEquipment(){
    if ((IsDefined(self.menu)) && (self.menuopen) && (self.menu.currentmenu == "Equipment")){
        checkSelfSubMenu(2);
    } 
    
    else if (IsDefined(self.menu) && self.menuopen && IsSubStr(self.menu.currentmenu, GetEquipmentDisplayName(equipment))){
        checkSelfSubMenu(2);
    }
}

checkSelfSubMenu(value){
    if(isDefined(value)){
        if(value == 1){
            self Submenu(self.menu.currentmenu);
        } else if (value == 2){
            self Submenu("Equipment");
        } else if (value == 3){
            self Submenu("Consumables");
        } else if (value == 4){
            self Submenu("Weapons");
        }
    }

    value = undefined;
}


// checkOtherSelfSubmenu(value){
//     if(value == 1){
//         self Submenu("Equipment");
//         value = undefined;
//     } else if (value == 2){
//         self Submenu("Consumables");
//         value = undefined;
//     } else {
//         self Submenu("Weapons");
//         value = undefined;
//     }
// }

GodMode(){

    if (!IsDefined(self.godmode))
    {
        self.godmode = true;
        self EnableInvulnerability();
        self IPrintLn("God Mode: ^2Enabled");
    }

    else
    {
        self.godmode = undefined;
        self DisableInvulnerability();
        self IPrintLn("God Mode: ^1Disabled");
    }  

    UpdateSelfSubMenu();

}

UFOMode()
{
    self Endon("disconnect");
    
    if (!IsDefined(self.ufomode))
    {
        self.ufomode = true;
        self IPrintLn("UFO Mode: ^2Enabled");
        self IPrintLn("Hold [{+frag}] To Move Forward"); 
        self IPrintLn("Press [{+actionslot 1}]/[{+actionslot 2}]/[{+actionslot 3}]/[{+actionslot 4}] To Pan");
        self.ufoscriptorigin = Spawn("script_origin", self GetOrigin());
        self.ufoscriptorigin.angles = self.angles;
        self PlayerLinkTo(self.ufoscriptorigin);
        
        UpdateSelfSubMenu();
        
        while (IsDefined(self.ufomode))
        {
            if (self FragButtonPressed())
                self.ufoscriptorigin MoveTo(self GetOrigin() + (AnglesToForward(self GetPlayerAngles()) * 25), 0.05);
            if (self ActionSlotOneButtonPressed() && !self.menuopen)
                self.ufoscriptorigin MoveTo(self GetOrigin() + (0, 0, 10), 0.05); 
            if (self ActionSlotTwoButtonPressed() && !self.menuopen)
                self.ufoscriptorigin MoveTo(self GetOrigin() + (0, 0, -10), 0.05);
            if (self ActionSlotThreeButtonPressed() && !self.menuopen)
                self.ufoscriptorigin MoveTo(self GetOrigin() + (AnglesToLeft(self GetPlayerAngles()) * 25), 0.05);
            if (self ActionSlotFourButtonPressed() && !self.menuopen)
                self.ufoscriptorigin MoveTo(self GetOrigin() + (AnglesToRight(self GetPlayerAngles()) * 25), 0.05);
                
            wait 0.05;
        }
    }

    else
    {
        self.ufomode = undefined;
        self IPrintLn("UFO Mode: ^1Disabled");
        self Unlink();
        self.ufoscriptorigin Delete();
    }

    UpdateSelfSubMenu();
}

Invisibility()
{
    if (!IsDefined(self.invisibility))
    {
        self.invisibility = true;
        self Hide();
        self IPrintLn("Invisibility: ^2Enabled");
    }
    else
    {
        self.invisibility = undefined;
        self Show();
        self IPrintLn("Invisibility: ^1Disabled");
    }

    UpdateSelfSubMenu();
}

RapidFire()
{
    if (!IsDefined(self.rapidfire))
    {
        self.rapidfire = true;
        self SetPerk("specialty_rof");
        self SetPerk("specialty_fastreload");
        SetDvar("perk_weapRateMultiplier", "0.001");
        SetDvar("perk_fireproof", "0.001");
        SetDvar("cg_weaponSimulateFireAnims", "0.001");
        self IPrintLn("Rapid Fire: ^2Enabled");
    }
    else
    {
        self.rapidfire = undefined;
        self UnSetPerk("specialty_rof");
        self UnSetPerk("specialty_fastreload");
        SetDvar("perk_weapRateMultiplier", "1");
        SetDvar("perk_fireproof", "1");
        SetDvar("cg_weaponSimulateFireAnims", "1");
        self IPrintLn("Rapid Fire: ^1Disabled");
    }

    UpdateSelfSubMenu();
  
}

Paintbrush()
{
    self Endon("disconnect");
    
    if (!IsDefined(self.paintbrush))
    {
        self.paintbrush = true;
        paintstroke = [];
        self IPrintLn("Paintbrush: ^2Enabled");
        self IPrintLn("Press [{+speed_throw}] To Paint");
        
        UpdateSelfSubMenu();
        
        while (IsDefined(level.paintbrush))
        {
            if (self AdsButtonPressed())
            {
                paintstroke[paintstroke.size] = SpawnFX(level.paintbrushfx, self GetEyeTraceOrigin());
                TriggerFX(paintstroke[paintstroke.size - 1]);
            }
            
            wait 0.05;
        }
        
        Array_Delete(paintstroke);
    }
    else
    {
        self.paintbrush = undefined;   
        self IPrintLn("Paintbrush: ^1Disabled");
    }  

    UpdateSelfSubMenu();
}

ShowFPS()
{
    if (!IsDefined(level.showfps))
    {
        level.showfps = true;
        SetDvar("cg_drawFPS","1");
        SetDvar("cg_drawBigFPS","1");
        self IPrintLn("Show FPS: ^2Enabled");
    }
    else
    {
        level.showfps = undefined;
        setDvar("cg_drawFPS","0");
        setDvar("cg_drawBigFPS","0");
        self IPrintLn("Show FPS: ^1Disabled");
    } 

    UpdateSelfSubMenu();
}

GivePlayersPoints(amount, status)
{
    foreach (player in level.players)
    {
        if (player.status == status)
            player.points += amount;
    }
    
    IPrintLn(GetAbbreviatedPlayerName(self) + " Has Given All " + status + "s +^2$" + amount);
}

LocationSelector()
{
    self Endon("death");
    self Endon("disconnect");
    
    self DisableOffHandWeapons();
    self BeginLocationSelection("map_mortar_selector"); 
    self GiveWeapon("killstreak_remote_turret_mp");
    self SwitchToWeapon("killstreak_remote_turret_mp");
    self.selectinglocation = 1; 
    self Waittill("confirm_location", location);  
    location = BulletTrace(location + (0, 0, 100000), location, false, self)["position"];
    self EndLocationSelection();
    self EnableOffHandWeapons();
    self SwitchToWeapon(self maps\mp\_utility::GetLastWeapon());
    self.selectinglocation = undefined;
    
    return location;
}

TeleportPlayers(status, type)
{
    if (type == "location")
        origin = LocationSelector();
    if (type == "self")
    {
        origin = self GetOrigin() + ((AnglesToForward(self GetPlayerAngles())[0] * 100), (AnglesToForward(self GetPlayerAngles())[1] * 100), 0);
        origin = BulletTrace(origin + (0, 0, 100000), origin, false, self)["position"];
        
        if (Distance(self GetOrigin(), origin) > 200)
            origin = self GetOrigin() + ((AnglesToForward(self GetPlayerAngles())[0] * 100), (AnglesToForward(self GetPlayerAngles())[1] * 100), 0);
    }   
    
    foreach (player in level.players)
    {
        if (IsAlive(player) && player != self && player.status == status)
            player SetOrigin(origin);
    }
    
    if (type == "location")
        self IPrintLn("Teleported " + status + "s To " + origin);
    if (type == "self")
        self IPrintLn("Teleported " + status + "s To You");
}

ChangePlayersStatus(status)
{
    if (level.infectiontime == 0 || level.players.size < 2)
    {
        foreach (player in level.players)
        {
            if (status == "Human" && player != self && player.status != "Human")
                thread ChangeToHuman(player);
            if (status == "Zombie" && player != self && player.status != "Zombie")
                thread ChangeToZombie(player);
        }
    }
    else
        self IPrintLn("^1Error: ^7Cannot Change Players Status Right Now"); 
}

// changed self submenu

FreezeAllPlayers() 
{
    level Notify("end_freezeallplayers");
    level Endon("end_freezeallplayers");
    
    if (!IsDefined(level.freezeallplayers))
    {
        level.freezeallplayers = true;
        
        UpdateSelfSubMenu();
        
        foreach (player in level.players)
        {
            if (!player IsHost() && !IsDefined(player.hashostprivileges))
                player FreezeControls(true);
        }
            
        self IPrintLn("Freeze All Players: ^2Enabled");
        
        while (IsDefined(level.freezeallplayers))
        {
            level Waittill("spawned_player", player);
            
            if (!player IsHost() && !IsDefined(player.hashostprivileges))
                player FreezeControls(true);
        }
    }
    else
    {
        level.freezeallplayers = undefined;
        
        foreach (player in level.players)
        {
            if (!player IsHost() && !IsDefined(player.hashostprivileges))
                player FreezeControls(false);
        }
        
        self IPrintLn("Freeze All Players: ^1Disabled");
    }

    UpdateSelfSubMenu();
}
