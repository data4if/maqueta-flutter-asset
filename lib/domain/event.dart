import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  final String title;
  final String place;
  final String date;
  final String imageUrl;

  Event(
      {required this.title,
      required this.place,
      required this.date,
      required this.imageUrl});

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
