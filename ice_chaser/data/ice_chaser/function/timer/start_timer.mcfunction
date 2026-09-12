# config_time2tick
scoreboard players operation #time tm_timer = #config_time tm_seconds
scoreboard players operation #time tm_timer *= #20 tm_seconds
# ボスバー設定
scoreboard players operation #max_time tm_timer = #time tm_timer
execute store result bossbar timer:bar max run scoreboard players get #max_time tm_timer

bossbar set timer:bar players @a
bossbar set timer:bar visible true
scoreboard players set #game tm_state 1

# title スタート
title @a title {"text":"START!","color":"green"}
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1 1