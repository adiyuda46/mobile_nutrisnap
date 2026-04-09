import 'package:injectable/injectable.dart';
import 'package:nutrisnap_mobile/data/datasource/detail_gizi_datasource.dart';
import 'package:nutrisnap_mobile/data/models/model_detail_gizi.dart';

@injectable
class DetailGiziRepository {
  final DetailGiziDatasource _detailGiziDatasource;

  DetailGiziRepository(this._detailGiziDatasource);

  Future<ResultGiziDetail> giziDetail(String detailBuah)async{
    try {
      final result = await _detailGiziDatasource.giziDetail(detailBuah);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}