import 'package:dio/dio.dart';

class LoginService {
  late Dio dio;
  
  

  // Constructor to initialize Dio with base options
  LoginService() {
    dio = Dio(BaseOptions(
      baseUrl: "https://api.realestate.salonsyncs.com/graphql",
      headers: {
        'X-Tenant-Id': 'RL0582',
      },
    ));
  }

  // Method to perform the login operation
  Future<Map<String, dynamic>> logService(Map<String, dynamic> payload) async {
    try {
      final response = await dio.post("/graphql", data: payload);
      // log("-> Status code${response.statusCode} Data->${response.data}->${response.statusMessage}");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Failed in 1st exception ->${response.statusCode}");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        // log("on catch if--->${e.response?.data}");
        throw Exception(
            "Error in 2nd -> Status code${e.response?.statusCode} Data->${e.response?.data}->${e.response?.statusMessage}");
      } else {
        // log("on catch else->${e.response?.data}--< -->${e.message}");
        throw Exception("dio error ->${e.message}");
      }
    } catch (e) {
      throw Exception("Catch error $e");
    }
  }
}
