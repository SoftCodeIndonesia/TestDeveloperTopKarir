class LeagueModel {
  String idLeague, strLeague, strSport, strLeagueAlternate;

  LeagueModel(
      {this.idLeague, this.strLeague, this.strLeagueAlternate, this.strSport});

  LeagueModel.fromMap(Map<String, dynamic> map) {
    this.idLeague = map['idLeague'];
    this.strLeague = map['strLeague'];
    this.strSport = map['strSport'];
    this.strLeagueAlternate = map['strLeagueAlternate'];
  }

  Map<String, dynamic> toMap() {
    var data = {
      'idLeague': idLeague,
      'strLeague': strLeague,
      'strSport': strSport,
      'strLeagueAlternate': strLeagueAlternate,
    };
    return data;
  }

  @override
  String toString() {
    return {
      'idLeague': idLeague,
      'strLeague': strLeague,
      'strSport': strSport,
      'strLeagueAlternate': strLeagueAlternate,
    }.toString();
  }
}
