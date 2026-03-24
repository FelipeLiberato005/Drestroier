#region LISTAS / VARIAVEIS
image_xscale = 0.5
image_yscale = image_xscale

habilidade = []
velh = 0
velv = 0
vel = 1

max_vida = 100;
vida  = max_vida;
controla_vida = new scr_vida(max_vida)

atirar = noone;

dir = 0;

estado_idle = new estado()
estado_run = new estado()
estado_habilidade_1 = new estado()

//VARIAVEIS CONTROLE    
right = noone
left = noone
up = noone
down = noone
hab_1 = noone
#endregion


#region MAQUINA DE ESTADOS
#region ESTADO IDLE 
estado_idle.inicia = function()
{
    velh = 0
    velv = 0
    
    var _sprite = define_sprite(dir, spr_player_idle_side, spr_player_idle_front, spr_player_idle_back)
    
    sprite_index = _sprite
}

estado_idle.roda = function()
{
    
    if (right xor left or down xor up)
    {
        troca_estado(estado_run)
    }
    
}
#endregion

#region ESTADO RUN
estado_run.inicia = function()
{
     dir     = (point_direction(0, 0, right - left, down - up) div 90);
    
    
    
    sprite_index = define_sprite(dir, spr_player_idle_side, spr_player_idle_front, spr_player_idle_back)
    
    image_index = 0;
}

estado_run.roda = function()
{

    dir    = (point_direction(0, 0, velh, velv) div 90);
    
    
    //Ajustando o lado
    if velh != 0
    {
        image_xscale = sign(velh)
    }

    sprite_index = define_sprite(dir, spr_player_idle_side, spr_player_idle_front, spr_player_idle_back)
    
    velh = (right - left) * vel
    velv = (down - up) * vel
    
    if velh == 0 and velv == 0
    {
        troca_estado(estado_idle)
    }
    
    if hab_1
    {
        troca_estado(estado_habilidade_1)
    }
}
#endregion

#region HABILIDADE 1
estado_habilidade_1.inicia = function()
{
    
    image_blend = c_green
}

estado_habilidade_1.roda = function()
{
    //velh = 0
    //velv = 0
    
    if !hab_1
    {
        troca_estado(estado_idle)
    }
}
#endregion
#endregion

global.projetil = global.bala_comum

#region BUFFS VARIAVEIS 
aplicou_buff = false
tempo_buff = room_speed * 2
cronometro_buff = 0
 vezes = 0
criou_instancia = false
instancia_buff = room_speed * 2
cronometro_inst = 0
#endregion

controle = function()
{
    left        = keyboard_check(ord("A"))
    right       = keyboard_check(ord("D"))
    up          = keyboard_check(ord("W"))
    down        = keyboard_check(ord("S"))
    atirar      = mouse_check_button_pressed(mb_left)
    hab_1       = keyboard_check(ord("O"))
}

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
        projetil.image_xscale   = 0.05
        projetil.image_yscale   = projetil.image_xscale
        
        
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
                var a = instance_create_layer(x, y - 10, "PLAYER", obj_chamas)
                var b = instance_create_layer(x - 10, y, "PLAYER", obj_chamas2)
                var c = instance_create_layer(x + 10, y, "PLAYER", obj_chamas3)
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






inicia_estado(estado_idle)