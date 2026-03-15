import 'package:injectable/injectable.dart';
import 'package:nutrisnap_mobile/data/datasource/predict_datasource.dart';
import 'package:nutrisnap_mobile/data/models/model_predict.dart';

@injectable
class PredictRepository {
  final PredictDataSource _predictDataSource;

  PredictRepository(this._predictDataSource);

  Future<GiziBuah> predictBuah(String buah) async {
    try {
      final result = await _predictDataSource.predictBuah(buah);
      return result;
    } catch (e) {
      rethrow; // Lanjutkan error ke Cubit
    }
  }
}
