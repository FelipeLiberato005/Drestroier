
function cria_projetil (    
                            _nome,
                            _inst,
                            _dano
    
                            ) constructor {
    
    nome = _nome
    
    //OBJETO DO PLAYER
    instancia = _inst
    
    
    dano_base = _dano
    dano_atual = _dano
    
    //HABILIDADES CONQUISTADAS PELO PLAYER
    habilidades = []

}



global.bala_comum = new cria_projetil(
    "Bala comum",
    obj_projetil_comum,
    5
)

global.bala_azul = new cria_projetil(
    "Bala azul",
    obj_projetil_azul,
    15
)