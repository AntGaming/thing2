draw_self();
draw_set_color(c_red);
if(obj_indoors_draw.uid == uid) draw_rectangle(x, y, x+64, y+64, true);
draw_set_color(c_white);
if(global.buildings[uid].crimescene) draw_sprite(spr_dead, global.buildings[uid].scene_inspected, x, y);