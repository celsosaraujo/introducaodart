class Localizacao {

  String latitude;
  String longitude;

  Localizacao(
    {
      required this.latitude,
      required this.longitude
    }
  );

  factory Localizacao.deJson( Map<String, dynamic> json ){
    return Localizacao(
      latitude: json['lat'] ?? '', 
      longitude: json['lng'] ?? '',
    );
  }
}