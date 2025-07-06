extends Control
var money = 0
var ativo = 1
var tempo = 1
var custo: int = 5
var custo_time: int = 15
var ganho = 1
@onready var money_label = $money
@onready var upgrade_custo = $upgrade_custo
@onready var upgrade_time = $upgrade_custo2


func _ready():
	$click.pressed.connect(_on_pressed_1)
	$upgrade.pressed.connect(_on_upgrade_ganho)
	$upgrade2.pressed.connect(_on_upgrade_time)
	custo_att()

func _on_pressed_1():
	if ativo == 1:
		ativo = 0
		money += ganho
		money_att()
		$click.disabled = true
		await get_tree().create_timer(tempo).timeout
		ativo = 1
		$click.disabled = false

func _on_upgrade_ganho():
	if money >= custo:
		money -= custo
		ganho += 1
		custo *= 1.5
	money_att()
	custo_att()

func _on_upgrade_time():
	if money >= custo_time:
		money -= custo_time
		custo_time *= 1.5
		if tempo > 0:
			tempo -= .1
		else:
			tempo = 0
	money_att()
	custo_att()

func money_att():
	money_label.set_text(str(money))

func custo_att():
	var custo_text = str("Custo = ",custo)
	var custo_text_2 = str("Custo = ",custo_time)
	upgrade_custo.set_text(str(custo_text))
	upgrade_time.set_text(str(custo_text_2))
