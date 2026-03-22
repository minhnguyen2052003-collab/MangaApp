import 'package:hive/hive.dart';

part "poster_image.g.dart";

@HiveType(typeId: 2)
class PosterImage {
  @HiveField(0)
  final String? tiny;
  @HiveField(1)
  final String? medium;
  @HiveField(2)
  final String? large;

  PosterImage({required this.large, required this.medium, required this.tiny});

  Map<String, dynamic> toMap() {
    return {"large": large, "medium": medium, "tiny": tiny};
  }

  factory PosterImage.fromMap(Map<String, dynamic> maps) {
    return PosterImage(
      large: maps["large"] ?? "",
      medium: maps["medium"] ?? "",
      tiny: maps["tiny"] ?? "",
    );
  }

  factory PosterImage.fromJson(Map<String, dynamic> json) {
    return PosterImage(
      large: json["large"],
      medium: json["medium"],
      tiny: json["tiny"],
    );
  }
}
