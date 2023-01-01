import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ferisoft/constant/http_constants.dart';
import 'package:ferisoft/model/category_model.dart';
import 'package:ferisoft/service/base_service.dart';

class CategoryService extends BaseService {
  Future<List<CategoryModel>> getCategories() async {
    var url = HttpConstants.category;

    Response resp = await createDio().get(url);
    var data = jsonDecode(resp.data);
    return ((data) as List)
        .map((category) => CategoryModel.fromJson(category))
        .toList();
  }
}
