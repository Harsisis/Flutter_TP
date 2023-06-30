import 'package:dio/dio.dart';

class CityService {
  final dio = Dio();

  final String key;
  final String city;

  CityService(this.key, this.city);

  Future<Response> getCity() async {
    dio.options.headers['X-Api-Key'] = key;
    return await dio.get('https://api.api-ninjas.com/v1/city?name=$city');
  }
}
