
function cria_habilidade(
                        _nome,
                        _instancia,
                        _dano
) constructor 
{
    nome = _nome
    
    objeto_hab = _instancia
    
    dano = _dano
    
}


global.chamas = new cria_habilidade(
    "Chamas",
    obj_chamas,
    5
)


