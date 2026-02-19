import 'dart:convert';
import 'dart:developer';
import 'package:book_your_taxi/common/app_secrets.dart';
import 'package:book_your_taxi/service/api_service.dart';
import 'package:dio/src/response.dart';
import '../../../models/common/place_model.dart';
import '../../../service/api_constant/api_constant.dart';

class SearchRepository extends ApiCall {
  Future<List<PlaceModel>> searchAddress({
    required double latitude,
    required double longitude,
    int radius = 2000,
  }) async {
    try {
      const String endPoint = ApiConstant.searchAddress;

      final query = {
        "query": "user address",
        "location": "$latitude,$longitude",
        "radius": radius,
        "key": AppSecrets.googleKEY,
      };

      Response response = await getRequest(
        endPoint: endPoint,
        queryParameters: query,
      );
      log('Response===:${response.data.toString()}');

      final data = jsonDecode(response.data);

      return (data["results"] as List)
          .map((e) => PlaceModel.fromJson(e))
          .toList();
    } catch (e) {
      log('Error===:${e.toString()}');
      return [];
    }
  }
}
