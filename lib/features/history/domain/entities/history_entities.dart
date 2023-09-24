import 'package:equatable/equatable.dart';

class HistoryEntities extends Equatable {
  final String id;
  final String date;
  final String timer;
  final String aTeam;
  final String bTeam;
  final String aTeamPoints;
  final String bTeamPoints;
  final String winner;

  const HistoryEntities({
    required this.id,
    required this.date,
    required this.timer,
    required this.aTeam,
    required this.bTeam,
    required this.aTeamPoints,
    required this.bTeamPoints,
    required this.winner,
  });

  @override
  List<Object> get props => [
        id,
        date,
        timer,
        aTeam,
        bTeam,
        aTeamPoints,
        bTeamPoints,
        winner,
      ];
}
