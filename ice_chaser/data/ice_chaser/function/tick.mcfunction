# タイマー同期
function ice_chaser:timer/tick
execute as @a run effect give @s minecraft:saturation 1 255 true
# --- 1. ID割り振り（IDを持っていないプレイヤーにユニークな番号を付与） ---
execute as @a[tag=frozen,tag=!ice_placed] unless score @s player_id matches 1.. run scoreboard players add #next_id player_id 1
execute as @a[tag=frozen,tag=!ice_placed] unless score @s player_id matches 1.. run scoreboard players operation @s player_id = #next_id player_id

# --- 2. 凍結した瞬間：自分のIDを引き継いだ防具立て・氷を召喚 ---
execute as @a[tag=frozen,tag=!ice_placed] at @s run summon armor_stand ~ ~ ~ {Tags:["frozen_anchor"],Invisible:1b,NoGravity:1b,Marker:1b}
execute as @a[tag=frozen,tag=!ice_placed] at @s run summon block_display ~-0.5 ~ ~-0.5 {Tags:["frozen_ice"],block_state:{Name:"minecraft:ice"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.0f,2.0f,1.0f]}}

# 召喚したエンティティに自分のIDをコピー
execute as @a[tag=frozen,tag=!ice_placed] at @s run scoreboard players operation @e[type=armor_stand,tag=frozen_anchor,distance=..1,limit=1] player_id = @s player_id
execute as @a[tag=frozen,tag=!ice_placed] at @s run scoreboard players operation @e[type=block_display,tag=frozen_ice,distance=..1,limit=1] player_id = @s player_id

execute as @a[tag=frozen,tag=!ice_placed] at @s run playsound minecraft:block.glass.break master @a ~ ~ ~ 1 1.5 1
execute as @a[tag=frozen,tag=!ice_placed] run tag @s add ice_placed

# --- 3. 凍結中：【マルチ対応】自分のIDと一致する防具立てに強固にTP ＆ デバフ ---
execute as @a[tag=frozen] at @s run tp @s @e[type=armor_stand,tag=frozen_anchor,limit=1]
# ※ IDが一致する防具立てへTP
execute as @a[tag=frozen] at @s as @e[type=armor_stand,tag=frozen_anchor] if score @s player_id = @p player_id run tp @p ~ ~ ~

execute as @a[tag=frozen] run effect give @s minecraft:slowness 1 255 true
execute as @a[tag=frozen] run effect give @s minecraft:mining_fatigue 1 255 true
execute as @a[tag=frozen] run title @s actionbar {"text":"凍ってしまった！","color":"aqua"}

# --- 4. 救出（接近判定） ---
execute as @a[team=Blue,tag=!frozen] at @s run tag @a[team=Blue,tag=frozen,distance=..1.5] remove frozen

# --- 5. 救出後の後処理：【マルチ対応】自分のIDと同じ防具立て・氷だけを消す ---
execute as @a[tag=!frozen,tag=ice_placed] at @s run playsound minecraft:block.glass.break master @a ~ ~ ~ 1 1 1
execute as @a[tag=!frozen,tag=ice_placed] at @s as @e[type=armor_stand,tag=frozen_anchor] if score @s player_id = @p player_id run kill @s
execute as @a[tag=!frozen,tag=ice_placed] at @s as @e[type=block_display,tag=frozen_ice] if score @s player_id = @p player_id run kill @s

execute as @a[tag=!frozen,tag=ice_placed] run effect clear @s minecraft:slowness
execute as @a[tag=!frozen,tag=ice_placed] run effect clear @s minecraft:mining_fatigue

# --- 6. タグ初期化 ---
execute as @a[tag=!frozen,tag=ice_placed] run tag @s remove ice_placed

# 鬼の勝利判定
execute if score #game tm_state matches 1 if entity @a[team=Blue] unless entity @a[team=Blue,tag=!frozen] run function ice_chaser:oni_win