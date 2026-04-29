var room_name = room_get_name(room);

if (!variable_instance_exists(self, "enemy_id")) exit;
if (ds_map_exists(global.inimigos_mortos, room_name)) {
    var lista = global.inimigos_mortos[? room_name];
    
    if (ds_list_find_index(lista, enemy_id) != -1) {
        instance_destroy();
    }
}