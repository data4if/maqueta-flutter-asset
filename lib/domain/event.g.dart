// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      title: json['title'] as String,
      place: json['place'] as String,
      date: json['date'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'title': instance.title,
      'place': instance.place,
      'date': instance.date,
      'imageUrl': instance.imageUrl,
    };
