import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';

Future<bool> isAccessToken() async{
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  if ( accessToken == null ){
    return false;
  }
  return true;
}

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

class OrbitData {
  final Tag? center;
  final List<Tag>? satellites;

  OrbitData({
    this.center,
    this.satellites,
  });

  factory OrbitData.fromJson(Map<String, dynamic> json) {
    return OrbitData(
      center: Tag.fromJson(json['center']),
      satellites: json['satellites'] != null
          ? (json['satellites'] as List)
          .map((data) => Tag.fromJson(data))
          .toList()
          : null,
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
      tagId: json['tagId'] ?? json['id'],
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
  final String? imageUrl;
  final bool? isLiked;
  final bool? isMyPost;
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
    this.imageUrl,
    this.isLiked,
    this.tags,
    this.isMyPost,
  });

  // JSON 데이터를 Post 객체로 변환
  factory Post.fromJson(Map<String, dynamic> json) {
    // contents를 JSON 문자열로부터 List<Map<String, dynamic>>로 변환
    List<Map<String, dynamic>>? contentsList;
    if (json['contents'] != null) {
      String contentsString = json['contents'];
      // JSON 문자열을 List<Map<String, dynamic>>로 파싱
      contentsList = List<Map<String, dynamic>>.from(jsonDecode(contentsString));
    }
    return Post(
      postId: json['postId'],
      title: json['title'],
      author: json['author'],
      commentCount: json['commentCount'],
      likeCount: json['likeCount'],
      contents: contentsList,
      isLiked: json['isLiked'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      viewCount: json['viewCount'],
      imageUrl: json['imageUrl'],
      isMyPost: json['isMyPost'],
      tags: json['tags'] != null
          ? (json['tags'] as List)
          .map((data) => Tag.fromJson(data))
          .toList()
          : null,
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
  final bool? isMyPost;

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
    this.isMyPost,
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
      isMyPost: json['isMyPost'],
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
