# チーム作成
team add Red "赤チーム"
team modify Red color red
team modify Red friendlyFire false
team add Blue "青チーム"
team modify Blue color blue
team modify Blue friendlyFire false

# スコアボード
scoreboard objectives add team_count dummy
scoreboard players set #oni_count team_count 1

say team_ok