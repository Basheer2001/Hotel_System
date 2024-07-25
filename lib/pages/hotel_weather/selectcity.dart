import 'package:flutter/material.dart';

import '../../helper/weatherapihelper.dart';
import '../../models/countrymodel.dart';


class SelectCityPage extends StatefulWidget {
  const SelectCityPage({Key? key}) : super(key: key);

  @override
  State<SelectCityPage> createState() => _SelectCityPageState();
}

class _SelectCityPageState extends State<SelectCityPage> {
  TextEditingController controller = TextEditingController();
  List<CountryModel> countries = [];
  List<CountryModel> filteredCountries = [];
  APIHelper helper = APIHelper();
  bool isLoading = true;

  void getCountries() async {
    countries = await helper.getCountryList();
    countries.sort((c1, c2) {
      return c1.name.compareTo(c2.name);
    });

    filteredCountries = countries;

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getCountries();
    super.initState();
  }

  String cityName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search for city",
          style: TextStyle(
            color: Colors.blue,
            shadows: [
              Shadow(
                offset: Offset(5.0, 5.0), // Shadow position
                blurRadius: 3.0, // Shadow blur
                color: Colors.grey, // Shadow color
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
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                cityName = value;
                setState(() {
                  if (value.trim() == "") {
                    filteredCountries = countries;
                  } else {
                    filteredCountries = countries
                        .where((country) => country.capital
                        .toUpperCase()
                        .startsWith(value.toUpperCase()))
                        .toList();
                  }
                });
              },
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                labelText: "City name",
                prefixIcon: Icon(Icons.location_city),
                suffixIcon: IconButton(
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  icon: Icon(Icons.search),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.blue)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.blue)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red)),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                itemCount: filteredCountries.length,
                itemBuilder: (context, index) {
                  CountryModel country = filteredCountries[index];
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.pop(context, country.capital);
                      },
                      title: Text(country.name),
                      subtitle: Text(country.capital),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(country.flagURL),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
