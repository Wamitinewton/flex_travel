
class Photo {
  final int id;
  final bool isBlessed;
  final String caption;
  final String publishedDate;
  final Images images;
  final String album;
  final Source source;
  final User user;

  Photo({
    required this.id,
    required this.isBlessed,
    required this.caption,
    required this.publishedDate,
    required this.images,
    required this.album,
    required this.source,
    required this.user,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      isBlessed: json['is_blessed'],
      caption: json['caption'],
      publishedDate: json['published_date'],
      images: Images.fromJson(json['images']),
      album: json['album'],
      source: Source.fromJson(json['source']),
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'is_blessed': isBlessed,
      'caption': caption,
      'published_date': publishedDate,
      'images': images.toJson(),
      'album': album,
      'source': source.toJson(),
      'user': user.toJson(),
    };
  }
}

class Images {
  final ImageDetail thumbnail;
  final ImageDetail small;
  final ImageDetail medium;
  final ImageDetail large;
  final ImageDetail original;

  Images({
    required this.thumbnail,
    required this.small,
    required this.medium,
    required this.large,
    required this.original,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      thumbnail: ImageDetail.fromJson(json['thumbnail']),
      small: ImageDetail.fromJson(json['small']),
      medium: ImageDetail.fromJson(json['medium']),
      large: ImageDetail.fromJson(json['large']),
      original: ImageDetail.fromJson(json['original']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'thumbnail': thumbnail.toJson(),
      'small': small.toJson(),
      'medium': medium.toJson(),
      'large': large.toJson(),
      'original': original.toJson(),
    };
  }
}

class ImageDetail {
  final int height;
  final int width;
  final String url;

  ImageDetail({
    required this.height,
    required this.width,
    required this.url,
  });

  factory ImageDetail.fromJson(Map<String, dynamic> json) {
    return ImageDetail(
      height: json['height'],
      width: json['width'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'width': width,
      'url': url,
    };
  }
}

class Source {
  final String name;
  final String localizedName;

  Source({
    required this.name,
    required this.localizedName,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      name: json['name'],
      localizedName: json['localized_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'localized_name': localizedName,
    };
  }
}

class User {
  final String username;

  User({
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
    };
  }
}

class PhotoData {
  final List<Photo> data;

  PhotoData({required this.data});

  factory PhotoData.fromJson(Map<String, dynamic> json) {
    return PhotoData(
      data: (json['data'] as List).map((i) => Photo.fromJson(i)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((i) => i.toJson()).toList(),
    };
  }
}
