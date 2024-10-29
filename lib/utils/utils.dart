import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart';
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

String formatDate(DateTime? dateTime) {
  // null 처리
  if (dateTime == null) return '';

  final DateTime now = DateTime.now();
  final Duration difference = now.difference(dateTime);

  // 방금 전
  if (difference.inSeconds < 60) {
    return '방금 전';
  }
  // n분 전
  else if (difference.inMinutes < 10) {
    return '${difference.inMinutes}분 전';
  }
  // 날짜가 같은 경우
  else if (now.year == dateTime.year && now.month == dateTime.month && now.day == dateTime.day) {
    return DateFormat('HH:mm').format(dateTime);
  }
  // 같은 년도에 날짜가 다른 경우
  else if (now.year == dateTime.year) {
    return DateFormat('MM-dd HH:mm').format(dateTime);
  }
  // 다른 년도
  else {
    return DateFormat('yy-MM-dd').format(dateTime);
  }
}

void printLongString(String str) {
  final int maxLength = 500; // 한 번에 출력할 최대 길이
  for (int i = 0; i < str.length; i += maxLength) {
    // maxLength 길이만큼 잘라서 출력
    print(str.substring(i, i + maxLength > str.length ? str.length : i + maxLength));
  }
}

List<Map<String, dynamic>> extractQuillController(QuillController controller) {
  if (controller == null) {
    return [];
  }
  // String jsonString = escapeSpecialCharacters(jsonEncode(controller.document.toDelta().toJson()));
  String jsonString = jsonEncode(controller.document.toDelta().toJson());
  List<Map<String, dynamic>> content = List<Map<String, dynamic>>.from(jsonDecode(jsonString));
  return content;
}

String escapeSpecialCharacters(String input) {
  // 정규 표현식을 사용하여 특수 문자를 이스케이프
  return input.replaceAllMapped(RegExp(r'(["\\])'), (match) {
    // 역슬래시와 큰따옴표 이스케이프 처리
    return '\\${match.group(0)}';
  });
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
  final String name;
  final int? postCount;
  final int? bookmarkCount;
  final int grade;
  final bool? isCommunity;

  Tag({
    required this.tagId,
    required this.name,
    required this.grade,
    this.postCount,
    this.bookmarkCount,
    this.isCommunity,
  });

  // JSON 데이터를 Tag 객체로 변환
  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      tagId: json['tagId'],
      name: json['name'],
      postCount: json['postCount'],
      bookmarkCount: json['bookmarkCount'],
      grade: json['grade'],
      isCommunity: json['isCommunity'],
    );
  }
}

// Post 데이터 모델
class Post {
  final int postId;
  final String title;
  final List<Map<String, dynamic>>? contents;
  final String? author;
  final int? commentCount;
  final int? likeCount;
  final int? viewCount;
  final DateTime? createdAt;
  final String? imageURL;
  final bool? isLiked;
  final bool? isMypost;
  final List<Tag>? tags;

  Post({
    required this.postId,
    required this.title,
    this.commentCount,
    this.author,
    this.likeCount,
    this.contents,
    this.createdAt,
    this.viewCount,
    this.imageURL,
    this.isLiked,
    this.tags,
    this.isMypost,
  });

  // JSON 데이터를 Post 객체로 변환
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['postId'],
      title: json['title'],
      author: json['author'],
      commentCount: json['commentCount'],
      likeCount: json['likeCount'],
      contents: json['contents'] != null
          ? List<Map<String, dynamic>>.from(json['contents'])
          : null,
      isLiked: json['isLiked'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      viewCount: json['viewCount'],
      imageURL: json['imageURL'],
      tags: json['tags'] != null
          ? (json['tags'] as List)
          .map((data) => Tag.fromJson(data))
          .toList()
          : null,
    );
  }
  Post toggleIsLiked() {
    int newLikeCount;
    newLikeCount = isLiked! ? likeCount! - 1 : likeCount! + 1;
    return Post(
      isLiked: !isLiked!,
      postId: postId,
      title: title,
      author: author,
      commentCount: commentCount,
      likeCount: newLikeCount,
      contents: contents,
      createdAt: createdAt,
      viewCount: viewCount,
      imageURL: imageURL,
      tags: tags,
      isMypost: isMypost,
    );
  }
}
// Comment 데이터 모델
class Comment {
  final int commentId;
  final String? contents;
  final String? author;
  final DateTime? createdAt;
  final int? likeCount;
  final int? postId;
  final bool? isPoster;
  final bool? isMyComment;
  final bool? isLiked;

  Comment({
    required this.commentId,
    this.contents,
    this.author,
    this.createdAt,
    this.likeCount,
    this.postId,
    this.isPoster,
    this.isMyComment,
    this.isLiked,
  });

  // JSON 데이터를 Post 객체로 변환
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      commentId: json['commentId'],
      contents: json['contents'],
      author: json['author'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      likeCount: json['likeCount'],
      postId: json['postId'],
      isPoster: json['isPoster'],
      isMyComment: json['isMyComment'],
      isLiked: json['isLiked'],
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

// TagData 모델
class TagData {
  final bool isBookmarked;
  final List<Post> posts;

  TagData({
    required this.isBookmarked,
    required this.posts,
  });

  // JSON 데이터를 PostData 객체로 변환
  factory TagData.fromJson(Map<String, dynamic> json) {
    return TagData(
      isBookmarked: json['is_bookmarked'],
      posts: (json['posts'] as List)
          .map((data) => Post.fromJson(data))
          .toList(),
    );
  }

  TagData toggleIsBookmarked() {
    return TagData(
      isBookmarked: !isBookmarked,
      posts: posts, // posts는 그대로 유지
    );
  }
}

// CommunityData 모델
class CommunityData {
  final bool isBookmarked;

  CommunityData({
    required this.isBookmarked,
  });

  // JSON 데이터를 CommunityData 객체로 변환
  factory CommunityData.fromJson(Map<String, dynamic> json) {
    return CommunityData(
      isBookmarked: json['is_bookmarked']
    );
  }

  CommunityData toggleIsBookmarked() {
    return CommunityData(
      isBookmarked: !isBookmarked,
    );
  }
}

// CommunityRecommendData 모델
class CommunityRecommendData {
  final List<Tag> tags;

  CommunityRecommendData({
    required this.tags,
  });

  // JSON 데이터를 RankData 객체로 변환
  factory CommunityRecommendData.fromJson(Map<String, dynamic> json) {
    return CommunityRecommendData(
      tags: (json['tags'] as List)
          .map((data) => Tag.fromJson(data))
          .toList(),
    );
  }
}

class PostDetailData {
  final Post post;
  final List<Comment> comments;

  PostDetailData({
    required this.post,
    required this.comments,
  });

  // JSON 데이터를 RankData 객체로 변환
  factory PostDetailData.fromJson(Map<String, dynamic> json) {
    return PostDetailData(
      post: Post.fromJson(json['post']),
      comments: (json['comments'] as List)
          .map((data) => Comment.fromJson(data))
          .toList(),
    );
  }
  PostDetailData toggleIsLiked() {
    return PostDetailData(
      post: post.toggleIsLiked(),
      comments: comments
    );
  }
}

class SearchTagData {
  final List<Tag> tags;

  SearchTagData({
    required this.tags,
  });

  // JSON 데이터를 RankData 객체로 변환
  factory SearchTagData.fromJson(Map<String, dynamic> json) {
    return SearchTagData(
      tags: (json['tags'] as List)
          .map((data) => Tag.fromJson(data))
          .toList(),
    );
  }
}

// User 데이터 모델
class User {
  final int? userId;
  final String? nickname;
  final int? posts;
  final int? comments;
  final DateTime? updatedAt;
  final String? email;

  User({
    this.userId,
    this.nickname,
    this.posts,
    this.comments,
    this.updatedAt,
    this.email,
  });

  // JSON 데이터를 Post 객체로 변환
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      email: json['email'],
      nickname: json['nickname'],
      posts: json['posts'],
      comments: json['comments'],
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }
}

class SearchUserData {
  final List<User> users;

  SearchUserData({
    required this.users,
  });

  // JSON 데이터를 RankData 객체로 변환
  factory SearchUserData.fromJson(Map<String, dynamic> json) {
    return SearchUserData(
      users: (json['users'] as List)
          .map((data) => User.fromJson(data))
          .toList(),
    );
  }
}

class CommentData {
  final List<Comment> comments;

  CommentData({
    required this.comments,
  });

  // JSON 데이터를 RankData 객체로 변환
  factory CommentData.fromJson(Map<String, dynamic> json) {
    return CommentData(
      comments: (json['comments'] as List)
          .map((data) => Comment.fromJson(data))
          .toList(),
    );
  }
}