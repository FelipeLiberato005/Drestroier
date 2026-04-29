
roda_estado()
imunidade()
sofri_dano()
//mostra_dano()



if controla_vida.vida <= 0
{
    var room_name = room_get_name(room);

// cria lista se não existir
    if (!ds_map_exists(global.inimigos_mortos, room_name)) {
        global.inimigos_mortos[? room_name] = ds_list_create();
    }

// pega a lista
    var lista = global.inimigos_mortos[? room_name];

// salva o inimigo morto
    ds_list_add(lista, enemy_id);

// destrói o inimigo
    instance_destroy();
}

