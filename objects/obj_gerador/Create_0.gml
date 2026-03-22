
quantidade = 100
tempo = room_speed * 1
cronometro = 0

gerar_inimigos = function()
{
    
    cronometro++;
    
    //var x_random = irandom_range(0, 640)    
    var x_random = choose(-20, 250 ,700)   
    var y_random = choose(400,  -20) 
    
   if quantidade > 0
   {    
        	if cronometro >= tempo
        {
            instance_create_layer(x_random, y_random, "ENEMY", obj_inimigo)
            cronometro = 0
            quantidade --;
        }
    }    
}