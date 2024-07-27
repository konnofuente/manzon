enum FileType {
  video,
  image,
  video_link,
  image_link;

  static FileType fromExtension(String fileExtension) {
    switch (fileExtension.toLowerCase()) {
      case '.jpg':
      case '.jpeg':
      case '.png':
      case '.gif':
        return FileType.image;
      case '.mp4':
      case '.mov':
      case '.avi':
        return FileType.video;
      default:
        return FileType.image;
    }
  }

  List<String> get acceptedExtensions {
    switch (this) {
      case FileType.image:
        return ['.jpg', '.jpeg', '.png', '.gif'];
      case FileType.video:
        return ['.mp4', '.mov', '.avi'];

      default:
        return [];
    }
  }
}