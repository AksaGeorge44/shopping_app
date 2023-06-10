import 'dart:convert';


CategoryModel categoryModelFromJson(String str)=>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data)=>json.encode(data.toJson());

class CategoryModel{
  CategoryModel (
      {

        required this.id,
        required this.name,
        required this.image,
      }
      );
  String image;
  String id;
  String name;

  factory CategoryModel.fromJson(Map<String,dynamic>json)=>CategoryModel(
    id:json["id"],
    name:json["name"],
    image:json["image"],

  );

  Map<String,dynamic> toJson()=> {
    "id":id,
    "name":name,
    "image":image,

  };


}