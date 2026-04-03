colision_list = ds_list_create();//lista colisão
hitbox_list = ds_list_create();//losta obj ja verificados
var bati = instance_place_list(x, y, obj_enemy_test, colision_list, false)

if(bati > 0)
{
	for(var i = 0;i < ds_list_size(colision_list); i++){
	
			var target = colision_list[| i];
			if(!ds_list_find_value(hitbox_list,target)){
			
				ds_list_add(hitbox_list,target)
				with(target){
				    
                    if target.imune == false{
                        vida_atual -= obj_player.dano_atual	
                        target.imune = true;
                    }
                    		
				}
			}
			
	}
}