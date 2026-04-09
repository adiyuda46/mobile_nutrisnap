class ResultGiziDetail {
  String? message;
  int? response;
  Result? result;

  ResultGiziDetail({this.message, this.response, this.result});

  ResultGiziDetail.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    response = json['response'];
    result =
        json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = message;
    data['response'] = response;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  String? abu;
  String? air;
  String? bKarotene;
  String? besi;
  String? energi;
  String? fosfor;
  String? kalium;
  String? kalsium;
  String? karbo;
  String? karotenTotal;
  String? label;
  String? lemak;
  String? natrium;
  String? protein;
  String? seng;
  String? seratPangan;
  String? tembaga;
  String? vitA;
  String? vitB1;
  String? vitB2;
  String? vitB3;
  String? vitC;

  Result(
      {this.abu,
      this.air,
      this.bKarotene,
      this.besi,
      this.energi,
      this.fosfor,
      this.kalium,
      this.kalsium,
      this.karbo,
      this.karotenTotal,
      this.label,
      this.lemak,
      this.natrium,
      this.protein,
      this.seng,
      this.seratPangan,
      this.tembaga,
      this.vitA,
      this.vitB1,
      this.vitB2,
      this.vitB3,
      this.vitC});

  Result.fromJson(Map<String, dynamic> json) {
    abu = json['Abu'];
    air = json['Air'];
    bKarotene = json['BKarotene'];
    besi = json['Besi'];
    energi = json['Energi'];
    fosfor = json['Fosfor'];
    kalium = json['Kalium'];
    kalsium = json['Kalsium'];
    karbo = json['Karbo'];
    karotenTotal = json['KarotenTotal'];
    label = json['Label'];
    lemak = json['Lemak'];
    natrium = json['Natrium'];
    protein = json['Protein'];
    seng = json['Seng'];
    seratPangan = json['SeratPangan'];
    tembaga = json['Tembaga'];
    vitA = json['VitA'];
    vitB1 = json['VitB1'];
    vitB2 = json['VitB2'];
    vitB3 = json['VitB3'];
    vitC = json['VitC'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Abu'] = abu;
    data['Air'] = air;
    data['BKarotene'] = bKarotene;
    data['Besi'] = besi;
    data['Energi'] = energi;
    data['Fosfor'] = fosfor;
    data['Kalium'] = kalium;
    data['Kalsium'] = kalsium;
    data['Karbo'] = karbo;
    data['KarotenTotal'] = karotenTotal;
    data['Label'] = label;
    data['Lemak'] = lemak;
    data['Natrium'] = natrium;
    data['Protein'] = protein;
    data['Seng'] = seng;
    data['SeratPangan'] = seratPangan;
    data['Tembaga'] = tembaga;
    data['VitA'] = vitA;
    data['VitB1'] = vitB1;
    data['VitB2'] = vitB2;
    data['VitB3'] = vitB3;
    data['VitC'] = vitC;
    return data;
  }
}