import 'package:manzon/domain/entities/enums/role_enum.dart';

class MediaEntity {
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
}