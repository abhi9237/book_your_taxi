import 'package:book_your_taxi/core/api_constant/api_constant.dart';
import 'package:book_your_taxi/core/storage/hive_storage_service.dart';
import 'package:book_your_taxi/models/response/app_error_reponse.dart';
import 'package:book_your_taxi/models/response/sign_up_response.dart';
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

  Future<Response<Map<String, dynamic>>> logInUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiCall.postRequest<Map<String, dynamic>>(
        data: {'email': email, 'password': password},
        endPoint: ApiConstant.login,
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

  Future<void> refreshAppToken({required String refreshToken}) async {
    try {
      final response = await apiCall.postRequest<Map<String, dynamic>>(
        data: {'refreshToken': refreshToken},
        endPoint: ApiConstant.refreshToken,
      );
      SignUpResponse res = SignUpResponse.fromJson(response.data ?? {});
      if (response.statusCode == 200) {
        HiveStorageService.storeUserToken(res.accessToken ?? '');
        HiveStorageService.storeRefreshToken(res.csrfToken ?? '');
      } else {
        throw _parseError(response.data, response.statusCode);
      }
    } on AppErrorResponse {
      rethrow;
    } catch (e) {
      throw Exception('Error sending OTP: $e');
    }
  }

  Future<Response> addPassengerProfile({
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await apiCall.postRequest<dynamic>(
        data: data,
        endPoint: ApiConstant.addUser,
        token: HiveStorageService.getUserToken(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
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

  Future<Response<Map<String, dynamic>>> uploadUserProfileImage(
    FormData data,
  ) async {
    try {
      final response = await apiCall.postRequest<Map<String, dynamic>>(
        data: data,
        endPoint: ApiConstant.addUserImage,
        token: HiveStorageService.getUserToken(),
        extraHeaders: {
          'x-api-key': ApiConstant.storageKey,
          'Content-Type': 'multipart/form-data',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
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
