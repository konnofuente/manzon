import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/export_infrastruture_models.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../domain/entities/export_domain_entities.dart';
import 'package:manzon/app/core/utils/constants/app_api_key.dart';

class MediaDataSource {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _mediaCollection = ApiKey.MEDIA_KEY;

  Future<MediaModel?> uploadMediaFile(File file, String collection) async {
    try {
      String fileId = Uuid().v4();
      Reference storageRef = _storage.ref().child('$collection/$fileId');
      UploadTask uploadTask = storageRef.putFile(file);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      String fileExtension = path.extension(file.path).toLowerCase();
      FileType fileType = FileType.fromExtension(fileExtension);

      Map<String, dynamic> metadata = {
        'id': fileId,
        'url': downloadUrl,
        'type': fileType.toString().split('.').last,
        'uploaded_at': FieldValue.serverTimestamp(),
      };

      await _firestore.collection(_mediaCollection).doc(fileId).set(metadata);

      // Create MediaModel from the metadata
      MediaModel mediaModel = MediaModel(
        mediaId: fileId,
        link: downloadUrl,
        createdAt: DateTime.now(),
        type: fileType,
      );

      return mediaModel;
    } catch (e) {
      print('Error uploading file: $e');
      return null;
    }
  }

  Future<void> deleteMediaFile(String fileId, String collection) async {
    try {
      // Delete the file from Firebase Storage
      Reference storageRef = _storage.ref().child('$collection/$fileId');
      await storageRef.delete();

      // Delete the file metadata from Firestore
      await _firestore.collection(_mediaCollection).doc(fileId).delete();
    } catch (e) {
      print('Error deleting file: $e');
    }
  }

  Future<Map<String, dynamic>?> getMediaFileMetadata(
      String fileId, String collection) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection(_mediaCollection).doc(fileId).get();
      if (doc.exists) {
        return doc.data() as Map<String, dynamic>?;
      }
      return null;
    } catch (e) {
      print('Error fetching file metadata: $e');
      return null;
    }
  }
}
