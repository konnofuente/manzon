import 'dart:io';
import 'package:manzon/domain/entities/media_entity.dart';
import '../../domain/entities/export_domain_entities.dart';


class MediaModel extends MediaEntity {
  MediaModel({
    String? link,
    required FileType type,
    DateTime? createdAt,
    DateTime? updatedAt,
    required String mediaId,
    File? file,
  }) : super(
          link: link,
          type: type,
          createdAt: createdAt,
          updatedAt: updatedAt,
          mediaId: mediaId,
          file: file,
        );

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(
      link: json['link'],
      type: FileType.values[json['type']],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      mediaId: json['mediaId'],
      file: json.containsKey('file') ? File(json['file']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'link': link,
      'type': type.index,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'mediaId': mediaId,
      'file': file?.path,
    };
  }
}
