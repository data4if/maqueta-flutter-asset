import 'package:json_annotation/json_annotation.dart';
<<<<<<< HEAD

=======
>>>>>>> bc52f81f2390e5715bd82915b09b95d06fe14786
part 'event.g.dart';

@JsonSerializable()
class Event {
  final String title;
<<<<<<< HEAD
  final String place;
  final String date;
  final String imageUrl;

  Event(
      {required this.title,
      required this.place,
      required this.date,
      required this.imageUrl});
=======
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
>>>>>>> bc52f81f2390e5715bd82915b09b95d06fe14786

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
