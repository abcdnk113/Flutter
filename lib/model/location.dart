class Location {
  String? type;
  List<Features>? features;
  Query? query;

  Location({this.type, this.features, this.query});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(new Features.fromJson(v));
      });
    }
    query = json['query'] != null ? new Query.fromJson(json['query']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.features != null) {
      data['features'] = this.features!.map((v) => v.toJson()).toList();
    }
    if (this.query != null) {
      data['query'] = this.query!.toJson();
    }
    return data;
  }
}

class Features {
  String? type;
  Properties? properties;
  Geometry? geometry;
  List<double>? bbox;

  Features({this.type, this.properties, this.geometry, this.bbox});

  Features.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    properties = json['properties'] != null
        ? new Properties.fromJson(json['properties'])
        : null;
    geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
    bbox = json['bbox'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.properties != null) {
      data['properties'] = this.properties!.toJson();
    }
    if (this.geometry != null) {
      data['geometry'] = this.geometry!.toJson();
    }
    data['bbox'] = this.bbox;
    return data;
  }
}

class Properties {
  Datasource? datasource;
  String? oldName;
  String? country;
  String? countryCode;
  String? city;
  double? lon;
  double? lat;
  String? formatted;
  String? addressLine1;
  String? addressLine2;
  String? category;
  Timezone? timezone;
  String? resultType;
  Rank? rank;
  String? placeId;

  Properties(
      {this.datasource,
      this.oldName,
      this.country,
      this.countryCode,
      this.city,
      this.lon,
      this.lat,
      this.formatted,
      this.addressLine1,
      this.addressLine2,
      this.category,
      this.timezone,
      this.resultType,
      this.rank,
      this.placeId});

  Properties.fromJson(Map<String, dynamic> json) {
    datasource = json['datasource'] != null
        ? new Datasource.fromJson(json['datasource'])
        : null;
    oldName = json['old_name'];
    country = json['country'];
    countryCode = json['country_code'];
    city = json['city'];
    lon = json['lon'];
    lat = json['lat'];
    formatted = json['formatted'];
    addressLine1 = json['address_line1'];
    addressLine2 = json['address_line2'];
    category = json['category'];
    timezone = json['timezone'] != null
        ? new Timezone.fromJson(json['timezone'])
        : null;
    resultType = json['result_type'];
    rank = json['rank'] != null ? new Rank.fromJson(json['rank']) : null;
    placeId = json['place_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.datasource != null) {
      data['datasource'] = this.datasource!.toJson();
    }
    data['old_name'] = this.oldName;
    data['country'] = this.country;
    data['country_code'] = this.countryCode;
    data['city'] = this.city;
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    data['formatted'] = this.formatted;
    data['address_line1'] = this.addressLine1;
    data['address_line2'] = this.addressLine2;
    data['category'] = this.category;
    if (this.timezone != null) {
      data['timezone'] = this.timezone!.toJson();
    }
    data['result_type'] = this.resultType;
    if (this.rank != null) {
      data['rank'] = this.rank!.toJson();
    }
    data['place_id'] = this.placeId;
    return data;
  }
}

class Datasource {
  String? sourcename;
  String? attribution;
  String? license;
  String? url;

  Datasource({this.sourcename, this.attribution, this.license, this.url});

  Datasource.fromJson(Map<String, dynamic> json) {
    sourcename = json['sourcename'];
    attribution = json['attribution'];
    license = json['license'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sourcename'] = this.sourcename;
    data['attribution'] = this.attribution;
    data['license'] = this.license;
    data['url'] = this.url;
    return data;
  }
}

class Timezone {
  String? name;
  String? offsetSTD;
  int? offsetSTDSeconds;
  String? offsetDST;
  int? offsetDSTSeconds;

  Timezone(
      {this.name,
      this.offsetSTD,
      this.offsetSTDSeconds,
      this.offsetDST,
      this.offsetDSTSeconds});

  Timezone.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    offsetSTD = json['offset_STD'];
    offsetSTDSeconds = json['offset_STD_seconds'];
    offsetDST = json['offset_DST'];
    offsetDSTSeconds = json['offset_DST_seconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['offset_STD'] = this.offsetSTD;
    data['offset_STD_seconds'] = this.offsetSTDSeconds;
    data['offset_DST'] = this.offsetDST;
    data['offset_DST_seconds'] = this.offsetDSTSeconds;
    return data;
  }
}

class Rank {
  double? importance;
  int? confidence;
  int? confidenceCityLevel;
  String? matchType;

  Rank(
      {this.importance,
      this.confidence,
      this.confidenceCityLevel,
      this.matchType});

  Rank.fromJson(Map<String, dynamic> json) {
    importance = json['importance'];
    confidence = json['confidence'];
    confidenceCityLevel = json['confidence_city_level'];
    matchType = json['match_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['importance'] = this.importance;
    data['confidence'] = this.confidence;
    data['confidence_city_level'] = this.confidenceCityLevel;
    data['match_type'] = this.matchType;
    return data;
  }
}

class Geometry {
  String? type;
  List<double>? coordinates;

  Geometry({this.type, this.coordinates});

  Geometry.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class Query {
  String? text;
  Parsed? parsed;

  Query({this.text, this.parsed});

  Query.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    parsed =
        json['parsed'] != null ? new Parsed.fromJson(json['parsed']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    if (this.parsed != null) {
      data['parsed'] = this.parsed!.toJson();
    }
    return data;
  }
}

class Parsed {
  String? city;
  String? expectedType;

  Parsed({this.city, this.expectedType});

  Parsed.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    expectedType = json['expected_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['expected_type'] = this.expectedType;
    return data;
  }
}