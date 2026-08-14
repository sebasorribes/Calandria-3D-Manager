class_name ActivesOrdersManager;
extends Control


# metodo para crear ordenes, otro para mostrarlas. Más adelante conectar con base de datos y que mostrarlas se haga desde la base de datos y lo demas conecte a la base tambien
# por ahora crear ordenes fijas y mostrarlas por un metodo fijo, despues agregar la interfaz y la posibilidad de crear, modificar y eliminar a mano.
# crear clase para manejar los unix time con metodos que devuelvan las fechas que necesito en string y las guarde sin tener que repetir codigo

var orders : Dictionary;

@onready var screen := $ActiveOrdersScreen;

func _ready() -> void:
	orders = {};
	CreateOrders();
	ShowOrders();

func CreateOrders() -> void:
	var auxID : String;
	var auxOrder : Order;
	
	auxID = CreateIDs();
	auxOrder = Order.new(auxID,"Juan","dispenser escarbadientes negro con detalles dorados",5000, RandomDay(),"5000asde_sdfs_sad5_15we_159asd84a65w",false,false);
	orders[auxOrder.ID] = auxOrder;
	
	auxID = CreateIDs();
	auxOrder = Order.new(auxID,"Carlos", "pikachu con capa de charizard",7500, RandomDay(),"5000asde_sdfs_sad5_15we_159asd84re5w",true,false);
	orders[auxOrder.ID] = auxOrder;
	
	auxID = CreateIDs();
	auxOrder = Order.new(auxID,"Mariela", "2 dispensadores escarbadientes de Boca",10000, RandomDay(),"502dasde_sdfs_sad5_15we_159asd84a65w",false,false);
	orders[auxOrder.ID] = auxOrder;

func CreateIDs() -> String:
	var auxID = GenerateUuidStandar();
	
	while(orders.find_key(auxID) != null):
		auxID = GenerateUuidStandar();
	
	return auxID;

func GenerateUuidStandar() -> String:
	var crypto = Crypto.new()
	var hex = crypto.generate_random_bytes(16).hex_encode()
	
	var part1 = hex.substr(0, 8)
	var part2 = hex.substr(8, 4)
	var part3 = hex.substr(12, 4)
	var part4 = hex.substr(16, 4)
	var part5 = hex.substr(20, 12)
	
	return "%s-%s-%s-%s-%s" % [part1, part2, part3, part4, part5]

func RandomDay() -> int:
	var randomDay = randi_range(1,31);
	var auxDict = {
		"Year": 2026,
		"Month": 8,
		"day": randomDay,
		"hour": 0,
		"minute": 0,
		"second": 0
	}
	return Time.get_unix_time_from_datetime_dict(auxDict);

func ShowOrders() ->  void:
	for order in orders.values():
		var auxDictDay =  Time.get_datetime_dict_from_unix_time(order.estipulatedDeliveredDay);
		var stringDay = "%s - %s - %s" % [auxDictDay["day"],auxDictDay["month"],auxDictDay["year"]]
		var auxData = [
			order.clientName, order.productDescription, str(order.checkAmount), 
			stringDay, order.productID, 
			str(order.delivered), str(order.paid)
			];
		
		for i in range(screen.get_child_count()):
			var auxLabel = Label.new();
			auxLabel.text = auxData[i];
			auxLabel.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER;
			screen.get_child(i).add_child(auxLabel);
