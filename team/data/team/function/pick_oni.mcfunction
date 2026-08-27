# ループ
execute as @r[tag=in_lobby] run team join Red @s
execute as @r[tag=in_lobby] run tag @s remove in_lobby
scoreboard players remove #loop team_count 1
execute if score #loop team_count matches 1.. run function team:pick_oni