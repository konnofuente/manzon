import 'dart:io';
import 'package:manzon/infrastructure/mappers/export_mapper.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';
import 'package:manzon/app/core/utils/constants/media_collection.dart';
import 'package:manzon/domain/repositories/export_domain_repository.dart';
import 'package:manzon/infrastructure/models/export_infrastruture_models.dart';
import 'package:manzon/infrastructure/data_sources/firebase/media_data_source.dart';

class MediaRepositoryImpl implements MediaRepository {
  final MediaDataSource mediaDataSource;

  MediaRepositoryImpl(this.mediaDataSource);

  @override
  Future<MediaEntity> uploadAssociationAvatar(File file) async {
    final mediaModel = await mediaDataSource.uploadMediaFile(file, MediaCollection.ASSOCIATION_AVATAR);
    if (mediaModel != null) {
      return   MediaMapper.toEntity(mediaModel)!;
    } else {
      throw Exception('Failed to upload association avatar.');
    }
  }

  @override
  Future<void> deleteMedia(String fileId, String collection) async {
    await mediaDataSource.deleteMediaFile(fileId, collection);
  }

  @override
  Future<MediaEntity?> getMediaMetadata(String fileId, String collection) async {
    final metadata = await mediaDataSource.getMediaFileMetadata(fileId, collection);
    if (metadata != null) {
      return MediaModel.fromJson(metadata);
    } else {
      return null;
    }
  }
}
