// This file declares neno model that will be used to manage 
// maneno from the live database

class Neno {
  String title;
  String maana;
  String visawe;
  String mnyambuliko;

  Neno(
      {this.title,
      this.maana,
      this.visawe,
      this.mnyambuliko });

  Neno.fromJson(Map<String, dynamic> json) {
    title         = json['title'];
    maana         = json['maana'];
    visawe        = json['visawe'];
    mnyambuliko   = json['mnyambuliko'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title']         = this.title;
    data['maana']         = this.maana;
    data['visawe']        = this.visawe;
    data['mnyambuliko']   = this.mnyambuliko;
    return data;
  }

  //static Neno fromMapObject(Map<String nenoMapList) {}
  Neno.fromMapObject(Map<String, dynamic> map) {
    this.title = map['title'];
    this.maana = map['maana'];
    this.visawe = map['visawe'];
    this.mnyambuliko = map['mnyambuliko'];
  }
}