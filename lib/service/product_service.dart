import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ferisoft/constant/http_constants.dart';
import 'package:ferisoft/model/product_model.dart';
import 'package:ferisoft/service/base_service.dart';

class ProductService extends BaseService {
  Future<List<ProductModel>> getProducts() async {
    var url = HttpConstants.product;

    Response resp = await createDio().get(url);
    var data = jsonDecode(resp.data);
    return ((data) as List)
        .map((product) => ProductModel.fromJson(product))
        .toList();
  }

  Future<List<ProductModel>> getProductsByCategoryId(String id) async {
    var url = HttpConstants.getProductsByCategoryId;
    url = url + "/$id";
    Response resp = await createDio().get(url);
    var data = jsonDecode(resp.data);
    return ((data) as List)
        .map((product) => ProductModel.fromJson(product))
        .toList();
  }
}
