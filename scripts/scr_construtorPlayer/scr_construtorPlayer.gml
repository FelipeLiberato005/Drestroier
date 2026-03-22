#region Construtor de personagem
function cria_personagem (
                            _inst,
                            _projetil,
                            _vida,
    
                            ) constructor {
    
    //OBJETO DO PLAYER
    instancia = _inst
    
    
    //VIDA
    vida_base = _vida
    vida_atual = _vida
    
    //PROJETIL
    projetil = _projetil
    
    //HABILIDADES CONQUISTADAS PELO PLAYER
    habilidades = []
    
    //STATUS DO PLAYER. EXEMPLO = CONGELADO (NÃO PODE ATIRAR)
    //BUFFS E DEBUFFS
    status = []
}

#endregion

#region PLAYER
var player = new cria_personagem(
    obj_player,
    obj_projetil_azul,
    100
)

#endregion

#endregion

global.player = [player]
