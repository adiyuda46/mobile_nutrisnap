import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nutrisnap_mobile/data/models/model_predict.dart';

@injectable
class PredictDataSource {
  final Dio _dio;

  PredictDataSource()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'http://34.87.56.108:8000/api/v1/nutrisnap/public',
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            headers: {'Content-Type': 'application/json'},
          ),
        );

  Future<GiziBuah> predictBuah(String buah) async {
    try {
      final response = await _dio.post(
        '/predict',
        data: {'PredictModelImg': buah},
      );

      if (response.statusCode == 200) {
        if (response.data['message'] == 'data di temukan') {
          return GiziBuah.fromJson(response.data);
        } else {
          throw Exception('Pesan respons error: ${response.data['message']}');
        }
      } else {
        throw Exception('Status code tidak OK: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      throw Exception('Gagal koneksi: ${dioError.message}');
    } catch (e) {
      throw Exception('Kesalahan tidak terduga: $e');
    }
  }
}
