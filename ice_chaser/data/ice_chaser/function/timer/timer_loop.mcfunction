# ボスバーをカウントダウン
scoreboard players remove #time tm_timer 1
execute store result bossbar timer:bar value run scoreboard players get #time tm_timer

# tick2second
scoreboard players operation #display_sec tm_seconds = #time tm_timer
scoreboard players operation #display_sec tm_seconds /= #20 tm_seconds

# 分
scoreboard players operation #min tm_seconds = #display_sec tm_seconds
scoreboard players operation #min tm_seconds /= #60 tm_seconds

# 秒
scoreboard players operation #sec tm_seconds = #display_sec tm_seconds
scoreboard players operation #sec tm_seconds %= #60 tm_seconds

# 残り時間: ○分 ○秒と表示
bossbar set timer:bar name [{"text":"残り時間: "},{"score":{"name":"#min","objective":"tm_seconds"},"color":"gold"},{"text":"分 "},{"score":{"name":"#sec","objective":"tm_seconds"},"color":"gold"},{"text":"秒"}]

# 終了処理
execute if score #time tm_timer matches ..0 run function ice_chaser:timer/stop_timer