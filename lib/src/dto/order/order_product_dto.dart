import 'dart:convert';

import '../../models/product_model.dart';

class OrderProductDto {
  final ProductModel product;
  final int amount;
  final double totalPrice;
  
  OrderProductDto({
    required this.product,
    required this.amount,
    required this.totalPrice,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'product': product.toMap()});
    result.addAll({'amount': amount});
    result.addAll({'totalPrice': totalPrice});
  
    return result;
  }

  factory OrderProductDto.fromMap(Map<String, dynamic> map) {
    return OrderProductDto(
      product: ProductModel.fromMap(map['product']),
      amount: map['amount']?.toInt() ?? 0,
      totalPrice: map['totalPrice']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderProductDto.fromJson(String source) => OrderProductDto.fromMap(json.decode(source));
}
