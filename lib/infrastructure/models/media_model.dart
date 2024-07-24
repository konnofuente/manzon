import 'package:manzon/domain/entities/media_entity.dart';
import 'package:manzon/domain/entities/enums/role_enum.dart';


class MediaModel extends MediaEntity {
  MediaModel({
    String? link,
    required FileType type,
    DateTime? createdAt,
    DateTime? updatedAt,
    required String mediaId,
  }) : super(
          link: link,
          type: type,
          createdAt: createdAt,
          updatedAt: updatedAt,
          mediaId: mediaId,
        );

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(
      link: json['link'],
      type: FileType.values[json['type']],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      mediaId: json['mediaId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'link': link,
      'type': type.index,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'mediaId': mediaId,
    };
  }
}
