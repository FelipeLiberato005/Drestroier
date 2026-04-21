#region VARIAVEIS
vida_base                   = 500
vida_atual                  = vida_base;


imune                       = false
tempo_imune                 = room_speed * 0.6
cronometro_imune            = 0;


lista_hits                  = [obj_hitbox, obj_hitbox_back, obj_hitbox_side_left, obj_hitbox_side_right]

ia_idle                     = new estado()
ia_persegue                 = new estado()

vel = 0.1

#endregion




#region MAQUINA DE ESTADOS IA




#region ESTADO PARADO
ia_idle.inicia = function()
{
    speed = 0
    vspeed = 0
    image_blend = c_white
}

ia_idle.roda = function()
{
    var distancia_player = point_distance(x, y, obj_player.x, obj_player.y)
    
    if distancia_player <= 60
    {
        troca_estado(ia_persegue)
    }
}
#endregion






#region ESTADO PERSEGUE
ia_persegue.inicia = function()
{
    
}

ia_persegue.roda = function()
{
    
    
    vir_x = sign(obj_player.x + 5 - x) 
    vir_y = sign(obj_player.y + 5 - y) 
    hspeed = vir_x * vel;
    vspeed = vir_y * vel; 
    
    var distancia_player = point_distance(x, y, obj_player.x, obj_player.y)
    
    if distancia_player >= 120
    {
        troca_estado(ia_idle)
    }
}
#endregion



#endregion






#region METODOS
sofri_dano = function()
{
	var dano = place_meeting(x, y, lista_hits);

}

imunidade = function()
{
    if imune == true
    {
        image_alpha = 0.5
        cronometro_imune++
        if cronometro_imune >= tempo_imune
        {
            image_alpha = 1
            imune = false
            cronometro_imune = 0
        }
    }
}
#endregion



inicia_estado(ia_idle)