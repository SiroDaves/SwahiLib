import 'package:json_annotation/json_annotation.dart';

part 'app_update.g.dart';

@JsonSerializable()
class AppUpdate {
  String ?version;
  String? title;
  String? description;
  AppLinks? appLinks;

  AppUpdate({
    this.version,
    this.title,
    this.description,
    this.appLinks,
  });

  factory AppUpdate.fromJson(Map<String, dynamic> json) => _$AppUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$AppUpdateToJson(this);
}

@JsonSerializable()
class AppLinks {
  String? android;
  String? ios;
  String? windows;
  String? macos;
  String? linux;

  AppLinks({
    this.android,
    this.ios,
    this.windows,
    this.macos,
    this.linux,
  });

  factory AppLinks.fromJson(Map<String, dynamic> json) => _$AppLinksFromJson(json);

  Map<String, dynamic> toJson() => _$AppLinksToJson(this);
}
