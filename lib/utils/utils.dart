import 'package:intl/intl.dart';

String formatNum(int? number) {
  // null 처리
  if (number == null) return '';

  // 숫자 처리
  if (number >= 1000000000) {
    // 10억 이상
    return '999M+';
  } else if (number >= 1000000) {
    // 백만 이상
    double value = number / 1000000;
    return value >= 10
        ? value.toStringAsFixed(0) + 'M'
        : value.toStringAsFixed(1) + 'M';
  } else if (number >= 1000) {
    // 천 이상
    double value = number / 1000;
    return value >= 10
        ? value.toStringAsFixed(0) + 'k'
        : value.toStringAsFixed(1) + 'k';
  } else {
    // 백 이하
    return number.toString();
  }
}

String fromatDate(DateTime? dateTime) {
  // null 처리
  if (dateTime == null) return '';
  // 현재 년도
  final int currentYear = DateTime.now().year;

  String formattedDate = DateFormat('MM-dd HH:mm').format(dateTime);

  if (dateTime.year != currentYear) {
    formattedDate = DateFormat('yy-MM-dd').format(dateTime);
  }

  return formattedDate;

}

class ParseSatellite {
  final int tId;
  final int grade;
  final String tagName;

  ParseSatellite({required this.tId, required this.grade, required this.tagName});

  factory ParseSatellite.fromJson(Map<String, dynamic> json) {
    return ParseSatellite(
      tId: json['tId'],
      grade: json['grade'],
      tagName: json['tagName'],
    );
  }
}

class ParsePrimary {
  final int tId;
  final int grade;
  final String tagName;

  ParsePrimary({required this.tId, required this.grade, required this.tagName});

  factory ParsePrimary.fromJson(Map<String, dynamic> json) {
    return ParsePrimary(
      tId: json['tId'],
      grade: json['grade'],
      tagName: json['tagName'],
    );
  }
}

class ParseOrbit {
  final ParsePrimary primary;
  final List<ParseSatellite> satellites;

  ParseOrbit({required this.primary, required this.satellites});

  factory ParseOrbit.fromJson(Map<String, dynamic> json) {
    var satellitesList = json['satellites'] as List;
    List<ParseSatellite> satellites = satellitesList.map((i) => ParseSatellite.fromJson(i)).toList();

    return ParseOrbit(
      primary: ParsePrimary.fromJson(json['primary']),
      satellites: satellites,
    );
  }
}

class OrbitData {
  final int uId;
  final List<ParseOrbit> orbit;

  OrbitData({required this.uId, required this.orbit});

  factory OrbitData.fromJson(Map<String, dynamic> json) {
    var orbitList = json['orbit'] as List;
    List<ParseOrbit> orbit = orbitList.map((i) => ParseOrbit.fromJson(i)).toList();

    return OrbitData(
      uId: json['uId'],
      orbit: orbit,
    );
  }
}

// Tag 데이터 모델
class Tag {
  final int tagId;
  final String tagName;
  final int count;
  final int? bookmarked;
  final int? change;

  Tag({
    required this.tagId,
    required this.tagName,
    required this.count,
    this.bookmarked,
    this.change,
  });

  // JSON 데이터를 Tag 객체로 변환
  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      tagId: json['tagId'],
      tagName: json['tag_name'],
      count: json['count'],
      bookmarked: json['bookmarked'],
      change: json['change'],
    );
  }
}

// DrawerData 모델
class DrawerData {
  final List<Tag> bookmarked;
  final List<Tag> recommended;

  DrawerData({
    required this.bookmarked,
    required this.recommended,
  });

  // JSON 데이터를 DrawerData 객체로 변환
  factory DrawerData.fromJson(Map<String, dynamic> json) {
    return DrawerData(
      bookmarked: (json['bookmarked'] as List)
          .map((data) => Tag.fromJson(data))
          .toList(),
      recommended: (json['recommended'] as List)
          .map((data) => Tag.fromJson(data))
          .toList(),
    );
  }
}

// Post 데이터 모델
class Post {
  final int post_id;
  final String title;
  final String? content;
  final int? comments;
  final int? like;
  final int? viewed;
  final int? change;
  final DateTime? createdAt;
  final String? imageURL;

  Post({
    required this.post_id,
    required this.title,
    this.comments,
    this.like,
    this.change,
    this.content,
    this.createdAt,
    this.viewed,
    this.imageURL,
  });

  // JSON 데이터를 Post 객체로 변환
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      post_id: json['post_id'],
      title: json['title'],
      comments: json['comments'],
      like: json['like'],
      change: json['change'],
      content: json['content'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      viewed: json['viewed'],
      imageURL: json['imageURL']
    );
  }
}

// RankData 모델
class RankData {
  final List<Post> daily;
  final List<Post> weekly;

  RankData({
    required this.daily,
    required this.weekly,
  });

  // JSON 데이터를 RankData 객체로 변환
  factory RankData.fromJson(Map<String, dynamic> json) {
    return RankData(
      daily: (json['daily'] as List)
          .map((data) => Post.fromJson(data))
          .toList(),
      weekly: (json['weekly'] as List)
          .map((data) => Post.fromJson(data))
          .toList(),
    );
  }
}

// CommunityRankData 모델
class CommunityRankData {
  final List<Tag> rank;

  CommunityRankData({
    required this.rank,
  });

  // JSON 데이터를 RankData 객체로 변환
  factory CommunityRankData.fromJson(Map<String, dynamic> json) {
    return CommunityRankData(
      rank: (json['rank'] as List)
          .map((data) => Tag.fromJson(data))
          .toList(),
    );
  }
}

// PostData 모델
class PostData {
  final List<Post> posts;

  PostData({
    required this.posts,
  });

  // JSON 데이터를 PostData 객체로 변환
  factory PostData.fromJson(Map<String, dynamic> json) {
    return PostData(
      posts: (json['posts'] as List)
          .map((data) => Post.fromJson(data))
          .toList(),
    );
  }
}