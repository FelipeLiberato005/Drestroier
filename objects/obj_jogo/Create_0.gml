lista_player = [global.player[0]]

inicia_level = function()
{
    instance_create_layer(room_width/2, room_height/2, "PLAYER", obj_level)
}

inicia_personagem = function()
{
    var info = array_length(global.player)
    
    for (var i = 0; i < info; i++) {
    	
        var player = global.player[i]
        
        var inst = instance_create_layer(room_width/2, room_height/2, "PLAYER" ,player.instancia)
        //inst.image_xscale = 0.5;
        //inst.image_yscale = inst.image_xscale;
    }
} 


