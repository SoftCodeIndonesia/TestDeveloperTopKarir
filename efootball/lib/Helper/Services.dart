import 'dart:convert';

import 'package:efootball/Models/EventModel.dart';
import 'package:efootball/Models/LeagueModel.dart';

import 'package:http/http.dart' as http;

class Services {
  Future<List<LeagueModel>> allLeague() async {
    String allLeagueUrl =
        "https://www.thesportsdb.com/api/v1/json/1/all_leagues.php";
    final response = await http.get(Uri.parse(allLeagueUrl));
    List<LeagueModel> listLeague = <LeagueModel>[];
    print("response : $response");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON

      List<dynamic> leagues = json.decode(response.body)['leagues'];
      if (leagues.length > 0) {
        for (int i = 0; i < leagues.length; i++) {
          if (leagues[i] != null) {
            Map<String, dynamic> map = leagues[i];
            listLeague.add(LeagueModel.fromMap(map));
          }
        }
      }
    } else {
      // If that call was not successful, throw an error.
      return listLeague;
    }
    return listLeague;
  }

  Future<List<dynamic>> listEventByLeague(String leagueId) async {
    String sessionUrl =
        "https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id=" +
            leagueId;
    final response = await http.get(Uri.parse(sessionUrl));
    List<EventModel> eventModel = <EventModel>[];
    if (response.statusCode == 200) {
      List<dynamic> leagues = json.decode(response.body)['events'];
      if (leagues.length > 0) {
        for (int i = 0; i < leagues.length; i++) {
          if (leagues[i] != null) {
            Map<String, dynamic> map = leagues[i];
            eventModel.add(EventModel.fromMap(map));
          }
        }
      }

      return eventModel;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<List<dynamic>> searchTeam(String teamName) async {
    String sessionUrl =
        "https://www.thesportsdb.com/api/v1/json/1/searchteams.php?t=" +
            teamName;
    final response = await http.get(Uri.parse(sessionUrl));

    if (response.statusCode == 200) {
      List<dynamic> team = json.decode(response.body)['teams'];

      return team;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<List<dynamic>> allCountry() async {
    String sessionUrl =
        "https://www.thesportsdb.com/api/v1/json/1/all_countries.php";
    final response = await http.get(Uri.parse(sessionUrl));

    if (response.statusCode == 200) {
      List<dynamic> team = json.decode(response.body)['countries'];

      return team;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<List<dynamic>> getTeamByCountry(String country) async {
    print("country : $country");
    String sessionUrl =
        "https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?s=Soccer&c=" +
            country;
    final response = await http.get(Uri.parse(sessionUrl));

    if (response.statusCode == 200) {
      List<dynamic> team = json.decode(response.body)['teams'];
      print(team);
      return team;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
