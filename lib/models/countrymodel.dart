class CountryModel{

  String name;
  String capital;
  String flagURL;

  CountryModel({

    required this.name,
    required this.capital,
    required this.flagURL

  });

  static List<CountryModel> fromJsonArray(List<dynamic> jsonArray){

    return jsonArray.map((e)=>CountryModel.fromJson(e)).toList();
  }

  factory CountryModel.fromJson(Map<String,dynamic> json){
    return CountryModel(
        name: json["name"]["official"],
        capital:json["capital"]==null ? "": json["capital"][0],
        flagURL:json["flags"]["png"]);


  }

}