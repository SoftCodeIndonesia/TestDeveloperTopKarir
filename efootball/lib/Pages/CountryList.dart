import 'package:efootball/Helper/Services.dart';
import 'package:efootball/Routes.dart';
import 'package:flutter/material.dart';

class CountryList extends StatefulWidget {
  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  bool loading = true;
  List<dynamic> countryList = <dynamic>[];

  @override
  void initState() {
    super.initState();
    getCountry();
  }

  void getCountry() async {
    Future<List<dynamic>> country = Services().allCountry();

    await country.then((value) {
      setState(() {
        countryList = value;
        loading = false;
      });
    });
  }

  void filter(value) {
    countryList.forEach((element) {
      if (value == '') {
        setState(() {
          loading = true;
          getCountry();
        });
      } else {
        if (element['name_en'].toLowerCase() == value.toLowerCase()) {
          setState(() {
            countryList = [
              {
                'name_en': element['name_en'],
              }
            ];
          });
        }
      }
    });
    loading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select country"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : countryList.isEmpty
                ? Center(
                    child: Text("Data not found!"),
                  )
                : Column(
                    children: [
                      TextField(
                        // focusNode: searchFocus,
                        onSubmitted: (value) {
                          setState(() {
                            loading = true;
                            filter(value);
                          });
                        },
                        // controller: _searchController,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          contentPadding: EdgeInsets.only(
                              left: 10, top: 5, right: 20, bottom: 5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.grey[350],
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          hintText: "Search country",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => Divider(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () => Navigator.pushNamed(
                                  context, Routes.team,
                                  arguments: countryList[index]['name_en']),
                              title: Text("${countryList[index]['name_en']}"),
                            );
                          },
                          itemCount: countryList.length,
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
