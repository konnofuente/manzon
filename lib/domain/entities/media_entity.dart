import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';

class MediaEntity extends Equatable {
  final String? link;
  final FileType type;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String mediaId;
  final File? file;

  MediaEntity({
    this.link,
    required this.type,
    this.createdAt,
    this.updatedAt,
    required this.mediaId,
    this.file,
  });

  @override
  List<Object?> get props => [link, type, createdAt, updatedAt, mediaId, file];

  // JSON serialization
  factory MediaEntity.fromJson(Map<String, dynamic> json) {
    return MediaEntity(
      link: json['link'],
      type: FileType.values.firstWhere((e) => e.toString() == 'FileType.${json['type']}'),
      createdAt: json.containsKey('createdAt') ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json.containsKey('updatedAt') ? DateTime.parse(json['updatedAt']) : null,
      mediaId: json['mediaId'],
      file: json.containsKey('file') ? File(json['file']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'link': link,
      'type': type.toString().split('.').last,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'mediaId': mediaId,
      'file': file?.path,
    };
  }
}
