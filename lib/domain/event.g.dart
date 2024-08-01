// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      title: json['title'] as String,
<<<<<<< HEAD
      place: json['place'] as String,
      date: json['date'] as String,
      imageUrl: json['imageUrl'] as String,
=======
      date: json['date'] as String,
      location: json['location'] as String,
      imageUrl: json['imageUrl'] as String,
      link: json['link'] as String,
>>>>>>> bc52f81f2390e5715bd82915b09b95d06fe14786
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'title': instance.title,
<<<<<<< HEAD
      'place': instance.place,
      'date': instance.date,
      'imageUrl': instance.imageUrl,
=======
      'date': instance.date,
      'location': instance.location,
      'imageUrl': instance.imageUrl,
      'link': instance.link,
>>>>>>> bc52f81f2390e5715bd82915b09b95d06fe14786
    };
