

import 'dart:convert';

import '../productmodel/productmodel.dart';

OrderModel orderModelFromJson(String str)=>
    OrderModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data)=>json.encode(data.toJson());


class OrderModel {
  OrderModel({
    required this.totalPrice,
    required this.orderId,
    required this.payment,
    required this.products,
    required this.status,
  });

  String payment;
  String status;

  List<ProductModel> products;
  double totalPrice;
  String orderId;

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> productMap = json["products"];
    return OrderModel(
        orderId: json["orderId"],
        products: productMap.map((e) => ProductModel.fromJson(e)).toList(),
        totalPrice: json["totalPrice"],
        status: json["status"],
        payment: json["payment"]);
  }
  Map<String,dynamic> toJson()=> {
    "id":orderId,
    "payment":payment,
    "products":products,
    "status":status,
    "totalprice":totalPrice,

  };

  OrderModel copyWith({
    int? qty,
  })=>

      OrderModel(
        orderId: orderId,
        payment:payment,
        products:products,
        status:status,
         totalPrice: totalPrice,

      );

}






