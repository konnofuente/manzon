import 'dart:io';
import 'package:manzon/domain/entities/export_domain_entities.dart';

abstract class MediaRepository {
  Future<MediaEntity> uploadAssociationAvatar(File file);
  Future<void> deleteMedia(String fileId, String collection);
  Future<MediaEntity?> getMediaMetadata(String fileId, String collection);
}
