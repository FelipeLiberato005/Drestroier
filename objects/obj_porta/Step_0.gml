var player = place_meeting(x, y, obj_player)

//var espaco = keyboard_check_released(vk_space)

if(player)
{
		//codigo da transição
		var tran = instance_create_layer(0, 0, "PLAYER", obj_transicao)
		tran.destino = destino;
		tran.destino_x = destino_x;
		tran.destino_y = destino_y;
		
		
}