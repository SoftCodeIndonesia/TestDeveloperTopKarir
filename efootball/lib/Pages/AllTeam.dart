import 'package:efootball/Helper/Services.dart';
import 'package:flutter/material.dart';

class AllTeam extends StatefulWidget {
  String country;

  AllTeam({this.country});

  @override
  _AllTeamState createState() => _AllTeamState();
}

class _AllTeamState extends State<AllTeam> {
  List<dynamic> allteam = <dynamic>[];
  bool loading = true;
  @override
  void initState() {
    super.initState();
    getCountry();
  }

  void getCountry() async {
    Future<List<dynamic>> country = Services().getTeamByCountry(widget.country);

    await country.then((value) {
      setState(() {
        if (value != null) {
          allteam = value;
        }
      });
    });
    loading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All team ${widget.country}"),
      ),
      body: Container(
        child: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : allteam.isEmpty
                ? Center(
                    child: Text("Data is empty!"),
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("${allteam[index]['strTeam']}"),
                      );
                    },
                    itemCount: allteam.length,
                  ),
      ),
    );
  }
}
