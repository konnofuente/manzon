import 'package:equatable/equatable.dart';
import 'package:manzon/domain/entities/enums/role_enum.dart';


class MediaEntity extends Equatable {
  final String? link;
  final FileType type;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String mediaId;

  MediaEntity({
    this.link,
    required this.type,
    this.createdAt,
    this.updatedAt,
    required this.mediaId,
  });

  @override
  List<Object?> get props => [link, type, createdAt, updatedAt, mediaId];

  // JSON serialization
  factory MediaEntity.fromJson(Map<String, dynamic> json) {
    return MediaEntity(
      link: json['link'],
      type: FileType.values.firstWhere((e) => e.toString() == 'FileType.${json['type']}'),
      createdAt: json.containsKey('createdAt') ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json.containsKey('updatedAt') ? DateTime.parse(json['updatedAt']) : null,
      mediaId: json['mediaId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'link': link,
      'type': type.toString().split('.').last,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'mediaId': mediaId,
    };
  }
}
