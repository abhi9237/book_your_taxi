import 'package:book_your_taxi/core/api_constant/api_constant.dart';
import 'package:book_your_taxi/models/response/app_error_reponse.dart';
import 'package:book_your_taxi/service/network/api_service.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  final ApiCall apiCall = ApiCall();

  Future<Response<Map<String, dynamic>>> sendOtp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiCall.postRequest<Map<String, dynamic>>(
        data: {'email': email, 'password': password},
        endPoint: ApiConstant.sendOtp,
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        throw _parseError(response.data, response.statusCode);
      }
    } on AppErrorResponse {
      rethrow;
    } catch (e) {
      throw Exception('Error sending OTP: $e');
    }
  }

  Future<Response<Map<String, dynamic>>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await apiCall.postRequest<Map<String, dynamic>>(
        data: {'email': email, 'otp': otp},
        endPoint: ApiConstant.verifyOtp,
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        throw _parseError(response.data, response.statusCode);
      }
    } on AppErrorResponse {
      rethrow;
    } catch (e) {
      throw Exception('Error sending OTP: $e');
    }
  }

  Future<Response<Map<String, dynamic>>> resendOtp({
    required String email,
  }) async {
    try {
      final response = await apiCall.postRequest<Map<String, dynamic>>(
        data: {'email': email},
        endPoint: ApiConstant.resendOtp,
      );
      if (response.statusCode == 200 || response.statusCode == 202) {
        return response;
      } else {
        throw _parseError(response.data, response.statusCode);
      }
    } on AppErrorResponse {
      rethrow;
    } catch (e) {
      throw Exception('Error sending OTP: $e');
    }
  }

  AppErrorResponse _parseError(dynamic data, int? statusCode) {
    if (data is Map<String, dynamic>) {
      return AppErrorResponse.fromJson(data);
    }

    return AppErrorResponse(
      statusCode: statusCode,
      message: data?.toString() ?? 'Something went wrong',
    );
  }
}
