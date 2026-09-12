# ループ
execute as @r[tag=in_lobby1] run function ice_chaser:team/assign_oni

scoreboard players remove #loop team_count 1
execute if score #loop team_count matches 1.. run function ice_chaser:team/pick_oni