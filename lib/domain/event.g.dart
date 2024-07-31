// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      title: json['title'] as String,
      date: json['date'] as String,
      location: json['location'] as String,
      imageUrl: json['imageUrl'] as String,
      link: json['link'] as String,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'title': instance.title,
      'date': instance.date,
      'location': instance.location,
      'imageUrl': instance.imageUrl,
      'link': instance.link,
    };
