extends Control

@onready var income_base_menu = $MarginContainer/HBoxContainer/vbox/IncomePanel/MarginContainer/BaseMenu;
@onready var income_check_menu = $MarginContainer/HBoxContainer/vbox/IncomePanel/MarginContainer/CheckMenu;

@onready var bills_add_name_box = $MarginContainer/HBoxContainer/vbox/BillsPanel/BillName
@onready var bills_add_amount_box = $MarginContainer/HBoxContainer/vbox/BillsPanel/BillAmount
@onready var bills_list = $MarginContainer/HBoxContainer/Panel2/MarginContainer/VBoxContainer/VBoxContainer

@export var bill_label_template = preload("res://scenes/finances/random_label.tscn");

func _on_add_check_pressed():
	income_base_menu.hide();
	income_check_menu.show();

func _on_enter_check_pressed():
	income_base_menu.show();
	income_check_menu.hide();


func _on_enter_bill_pressed():
	var bill_name = bills_add_name_box.text;
	var bill_amount = bills_add_amount_box.text;
	if bill_name.replace("\\s", "") != "":
		if bill_amount.replace("\\s", "") != "":
			var bill;
			if not Finances.bills_dictionary.has(bill_name):
				Finances.bills_dictionary[bill_name] = {};
			bill = Finances.bills_dictionary[bill_name];
			bill["amount"] = bill_amount.to_int();
	update_bill_list();


func update_bill_list():
	for child in bills_list.get_children():
		child.queue_free();
	for bill_name in Finances.bills_dictionary.keys():
		var bill_amount = Finances.bills_dictionary[bill_name]["amount"];
		var new_bill_label = bill_label_template.instantiate();
		new_bill_label.labels["BillName"] = bill_name;
		new_bill_label.labels["BillAmount"] = bill_amount;
		bills_list.add_child(new_bill_label);



