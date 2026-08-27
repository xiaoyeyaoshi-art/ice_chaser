# ボスバーの作成
bossbar add timer:bar "残り時間"
bossbar set timer:bar color green
bossbar set timer:bar style progress
bossbar set timer:bar players @a
bossbar set timer:bar visible false

# スコアボードの作成
scoreboard objectives add tm_timer dummy "tick"
scoreboard objectives add tm_seconds dummy "秒"
scoreboard objectives add tm_state dummy "状態"

# 計算用定数(1秒20tick)
scoreboard players set #60 tm_seconds 60
scoreboard players set #20 tm_seconds 20

# タイマー初期値
execute unless score #config_time tm_seconds matches 1.. run scoreboard players set #config_time tm_seconds 300

# test
say timer_ok