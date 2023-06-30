import 'package:dio/dio.dart';

class MeteoService {
  final dio = Dio();

  final double lat;
  final double lng;
  final String key;

  MeteoService(this.key, this.lat, this.lng);

  Future<Response> getMeteo() async {
    return await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lng&appid=$key');
  }
}
