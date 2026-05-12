import '../../core/api_constant/api_constant.dart';
import '../../models/response/app_error_reponse.dart';
import '../../models/response/logout_response.dart';
import '../../service/network/api_service.dart';

class ProfileRepo {
  final ApiCall apiCall = ApiCall();

  Future<LogOutResponse> logOut() async {
    try {
      final response = await apiCall.postRequest<Map<String, dynamic>>(
        endPoint: ApiConstant.logout,
      );

      LogOutResponse res = LogOutResponse.fromJson(response.data ?? {});
      if (response.statusCode == 200) {
        return res;
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
