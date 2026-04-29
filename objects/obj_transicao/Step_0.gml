if(mudei)
{
		alpha -= 0.02;
}
else
{
	    alpha += .02;	
}


if(alpha >= 1)
{
	room_goto(destino)
	
	obj_player.x = destino_x;
	obj_player.y = destino_y;
//instance_destroy()
}

if(mudei && alpha <= 0) instance_destroy()