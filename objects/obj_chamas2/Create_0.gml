estado_1 = new estado();
estado_2 = new estado();
estado_3 = new estado();
estado_4 = new estado();

vel = global.vel_chamas

#region Etagio 1
estado_1.inicia = function()
{
   vspeed = -vel
    hspeed = 0
}

estado_1.roda = function()
{
    if (y <= (obj_level.y - 30))
    {
        troca_estado(estado_2)
    }
}
#endregion

#region Estagio 2
estado_2.inicia = function()
{
    vspeed = 0
    hspeed = vel
}

estado_2.roda = function()
{
    if (x >= (obj_level.x + 30))
    {
        troca_estado(estado_3)
    }
}
#endregion

#region Estagio 3
estado_3.inicia = function()
{
    hspeed = 0
    vspeed = vel
} 

estado_3.roda = function()
{
    if (y >= (obj_level.y + 30))
    {
        troca_estado(estado_4)
    }
}
#endregion

#region Estagio 4
estado_4.inicia = function()
{
    vspeed = 0
    hspeed = -vel
} 

estado_4.roda = function()
{
   if (x <= (obj_level.x - 30))
    {
        troca_estado(estado_1)
    }
}
#endregion


#endregion



inicia_estado(estado_1)