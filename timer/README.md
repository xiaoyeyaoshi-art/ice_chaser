タイマーモジュール

ボスバーに「残り時間：〇分　〇秒」と表示しカウントダウンさせる汎用タイマー

タイマーの操作:
# /function timer:start_timer : タイマーを開始
# /function timer:stop_timer  : タイマーを強制停止

制限時間の変更:
# scoreboard players set #config_time tm_seconds 任意の秒数（ｓ） (初期値: 300秒)



==変数メモ==
config_time tm_seconds : 設定した制限時間（秒）←ここを変更している
time tm_timer          : 実際の内部タイマー　config_timeから取得
game tm_state          : タイマーの作動状態（0: 停止 / 1: 作動中）

timer:bar              : ボスバーのID