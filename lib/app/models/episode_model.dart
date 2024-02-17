import 'dart:math';

import 'package:flutter/material.dart';

import '../../core/utils/serializer.dart';
import '../../core/variables/colors.dart';

class Episode extends BaseModel {
  int? id;
  String? name;
  String? airDate;
  String? episode;
  List<String>? characters;
  String? url;
  DateTime? created;
  Color? color;

  Episode({this.id, this.name, this.airDate, this.episode, this.characters, this.url, this.created});

  Episode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    airDate = json['air_date'];
    episode = json['episode'];
    characters = json['characters'].cast<String>();
    url = json['url'];
    created = DateTime.tryParse(json['created']);
    color = ColorTable.primaryColor.withRed(Random().nextInt(255)).withBlue(Random().nextInt(255));
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['air_date'] = airDate;
    data['episode'] = episode;
    data['characters'] = characters;
    data['url'] = url;
    data['created'] = created.toString();
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return Episode.fromJson(json);
  }
}
