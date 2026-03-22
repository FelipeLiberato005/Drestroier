image_blend = c_aqua
dano_base = 30
dano_atual = dano_base;
limite_room = function()
{
    if x >= room_width + 100 or x < room_width - (room_width + 100)
{
    instance_destroy()
}
else if y >= room_height + 100 or y < room_height - (room_height + 100)
{
    instance_destroy()
}


}


dando_dano = function()
{
    //var info_inimigo = array_length(global.inimigo)
    //
    //for (var i = 0; i < info_inimigo; i++) {
    	//
        //var inimigo = global.inimigo[i]
        //
        //
        //var dano = place_meeting(x, y, inimigo)
        //
        //if dano
        //{
            //show_message("Menos vida")
        //}
    //}
    
    //place_meeting(x, y, global.inimigo[0].instancia)
    
}