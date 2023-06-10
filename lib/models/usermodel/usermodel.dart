import 'dart:convert';


UserModel userModelFromJson(String str)=>
    UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data)=>json.encode(data.toJson());

class UserModel{
  UserModel (
      {

        required this.id,
        required this.name,
         this.image,
        required this.email,
      }
      );
  String? image;
  String id;
  String name;
  String email;

  factory UserModel.fromJson(Map<String,dynamic>json)=>UserModel(
    id:json["id"],
    name:json["name"],
    image:json["image"],
    email:json["email"],

  );

  Map<String,dynamic> toJson()=> {
    "id":id,
    "name":name,
    "image":image,
    "email":email,

  };
  UserModel copyWith({
    String?name,image,
  })=>

      UserModel(
        id: id,
        name: name??this.name,
        image: image??this.image,
        email: email,

      );




}