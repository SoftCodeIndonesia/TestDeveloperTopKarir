import 'package:efootball/Helper/Services.dart';
import 'package:efootball/Models/EventModel.dart';
import 'package:flutter/material.dart';

class Seasons extends StatefulWidget {
  String leagueId;
  Seasons({this.leagueId});

  @override
  _SeasonsState createState() => _SeasonsState();
}

class _SeasonsState extends State<Seasons> {
  List<EventModel> events = <EventModel>[];
  bool loading = true;
  @override
  void initState() {
    super.initState();
    getSeasons();
  }

  void getSeasons() async {
    Future<List> allEvent = Services().listEventByLeague(widget.leagueId);
    await allEvent.then((value) {
      setState(() {
        events = value;
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
      ),
      body: Container(
        child: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: null,
                          title: Text("${events[index].strEvent}"),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${events[index].dateEvent}, ${events[index].strTime}"),
                              SizedBox(
                                height: 30,
                              ),
                              Text("Home : ${events[index].strHomeTeam}"),
                              Text("Away : ${events[index].strAwayTeam}"),
                              Text(
                                  "Score : ${events[index].intHomeScore} - ${events[index].intAwayScore}"),
                            ],
                          ),
                        );
                      },
                      itemCount: events.length,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
