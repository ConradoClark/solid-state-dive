extends Node

var gravity: float
var gravityEnabled: bool = true

var playerCanShoot: bool = false
var playerWeapon: Weapon = preload("res://scenes/weapons/default_blaster.tres") as Weapon
