class EventModel {
  String idEvent,
      strEvent,
      strSport,
      strHomeTeam,
      strAwayTeam,
      dateEvent,
      strTime;
  String intHomeScore, intAwayScore;

  EventModel(
      {this.idEvent,
      this.strAwayTeam,
      this.strEvent,
      this.dateEvent,
      this.intAwayScore,
      this.intHomeScore,
      this.strHomeTeam,
      this.strSport,
      this.strTime});

  EventModel.fromMap(Map<String, dynamic> map) {
    this.idEvent = map['idEvent'];
    this.strEvent = map['strEvent'];
    this.strSport = map['strSport'];
    this.strHomeTeam = map['strHomeTeam'];
    this.strAwayTeam = map['strAwayTeam'];
    this.dateEvent = map['dateEvent'];
    this.strTime = map['strTime'];
    this.intHomeScore = map['intHomeScore'];
    this.intAwayScore = map['intAwayScore'];
  }

  Map<String, dynamic> toMap() {
    var data = {
      'idEvent': idEvent,
      'strEvent': strEvent,
      'strSport': strSport,
      'strHomeTeam': strHomeTeam,
      'dateEvent': dateEvent,
      'strTime': strTime,
      'intHomeScore': intHomeScore,
      'intAwayScore': intAwayScore,
    };
    return data;
  }

  @override
  String toString() {
    return {
      'idEvent': idEvent,
      'strEvent': strEvent,
      'strSport': strSport,
      'strHomeTeam': strHomeTeam,
      'dateEvent': dateEvent,
      'strTime': strTime,
      'intHomeScore': intHomeScore,
      'intAwayScore': intAwayScore,
    }.toString();
  }
}
