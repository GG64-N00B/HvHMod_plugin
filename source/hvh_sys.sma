#include <amxmodx>
#include <amxmisc>
#include <hlsdk_const>
#include <fakemeta>
#include <fun>
#include <hl>
#include <engine>
#include <hamsandwich>

#define PLUGIN "HvH system"
#define VERSION "1.0"
#define AUTHOR "N00B"

new first_hack[32]
new second_hack[32]
new float:is_live

public plugin_init() {
	register_plugin(PLUGIN, VERSION, AUTHOR)
	set_task(90.0, "hvh_info", 1, _, _,"b")
	set_task(60.0, "check_hvh_status", 1, _, _,"b")
	set_task(120.0, "hvh_opponents", 1, _, _,"b")
	register_clcmd("say /hvh_help", "ShowHelp")
	register_clcmd("hvh_cheat_first", "SetFirstHack")
	register_clcmd("hvh_cheat_second", "SetSecondHack")
	register_clcmd("hvh_start", "hvh_start")
	register_clcmd("hvh_stop", "hvh_stop")
}

public hvh_info( id ) {
	set_hudmessage(255, 0, 0, -1.0, 0.01)
	show_hudmessage(id, "say /hvh_help to view full list of commands")
}
public ShowHelp( id ) {
	show_motd(id, "help.txt")
}
public SetFirstHack( id ) {
	get_cvar_string("hvh_cheat_first", first_hack, 128)
}
public SetSecondHack( id ) {
	get_cvar_string("hvh_cheat_second", second_hack, 128)
}
public hvh_start( id ) {
	is_live = 1;
	hl_user_spawn(id)
	set_hudmessage(0, 255, 0, -1.0, -1.0)
	show_hudmessage(id, "Game started!")
	
	
}
public hvh_stop( id ) {
	is_live = 0;
}
public check_hvh_status( id ) {
	if(is_live){
		set_hudmessage(0, 255, 0, -1.0, 256)
		show_hudmessage(id, "HvH match is live!")
	}
}
public hvh_opponents( id ) {
	if(is_live){
		new cheaters[128]
		formatex(cheaters, 128, "[cheat1] vs [cheat2]", first_hack, second_hack)
		set_hudmessage(0, 255, 0, -1.0, 128)
		show_hudmessage(id, cheaters)
	}
}
/* AMXX-Studio Notes - DO NOT MODIFY BELOW HERE
*{\\ rtf1\\ ansi\\ deff0{\\ fonttbl{\\ f0\\ fnil Tahoma;}}\n\\ viewkind4\\ uc1\\ pard\\ lang1049\\ f0\\ fs16 \n\\ par }
*/
