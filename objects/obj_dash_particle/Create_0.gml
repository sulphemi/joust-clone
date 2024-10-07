// Inherit the parent event
event_inherited();

xoffset = random_range(-20, 20);
yoffset = random_range(-20, 20);

x += xoffset;
y += yoffset;

image_blend = make_color_rgb(100, irandom_range(0, 180), irandom_range(120, 255));

decay = random_range(0.8, 0.95);