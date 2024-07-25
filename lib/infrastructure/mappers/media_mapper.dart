import 'package:manzon/domain/entities/media_entity.dart';
import 'package:manzon/infrastructure/models/media_model.dart';

class MediaMapper {
  static MediaModel toModel(MediaEntity mediaEntity) {
    return MediaModel(
      link: mediaEntity.link,
      type: mediaEntity.type,
      createdAt: mediaEntity.createdAt,
      updatedAt: mediaEntity.updatedAt,
      mediaId: mediaEntity.mediaId,
    );
  }

  static MediaEntity toEntity(MediaModel mediaModel) {
    return MediaEntity(
      link: mediaModel.link,
      type: mediaModel.type,
      createdAt: mediaModel.createdAt,
      updatedAt: mediaModel.updatedAt,
      mediaId: mediaModel.mediaId,
    );
  }
}
