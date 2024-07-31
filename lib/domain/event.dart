import 'package:json_annotation/json_annotation.dart';
part 'event.g.dart';

@JsonSerializable()
class Event {
  final String title;
  final String date;
  final String location;
  final String imageUrl;
  final String link;

  Event({
    required this.title,
    required this.date,
    required this.location,
    required this.imageUrl,
    required this.link,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
