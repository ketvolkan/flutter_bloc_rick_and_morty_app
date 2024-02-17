import '../../core/utils/serializer.dart';

class BaseListModel<T extends BaseModel> extends BaseModel {
  Info? info;
  List<T>? results;
  T? type;
  BaseListModel({this.info, this.results, this.type});

  @override
  fromJson(Map<String, dynamic> json) {
    if (type == null) return BaseListModel();
    return BaseListModel(
      info: modelDecode(json['info'], Info()),
      results: modelListDecode<T>(json['results'], type!),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (info != null) data['info'] = info!.toJson();
    if (results != null) data['results'] = results!.map((v) => v.toJson()).toList();
    return data;
  }
}

class Info extends BaseModel {
  int? count;
  int? pages;
  String? next;
  String? prev;

  Info({this.count, this.pages, this.next, this.prev});

  Info.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pages = json['pages'];
    next = json['next'];
    prev = json['prev'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['pages'] = pages;
    data['next'] = next;
    data['prev'] = prev;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return Info.fromJson(json);
  }
}
