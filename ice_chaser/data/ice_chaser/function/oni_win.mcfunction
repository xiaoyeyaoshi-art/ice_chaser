# ゲーム終了設定
scoreboard players set #game tm_state 0
bossbar set timer:bar visible false

execute as @a[tag=ice_placed] at @s run fill ~ ~ ~ ~ ~1 ~ minecraft:air
tp @a 9 92 -198
effect clear @a
tag @a remove frozen
tag @a remove ice_placed

# 結果発表
title @a title {"text":"鬼の勝利！","color":"red","bold":true}
title @a subtitle {"text":"逃げ役が全員氷になりました","color":"gray"}
execute as @a at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 0.5 1 1

team leave @a
kill @e[type=armor_stand,tag=frozen_anchor]
kill @e[type=block_display,tag=frozen_anchor]
tag @a remove frozen
tag @a remove ice_placed
stopsound @a record