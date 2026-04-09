import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:nutrisnap_mobile/data/models/model_detail_gizi.dart';

@injectable
class DetailGiziDatasource {
  final Dio _dio;

  DetailGiziDatasource()
      : _dio = Dio(BaseOptions(
          baseUrl: 'http://34.87.56.108:8000/api/v1/nutrisnap/public',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {'Content-Type': 'application/json'},
        ));

  Future<ResultGiziDetail> giziDetail(String detailBuah) async {
    try {
      final response = await _dio.post(
        '/predict/detail',
        data: {'Label': detailBuah},
      );

       if (response.statusCode == 200) {
        if (response.data['message'] == 'data di temukan') {
          return ResultGiziDetail.fromJson(response.data);
        } else {
          throw Exception('Pesan respons error: ${response.data['message']}');
        }
      } else {
        throw Exception('Status code tidak OK: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      throw Exception('Gagal koneksi: ${dioError.message}');
    } catch (e) {
      throw Exception('Error System: $e');
    }
  }
}
