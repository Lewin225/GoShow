tool
extends Node

enum GraphNodeCategories{Math, Rendering, Colour, Inputs, Outputs}
enum GraphDataType{Float, Boolean, Vec3, Vec3Array, Texture2D} 
var GraphDataColors = [
  Color('#97dfff') #Float
, Color('#e52557') #Boolean
, Color('#74ba4f') #Vector3
, Color('#36ba75') #Vec3Array
, Color.orange     #Texture2D
] 


var PROPERTYLIST_SCRIPT_VARIABLE = 8192
var PROPERTYLIST_EXPORT_VARIABLE = 8199
