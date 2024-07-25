import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:untitled1/pages/hotel_weather/selectcity.dart';
import '../../helper/weatherapihelper.dart';
import '../../models/weatherdata_model.dart';

/*class WeatherDetailPage extends StatefulWidget {
  const WeatherDetailPage({Key? key}) : super(key: key);

  @override
  State<WeatherDetailPage> createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {
  void checkPermissionAndGetLocation(BuildContext) async{
    LocationPermission permission=await Geolocator.checkPermission();
    switch(permission){
      case LocationPermission.denied:
        LocationPermission permission=await Geolocator.requestPermission();
        switch(permission){
          case LocationPermission.denied:
            showDialog(context: context,
                builder: (context){
                  return AlertDialog(
                    content: Text("Permission is required"),
                    actions: [
                      TextButton(onPressed: (){
                        checkPermissionAndGetLocation(context);
                      }
                          , child: Text("continue")),
                      TextButton(onPressed: ()
                      {SystemNavigator.pop();},
                          child: Text("Exit"))
                    ],
                  );
                });
            break;

          case LocationPermission.deniedForever:
            showDialog(context: context,
                builder: (context){
                  return AlertDialog(
                    content: Text("Permission denied, for ever tp grant it open app settings"),
                  );
                });
            break;

          case LocationPermission.whileInUse:
          case LocationPermission.always:
            getLocation();
            break;

          case LocationPermission.unableToDetermine:
            showDialog(context: context,
                builder:(context){
                  return AlertDialog(
                    content: Text("Unable to Determine location permission"),
                  );
                });
            break;
        }
        break;

      case LocationPermission.deniedForever:
        showDialog(context: context,
            builder: (context){
              return AlertDialog(
                content: Text("Permission denied for ever tp grant it open app settings"),
              );
            });

        break;

      case LocationPermission.whileInUse:
      case LocationPermission.always:
        getLocation();
        break;

      case LocationPermission.unableToDetermine:
        showDialog(context: context,
            builder:(context){
              return AlertDialog(
                content: Text("unable to determine location permission"),
              );
            } );
        break;
    }
  }

  void getLocation() async{
    Position position=await Geolocator.getCurrentPosition();
    print(position.longitude);
    print(position.latitude);
    weatherDataModel =await APIHelper().getWeatherDataForMyLocation(position.latitude,position.longitude);
    if(weatherDataModel!=null){
      setState(() {
        isLoading=false;
      });
    }
    print(weatherDataModel!.name);
  }


  WeatherDataModel? weatherDataModel=  WeatherDataModel(0,"","","");

  @override
  void initState(){
    Future.delayed(Duration.zero,(){
      checkPermissionAndGetLocation(context);
    });
    super.initState();
  }

  bool isLoading=true;

  @override
  Widget build(BuildContext context){

    return Scaffold(
        appBar: AppBar(
          title: Text(
            // isLoading? " " weatherDataModel.name,
            isLoading ? weatherDataModel!.name : "",
          ),

          actions: [
            IconButton(onPressed: (){
              setState(() {
                isLoading=true;
              });

            }, icon: Icon(Icons.refresh)),

            IconButton(onPressed: ()async{
              String? cityName =await Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>SelectCityPage())   );
              if(cityName!= null){
                setState(() {
                  isLoading =true;
                });

                weatherDataModel = await APIHelper().getWeatherDataForCityName(cityName);
                if( weatherDataModel ==null){
                  weatherDataModel= WeatherDataModel(0,"","","");
                  showDialog(context: context,
                      builder: (context)=>
                          AlertDialog(
                            title:Text("Error") ,
                            content: Text("Wrong city name"),
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: Text("ok"))
                            ],
                          ));
                }
                setState(() {
                  isLoading=false;
                });
              }
            },
                icon: Icon(Icons.location_city)),
          ],
        ),

        body:Center(
            child:isLoading
                ?CircularProgressIndicator(
              color: Colors.red,
            )
                :Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                weatherDataModel!.iconCode==""
                    ? Container()
                    :Image(
                    image:NetworkImage(
                        weatherDataModel!.getStatusIconURL()
                    )
                ),

                Text(weatherDataModel!.temp.toStringAsFixed(1),
                  style: TextStyle(fontSize: 30),),

                Text(weatherDataModel!.status,
                  style: TextStyle(fontSize: 30),)

              ],
            )
        )


    );

  }

}*/


class WeatherDetailPage extends StatefulWidget {
  const WeatherDetailPage({Key? key}) : super(key: key);

  @override
  State<WeatherDetailPage> createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {
  void checkPermissionAndGetLocation(BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();
    switch (permission) {
      case LocationPermission.denied:
        LocationPermission permission = await Geolocator.requestPermission();
        switch (permission) {
          case LocationPermission.denied:
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Permission Required"),
                  content: Text("Location permission is required to access weather data."),
                  actions: [
                    TextButton(
                      onPressed: () {
                        checkPermissionAndGetLocation(context);
                      },
                      child: Text("Continue"),
                    ),
                    TextButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: Text("Exit"),
                    ),
                  ],
                );
              },
            );
            break;

          case LocationPermission.deniedForever:
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Permission Denied Forever"),
                  content: Text("Please enable location permission in the app settings."),
                );
              },
            );
            break;

          case LocationPermission.whileInUse:
          case LocationPermission.always:
            getLocation();
            break;

          case LocationPermission.unableToDetermine:
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Unable to Determine Permission"),
                  content: Text("Unable to determine location permission."),
                );
              },
            );
            break;
        }
        break;

      case LocationPermission.deniedForever:
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Permission Denied Forever"),
              content: Text("Please enable location permission in the app settings."),
            );
          },
        );
        break;

      case LocationPermission.whileInUse:
      case LocationPermission.always:
        getLocation();
        break;

      case LocationPermission.unableToDetermine:
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Unable to Determine Permission"),
              content: Text("Unable to determine location permission."),
            );
          },
        );
        break;
    }
  }

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    print(position.longitude);
    print(position.latitude);
    weatherDataModel = await APIHelper().getWeatherDataForMyLocation(position.latitude, position.longitude);
    if (weatherDataModel != null) {
      setState(() {
        isLoading = false;
      });
    }
    print(weatherDataModel!.name);
  }

  WeatherDataModel? weatherDataModel = WeatherDataModel(0, "", "", "");

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      checkPermissionAndGetLocation(context);
    });
    super.initState();
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isLoading ? "Loading..." : weatherDataModel!.name,
          style: TextStyle(
            color: Colors.blue,
            shadows: [
              Shadow(
                offset: Offset(5.0, 5.0),
                blurRadius: 3.0,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.grey),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isLoading = true;
              });
              getLocation();
            },
            icon: Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () async {
              String? cityName = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SelectCityPage()),
              );
              if (cityName != null) {
                setState(() {
                  isLoading = true;
                });

                weatherDataModel = await APIHelper().getWeatherDataForCityName(cityName);
                if (weatherDataModel == null) {
                  weatherDataModel = WeatherDataModel(0, "", "", "");
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Error"),
                      content: Text("Wrong city name"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("OK"),
                        ),
                      ],
                    ),
                  );
                }
                setState(() {
                  isLoading = false;
                });
              }
            },
            icon: Icon(Icons.location_city),
          ),
        ],
      ),

      body: Center(
        child: isLoading
            ? CircularProgressIndicator(
          color: Colors.red,
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            weatherDataModel!.iconCode == ""
                ? Container()
                : Image(
              image: NetworkImage(weatherDataModel!.getStatusIconURL()),
            ),
            SizedBox(height: 20),
            Text(
              weatherDataModel!.temp.toStringAsFixed(1) + "°C",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              weatherDataModel!.status,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                      getLocation();
                    },
                    icon: Icon(Icons.my_location),
                    label: Text("Update Location"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      textStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () async {
                      String? cityName = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SelectCityPage()),
                      );
                      if (cityName != null) {
                        setState(() {
                          isLoading = true;
                        });

                        weatherDataModel = await APIHelper().getWeatherDataForCityName(cityName);
                        if (weatherDataModel == null) {
                          weatherDataModel = WeatherDataModel(0, "", "", "");
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Error"),
                              content: Text("Wrong city name"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            ),
                          );
                        }
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    icon: Icon(Icons.search),
                    label: Text("Search City"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      textStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
