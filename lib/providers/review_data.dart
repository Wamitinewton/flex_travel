
class Review {
  final int id;
  final String lang;
  final int locationId;
  final String publishedDate;
  final int rating;
  final int helpfulVotes;
  final String ratingImageUrl;
  final String url;
  final String text;
  final String title;
  final String tripType;
  final String travelDate;
  final User user;
  final Map<String, Subrating> subratings;

  Review({
    required this.id,
    required this.lang,
    required this.locationId,
    required this.publishedDate,
    required this.rating,
    required this.helpfulVotes,
    required this.ratingImageUrl,
    required this.url,
    required this.text,
    required this.title,
    required this.tripType,
    required this.travelDate,
    required this.user,
    required this.subratings,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    var subratingsJson = json['subratings'] as Map<String, dynamic>? ?? {};
    var subratingsMap = subratingsJson.map((key, value) => MapEntry(key, Subrating.fromJson(value)));
    return Review(
      id: json['id'],
      lang: json['lang'],
      locationId: json['location_id'],
      publishedDate: json['published_date'],
      rating: json['rating'],
      helpfulVotes: json['helpful_votes'],
      ratingImageUrl: json['rating_image_url'],
      url: json['url'],
      text: json['text'],
      title: json['title'],
      tripType: json['trip_type'],
      travelDate: json['travel_date'],
      user: User.fromJson(json['user']),
      subratings: subratingsMap,
    );
  }

  Map<String, dynamic> toJson() {
    var subratingsMap = subratings.map((key, value) => MapEntry(key, value.toJson()));
    return {
      'id': id,
      'lang': lang,
      'location_id': locationId,
      'published_date': publishedDate,
      'rating': rating,
      'helpful_votes': helpfulVotes,
      'rating_image_url': ratingImageUrl,
      'url': url,
      'text': text,
      'title': title,
      'trip_type': tripType,
      'travel_date': travelDate,
      'user': user.toJson(),
      'subratings': subratingsMap,
    };
  }
}

class User {
  final String username;
  final UserLocation userLocation;
  final Avatar avatar;

  User({
    required this.username,
    required this.userLocation,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      userLocation: UserLocation.fromJson(json['user_location']),
      avatar: Avatar.fromJson(json['avatar']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'user_location': userLocation.toJson(),
      'avatar': avatar.toJson(),
    };
  }
}

class UserLocation {
  final String id;
  final String name;

  UserLocation({
    required this.id,
    required this.name,
  });

  factory UserLocation.fromJson(Map<String, dynamic> json) {
    return UserLocation(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class Avatar {
  final String thumbnail;
  final String small;
  final String medium;
  final String large;
  final String original;

  Avatar({
    required this.thumbnail,
    required this.small,
    required this.medium,
    required this.large,
    required this.original,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) {
    return Avatar(
      thumbnail: json['thumbnail'],
      small: json['small'],
      medium: json['medium'],
      large: json['large'],
      original: json['original'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'thumbnail': thumbnail,
      'small': small,
      'medium': medium,
      'large': large,
      'original': original,
    };
  }
}

class Subrating {
  final String name;
  final String ratingImageUrl;
  final int value;
  final String localizedName;

  Subrating({
    required this.name,
    required this.ratingImageUrl,
    required this.value,
    required this.localizedName,
  });

  factory Subrating.fromJson(Map<String, dynamic> json) {
    return Subrating(
      name: json['name'],
      ratingImageUrl: json['rating_image_url'],
      value: json['value'],
      localizedName: json['localized_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'rating_image_url': ratingImageUrl,
      'value': value,
      'localized_name': localizedName,
    };
  }
}

class ReviewData {
  final List<Review> data;

  ReviewData({required this.data});

  factory ReviewData.fromJson(Map<String, dynamic> json) {
    return ReviewData(
      data: (json['data'] as List).map((i) => Review.fromJson(i)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((i) => i.toJson()).toList(),
    };
  }
}
