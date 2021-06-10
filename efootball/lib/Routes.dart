import 'package:efootball/Pages/AllTeam.dart';
import 'package:efootball/Pages/CountryList.dart';
import 'package:efootball/Pages/Home.dart';
import 'package:efootball/Pages/Seasion.dart';
import 'package:efootball/Pages/search.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String homeRoute = '/';
  static const String seasons = '/seasons';
  static const String search = '/search';
  static const String country = '/country';
  static const String team = '/team';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => Home());
      case seasons:
        String leagueId = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => Seasons(
            leagueId: leagueId,
          ),
        );
      case search:
        return MaterialPageRoute(builder: (_) => Search());
      case country:
        return MaterialPageRoute(builder: (_) => CountryList());
      case team:
        String country = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => AllTeam(
                  country: country,
                ));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
