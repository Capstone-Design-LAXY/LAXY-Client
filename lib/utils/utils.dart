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
  final String tagName;
  final int? count;
  final int? bookmarked;
  final int? change;
  final int? grade;
  final bool? isBookmarked;

  Tag({
    required this.tagId,
    required this.tagName,
    this.count = 0,
    this.bookmarked = 0,
    this.change = 0,
    this.grade = 1,
    this.isBookmarked = false,
  });

  // JSON 데이터를 Tag 객체로 변환
  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      tagId: json['tagId'],
      tagName: json['tag_name'],
      count: json['count'],
      bookmarked: json['bookmarked'],
      change: json['change'],
      grade: json['grade'],
      isBookmarked: json['isBookmarked'],
    );
  }
  Tag toggleIsBookmarked() {
    int newBookmarked;
    newBookmarked = isBookmarked! ? bookmarked! - 1 : bookmarked! + 1;
    return Tag(
      tagName: tagName,
      tagId: tagId,
      isBookmarked: !isBookmarked!,
      grade: grade,
      change: change,
      count: count,
      bookmarked: newBookmarked,
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
  final int postId;
  final String title;
  final List<Map<String, dynamic>>? content;
  final String? nickname;
  final String? summary;
  final int? userId;
  final int? comments;
  final int? like;
  final int? viewed;
  final int? change;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? imageURL;
  final bool? isLiked;
  final List<Tag>? tags;

  Post({
    required this.postId,
    required this.title,
    this.comments,
    this.userId,
    this.nickname,
    this.like = 0,
    this.change = 0,
    List<Map<String, dynamic>>? content,
    this.createdAt,
    this.updatedAt,
    this.viewed = 0,
    this.imageURL,
    this.isLiked = false,
    this.summary = 'content',
    this.tags,
  }) : this.content = content ?? [{"insert": "\n\n"}];

  // JSON 데이터를 Post 객체로 변환
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['post_id'],
      userId: json['user_id'],
      title: json['title'],
      nickname: json['nickname'],
      comments: json['comments'],
      like: json['like'],
      change: json['change'],
      content: json['content'] != null
        ? List<Map<String, dynamic>>.from(json['content'])
        : null,
      isLiked: json['isLiked'],
      summary: json['summary'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      viewed: json['viewed'],
      imageURL: json['imageURL'],
      tags: json['tags'] != null
        ? (json['tags'] as List)
          .map((data) => Tag.fromJson(data))
          .toList()
        : null,
    );
  }
  Post toggleIsLiked() {
    int newlike;
    newlike = isLiked! ? like! - 1 : like! + 1;
    return Post(
      isLiked: !isLiked!,
      postId: postId,
      userId: userId,
      title: title,
      nickname: nickname,
      comments: comments,
      like: newlike,
      change: change,
      content: content,
      createdAt: createdAt,
      updatedAt: updatedAt,
      viewed: viewed,
      imageURL: imageURL,
      tags: tags,
      summary: summary,
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

// Comment 데이터 모델
class Comment {
  final int commentId;
  final int userId;
  final int? postId;
  final String? nickname;
  final String? contents;
  final int? likes;
  final bool? isLiked;
  final DateTime? updatedAt;

  Comment({
    required this.commentId,
    this.nickname,
    this.postId,
    this.contents = 'null',
    this.isLiked = false,
    this.likes = 0,
    this.updatedAt,
    required this.userId,
  });

  // JSON 데이터를 Post 객체로 변환
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      commentId: json['comment_id'],
      postId: json['postId'],
      nickname: json['nickname'],
      contents: json['contents'],
      isLiked: json['isLiked'],
      likes: json['likes'],
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      userId: json['user_id'],
    );
  }
  Comment toggleIsLiked() {
    int newlike;
    newlike = isLiked! ? likes! - 1 : likes! + 1;
    return Comment(
      userId: userId,
      commentId: commentId,
      nickname: nickname,
      updatedAt: updatedAt,
      likes: newlike,
      contents: contents,
      isLiked: !isLiked!,
      postId: postId,
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
  final int userId;
  final String? nickname;
  final int? posts;
  final int? comments;
  final DateTime? updatedAt;
  final String? email;
  final String? password;
  final List<Tag>? bookmarked;

  User({
    required this.userId,
    this.nickname = '',
    this.posts = 0,
    this.comments = 0,
    this.updatedAt,
    this.email,
    this.password,
    this.bookmarked,
  });

  // JSON 데이터를 Post 객체로 변환
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      email: json['email'],
      nickname: json['nickname'],
      posts: json['posts'],
      comments: json['comments'],
      password: json['password'],
      bookmarked:json['boomarked'] != null
          ? (json['boomarked'] as List)
          .map((data) => Tag.fromJson(data))
          .toList()
          : null,
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

class TempCommunityData {
  final int tagId;
  final RankData? communityMainData;
  final PostData? communityGoodPostData;
  final PostData? communityPostData;
  final CommunityRecommendData? communityRecommendData;

  TempCommunityData({
    required this.tagId,
    this.communityRecommendData,
    this.communityMainData,
    this.communityGoodPostData,
    this.communityPostData,
  });
  factory TempCommunityData.fromJson(Map<String, dynamic> json) {
    return TempCommunityData(
      tagId: json['tagId'],
      communityMainData: RankData.fromJson(json['communityMainData']),
      communityGoodPostData: PostData.fromJson(json['communityGoodPostData']),
      communityPostData: PostData.fromJson(json['communityPostData']),
      communityRecommendData: CommunityRecommendData.fromJson(json['communityRecommendData']),
    );
  }
}

class TempSearchData {
  final String term;
  final SearchTagData? searchCommunityData;
  final SearchTagData? searchTagData;
  final PostData? searchPostData;
  final SearchUserData? searchUserData;

  TempSearchData({
    required this.term,
    this.searchCommunityData,
    this.searchTagData,
    this.searchPostData,
    this.searchUserData,
  });
  factory TempSearchData.fromJson(Map<String, dynamic> json) {
    return TempSearchData(
      term: json['term'],
      searchCommunityData: SearchTagData.fromJson(json['searchCommunityData']),
      searchTagData: SearchTagData.fromJson(json['searchTagData']),
      searchPostData: PostData.fromJson(json['searchPostData']),
      searchUserData: SearchUserData.fromJson(json['searchUserData']),
    );
  }
}