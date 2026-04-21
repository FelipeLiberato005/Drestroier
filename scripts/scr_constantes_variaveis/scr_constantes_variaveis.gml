
global.vel_chamas = 2.5

global.debug = false


function define_sprite(_dir = 0, _sprite_side, _sprite_front, _sprite_back)
{
    var _sprite;
    
    switch (_dir) {
        case 0: _sprite = _sprite_side; break;
        case 1: _sprite = _sprite_back; break;
        case 2: _sprite = _sprite_side; break;
        case 3: _sprite = _sprite_front; break;
    	
    }
    
    return _sprite;
}