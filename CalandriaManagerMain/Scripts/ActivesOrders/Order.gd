class_name Order;
extends Node

var ID : String;
var clientName : String;
var productDescription : String;
var checkAmount : float;
var estipulatedDeliveredDay : int; #investigar lo de time unix
var productID : String; #ID por el momento;
var delivered : bool;
var paid : bool;

func _init(_ID : String, _clientName : String, _productDescription : String, _checkAmount : float, _estipulatedDay : int, _productID : String, _delivered : bool, _paid : bool) -> void:
	ID = _ID;
	clientName = _clientName;
	productDescription = _productDescription;
	checkAmount = _checkAmount;
	estipulatedDeliveredDay = _estipulatedDay;
	productID = _productID;
	delivered = _delivered;
	paid = _paid;
