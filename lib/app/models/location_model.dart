import 'dart:math';

import 'package:flutter/material.dart';

import '../../core/utils/serializer.dart';
import '../../core/variables/colors.dart';

class Location extends BaseModel {
  int? id;
  String? name;
  String? type;
  String? dimension;
  List<String>? residents;
  String? url;
  DateTime? created;
  Color? color;

  Location({this.id, this.name, this.type, this.dimension, this.residents, this.url, this.created});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    dimension = json['dimension'];
    residents = json['residents'].cast<String>();
    url = json['url'];
    created = DateTime.tryParse(json['created']);
    color = ColorTable.primaryColor.withRed(Random().nextInt(255)).withBlue(Random().nextInt(255));
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['dimension'] = dimension;
    data['residents'] = residents;
    data['url'] = url;
    data['created'] = created.toString();
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return Location.fromJson(json);
  }
}
