image_alpha -= 0.1;

if(keyboard_check(ord("A"))) image_xscale = -1;


if(keyboard_check(ord("D"))) image_xscale = 1;

if(image_alpha <= 0) instance_destroy()