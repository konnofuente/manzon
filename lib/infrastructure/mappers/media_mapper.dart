import 'package:manzon/domain/entities/media_entity.dart';
import 'package:manzon/infrastructure/models/media_model.dart';

class MediaMapper {
  static MediaModel toModel(MediaEntity entity) {
    return MediaModel(
      link: entity.link,
      type: entity.type,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      mediaId: entity.mediaId,
      file: entity.file,
    );
  }

  static MediaEntity toEntity(MediaModel model) {
    return MediaEntity(
      link: model.link,
      type: model.type,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      mediaId: model.mediaId,
      file: model.file,
    );
  }
}
