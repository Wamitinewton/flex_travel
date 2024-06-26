class AvatarReference {
  AvatarReference(this.downloadUrl);
  final String downloadUrl;

  factory AvatarReference.fromMap(Map<String, dynamic> data) {
    final String? downloadUrl = data['downloadUrl'] as String?;
    if (downloadUrl == null) {
      throw ArgumentError('Download URL must not be null');
    }
    return AvatarReference(downloadUrl);
  }

  Map<String, dynamic> toMap() {
    return {
      'downloadUrl': downloadUrl,
    };
  }
}
