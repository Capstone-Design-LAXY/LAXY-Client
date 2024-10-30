// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:laxy/common/component/custom/custom_dropdown_button.dart';
// import 'package:laxy/common/component/list/list_header.dart';
// import 'package:laxy/common/component/list/post_list_tile.dart';
// import 'package:laxy/common/component/list/user_list_tile.dart';
// import 'package:laxy/utils/utils.dart';
//
// class SearchUserTabView extends StatefulWidget {
//   final String searchTerm; // 검색어를 전달받기 위한 변수
//
//   const SearchUserTabView({
//     required this.searchTerm,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<SearchUserTabView> createState() => _SearchUserTabViewState();
// }
//
// class _SearchUserTabViewState extends State<SearchUserTabView> {
//   late SearchUserData searchUserData;
//
//   @override
//   void initState() {
//     super.initState();
//
//     String jsonString = '''
//     {
//       "users": [
//         {
//           "user_id": 67601,
//           "nickname": "김민수",
//           "comments": 1024,
//           "posts": 512,
//           "updatedAt": "2023-01-10T14:00:00.000Z"
//         },
//         {
//           "user_id": 67602,
//           "nickname": "이영희",
//           "comments": 2048,
//           "posts": 1024,
//           "updatedAt": "2023-01-15T08:30:00.000Z"
//         },
//         {
//           "user_id": 67603,
//           "nickname": "박준호",
//           "comments": 3072,
//           "posts": 2048,
//           "updatedAt": "2023-01-20T11:15:00.000Z"
//         },
//         {
//           "user_id": 67604,
//           "nickname": "최지민",
//           "comments": 1500,
//           "posts": 800,
//           "updatedAt": "2023-01-25T09:00:00.000Z"
//         },
//         {
//           "user_id": 67605,
//           "nickname": "정수빈",
//           "comments": 800,
//           "posts": 1500,
//           "updatedAt": "2023-01-30T15:30:00.000Z"
//         },
//         {
//           "user_id": 67606,
//           "nickname": "강서연",
//           "comments": 2400,
//           "posts": 1900,
//           "updatedAt": "2023-02-05T13:20:00.000Z"
//         },
//         {
//           "user_id": 67607,
//           "nickname": "임하준",
//           "comments": 3200,
//           "posts": 2500,
//           "updatedAt": "2023-02-10T16:45:00.000Z"
//         },
//         {
//           "user_id": 67608,
//           "nickname": "오세훈",
//           "comments": 1280,
//           "posts": 640,
//           "updatedAt": "2023-02-15T12:00:00.000Z"
//         },
//         {
//           "user_id": 67609,
//           "nickname": "배수빈",
//           "comments": 1900,
//           "posts": 860,
//           "updatedAt": "2023-02-20T09:30:00.000Z"
//         },
//         {
//           "user_id": 67610,
//           "nickname": "윤찬미",
//           "comments": 2200,
//           "posts": 3000,
//           "updatedAt": "2023-02-25T11:10:00.000Z"
//         },
//         {
//           "user_id": 67611,
//           "nickname": "서지혜",
//           "comments": 1750,
//           "posts": 1300,
//           "updatedAt": "2023-03-02T14:50:00.000Z"
//         },
//         {
//           "user_id": 67612,
//           "nickname": "진호",
//           "comments": 400,
//           "posts": 1000,
//           "updatedAt": "2023-03-07T08:00:00.000Z"
//         },
//         {
//           "user_id": 67613,
//           "nickname": "장유진",
//           "comments": 3100,
//           "posts": 2700,
//           "updatedAt": "2023-03-12T18:00:00.000Z"
//         },
//         {
//           "user_id": 67614,
//           "nickname": "한상진",
//           "comments": 2600,
//           "posts": 2100,
//           "updatedAt": "2023-03-17T09:45:00.000Z"
//         },
//         {
//           "user_id": 67615,
//           "nickname": "송하늘",
//           "comments": 900,
//           "posts": 750,
//           "updatedAt": "2023-03-22T12:20:00.000Z"
//         },
//         {
//           "user_id": 67616,
//           "nickname": "이승민",
//           "comments": 1500,
//           "posts": 1900,
//           "updatedAt": "2023-03-27T13:15:00.000Z"
//         },
//         {
//           "user_id": 67617,
//           "nickname": "안현수",
//           "comments": 1850,
//           "posts": 900,
//           "updatedAt": "2023-04-01T10:40:00.000Z"
//         },
//         {
//           "user_id": 67618,
//           "nickname": "신유정",
//           "comments": 2900,
//           "posts": 1500,
//           "updatedAt": "2023-04-06T11:05:00.000Z"
//         },
//         {
//           "user_id": 67619,
//           "nickname": "문주희",
//           "comments": 3200,
//           "posts": 2000,
//           "updatedAt": "2023-04-11T15:30:00.000Z"
//         },
//         {
//           "user_id": 67620,
//           "nickname": "허정훈",
//           "comments": 1800,
//           "posts": 2400,
//           "updatedAt": "2023-04-16T16:45:00.000Z"
//         },
//         {
//           "user_id": 67621,
//           "nickname": "이재현",
//           "comments": 1500,
//           "posts": 800,
//           "updatedAt": "2023-04-21T09:50:00.000Z"
//         },
//         {
//           "user_id": 67622,
//           "nickname": "양지수",
//           "comments": 2600,
//           "posts": 1400,
//           "updatedAt": "2023-04-26T12:30:00.000Z"
//         },
//         {
//           "user_id": 67623,
//           "nickname": "차유나",
//           "comments": 3000,
//           "posts": 1800,
//           "updatedAt": "2023-05-01T10:00:00.000Z"
//         },
//         {
//           "user_id": 67624,
//           "nickname": "조민호",
//           "comments": 1300,
//           "posts": 1600,
//           "updatedAt": "2023-05-06T17:15:00.000Z"
//         },
//         {
//           "user_id": 67625,
//           "nickname": "원서연",
//           "comments": 2400,
//           "posts": 2200,
//           "updatedAt": "2023-05-11T14:30:00.000Z"
//         },
//         {
//           "user_id": 67626,
//           "nickname": "곽상우",
//           "comments": 2100,
//           "posts": 1950,
//           "updatedAt": "2023-05-16T13:00:00.000Z"
//         },
//         {
//           "user_id": 67627,
//           "nickname": "유하은",
//           "comments": 800,
//           "posts": 1500,
//           "updatedAt": "2023-05-21T12:20:00.000Z"
//         },
//         {
//           "user_id": 67628,
//           "nickname": "홍민서",
//           "comments": 2900,
//           "posts": 2700,
//           "updatedAt": "2023-05-26T11:00:00.000Z"
//         },
//         {
//           "user_id": 67629,
//           "nickname": "한지민",
//           "comments": 1700,
//           "posts": 1100,
//           "updatedAt": "2023-05-31T10:10:00.000Z"
//         },
//         {
//           "user_id": 67630,
//           "nickname": "이도현",
//           "comments": 2200,
//           "posts": 1300,
//           "updatedAt": "2023-06-05T14:40:00.000Z"
//         },
//         {
//           "user_id": 67631,
//           "nickname": "김하나",
//           "comments": 3600,
//           "posts": 3200,
//           "updatedAt": "2023-06-10T15:00:00.000Z"
//         },
//         {
//           "user_id": 67632,
//           "nickname": "윤서영",
//           "comments": 2800,
//           "posts": 2100,
//           "updatedAt": "2023-06-15T17:30:00.000Z"
//         },
//         {
//           "user_id": 67633,
//           "nickname": "주원",
//           "comments": 1500,
//           "posts": 500,
//           "updatedAt": "2023-06-20T08:30:00.000Z"
//         },
//         {
//           "user_id": 67634,
//           "nickname": "차진우",
//           "comments": 1600,
//           "posts": 1000,
//           "updatedAt": "2023-06-25T09:00:00.000Z"
//         },
//         {
//           "user_id": 67635,
//           "nickname": "배현우",
//           "comments": 2200,
//           "posts": 1500,
//           "updatedAt": "2023-06-30T12:45:00.000Z"
//         },
//         {
//           "user_id": 67636,
//           "nickname": "정민",
//           "comments": 1400,
//           "posts": 700,
//           "updatedAt": "2023-07-05T11:15:00.000Z"
//         },
//         {
//           "user_id": 67637,
//           "nickname": "이재아",
//           "comments": 3000,
//           "posts": 1800,
//           "updatedAt": "2023-07-10T09:00:00.000Z"
//         },
//         {
//           "user_id": 67638,
//           "nickname": "남기훈",
//           "comments": 3200,
//           "posts": 2100,
//           "updatedAt": "2023-07-15T14:00:00.000Z"
//         },
//         {
//           "user_id": 67639,
//           "nickname": "정희원",
//           "comments": 2800,
//           "posts": 2500,
//           "updatedAt": "2023-07-20T08:30:00.000Z"
//         },
//         {
//           "user_id": 67640,
//           "nickname": "오재현",
//           "comments": 1700,
//           "posts": 1300,
//           "updatedAt": "2023-07-25T12:15:00.000Z"
//         },
//         {
//           "user_id": 67641,
//           "nickname": "서현",
//           "comments": 1900,
//           "posts": 800,
//           "updatedAt": "2023-07-30T10:00:00.000Z"
//         },
//         {
//           "user_id": 67642,
//           "nickname": "추민재",
//           "comments": 1500,
//           "posts": 900,
//           "updatedAt": "2023-08-04T14:30:00.000Z"
//         },
//         {
//           "user_id": 67643,
//           "nickname": "윤다솜",
//           "comments": 1200,
//           "posts": 1100,
//           "updatedAt": "2023-08-09T15:45:00.000Z"
//         },
//         {
//           "user_id": 67644,
//           "nickname": "고정훈",
//           "comments": 800,
//           "posts": 600,
//           "updatedAt": "2023-08-14T12:00:00.000Z"
//         },
//         {
//           "user_id": 67645,
//           "nickname": "이서준",
//           "comments": 2100,
//           "posts": 1200,
//           "updatedAt": "2023-08-19T09:20:00.000Z"
//         },
//         {
//           "user_id": 67646,
//           "nickname": "변영수",
//           "comments": 1300,
//           "posts": 950,
//           "updatedAt": "2023-08-24T10:00:00.000Z"
//         },
//         {
//           "user_id": 67647,
//           "nickname": "장세훈",
//           "comments": 2400,
//           "posts": 2000,
//           "updatedAt": "2023-08-29T14:00:00.000Z"
//         },
//         {
//           "user_id": 67648,
//           "nickname": "서진",
//           "comments": 1900,
//           "posts": 850,
//           "updatedAt": "2023-09-03T16:30:00.000Z"
//         },
//         {
//           "user_id": 67649,
//           "nickname": "배가영",
//           "comments": 3000,
//           "posts": 1800,
//           "updatedAt": "2023-09-08T12:00:00.000Z"
//         },
//         {
//           "user_id": 67650,
//           "nickname": "김상호",
//           "comments": 1800,
//           "posts": 1500,
//           "updatedAt": "2023-09-13T11:00:00.000Z"
//         }
//       ]
//     }
//     ''';
//     // JSON 문자열을 RankData 객체로 파싱
//     searchUserData = SearchUserData.fromJson(jsonDecode(jsonString));
//
//     print(searchUserData.users.length);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> _buildUsers() {
//       List<Widget> tags = [];
//       for (int i = 0; i < searchUserData.users.length; i++) {
//         tags.add(
//             UserListTile(
//               nickname: searchUserData.users[i].nickname,
//               comments: searchUserData.users[i].comments,
//               posts: searchUserData.users[i].posts,
//               updatedAt: searchUserData.users[i].updatedAt,
//             )
//         );
//       }
//       return tags;
//     }
//
//     // TODO: 테마 적용
//     return ListView(
//       children: [
//         Column(
//           children: _buildUsers(),
//         ),
//       ],
//     );
//   }
// }
