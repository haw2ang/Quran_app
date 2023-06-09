class TafseerModel {
  List<dynamic>? tafseers;

  TafseerModel({this.tafseers});

  TafseerModel.fromJson(Map<String, dynamic> json) {
    tafseers = json['tafseers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tafseers'] = tafseers;
    return data;
  }
}
