vida_base = 50
vida_atual = vida_base;

//lista_hits = [obj_hitbox, obj_hitbox_back, obj_hitbox_side_left, obj_hitbox_side_right]
imune = false
tempo_imune = room_speed * 1
cronometro_imune = 0;


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