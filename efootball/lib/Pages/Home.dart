import 'package:efootball/Helper/LeagueRow.dart';
import 'package:efootball/Helper/Services.dart';
import 'package:efootball/Models/LeagueModel.dart';
import 'package:efootball/Routes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<LeagueModel> league = <LeagueModel>[];
  bool loading = true;
  @override
  void initState() {
    super.initState();
    getAllLeague();
  }

  void getAllLeague() async {
    Future<List<LeagueModel>> allLeague = Services().allLeague();
    allLeague.then((value) {
      setState(() {
        league = value;
        loading = false;
      });
    }).catchError((value) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Football"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TextField(
            //   readOnly: true,
            //   onTap: () => Navigator.pushNamed(context, Routes.search),
            //   style: TextStyle(
            //     color: Colors.white,
            //   ),
            //   decoration: InputDecoration(
            //     prefixIcon: Icon(
            //       Icons.search,
            //       color: Colors.white,
            //     ),

            //     // prefixStyle: TextStyle(),
            //     contentPadding: EdgeInsets.only(
            //         left: 10, top: 5, right: 20, bottom: 5),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(10.0),
            //       ),
            //     ),
            //     filled: true,
            //     fillColor: Colors.grey[350],
            //     hintStyle: TextStyle(
            //       color: Colors.white,
            //     ),
            //     hintText: "Search team",
            //     focusedBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(15.0),
            //       ),
            //       borderSide: BorderSide.none,
            //     ),
            //     enabledBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(15.0),
            //       ),
            //       borderSide: BorderSide.none,
            //     ),
            //     errorBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(15.0),
            //       ),
            //       borderSide: BorderSide.none,
            //     ),
            //     disabledBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(15.0),
            //       ),
            //       borderSide: BorderSide.none,
            //     ),
            //   ),
            // ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.search),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Text(
                  "Search team",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.country),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Text(
                  "All team",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "List league",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            Divider(),
            SizedBox(),
            loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () => Navigator.pushNamed(
                              context, Routes.seasons,
                              arguments: league[index].idLeague),
                          title: Text("${league[index].strLeague}"),
                        );
                      },
                      itemCount: league.length,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
