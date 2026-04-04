class GiziBuah {
  String? message;
  int? response;
  Result? result;

  GiziBuah({this.message, this.response, this.result});

  GiziBuah.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    response = json['response'];
    result =
        json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['response'] = response;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  String? energi;
  String? giziUnggulan1;
  String? giziUnggulan2;
  String? giziUnggulan3;
  String? karbo;
  String? label;
  String? lemak;
  String? protein;

  Result(
      {this.energi,
      this.giziUnggulan1,
      this.giziUnggulan2,
      this.giziUnggulan3,
      this.karbo,
      this.label,
      this.lemak,
      this.protein});

  Result.fromJson(Map<String, dynamic> json) {
    energi = json['Energi'];
    giziUnggulan1 = json['GiziUnggulan1'];
    giziUnggulan2 = json['GiziUnggulan2'];
    giziUnggulan3 = json['GiziUnggulan3'];
    karbo = json['Karbo'];
    label = json['Label'];
    lemak = json['Lemak'];
    protein = json['Protein'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Energi'] = energi;
    data['GiziUnggulan1'] = giziUnggulan1;
    data['GiziUnggulan2'] = giziUnggulan2;
    data['GiziUnggulan3'] = giziUnggulan3;
    data['Karbo'] = karbo;
    data['Label'] = label;
    data['Lemak'] = lemak;
    data['Protein'] = protein;
    return data;
  }
}

// class GiziBuahV2 {
//   double? confidence;
//   String? label;

//   GiziBuahV2({this.confidence, this.label});

//   GiziBuahV2.fromJson(Map<String, dynamic> json) {
//     confidence = json['confidence'];
//     label = json['label'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['confidence'] = this.confidence;
//     data['label'] = this.label;
//     return data;
//   }
// }