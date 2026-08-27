# リセット
team leave @a
effect clear @a minecraft:glowing

# チーム分け（鬼）
tag @a[x=0,y=-60,z=0,distance=..15] add in_lobby
scoreboard players operation #loop team_count = #oni_count team_count
execute if score #loop team_count matches 1.. run function team:pick_oni
execute as @a[tag=in_lobby] run team join Blue @s
tag @a remove in_lobby

effect give @a[team=Red] minecraft:glowing infinite 0 true
effect give @a[team=Blue] minecraft:glowing infinite 0 true

tellraw @a[team=Red] [{"text":"あなたは ","color":"white"},{"text":"鬼","color":"red","bold":true},{"text":" です！","color":"white"}]
tellraw @a[team=Blue] [{"text":"あなたは ","color":"white"},{"text":"逃げ役","color":"blue","bold":true},{"text":" です！","color":"white"}]