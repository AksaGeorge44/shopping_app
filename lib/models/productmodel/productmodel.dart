import 'dart:convert';

ProductModel productModelFromJson(String str)=>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data)=>json.encode(data.toJson());

class ProductModel{
  ProductModel (
  {

 required this.id,
  required this.name,
    required this.description,
    required this.image,
    required this.isFavourite,
    required this.price,
    required this.status, required qty,
  }
);
  String image;
  String id;
  bool isFavourite;
  String name;
  String price;
  String description;
  String status;
  int?qty;

  factory ProductModel.fromJson(Map<String,dynamic>json)=>ProductModel(
    id:json["id"],
    name:json["name"],
    description:json["description"],
    image:json["image"],
    isFavourite:false,
    qty:json["qty"],
    price:json["price"],
    status:json["status"],

);

  Map<String,dynamic> toJson()=> {
    "id":id,
    "name":name,
    "image":image,
    "description":description,
    "isFavourite":isFavourite,
    "price":price,
    "status":status,
    "qty":qty,

};

  ProductModel copyWith({
     int? qty,
})=>

    ProductModel(
        id: id,
        name: name,
        description: description,
        image: image,
        isFavourite: isFavourite,
        price: price,
        status: status,
       qty: qty??this.qty,

    );

}