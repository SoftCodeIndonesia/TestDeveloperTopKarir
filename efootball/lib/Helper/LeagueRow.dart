import 'package:efootball/Models/LeagueModel.dart';
import 'package:flutter/material.dart';

class LeagueRow extends StatefulWidget {
  LeagueModel leagueModel;

  LeagueRow({this.leagueModel});

  @override
  _LeagueRowState createState() => _LeagueRowState();
}

class _LeagueRowState extends State<LeagueRow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: ListTile(
          title: Text("${widget.leagueModel.strLeague}"),
        ),
      ),
    );
  }
}
