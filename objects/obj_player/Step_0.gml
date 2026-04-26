x = round(x);
y = round(y);

depth = -y
controle()
roda_estado()
coldown_ataque()

fica_imune()
perde_vida()


if (!can_dash)
{
    dash_cooldown--;
    
    if (dash_cooldown <= 0)
    {
        can_dash = true;
    }
}
