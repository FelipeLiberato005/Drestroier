#region LISTAS / VARIAVEIS

image_xscale = 0.2
image_yscale = image_xscale

habilidade = []

max_vida = 100;
vida  = max_vida;
controla_vida = new scr_vida(max_vida)

atirar = noone;



global.projetil = global.bala_comum

#region BUFFS
aplicou_buff = false
tempo_buff = room_speed * 2
cronometro_buff = 0
 vezes = 0
criou_instancia = false
instancia_buff = room_speed * 2
cronometro_inst = 0
#endregion

#endregion





#region METODOS
usando_habilidade_1 = function(balas)
{
    var info = global.player[0]
    
    if atirar
    {
        var projetil = instance_create_layer(x, y, "PROJETIL", balas.instancia)     
        projetil.direction      =   point_direction(x, y, mouse_x, mouse_y)
        projetil.image_angle    =   projetil.direction;    
        projetil.speed          = 2; 
        projetil.image_xscale   = 0.2
        projetil.image_yscale   = projetil.image_xscale
        
        
}
}

troca_tiro = function()
{
    if keyboard_check(vk_right)
    {
        global.projetil = global.bala_comum
    }
    else if keyboard_check(vk_left)
    {
        global.projetil = global.bala_azul
    }
}


cria_buff = function(_nome, _valor)
{
    return {
        nome: _nome,
        valor: _valor,      
    };
}

aplica_buff = function()
{
    var _chamas = cria_buff("Chamas", 5)
    if keyboard_check(ord("F"))
    {
        if aplicou_buff == false
        { 
            array_push(habilidade, _chamas)
            aplicou_buff = true
        }
    }  
}

coldown_buff = function()
{
    if aplicou_buff == true
    {
        cronometro_buff++;
        
        if cronometro_buff >= tempo_buff
        {
            aplicou_buff = false
            cronometro_buff = 0
        }
    }
    else
    {
        cronometro_buff = 0;
    }
    
}

function cria_chamas()
{
   
    for (var i = 0; i < array_length(habilidade);i++) {
      var _hab = habilidade[i]
       
      
      
          
      if criou_instancia == false and vezes = 0
      {
           if _hab.nome == "Chamas"
           {
                criou_instancia = true
                var a = instance_create_layer(x, y - 30, "PLAYER", obj_chamas)
                var b = instance_create_layer(x - 30, y, "PLAYER", obj_chamas2)
                var c = instance_create_layer(x + 30, y, "PLAYER", obj_chamas3)
                vezes++;
            }
        }
    }
}

instancia_coldown = function()
{
    
     if criou_instancia == true
    {
        cronometro_inst++;
        
        if cronometro_inst >= instancia_buff
        {
            criou_instancia = false
            cronometro_inst = 0
        }
    }
    else
    {
        cronometro_buff = 0
    }
    
}
#endregion
