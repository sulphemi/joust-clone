dest_x = obj_player.x + xoffset;
dest_y = obj_player.y + yoffset;

xv = (dest_x - x) * 0.15;
yv = (dest_y - y) * 0.15;

event_inherited();