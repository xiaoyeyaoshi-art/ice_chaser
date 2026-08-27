# 特にいうことはない終了処理
scoreboard players set #game tm_state 0
bossbar set timer:bar visible false
title @a title {"text":"TIME UP!","color":"gold"}
playsound entity.player.levelup master @a ~ ~ ~ 1 0.5 1

