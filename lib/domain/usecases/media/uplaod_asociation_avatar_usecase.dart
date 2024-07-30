import 'dart:io';
import 'package:manzon/domain/entities/media_entity.dart';
import 'package:manzon/domain/repositories/media_repository.dart';

class UploadAssociationAvatarUseCase {
  final MediaRepository mediaRepository;

  UploadAssociationAvatarUseCase(this.mediaRepository);

  Future<MediaEntity> call(File file) async {
    return await mediaRepository.uploadAssociationAvatar(file);
  }
}
