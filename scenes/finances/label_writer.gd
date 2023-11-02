extends Node


# When instantiating a scene with this script, add an entry to this dictionary
# for each label you wish to change the text of, with each entry's key being
# the name of the label node and the value being the String to set its text to
var labels: Dictionary = {};

# Array that contains all of the labels in this scene
var labelNodes: Array = [];


func _ready():
	get_all_label_nodes_from_children(self);
	for key in labels.keys():
		for node in labelNodes:
			if node.name == key:
				node.text = str(labels[key]);

# Recursive method that searches entire scene for Label nodes and
# adds them to the labelNodes array
func get_all_label_nodes_from_children(initialParent: Node):
	for child in initialParent.get_children():
		if child is Label:
			labelNodes.push_front(child);
		elif child.get_child_count() > 0:
			get_all_label_nodes_from_children(child);
