# リセット
kill @e[type=block_display,tag=frozen_ice]
kill @e[type=armor_stand,tag=frozen_anchor]
# BGM
stopsound @a record
playsound music_disc.lava_chicken record @a 8 242 -272 100 1

# 1. チーム・モード設定
gamemode adventure @a
function ice_chaser:team/load
function ice_chaser:team/split_team
gamerule locator_bar false

# 2. テレポート（スポーン地点の防具立てへ）
execute as @a[team=Blue] at @e[type=armor_stand,tag=blue_spawn,sort=random,limit=1] run tp @s ~ ~ ~
execute as @a[team=Red] at @e[type=armor_stand,tag=red_spawn,sort=random,limit=1] run tp @s ~ ~ ~

# 3. タイマー起動
function ice_chaser:timer/load
function ice_chaser:timer/start_timer
