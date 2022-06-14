// To parse this JSON data, do
//
//     final DataModel = DataModelFromJson(jsonString);

import 'dart:convert';

List<DataModel> DataModelFromJson(String str) =>
    List<DataModel>.from(json.decode(str).map((x) => DataModel.fromJson(x)));

class DataModel {
  DataModel({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  String? id;
  String? author;
  int? width;
  int? height;
  String? url;
  String? downloadUrl;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
      );
}
