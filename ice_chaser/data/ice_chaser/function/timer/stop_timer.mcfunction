#逃げ役勝利判定
execute if score #game tm_state matches 1 if entity @a[team=Blue,tag=!frozen] run function ice_chaser:runner_win

# 特にいうことはない終了処理
scoreboard players set #game tm_state 0
bossbar set timer:bar visible false

