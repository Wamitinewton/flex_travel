class LocationDetails {
  final String locationId;
  final String name;
  final String description;
  final String webUrl;
  final Address address;
  final List<Ancestor> ancestors;
  final double latitude;
  final double longitude;
  final String timezone;
  final String writeReview;
  final RankingData rankingData;
  final double rating;
  final String ratingImageUrl;
  final int numReviews;
  final ReviewRatingCount reviewRatingCount;
  final List<Subrating> subratings;
  final int photoCount;
  final String seeAllPhotos;
  final String priceLevel;
  final List<String> amenities;
  final String parentBrand;
  final String brand;
  final Category category;
  final List<Category> subcategory;
  final List<String> styles;
  final List<TripType> tripTypes;
  final List<Award> awards;

  LocationDetails({
    required this.locationId,
    required this.name,
    required this.description,
    required this.webUrl,
    required this.address,
    required this.ancestors,
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.writeReview,
    required this.rankingData,
    required this.rating,
    required this.ratingImageUrl,
    required this.numReviews,
    required this.reviewRatingCount,
    required this.subratings,
    required this.photoCount,
    required this.seeAllPhotos,
    required this.priceLevel,
    required this.amenities,
    required this.parentBrand,
    required this.brand,
    required this.category,
    required this.subcategory,
    required this.styles,
    required this.tripTypes,
    required this.awards,
  });

  factory LocationDetails.fromJson(Map<String, dynamic> json) {
    return LocationDetails(
      locationId: json['location_id'],
      name: json['name'],
      description: json['description'],
      webUrl: json['web_url'],
      address: Address.fromJson(json['address_obj']),
      ancestors:
          (json['ancestors'] as List).map((i) => Ancestor.fromJson(i)).toList(),
      latitude: double.parse(json['latitude']),
      longitude: double.parse(json['longitude']),
      timezone: json['timezone'],
      writeReview: json['write_review'],
      rankingData: RankingData.fromJson(json['ranking_data']),
      rating: double.parse(json['rating']),
      ratingImageUrl: json['rating_image_url'],
      numReviews: int.parse(json['num_reviews']),
      reviewRatingCount:
          ReviewRatingCount.fromJson(json['review_rating_count']),
      subratings: (json['subratings'] as Map)
          .values
          .map((i) => Subrating.fromJson(i))
          .toList(),
      photoCount: int.parse(json['photo_count']),
      seeAllPhotos: json['see_all_photos'],
      priceLevel: json['price_level'],
      amenities: List<String>.from(json['amenities']),
      parentBrand: json['parent_brand'],
      brand: json['brand'],
      category: Category.fromJson(json['category']),
      subcategory: (json['subcategory'] as List)
          .map((i) => Category.fromJson(i))
          .toList(),
      styles: List<String>.from(json['styles']),
      tripTypes: (json['trip_types'] as List)
          .map((i) => TripType.fromJson(i))
          .toList(),
      awards: (json['awards'] as List).map((i) => Award.fromJson(i)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location_id': locationId,
      'name': name,
      'description': description,
      'web_url': webUrl,
      'address_obj': address.toJson(),
      'ancestors': ancestors.map((i) => i.toJson()).toList(),
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
      'timezone': timezone,
      'write_review': writeReview,
      'ranking_data': rankingData.toJson(),
      'rating': rating.toString(),
      'rating_image_url': ratingImageUrl,
      'num_reviews': numReviews.toString(),
      'review_rating_count': reviewRatingCount.toJson(),
      'subratings': subratings.map((i) => i.toJson()).toList(),
      'photo_count': photoCount.toString(),
      'see_all_photos': seeAllPhotos,
      'price_level': priceLevel,
      'amenities': amenities,
      'parent_brand': parentBrand,
      'brand': brand,
      'category': category.toJson(),
      'subcategory': subcategory.map((i) => i.toJson()).toList(),
      'styles': styles,
      'trip_types': tripTypes.map((i) => i.toJson()).toList(),
      'awards': awards.map((i) => i.toJson()).toList(),
    };
  }
}

class Address {
  final String street1;
  final String city;
  final String state;
  final String country;
  final String postalcode;
  final String addressString;

  Address({
    required this.street1,
    required this.city,
    required this.state,
    required this.country,
    required this.postalcode,
    required this.addressString,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street1: json['street1'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postalcode: json['postalcode'],
      addressString: json['address_string'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street1': street1,
      'city': city,
      'state': state,
      'country': country,
      'postalcode': postalcode,
      'address_string': addressString,
    };
  }
}

class Ancestor {
  final String level;
  final String name;
  final String locationId;

  Ancestor({
    required this.level,
    required this.name,
    required this.locationId,
  });

  factory Ancestor.fromJson(Map<String, dynamic> json) {
    return Ancestor(
      level: json['level'],
      name: json['name'],
      locationId: json['location_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'level': level,
      'name': name,
      'location_id': locationId,
    };
  }
}

class RankingData {
  final String geoLocationId;
  final String rankingString;
  final String geoLocationName;
  final String rankingOutOf;
  final String ranking;

  RankingData({
    required this.geoLocationId,
    required this.rankingString,
    required this.geoLocationName,
    required this.rankingOutOf,
    required this.ranking,
  });

  factory RankingData.fromJson(Map<String, dynamic> json) {
    return RankingData(
      geoLocationId: json['geo_location_id'],
      rankingString: json['ranking_string'],
      geoLocationName: json['geo_location_name'],
      rankingOutOf: json['ranking_out_of'],
      ranking: json['ranking'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'geo_location_id': geoLocationId,
      'ranking_string': rankingString,
      'geo_location_name': geoLocationName,
      'ranking_out_of': rankingOutOf,
      'ranking': ranking,
    };
  }
}

class ReviewRatingCount {
  final int oneStar;
  final int twoStar;
  final int threeStar;
  final int fourStar;
  final int fiveStar;

  ReviewRatingCount({
    required this.oneStar,
    required this.twoStar,
    required this.threeStar,
    required this.fourStar,
    required this.fiveStar,
  });

  factory ReviewRatingCount.fromJson(Map<String, dynamic> json) {
    return ReviewRatingCount(
      oneStar: int.parse(json['1']),
      twoStar: int.parse(json['2']),
      threeStar: int.parse(json['3']),
      fourStar: int.parse(json['4']),
      fiveStar: int.parse(json['5']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '1': oneStar.toString(),
      '2': twoStar.toString(),
      '3': threeStar.toString(),
      '4': fourStar.toString(),
      '5': fiveStar.toString(),
    };
  }
}

class Subrating {
  final String name;
  final String localizedName;
  final String ratingImageUrl;
  final double value;

  Subrating({
    required this.name,
    required this.localizedName,
    required this.ratingImageUrl,
    required this.value,
  });

  factory Subrating.fromJson(Map<String, dynamic> json) {
    return Subrating(
      name: json['name'],
      localizedName: json['localized_name'],
      ratingImageUrl: json['rating_image_url'],
      value: double.parse(json['value']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'localized_name': localizedName,
      'rating_image_url': ratingImageUrl,
      'value': value.toString(),
    };
  }
}

class Category {
  final String name;
  final String localizedName;

  Category({
    required this.name,
    required this.localizedName,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
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

class TripType {
  final String name;
  final String localizedName;
  final int value;

  TripType({
    required this.name,
    required this.localizedName,
    required this.value,
  });

  factory TripType.fromJson(Map<String, dynamic> json) {
    return TripType(
      name: json['name'],
      localizedName: json['localized_name'],
      value: int.parse(json['value']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'localized_name': localizedName,
      'value': value.toString(),
    };
  }
}

class Award {
  final String awardType;
  final String year;
  final AwardImages images;
  final List<String> categories;
  final String displayName;

  Award({
    required this.awardType,
    required this.year,
    required this.images,
    required this.categories,
    required this.displayName,
  });

  factory Award.fromJson(Map<String, dynamic> json) {
    return Award(
      awardType: json['award_type'],
      year: json['year'],
      images: AwardImages.fromJson(json['images']),
      categories: List<String>.from(json['categories']),
      displayName: json['display_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'award_type': awardType,
      'year': year,
      'images': images.toJson(),
      'categories': categories,
      'display_name': displayName,
    };
  }
}

class AwardImages {
  final String tiny;
  final String small;
  final String large;

  AwardImages({
    required this.tiny,
    required this.small,
    required this.large,
  });

  factory AwardImages.fromJson(Map<String, dynamic> json) {
    return AwardImages(
      tiny: json['tiny'],
      small: json['small'],
      large: json['large'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tiny': tiny,
      'small': small,
      'large': large,
    };
  }
}
