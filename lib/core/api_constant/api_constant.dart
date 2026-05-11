class ApiConstant {
 static final String baseUrl = 'https://63yv2au8.ap-southeast.insforge.app/api/';
 static final String storageKey = 'ik_f4385ea19b58d51102c3616dbca8b87e';
 static final String sendOtp = '${baseUrl}auth/users';
 static final String refreshToken = '${baseUrl}auth/refresh';
 static final String verifyOtp = '${baseUrl}auth/email/verify';
 static final String resendOtp = '${baseUrl}auth/email/send-verification';
 static final String addUser = '${baseUrl}database/records/users';
 static final String addUserImage = '${baseUrl}storage/buckets/user_image/objects';
}
