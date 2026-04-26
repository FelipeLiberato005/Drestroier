 

for (i = 0; i < array_length(ataques); i++)
{
        _x = 40
        _y = 60 + (i * 20)
        if ocultar == false
        {
            draw_set_font(fnt_introducao)
            draw_text(_x, _y, ataques[i])
            draw_set_font(-1)    
        }
        
}