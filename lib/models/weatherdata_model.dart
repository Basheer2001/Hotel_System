class WeatherDataModel{
  double temp;
  String name;
  String status;
  String iconCode;

  String getStatusIconURL(){

    return "https://openweathermap.org/img/wn/$iconCode@2x.png";

  }


  WeatherDataModel(this.temp,this.name,this.status,this.iconCode);

  factory WeatherDataModel.formJson(Map<String,dynamic>json){
    return WeatherDataModel(
      json["main"]["temp"],
      json["name"],
      json["weather"][0]["main"],
      json["weather"][0]["icon"],


    );


  }}