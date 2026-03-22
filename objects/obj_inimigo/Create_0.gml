lista_perde_vida = [obj_chamas, obj_chamas2, obj_chamas3]


#region Variaveis Chamas
chamas_tempo = 20
chamas_cronometro = 0
#endregion

#region MAQUINA ESTADOS
estado_inicial = new estado();
estado_direcao = new estado();
#region ESTADO INICIAL
estado_inicial.inicia = function()
{
    image_blend = c_red
    tempo = 10
    cronometro = 0
    
    
    
}

estado_inicial.roda = function()
{
    cronometro++;
    if cronometro >= tempo{
        troca_estado(estado_direcao)
    }
    
}



#region ESTADO DE DIRECAO ATÉ O PLAYER
estado_direcao.inicia = function()
{
  image_blend = c_aqua
}

estado_direcao.roda = function()
{
    if (hspeed != 0) image_xscale = sign(hspeed)
			
        
			if(instance_exists(obj_player))
			{
                if x <= 320
            {
 			    vir_x = sign((obj_level.x - 20) - x) 
                vir_y = sign(obj_level.y - y)
 			    hspeed = vir_x * vel;
                vspeed = vir_y * vel;    
			}
            else if x > 320 {
            	vir_x = sign((obj_level.x + 20) - x) 
                vir_y = sign(obj_level.y - y) 
                hspeed = vir_x * vel;
                vspeed = vir_y * vel;    
            }
        }
}
#endregion

#endregion



#endregion


#region VARIAVEIS
max_vida = 15
vida  = max_vida;
controla_vida = new scr_vida(max_vida)


vel = 0.5
#endregion



#region METODOS
#region Apenas desenhando algumas informações do inimigo para o player ver exemplo: vida
desenha_info = function()
{
    draw_set_font(fnt_infos_personagens)        
    draw_text(x - 20, y - 25, "Vida "+ "("+string(vida_atual)+")")
    draw_set_font(-1)
}
#endregion


#region Metodos que tira vida
disparo_comum_player = function()
{
     var dano_a = instance_place(x, y, global.projetil.instancia)
    if instance_exists(global.projetil.instancia)
    {
    if dano_a != noone
    {
         with (dano_a)
    {
        instance_destroy()
    }
        controla_vida.perde_vida(global.projetil.dano_atual)
        var temp  = instance_create_layer(x+5, y-5,"ENEMY", obj_cont_dano)
        temp.txtCura = global.projetil.dano_atual
        temp.cor = choose(c_white, c_blue, c_red, c_green)
        temp.fonte = fnt_dano
    }
    }
}

dano_chamas_player = function()
{
    
    var _dano = place_meeting(x, y, lista_perde_vida)
    
    if instance_exists(lista_perde_vida[0]) 
    {  chamas_cronometro++;
        
       if _dano and (chamas_cronometro >= chamas_tempo)
       {
            var damage = 5
            
            controla_vida.perde_vida(damage)
            var temp  = instance_create_layer(x+5, y-5,"ENEMY", obj_cont_dano)
            temp.txtCura = damage
            temp.cor = choose(c_white, c_blue, c_red, c_green)
            temp.fonte = fnt_dano
            
           chamas_cronometro = 0; 
       }   
    }
    
} 
#endregion

#region SE DESTRUINDO QUANDO VIDA CHEG A 0
destruir = function()
{
    if controla_vida.vida == 0
    {
        instance_destroy()
    }
}
#endregion



#endregion


inicia_estado(estado_inicial)