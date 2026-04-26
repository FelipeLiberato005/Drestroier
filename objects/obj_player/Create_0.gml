#region LISTAS / VARIAVEIS


habilidade                      = []
velh                            = 0
velv                            = 0
vel                             = 1

max_vida                        = 100;
vida                            = max_vida;
controla_vida                   = new scr_vida(max_vida)

dano_base                       = 15
dano_atual                      = dano_base

atirar                          = noone;

dir                             = 0;

lista_colisoes                  = [obj_colisor]

estado_idle                     = new estado()
estado_run                      = new estado()
estado_habilidade_1             = new estado()
estado_atack                    = new estado()
estado_dash                     = new estado()

//VARIAVEIS CONTROLE    
right                   = noone
left                    = noone
up                      = noone
down                    = noone
hab_1                   = noone
atack                   = noone
dash                    = noone


//DASH
can_dash                = true;
dash_timer = 0;
dash_duracao = 10;

dash_speed = 0;
dash_dir = 0;
dash_cooldown = 0;

ativa_ataque            = room_speed * 0.3;
recarga_ataque          = 0
atacou                  = false

imune                   = false;
tempo_imune             = room_speed * 2.5
coldown_imune           = 0
#endregion


#region MAQUINA DE ESTADOS


#region ESTADO IDLE 
estado_idle.inicia = function()
{
    velh = 0
    velv = 0
    
    var _sprite = define_sprite(dir, spr_pmago_idle_side, spr_pmago_idle_front, spr_pmago_idle_back)
    
    sprite_index = _sprite
}

estado_idle.roda = function()
{
    dir     = (point_direction(0, 0, right - left, down - up) div 90);
    
    if (right xor left or down xor up)
    {
        troca_estado(estado_run)
    }
    
    if atack and atacou == false
    {
        troca_estado(estado_atack)
    }
}
#endregion






#region ESTADO RUN
estado_run.inicia = function()
{
     
    
    sprite_index = define_sprite(dir, spr_mago_run_side, spr_mago_run_front, spr_mago_run_back)
    
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

    sprite_index = define_sprite(dir, spr_mago_run_side, spr_mago_run_front, spr_mago_run_back)
    
        
    
    if (right != left) {
    velh = (right - left) * vel;
    velv = 0;
    }
    else if (down != up) {
        velv = (down - up) * vel;
        velh = 0;
    }
    else {
        velh = 0;
        velv = 0;
    }
    
    
    //VOLTANDO PARA IDLE    
    if velh == 0 and velv == 0
    {
        troca_estado(estado_idle)
    }
    
    
    //ATAQUE
    if atack and atacou == false
    {
        troca_estado(estado_atack)
    }
    
    
    
    
    //DASH
    if dash && can_dash == true
    {
        troca_estado(estado_dash)
    }
}
#endregion





#region ESTADO ATACK
estado_atack.inicia = function()
{
     dir     = (point_direction(0, 0, right - left, down - up) div 90);
    
     sprite_index = define_sprite(dir, spr_mago_atack_side, spr_mago_atack_front, spr_mago_atack_back)
    
    if sprite_index == spr_mago_atack_front
    {
        instance_create_layer(x - 25, y - 5, "PLAYER" ,obj_hitbox) 
        atacou = true;   
        
    }    
    else if sprite_index == spr_mago_atack_back
    {
        instance_create_layer(x - 25, bbox_top - 25, "PLAYER" , obj_hitbox_back)
        atacou = true;    
    }    
    else if sprite_index == spr_mago_atack_side and velh > 0
    {
        
        instance_create_layer(x + 2, y - 12 , "PLAYER" , obj_hitbox_side_right)  
        atacou = true;
    }
    else if sprite_index == spr_mago_atack_side and velh < 0
    {
        instance_create_layer(x - 24, y - 12 , "PLAYER" , obj_hitbox_side_left)  
        atacou = true;
    }
        
    
    
    
     image_index = 0;
}

estado_atack.roda = function()
{
    
    velh = 0
    velv = 0
    //Ajustando o lado
     
    
    
    if image_index >= image_number - 0.2
    {
        troca_estado(estado_idle)
    }
}
#endregion


#region Dash

estado_dash.inicia = function()
{
    image_blend = c_aqua;
    
    dash_cooldown = 30; // meio segundo (ajuste)
    can_dash = false;
    
    dash_timer = dash_duracao;
    dash_speed = 5;
    
    // pega direção baseada no input atual
    dash_dir = point_direction(0, 0, right - left, down - up);
    
    // fallback caso não esteja apertando nada
    var h = right - left;
    var v = down - up;

       // trava diagonal
    if (h != 0) {
        v = 0;
    }
    else if (v != 0) {
        h = 0;
    }
    
       // fallback (se não tiver input)
    if (h == 0 && v == 0) {
        h = sign(velh);
        v = sign(velv);
    }

dash_dir = point_direction(0, 0, h, v);
}




estado_dash.roda = function()
{
    // aplica velocidade
    velh = lengthdir_x(dash_speed, dash_dir);
    velv = lengthdir_y(dash_speed, dash_dir);
    
    // desaceleração suave
    dash_speed *= 0.85;
    
    dash_timer--;
    
    with (instance_create_depth(x,y,depth+1,obj_efeitodash))
		{
			sprite_index = other.sprite_index
			image_blend = make_colour_rgb(100, 100, 100)
			image_alpha = 0.7;
		}
    
    if (dash_timer <= 0)
    {
        troca_estado(estado_run);
    }
}

#endregion


#endregion





#region BUFFS VARIAVEIS 
aplicou_buff = false
tempo_buff = room_speed * 2
cronometro_buff = 0
 vezes = 0
criou_instancia = false
instancia_buff = room_speed * 2
cronometro_inst = 0
#endregion





#region METODOS

controle = function()
{
    left        = keyboard_check(ord("A"))
    right       = keyboard_check(ord("D"))
    up          = keyboard_check(ord("W"))
    down        = keyboard_check(ord("S"))
    atack       = mouse_check_button_pressed(mb_left)
    hab_1       = keyboard_check(ord("O"))
    dash        = mouse_check_button_pressed(mb_right)
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


corrigindo_mov = function()
{
    var h = right - left
    var v = down - up

// normaliza o vetor
var len = point_distance(0, 0, h, v);

if (len > 0)
{
	h /= len;
	v /= len;
}

move_and_collide(h * vel, v * vel, lista_colisoes, 12)
}

coldown_ataque = function()
{
    if atacou == true
    {
        recarga_ataque++;
        
        if recarga_ataque >= ativa_ataque
        {
            atacou = false
            recarga_ataque = 0;
        }
    }
}

perde_vida = function()
{
    var vida = instance_place(x + 5, y + 5, obj_enemy_test)
    
    if imune == false
    {
        if vida{
        imune = true;
        controla_vida.perde_vida(vida.dano_atual)
    }
    }
    
}

fica_imune = function()
{
    if imune == true
    {
        image_alpha = 0.5
        coldown_imune++
        if coldown_imune >= tempo_imune
        {
            image_alpha = 1
            imune = false
            coldown_imune = 0
        }
    }
}

#region Debug

view_player = noone;

roda_debug = function()
{
    //if (!global.debug) return;
        
    show_debug_overlay(1);
    
    view_player = dbg_view("View player", 1, 40, 100, 300, 400)
    
    dbg_watch(ref_create(self, "velv"), "velocidade Vertical")
    
    dbg_watch(ref_create(self, "velh"), "Velocidade Horizontal")
    
    dbg_slider(ref_create(self, "vel"), 0, 10, "Velocidade", 0.5)
    
}



ativa_debug = function()
{
    //if !DEBUG_MODE return;
    
    if (keyboard_check_pressed(vk_tab))
    {
        global.debug = !global.debug;
        
            //Se o jogo estiver no modo debug, vai rodar o debug
            if(global.debug)
        {
            roda_debug()
        } 
        else 
        {
            show_debug_overlay(0)
            
            if(dbg_view_exists(view_player))
            {
                dbg_view_delete(view_player)
            }
        }
    }
}


#endregion

#endregion






inicia_estado(estado_idle)