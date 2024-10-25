import 'dart:convert';
import '../utils/utils.dart';

List<User> allUser = [
    User(userId: 67601, nickname: "김민수", comments: 1024, posts: 512, updatedAt: DateTime.parse("2023-01-10T14:00:00.000Z")),
    User(userId: 67602, nickname: "이영희", comments: 2048, posts: 1024, updatedAt: DateTime.parse("2023-01-15T08:30:00.000Z")),
    User(userId: 67603, nickname: "박준호", comments: 3072, posts: 2048, updatedAt: DateTime.parse("2023-01-20T11:15:00.000Z")),
    User(userId: 67604, nickname: "최지민", comments: 1500, posts: 800, updatedAt: DateTime.parse("2023-01-25T09:00:00.000Z")),
    User(userId: 67605, nickname: "정수빈", comments: 800, posts: 1500, updatedAt: DateTime.parse("2023-01-30T15:30:00.000Z")),
    User(userId: 67606, nickname: "강서연", comments: 2400, posts: 1900, updatedAt: DateTime.parse("2023-02-05T13:20:00.000Z")),
    User(userId: 67607, nickname: "임하준", comments: 3200, posts: 2500, updatedAt: DateTime.parse("2023-02-10T16:45:00.000Z")),
    User(userId: 67608, nickname: "오세훈", comments: 1280, posts: 640, updatedAt: DateTime.parse("2023-02-15T12:00:00.000Z")),
    User(userId: 67609, nickname: "배수빈", comments: 1900, posts: 860, updatedAt: DateTime.parse("2023-02-20T09:30:00.000Z")),
    User(userId: 67610, nickname: "윤찬미", comments: 2200, posts: 3000, updatedAt: DateTime.parse("2023-02-25T11:10:00.000Z")),
    User(userId: 67611, nickname: "서지혜", comments: 1750, posts: 1300, updatedAt: DateTime.parse("2023-03-02T14:50:00.000Z")),
    User(userId: 67612, nickname: "진호", comments: 400, posts: 1000, updatedAt: DateTime.parse("2023-03-07T08:00:00.000Z")),
    User(userId: 67613, nickname: "장유진", comments: 3100, posts: 2700, updatedAt: DateTime.parse("2023-03-12T18:00:00.000Z")),
    User(userId: 67614, nickname: "한상진", comments: 2600, posts: 2100, updatedAt: DateTime.parse("2023-03-17T09:45:00.000Z")),
    User(userId: 67615, nickname: "송하늘", comments: 900, posts: 750, updatedAt: DateTime.parse("2023-03-22T12:20:00.000Z")),
    User(userId: 67616, nickname: "이승민", comments: 1500, posts: 1900, updatedAt: DateTime.parse("2023-03-27T13:15:00.000Z")),
    User(userId: 67617, nickname: "안현수", comments: 1850, posts: 900, updatedAt: DateTime.parse("2023-04-01T10:40:00.000Z")),
    User(userId: 67618, nickname: "신유정", comments: 2900, posts: 1500, updatedAt: DateTime.parse("2023-04-06T11:05:00.000Z")),
    User(userId: 67619, nickname: "문주희", comments: 3200, posts: 2000, updatedAt: DateTime.parse("2023-04-11T15:30:00.000Z")),
    User(userId: 67620, nickname: "허정훈", comments: 1800, posts: 2400, updatedAt: DateTime.parse("2023-04-16T16:45:00.000Z")),
    User(userId: 67621, nickname: "이재현", comments: 1500, posts: 800, updatedAt: DateTime.parse("2023-04-21T09:50:00.000Z")),
    User(userId: 67622, nickname: "양지수", comments: 2600, posts: 1400, updatedAt: DateTime.parse("2023-04-26T12:30:00.000Z")),
    User(userId: 67623, nickname: "차유나", comments: 3000, posts: 1800, updatedAt: DateTime.parse("2023-05-01T10:00:00.000Z")),
    User(userId: 67624, nickname: "조민호", comments: 1300, posts: 1600, updatedAt: DateTime.parse("2023-05-06T17:15:00.000Z")),
    User(userId: 67625, nickname: "원서연", comments: 2400, posts: 2200, updatedAt: DateTime.parse("2023-05-11T14:30:00.000Z")),
    User(userId: 67626, nickname: "곽상우", comments: 2100, posts: 1950, updatedAt: DateTime.parse("2023-05-16T13:00:00.000Z")),
    User(userId: 67627, nickname: "유하은", comments: 800, posts: 1500, updatedAt: DateTime.parse("2023-05-21T12:20:00.000Z")),
    User(userId: 67628, nickname: "홍민서", comments: 2900, posts: 2700, updatedAt: DateTime.parse("2023-05-26T11:00:00.000Z")),
    User(userId: 67629, nickname: "한지민", comments: 1700, posts: 1100, updatedAt: DateTime.parse("2023-05-31T10:10:00.000Z")),
    User(userId: 67630, nickname: "이도현", comments: 2200, posts: 1300, updatedAt: DateTime.parse("2023-06-05T14:40:00.000Z")),
    User(userId: 67631, nickname: "김하나", comments: 3600, posts: 3200, updatedAt: DateTime.parse("2023-06-10T15:00:00.000Z")),
    User(userId: 67632, nickname: "윤서영", comments: 2800, posts: 2100, updatedAt: DateTime.parse("2023-06-15T17:30:00.000Z")),
    User(userId: 67633, nickname: "주원", comments: 1500, posts: 500, updatedAt: DateTime.parse("2023-06-20T08:30:00.000Z")),
    User(userId: 67634, nickname: "차진우", comments: 1600, posts: 1000, updatedAt: DateTime.parse("2023-06-25T09:00:00.000Z")),
    User(userId: 67635, nickname: "배현우", comments: 2200, posts: 1500, updatedAt: DateTime.parse("2023-06-30T12:45:00.000Z")),
    User(userId: 67636, nickname: "정민", comments: 1400, posts: 700, updatedAt: DateTime.parse("2023-07-05T11:15:00.000Z")),
    User(userId: 67637, nickname: "이재아", comments: 3000, posts: 1800, updatedAt: DateTime.parse("2023-07-10T09:00:00.000Z")),
    User(userId: 67638, nickname: "남기훈", comments: 3200, posts: 2100, updatedAt: DateTime.parse("2023-07-15T14:00:00.000Z")),
    User(userId: 67639, nickname: "정희원", comments: 2800, posts: 2500, updatedAt: DateTime.parse("2023-07-20T08:30:00.000Z")),
    User(userId: 67640, nickname: "오재현", comments: 1700, posts: 1300, updatedAt: DateTime.parse("2023-07-25T12:15:00.000Z")),
    User(userId: 67641, nickname: "서현", comments: 1900, posts: 800, updatedAt: DateTime.parse("2023-07-30T10:00:00.000Z")),
    User(userId: 67642, nickname: "추민재", comments: 1500, posts: 900, updatedAt: DateTime.parse("2023-08-04T14:30:00.000Z")),
    User(userId: 67643, nickname: "윤다솜", comments: 1200, posts: 1100, updatedAt: DateTime.parse("2023-08-09T15:45:00.000Z")),
    User(userId: 67644, nickname: "고정훈", comments: 800, posts: 600, updatedAt: DateTime.parse("2023-08-14T12:00:00.000Z")),
    User(userId: 67645, nickname: "이서준", comments: 2100, posts: 1200, updatedAt: DateTime.parse("2023-08-19T09:20:00.000Z")),
    User(userId: 67646, nickname: "변영수", comments: 1300, posts: 950, updatedAt: DateTime.parse("2023-08-24T10:00:00.000Z")),
    User(userId: 67647, nickname: "장세훈", comments: 2400, posts: 2000, updatedAt: DateTime.parse("2023-08-29T14:00:00.000Z")),
    User(userId: 67648, nickname: "서진", comments: 1900, posts: 850, updatedAt: DateTime.parse("2023-09-03T16:30:00.000Z")),
    User(userId: 67649, nickname: "배가영", comments: 3000, posts: 1800, updatedAt: DateTime.parse("2023-09-08T12:00:00.000Z")),
    User(userId: 67650, nickname: "김상호", comments: 1800, posts: 1500, updatedAt: DateTime.parse("2023-09-13T11:00:00.000Z")),
    User(userId: 672394, nickname: "CHUYA"),
    User(userId: 238472, nickname: "FlutterFan"),
    User(userId: 912734, nickname: "개발자준"),
    User(userId: 123123123, nickname: "LAXY", password: 'rkskek', email: 'rkskek@naver.com'),
    User(userId: 123321123, nickname: "이승목", password: 'aaa', email: 'aaa@aaa.aaa'),
    User(userId: 1, nickname: "민지호", comments: 51, posts: 9, updatedAt: DateTime.parse("2023-01-10T14:00:00.000Z")),
    User(userId: 2, nickname: "정민지", comments: 21, posts: 5, updatedAt: DateTime.parse("2023-01-15T14:00:00.000Z")),
    User(userId: 3, nickname: "김민지", comments: 43, posts: 19, updatedAt: DateTime.parse("2023-01-20T14:00:00.000Z")),
];
List<Post> allPost = [
    Post(postId: 87291, title: "오늘의 날씨는?", summary: "비가 올 것 같아요. 우산 챙기세요.", comments: 182, like: 521, viewed: 899, createdAt: DateTime.parse("2021-04-25T12:34:00.000Z")),
    Post(postId: 97852, title: "새로운 취미 추천", summary: "요즘 뜨는 취미는 무엇일까요?", comments: 249, like: 783, viewed: 1374, createdAt: DateTime.parse("2022-02-15T08:22:00.000Z")),
    Post(postId: 11237, title: "아침 운동의 중요성", summary: "매일 아침 운동하는 습관!", comments: 321, like: 456, viewed: 1023, createdAt: DateTime.parse("2020-09-12T07:40:00.000Z")),
    Post(postId: 56389, title: "재테크 꿀팁 공유", summary: "소액 투자로 시작하는 재테크", comments: 405, like: 642, viewed: 1845, imageURL: "https://picsum.photos/200", createdAt: DateTime.parse("2023-06-19T15:15:00.000Z")),
    Post(postId: 23876, title: "여행 준비물 리스트", summary: "꼭 챙겨야 할 필수 아이템들", comments: 92, like: 317, viewed: 744, createdAt: DateTime.parse("2021-11-30T09:00:00.000Z")),
    Post(postId: 46378, title: "추천 영화 리스트", summary: "주말에 보기 좋은 영화들", comments: 533, like: 910, viewed: 2458, createdAt: DateTime.parse("2019-07-18T14:10:00.000Z")),
    Post(postId: 91234, title: "책 읽기의 장점", summary: "매일 책 읽기의 중요성을 알아봅시다.", comments: 67, like: 155, viewed: 481, createdAt: DateTime.parse("2020-10-10T18:24:00.000Z")),
    Post(postId: 66728, title: "반려동물 관리 방법", summary: "강아지 털 관리 팁", comments: 187, like: 259, viewed: 891, createdAt: DateTime.parse("2021-08-22T04:05:00.000Z")),
    Post(postId: 57893, title: "헬스장 추천", summary: "어디 헬스장이 좋은가요?", comments: 200, like: 378, viewed: 1298, createdAt: DateTime.parse("2022-01-02T11:45:00.000Z")),
    Post(postId: 34892, title: "IT 트렌드 분석", summary: "올해 뜨는 IT 기술은?", comments: 450, like: 821, viewed: 2114, imageURL: "https://picsum.photos/200", createdAt: DateTime.parse("2020-02-24T16:18:00.000Z")),
    Post(postId: 89347, title: "최신 가전제품", summary: "최신 스마트 가전 소개합니다.", comments: 134, like: 452, viewed: 1203, createdAt: DateTime.parse("2023-05-14T21:50:00.000Z")),
    Post(postId: 23901, title: "등산 코스 추천", summary: "가을에 가기 좋은 산", comments: 98, like: 245, viewed: 621, createdAt: DateTime.parse("2022-09-21T05:11:00.000Z")),
    Post(postId: 70483, title: "홈 카페 인테리어", summary: "집에서 즐기는 홈 카페 꾸미기", comments: 301, like: 502, viewed: 1501, createdAt: DateTime.parse("2021-03-10T14:55:00.000Z")),
    Post(postId: 53692, title: "내일의 주식 전망", summary: "주식 시장 분석과 내일의 전망", comments: 775, like: 923, viewed: 3095, createdAt: DateTime.parse("2023-02-28T08:40:00.000Z")),
    Post(postId: 13290, title: "다이어트 식단", summary: "건강한 식단으로 체중 감량하기", comments: 354, like: 620, viewed: 1450, imageURL: "https://picsum.photos/200", createdAt: DateTime.parse("2020-06-17T07:30:00.000Z")),
    Post(postId: 49723, title: "쇼핑몰 추천", summary: "가성비 좋은 온라인 쇼핑몰 추천", comments: 156, like: 399, viewed: 1084, createdAt: DateTime.parse("2019-12-05T03:17:00.000Z")),
    Post(postId: 89014, title: "내가 사랑하는 음악", summary: "요즘 듣고 있는 음악 추천", comments: 66, like: 289, viewed: 672, createdAt: DateTime.parse("2021-07-22T02:02:00.000Z")),
    Post(postId: 78512, title: "명언 모음집", summary: "삶에 도움이 되는 명언들", comments: 402, like: 703, viewed: 1822, createdAt: DateTime.parse("2020-11-12T09:50:00.000Z")),
    Post(postId: 58329, title: "헬시푸드 레시피", summary: "간단하고 건강한 요리법", comments: 285, like: 563, viewed: 1307, imageURL: "https://picsum.photos/200", createdAt: DateTime.parse("2023-03-23T13:07:00.000Z")),
    Post(postId: 29387, title: "여행 후기 공유", summary: "최근 다녀온 여행 후기를 남겨요.", comments: 141, like: 329, viewed: 889, imageURL: "https://picsum.photos/200", createdAt: DateTime.parse("2022-05-06T12:14:00.000Z")),
    Post(postId: 97245, title: "독서 습관 들이기", summary: "하루 10분 독서로 시작하기", comments: 158, like: 487, viewed: 1249, createdAt: DateTime.parse("2021-10-18T19:30:00.000Z")),
    Post(postId: 40982, title: "간단한 운동법", summary: "5분 만에 하는 스트레칭", comments: 72, like: 205, viewed: 654, createdAt: DateTime.parse("2023-08-07T17:25:00.000Z")),
    Post(postId: 89120, title: "요리 초보의 도전", summary: "처음 해본 파스타 요리!", comments: 186, like: 423, viewed: 1140, imageURL: "https://picsum.photos/200", createdAt: DateTime.parse("2019-03-13T05:12:00.000Z")),
    Post(postId: 67653, title: "매일 아침 루틴", summary: "성공적인 아침 루틴 만들기", comments: 321, like: 612, viewed: 1504, createdAt: DateTime.parse("2020-07-29T10:44:00.000Z")),
    Post(postId: 13987, title: "온라인 클래스 추천", summary: "취미를 배울 수 있는 사이트", comments: 312, like: 581, viewed: 1319, createdAt: DateTime.parse("2022-11-02T03:25:00.000Z")),
    Post(postId: 91208, title: "반려동물 입양", summary: "입양 전 알아야 할 사항들", comments: 128, like: 394, viewed: 1012, imageURL: "https://picsum.photos/200", createdAt: DateTime.parse("2021-06-09T06:20:00.000Z")),
    Post(postId: 25781, title: "커피 원두 추천", summary: "향과 맛이 좋은 원두 추천", comments: 85, like: 221, viewed: 754, createdAt: DateTime.parse("2020-01-15T18:35:00.000Z")),
    Post(postId: 10987, title: "게임 추천", summary: "요즘 핫한 게임은?", comments: 411, like: 759, viewed: 2023, createdAt: DateTime.parse("2019-09-29T13:56:00.000Z")),
    Post(postId: 78012, title: "자동차 관리 팁", summary: "겨울철 자동차 관리 요령", comments: 142, like: 372, viewed: 936, imageURL: "https://picsum.photos/200", createdAt: DateTime.parse("2022-12-11T20:19:00.000Z")),
    Post(postId: 47982, title: "집에서 하는 간단 요리", summary: "쉬운 재료로 만드는 요리", comments: 98, like: 310, viewed: 890, createdAt: DateTime.parse("2023-07-03T04:12:00.000Z")),
    Post(postId: 68371, title: "책 추천", summary: "마음의 양식을 채우는 도서", comments: 183, like: 533, viewed: 1211, imageURL: "https://picsum.photos/200", createdAt: DateTime.parse("2021-05-28T09:18:00.000Z")),
    Post(postId: 29382, title: "공부 자극 글", summary: "열심히 공부하는 법을 배워보세요.", comments: 257, like: 687, viewed: 1589, imageURL: "https://picsum.photos/200", createdAt: DateTime.parse("2022-08-10T14:28:00.000Z")),
    Post(postId: 47281, title: "의류 쇼핑몰 추천", summary: "저렴하고 트렌디한 의류 추천", comments: 198, like: 489, viewed: 1187, imageURL: "https://picsum.photos/200", createdAt: DateTime.parse("2020-05-05T22:10:00.000Z")),
    Post(postId: 98237, title: "취미 만들기", summary: "취미로 시작하는 나만의 프로젝트", comments: 223, like: 431, viewed: 1205, createdAt: DateTime.parse("2019-01-17T10:55:00.000Z")),
    Post(postId: 13567, title: "알뜰 쇼핑 팁", summary: "저렴하게 쇼핑하는 방법", comments: 302, like: 675, viewed: 1432, createdAt: DateTime.parse("2021-02-13T08:22:00.000Z")),
    Post(postId: 62589, title: "겨울 스포츠 즐기기", summary: "스키, 스노우보드 즐기는 팁", comments: 109, like: 312, viewed: 819, createdAt: DateTime.parse("2022-12-23T05:47:00.000Z")),
    Post(postId: 32901, title: "맛집 추천", summary: "이번 주말 가볼만한 맛집", comments: 457, like: 801, viewed: 2301, imageURL: "https://picsum.photos/200", createdAt: DateTime.parse("2020-11-27T15:09:00.000Z")),
    Post(postId: 67638, title: "새로운 취미를 찾다: 하루 만에 시작하는 5가지 방법", comments: 6600, like: 7797, change: 18),
    Post(postId: 80603, title: "아침 루틴으로 성공을 잡는 법: 7가지 필수 팁", comments: 9892, like: 31611, change: 6),
    Post(postId: 18550, title: "여행의 설렘, 그리고 놓치지 말아야 할 순간들", comments: 1940, like: 95441, change: -2),
    Post(postId: 70709, title: "시간 관리의 비밀: 효율적으로 일하는 10가지 습관", comments: 4967, like: 149, change: 18),
    Post(postId: 30827, title: "내가 몰랐던 커피의 세계: 당신이 알아야 할 정보", comments: 8451, like: 12065, change: -5),
    Post(postId: 40604, title: "내 방을 아늑하게 꾸미는 방법: 인테리어 팁 5선", comments: 7243, like: 24354, change: 0),
    Post(postId: 60880, title: "운동을 즐기는 방법: 초보자를 위한 가이드", comments: 4920, like: 55483, change: -7),
    Post(postId: 9754, title: "디지털 디톡스: 일주일 동안 SNS 없이 살아보기", comments: 2296, like: 82045, change: -5),
    Post(postId: 6668, title: "건강한 식습관으로의 첫걸음: 간단한 레시피 3가지", comments: 7811, like: 60625, change: 9),
    Post(postId: 60207, title: "어떻게 하면 긍정적으로 생각할 수 있을까? 마음을 다스리는 법", comments: 1427, like: 72095, change: 10),
    Post(postId: 67638, title: "미래 직업 전망: 2030년에 뜰 산업 7가지", comments: 6600, like: 7797, change: 18),
    Post(postId: 80603, title: "성공적인 팀워크의 핵심: 협업을 위한 5가지 팁", comments: 9892, like: 31611, change: 6),
    Post(postId: 18550, title: "집에서 만드는 힐링 스파: DIY 홈케어 방법", comments: 1940, like: 95441, change: -9),
    Post(postId: 70709, title: "일상 속 작은 변화로 큰 행복 찾기", comments: 4967, like: 149, change: 18),
    Post(postId: 30827, title: "일 잘하는 사람들의 공통점: 생산성 높이는 습관", comments: 8451, like: 12065, change: -5),
    Post(postId: 40604, title: "바쁜 아침에도 가능한 10분 아침 요가 루틴", comments: 7243, like: 24354, change: 0),
    Post(postId: 60880, title: "여행 사진 잘 찍는 법: 초보자를 위한 촬영 팁", comments: 4920, like: 55483, change: -7),
    Post(postId: 9754, title: "아이디어가 넘치는 사람들의 사고방식: 창의력 향상 비법", comments: 2296, like: 82045, change: -5),
    Post(postId: 6668, title: "집에서도 가능한 쉬운 운동 루틴: 초보자 가이드", comments: 7811, like: 60625, change: 9),
    Post(postId: 60207, title: "매일 실천하는 자기 계발 습관: 삶을 바꾸는 작은 행동들", comments: 1427, like: 72095, change: 10),
    Post(postId: 982347, title: "[iOS 18] 새로생긴 iOS 18의 기능들 요약 정리", userId: 451927, nickname: "꼬부7I", summary: "iOS 18의 새로운 기능들을 정리해봤습니다.", tags: [Tag(tagId: 3765, tagName: "Flutter", grade: 1), Tag(tagId: 5432, tagName: "API연동", grade: 5), Tag(tagId: 8907, tagName: "개발팁", grade: 11)],
        content: [
        {
            "insert": {
                "image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDA5MTdfMTU0/MDAxNzI2NTE2MDg1NTk5.M_iay-1R8pS0EJ-gByASWK3uIvlzsAgwiOwe2q3Qn0kg.DwXRVt7bVLCKq-b6RdxpGVeMAMNDgvNSA5C8VC1O1eUg.JPEG/Generic-iOS-18-Feature-Real-Mock.jpg?type=w1600"
            }
        },
        {
            "insert": "\n\n"
        },
        {
            "insert": "iOS 18의 새로운 기능들을 정리해봤습니다.",
            "attributes": {
                "bold": true
            }
        },
        {
            "insert": "\n\n직접 해보면서 간단하게 "
        },
        {
            "insert": "요약정리한",
            "attributes": {
                "background": "#FFFFF59D"
            }
        },
        {
            "insert": " 것이니 참조만 해주세요~\n\n"
        },
        {
            "insert": {
                "image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDA5MTdfNTUg/MDAxNzI2NTA4NzY0MDU2.lemsm24MuabUk8kJLYgM0OwHd6bSMdPtoSbWAP2zyYcg.Ljivq_OtVuadsoz-PTgDUHKCgvDRUl1b1UPMmNU1MW8g.PNG/%EC%95%94%ED%98%B8_%EC%95%B1%2C_%EB%B0%B0%EC%97%B4.png?type=w1600"
            },
            "attributes": {
                "style": "width: 392.72727272727275; height: 310.176; "
            }
        },
        {
            "insert": " "
        },
        {
            "insert": "ios 18 ",
            "attributes": {
                "color": "#FF1E88E5"
            }
        },
        {
            "insert": "에서는 홈화면을 자유롭게 꾸밀 수 있습니다.\n새로운 홈화면 꾸미기"
        },
        {
            "insert": "\n",
            "attributes": {
                "blockquote": true
            }
        },
        {
            "insert": "앱 배열 사용자화"
        },
        {
            "insert": "\n",
            "attributes": {
                "list": "bullet"
            }
        },
        {
            "insert": "암호앱"
        },
        {
            "insert": "\n",
            "attributes": {
                "list": "bullet"
            }
        },
        {
            "insert": "앱 색상 변경"
        },
        {
            "insert": "\n",
            "attributes": {
                "list": "bullet"
            }
        },
        {
            "insert": "앱과 위젯을 자유롭게 변환하기"
        },
        {
            "insert": "\n",
            "attributes": {
                "list": "bullet"
            }
        },
        {
            "insert": "잠금화면 설정 기능 선택, 액션 버튼의 기능 다양화"
        },
        {
            "insert": "\n",
            "attributes": {
                "indent": 1,
                "list": "bullet"
            }
        },
        {
            "insert": {
                "image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDA5MTdfMTI2/MDAxNzI2NTEwMDA3NDAy.0_rVzocXqv7x2VBYMFs1xVM_KXgGUX9R56lEf747YQMg.1uOPiLe74NdSdwFfYDk4aUkfW9owWj4x76_ui9ewsFUg.PNG/KakaoTalk_20240917_030630972.png?type=w1600"
            },
            "attributes": {
                "style": "width: 392.72727272727275; height: 299.2101818181818; "
            }
        },
        {
            "insert": "제어센터 기능의 다양함\n설정 - 연결된 에어팟 선택 - 머리 제스처 켬\n\n끄덕끄덕🙂‍↕️ 도리도리🙂‍↔️로 걸려오는 전화를 수신 및 거부할 수 있습니다.\n\n"
        },
        {
            "insert": "블로그 출처",
            "attributes": {
                "link": "https://cafe.naver.com/appleiphone/8515120"
            }
        },
        {
            "insert": "\n\n"
        }
    ], imageURL: "https://cafeptthumb-phinf.pstatic.net/MjAyNDA5MTdfMTU0/MDAxNzI2NTE2MDg1NTk5.M_iay-1R8pS0EJ-gByASWK3uIvlzsAgwiOwe2q3Qn0kg.DwXRVt7bVLCKq-b6RdxpGVeMAMNDgvNSA5C8VC1O1eUg.JPEG/Generic-iOS-18-Feature-Real-Mock.jpg?type=w1600", updatedAt: DateTime.parse("2024-09-22T14:05:00.000Z"), isLiked: true, like: 483, comments: 3),
    Post(postId: 865124, title: "[난지금](7) 비오는 날 추천 드라마!", userId: 578599, nickname: "맑은하늘서쪽하늘", summary: "<이토록 친밀한 배신자>",
        content: [{"insert":"\n"},{"insert":{"image":"https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMThfMjI1/MDAxNzI5MjI5Mjc3Njk5.FZK-nmh5Mr0jMHzGDCiy2b7ju2w0ASy2_pBg6VpVdrkg.7TLnx-dCtPNreSjeSft572SIjTeuXgKvDRe52lqEfZ4g.JPEG/20241018%EF%BC%BF142138.jpg?type=w1600"}},{"insert":"\n<이토록 친밀한 배신자>\n지난 주 시작한 MBC 드라마인데..\n얼마만에 지상파 드라마 보는건지 모르겠네요.\n원래 이렇게 초반부터 드라마 안보는데.. 안볼수없었어요. \n\n금토 드라마여서 오늘 3회 방영하는데\n오늘 본방 전 2회 다시 정주행 한번 했네요. \n비 오는날 보시면 무서움+긴장감 몇배 더할듯요 ㅋ\n\n김은희 작가 시그널 잼나게 보셨다면 추천해요.\n한석규 님과 딸 역할 채원빈 님 연기, 장난 아님요~~\n\n\n"}],
        tags: [
            Tag(tagId: 4918, tagName: "드라마", grade: 1),
            Tag(tagId: 9620, tagName: "비", grade: 2),
            Tag(tagId: 2001, tagName: "날씨", grade: 3),
            Tag(tagId: 6520, tagName: "작가", grade: 4),
            Tag(tagId: 9205, tagName: "시그널", grade: 5),
            Tag(tagId: 5886, tagName: "배우", grade: 6),
            Tag(tagId: 4513, tagName: "연기", grade: 7),
            Tag(tagId: 3236, tagName: "정주행", grade: 8),
            Tag(tagId: 1017, tagName: "MBC", grade: 9),
            Tag(tagId: 11111, tagName: "문화", grade: 10),
        ],
        imageURL: "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMThfMjI1/MDAxNzI5MjI5Mjc3Njk5.FZK-nmh5Mr0jMHzGDCiy2b7ju2w0ASy2_pBg6VpVdrkg.7TLnx-dCtPNreSjeSft572SIjTeuXgKvDRe52lqEfZ4g.JPEG/20241018%EF%BC%BF142138.jpg?type=w1600",
        updatedAt: DateTime.parse("2024-10-28T14:27:00.000Z"),
        isLiked: false,
        like: 15,
        comments: 3
    ),
    Post(
        postId: 656762,
        userId: 924836,
        nickname: "한강뷰내꺼",
        title: "나의 유튜브 쇼츠 음악 플레이리스트",
        tags: [
            Tag(tagId: 5584, tagName: "음악", grade: 1),
            Tag(tagId: 8073, tagName: "유튜브", grade: 2),
            Tag(tagId: 4268, tagName: "쇼츠", grade: 3),
            Tag(tagId: 9041, tagName: "플레이리스트", grade: 4),
            Tag(tagId: 7145, tagName: "일상", grade: 5),
            Tag(tagId: 9481, tagName: "친구", grade: 6),
            Tag(tagId: 1788, tagName: "커피", grade: 7),
            Tag(tagId: 3970, tagName: "행복", grade: 8),
        ],
        summary: "요즘은 하루의 소소한 순간들을 음악으로 채우는 것이 큰 즐거움이 되었어요. 특히 '나의 유튜브 쇼츠 음악 플레이리스트'는 일상 속에서 제 감정을 더욱 풍부하게 만들어 주는 소중한 친구 같답니다.",
        content: [
            {"insert": "요즘은 하루의 소소한 순간들을 음악으로 채우는 것이 큰 즐거움이 되었어요. 특히 '나의 유튜브 쇼츠 음악 플레이리스트'는 일상 속에서 제 감정을 더욱 풍부하게 만들어 주는 소중한 친구 같답니다.\n\n"},
            {"insert": {"image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMjRfNDcg/MDAxNzI5NzA3NTY4MTMw.4yvhtkNzUzEQB9JFtmjVL-NR-EAR7voTKj5mPQCD7l4g.rlEXqS7qupKgOLEbwJxyWMDjvluFxe20T0J1rpiRUyEg.JPEG/%EB%8B%A4%EC%9A%B4%EC%9D%B4%EB%AF%B8%EC%A7%80_1584624200.jpg?type=w1600"}},
            {"insert": "\n\n아침에 일어나서 창문을 열면 상쾌한 공기와 함께 좋아하는 곡이 흘러나오고, 그 순간 하루가 시작되는 기분을 느껴요. 커피를 내리며 듣는 잔잔한 멜로디는 마치 작은 카페에 앉아 있는 듯한 기분을 주고, 길을 걸을 때는 경쾌한 비트가 발걸음을 가볍게 해주죠.\n\n"},
            {"insert": {"image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMjRfOTMg/MDAxNzI5NzA3NTY4NDQx.4O1b7V4_fnUPKh1maBeQNu98muqnBqFhnDP9yQ7bRW8g._12qAUfyLFHk6X2b1dCLOP8oljwUtlisAkVAR90arNog.JPEG/%EB%8B%A4%EC%9A%B4%EC%9D%B4%EB%AF%B8%EC%A7%80_1029708087.jpg?type=w1600"}},
            {"insert": "\n\n또한, 친구들과의 소소한 만남에서도 이 플레이리스트는 빼놓을 수 없어요. 함께 웃고 떠드는 사이에 음악이 흐르면, 그 순간이 더욱 특별하게 느껴져요. 기억에 남는 순간들을 음악과 함께 간직할 수 있다는 건 정말 큰 행복이죠.\n\n"},
            {"insert": {"image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMjRfMjM3/MDAxNzI5NzA3NTY4Nzc2.800C5BUW8nPVr8urQ-FSHv_eddVHVrSnO1_6VyEBKLsg.MOeLPlL_i19jxPg94SqtBYya_0TPn1XqnpTt2fvAXG8g.JPEG/%EB%8B%A4%EC%9A%B4%EC%9D%B4%EB%AF%B8%EC%A7%80_399888503.jpg?type=w1600"}},
            {"insert": "\n\n"}
        ],
        imageURL: "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMjRfNDcg/MDAxNzI5NzA3NTY4MTMw.4yvhtkNzUzEQB9JFtmjVL-NR-EAR7voTKj5mPQCD7l4g.rlEXqS7qupKgOLEbwJxyWMDjvluFxe20T0J1rpiRUyEg.JPEG/%EB%8B%A4%EC%9A%B4%EC%9D%B4%EB%AF%B8%EC%A7%80_1584624200.jpg?type=w1600",
        updatedAt: DateTime.parse("2024-10-24T10:00:00.000Z"),
        isLiked: false,
        like: 0,
        comments: 2
    ),
    Post(
        postId: 938118,
        userId: 563135,
        nickname: "휴직",
        title: "[멍청비용] 오늘, 세계여행 중 모든게 든 지갑을 잃어버렸습니다",
        tags: [
            Tag(tagId: 3636, tagName: "세계여행", grade: 1),
            Tag(tagId: 3425, tagName: "지갑", grade: 2),
            Tag(tagId: 8750, tagName: "모험", grade: 3),
            Tag(tagId: 3188, tagName: "노이슈반타인", grade: 4),
            Tag(tagId: 4578, tagName: "독일", grade: 5),
            Tag(tagId: 2081, tagName: "여행", grade: 6),
            Tag(tagId: 5278, tagName: "유럽", grade: 7),
        ],
        summary: "세계여행 190일째, 오늘 모든게 든 지갑을 노이슈반슈타인 성에서 잃어버렸습니다...",
        content: [{"insert":"세계여행 190일째, 오늘 모든게 든 지갑을 노이슈반슈타인 성에서 잃어버렸습니다... \n과연.. 찾을 수 있을까요?\n\n안녕하세요. 아내와 함께 세계여행 중입니다. 지난 3월부터 여행을 시작해 오늘 딱 190일째네요.\n동남아와 코카서스 3국, 발칸반도를 거쳐 독일까지 왔습니다. 지금은 렌트로 유럽 구석구석을 다니는 중이고요. \n오늘은 그 유명한 노이슈반슈타인 성에 다녀왔어요.\n저렴한 에어비앤비를 찾아 독일 Biberach라는 시골 마을에 묵고 있는데 노이슈반슈타인 성까지 120km정도, 1시간 반 거리여서 당일치기로 다녀오려 했습니다. 이틀 전에 9시 타임만 자리가 남아 새벽 6시 반에 출발했어요. 주차장에서 성까지 3~40분 정도 걸어올라가야 해 넉넉하게 출발해야 합니다. \n\n새벽부터 비도 많이오고 캄캄한데 독일 사람들은 마을 도로에서도 시속 100km 정도로 마구 달리더라고요.. \n 도로폭도 좁고 가로등도 없는데 맞은편에서는 집채만한 화물차가 끊임없이 달려와 속도를 낼 수가 없었어요. 그랬더니 뒤차들은 쌍라이트 켜고 추월해가고 난리도 아닙니다... 독일 운전매너 좋다고 봤는데 말이죠. 구불구불 도로에 7~80km로 달렸는데도 그러더라고요. 내비에 뜬 시간보다 조금 늦게 도착했습니다. \n"},{"insert":{"image":"https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMDNfMTU4/MDAxNzI3OTA3NDM5MTY3.hgF0WCS44zN-RMqeD7YEIQp5KjDWlJoueOCom66NvF8g.Z-LNTp0yHpwowcYj72Gz7Y28i7pzFiJO39jvVqgOED8g.JPEG/KakaoTalk_20241003_063541121_01.jpg?type=w1600"}},{"insert":"\n 이제 지갑사건이 시작됩니다.(떠올리기도 싫은) \n\n 노이슈반슈타인 성 관람을 마치고 주차장에서 차를 찾았어요. 여긴 시간 상관없이 무조건 일일 12유로나 합니다. \n 다시 비오는 고속도로를 지나 너무 졸려 졸음쉼터에서 한숨 잠도 자고, 숙소 있는 마을까지 2시간 정도 걸려 왔습니다. \n 차에 기름을 넣어야해서 주유소로 갔죠. 그리고 결제를 하려고 지갑을 찾는데... 응? \n 응?! 응?!!!! 설마...?!!!!! 지갑이 없는 겁니다. \n 세계여행하면서 절대 잃어버리면 안되는게 둘있는데 휴대폰과 지갑이죠. \n 지갑에는 바로 어제 찾은 현금 200유로와 제 신용카드 2개, 아내 신용카드 1개, 운전면허증(영문), 이스탄불에서 사고 반환 실패한 이스탄불카르트, 그리고 여분 여권사진 여러장이 들어있었습니다. 아, 여행하며 만난 사람들이 건네준 명함도 몇장 들어있었네요. \n"},{"insert":{"image":"https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMDNfMjI5/MDAxNzI3OTA3NzM1MTUx.tyGU_oY9X-_586C0E4xFdG-Hv6Y1EhoYB97DIhUiWxYg.aHsrvXTNHlgAmr99BjsKtYN_0GBj_TW3YQIVPFeHBJEg.JPEG/KakaoTalk_20241003_063541121.jpg?type=w1600"}},
            {"insert": "\n\n"}],
        imageURL: "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMDNfMTU4/MDAxNzI3OTA3NDM5MTY3.hgF0WCS44zN-RMqeD7YEIQp5KjDWlJoueOCom66NvF8g.Z-LNTp0yHpwowcYj72Gz7Y28i7pzFiJO39jvVqgOED8g.JPEG/KakaoTalk_20241003_063541121_01.jpg?type=w1600",
        updatedAt: DateTime.parse("2024-10-03T07:22:00.000Z"),
        isLiked: true,
        like: 1088,
        comments: 3
    ),
    Post(
        postId: 766436,
        userId: 740377,
        nickname: "샤이니",
        title: "엄마표 미술놀이로 제격이에요",
        tags: [
            Tag(tagId: 2288, tagName: "미술", grade: 1),
            Tag(tagId: 2, tagName: "아이", grade: 2),
            Tag(tagId: 5006, tagName: "엄마", grade: 3),
            Tag(tagId: 9851, tagName: "감기", grade: 4),
            Tag(tagId: 7334, tagName: "집", grade: 5),
            Tag(tagId: 8661, tagName: "놀이", grade: 6),
            Tag(tagId: 2271, tagName: "검색", grade: 7),
            Tag(tagId: 6113, tagName: "색깔", grade: 8),
        ],
        summary: "엄마표 미술놀이로 제격이에요",
        content: [
            {"insert": "엄마표 미술놀이로 제격이에요\n\n"},
            {"insert": {"image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMTZfMTI0/MDAxNzI5MDQ2NzgzODgy.2a1ZukB3Miulq8Q9ix37UEwLvGbJoyCsXSwa19J4DYUg.JNJCd2hoYcAnSG4ZR0ejk3ZSrpNs7-NkvhkWIiU0MIUg.JPEG/1.jpg?type=w1600"}},
            {"insert": "\n\n아이가 감기에 걸려서 요 몇일 집에서만 있었는데요\n어린이집에도 못가고, 엄마도 심심... 아이도 심심...\n혼자서도 잘 노는 아이지만 그래도\n이왕 집에서 보내는 엄마와의 시간을\n알차게 보내게 해주고 싶더라구요\n\n"},
            {"insert": {"image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMTZfMTk5/MDAxNzI5MDQ2NzgzODQ2.B0AHTKb-0LcLRYoR5uzRUoQXGW0sTpct3C1xU0VhzWYg.FqSbmBzYiEqpSzLER99uyrJpZX1GHcZZTLG2Ii7H1Iog.JPEG/2.jpg?type=w1600"}},
            {"insert": "\n\n그래서 뭘해줄까 고민고민하다\n엄마표 미술놀이 해주면 좋겠다 싶어\n폭풍 검색했더니 물을 좋아하는 아이가 하면 좋을\n거품 놀이가 있더라구요\n따뜻한 물로 길지 않은 시간 하면 괜찮을 것 같아 바로 구매\n\n"},
            {"insert": {"image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMTZfMTY1/MDAxNzI5MDQ2Nzg0MDYy.HGPSuGgGAkCPeeqQIVVKsg_Nbj6NXBlDZva4IepaSVwg.1LyPWMZLnTuxa2S-Gp4C2isnoNMX5c4GKyXI9AQNCysg.JPEG/3.jpg?type=w1600"}},
            {"insert": "\n\n"}
        ],
        imageURL: "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMTZfMTI0/MDAxNzI5MDQ2NzgzODgy.2a1ZukB3Miulq8Q9ix37UEwLvGbJoyCsXSwa19J4DYUg.JNJCd2hoYcAnSG4ZR0ejk3ZSrpNs7-NkvhkWIiU0MIUg.JPEG/1.jpg?type=w1600",
        updatedAt: DateTime.parse("2024-10-16T11:59:00.000Z"),
        isLiked: true,
        like: 70,
        comments: 3
    ),
    Post(
        postId: 422069,
        userId: 483398,
        nickname: "달토",
        title: "영화 룩 백",
        tags: [
            Tag(tagId: 4580, tagName: "영화", grade: 1),
            Tag(tagId: 5461, tagName: "비", grade: 2),
            Tag(tagId: 9934, tagName: "저녁", grade: 3),
            Tag(tagId: 6504, tagName: "친구", grade: 4),
            Tag(tagId: 2517, tagName: "시간", grade: 5),
            Tag(tagId: 6677, tagName: "관객", grade: 6),
            Tag(tagId: 7898, tagName: "정보", grade: 7),
            Tag(tagId: 9818, tagName: "눈물", grade: 8),
            Tag(tagId: 1919, tagName: "안경닦이", grade: 9),
            Tag(tagId: 11111, tagName: "문화", grade: 10),
        ],
        summary: "지난주 비 오는 저녁에 영화 한편 보고 왔어요. 둘째아이가 좋아하는 작가 작품인데, 친구들이랑 시간이 안맞았는지 엄마 호출해 줬어요.",
        content: [
            {"insert": "지난주 비 오는 저녁에 영화 한편 보고 왔어요. 둘째아이가 좋아하는 작가 작품인데, 친구들이랑 시간이 안맞았는지 엄마 호출해 줬어요.\n\n"},
            {"insert": {"image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMjRfOTUg/MDAxNzI5NzM1NDUyMzE2.q-NG4dnCnHtQQjf02CzxCKk35e9UnyEHS1i3gSj2KLYg.XpTxS9Dlo8oVRu_2wlXWHG2r1bmJuv2Tzf2s_Nq6NYsg.JPEG/common%EF%BC%BF20241024%EF%BC%BF103350.jpg?type=w1600"}},
            {"insert": "\n\n관객은 저희 포함 총 다섯명.\n괜히 미안시런 마음... 아시죠?^^\n\n"},
            {"insert": {"image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMjRfMjcw/MDAxNzI5NzM1NDUyMzQz.sEcFTP_Zu1j7EMqF6H4bplqiqVy38QQLq8qaXYI1s_Mg.fuILmLMt1WIwct3FtZC5ijVKRHuWAFHM5P3kL0DMRdcg.JPEG/common%EF%BC%BF20241024%EF%BC%BF103344.jpg?type=w1600"}},
            {"insert": "\n\n전 아무 정보도 없이 보러 갔다, 소매에 눈물 쓱쓱 닦고 왔어요. 뒷자리 분은 오열하시고..\n휴지도 한장 없고 주머니엔 안경닦이만 굴러다니고요.\n한시간 정도 짧은 영화였는데 참 좋은 영화였어요.\n\n"}
        ],
        imageURL: "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMjRfOTUg/MDAxNzI5NzM1NDUyMzE2.q-NG4dnCnHtQQjf02CzxCKk35e9UnyEHS1i3gSj2KLYg.XpTxS9Dlo8oVRu_2wlXWHG2r1bmJuv2Tzf2s_Nq6NYsg.JPEG/common%EF%BC%BF20241024%EF%BC%BF103350.jpg?type=w1600",
        updatedAt: DateTime.parse("2024-10-16T11:59:00.000Z"),
        isLiked: true,
        like: 192,
        comments: 3
    ),
    Post(
        postId: 495475,
        userId: 369023,
        nickname: "물비늘",
        title: "쿠팡파트너스와 함께하는 일상",
        tags: [
            Tag(tagId: 6290, tagName: "일상", grade: 1),
            Tag(tagId: 8667, tagName: "쿠팡", grade: 2),
            Tag(tagId: 5723, tagName: "파트너", grade: 3),
            Tag(tagId: 3185, tagName: "아침", grade: 4),
            Tag(tagId: 3578, tagName: "상품", grade: 5),
            Tag(tagId: 5994, tagName: "루틴", grade: 6),
            Tag(tagId: 3438, tagName: "집", grade: 7),
            Tag(tagId: 3704, tagName: "생활용품", grade: 8),
        ],
        summary: "오늘은 '쿠팡파트너스와 함께하는 일상'에 대해 이야기해볼게요.",
        content:[
            {"insert": "오늘은 '쿠팡파트너스와 함께하는 일상'에 대해 이야기해볼게요.\n요즘 제 일상에서 쿠팡파트너스는 정말 큰 비중을 차지하고 있어요.\n아침에 일어나서 커피 한 잔과 함께 하루를 시작할 때, 쿠팡파트너스를 통해 다양한 상품을 살펴보는 것이 저의 작은 루틴이 되었답니다.\n\n"},
            {"insert": {"image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMTdfMjgw/MDAxNzI5MTMzMTM5ODM3.dGDryc1K9yEkBWxjFUvmAYA4-Tl5QFYv6UEQTJIMi0Ug.1tli3E409LI-Rs-NxUFC9mCJHZgnRi5goX63nUs9ABYg.JPEG/%EB%8B%A4%EC%9A%B4%EC%9D%B4%EB%AF%B8%EC%A7%80_353781006.jpg?type=w1600"}},
            {"insert": "\n\n특히 요즘은 집에서 보내는 시간이 많아지다 보니, 필요한 물건들을 쿠팡파트너스를 통해 쉽게 찾고 구매하는 재미가 쏠쏠해요.\n주말에는 가족들과 함께 간편하게 주문한 음식을 나누고, 필요한 생활용품들도 클릭 한 번으로 간편하게 해결할 수 있어 정말 편리하죠.\n\n"},
            {"insert": {"image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMTdfMTIw/MDAxNzI5MTMzMTQwMjY4.no3kiP4JP48jJlwkZdclJTj4UNxgZijJKvFsd0CeGUwg.AM9lpzOt32ci6qH3CqoKZKKYR5gNld5HLpw5rQkf8msg.JPEG/%EB%8B%A4%EC%9A%B4%EC%9D%B4%EB%AF%B8%EC%A7%80_843931921.jpg?type=w1600"}},
            {"insert": "\n\n"}
        ],
        imageURL: "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMTdfMjgw/MDAxNzI5MTMzMTM5ODM3.dGDryc1K9yEkBWxjFUvmAYA4-Tl5QFYv6UEQTJIMi0Ug.1tli3E409LI-Rs-NxUFC9mCJHZgnRi5goX63nUs9ABYg.JPEG/%EB%8B%A4%EC%9A%B4%EC%9D%B4%EB%AF%B8%EC%A7%80_353781006.jpg?type=w1600",
        updatedAt: DateTime.parse("2024-10-16T11:59:00.000Z"),
        isLiked: true,
        like: 88,
        comments: 3
    ),
    Post(
        postId: 638261,
        userId: 941888,
        nickname: "유나디나",
        title: "[리뷰]스포츠 모자 추천 좀 해주세요!!!",
        tags: [
            Tag(tagId: 3711, tagName: "스포츠", grade: 1),
            Tag(tagId: 4991, tagName: "자전거", grade: 2),
            Tag(tagId: 2030, tagName: "힐링", grade: 3),
            Tag(tagId: 6076, tagName: "운동", grade: 4),
            Tag(tagId: 4521, tagName: "한강", grade: 5),
            Tag(tagId: 2498, tagName: "노을", grade: 6),
        ],
        summary: "요즘 자전거 타기에 ",
        content: [{"insert":"요즘 자전거 타기에 \n푹~빠져있는 1인입니다^^\n\n어릴 때 자전거 타보고\n성인되어서는 한번도 안탔는데\n얼마전 친구랑 한강에 놀러갔다가\n자전거 타는 분들이 좋아보여서\n자전거를 빌려서 타봤어요\n\n해지는 노을바라보며 \n자전거 타는데 \n기분이 그렇게 좋을 수가\n없더라구요\n\n"},{"insert":{"image":"https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMDhfMjA1/MDAxNzI4Mzc1ODQ4MTQ2.FLy1LugOZR-vQCDmjwBvSwXqiByF-e-8hhRHm9-Rh10g.OrDH9AzOG8asf2eL8yXMFEP0TWzuLW1bw18CirIumfQg.JPEG/1%28%EB%8C%80%ED%91%9C%EC%82%AC%EC%A7%84%29.jpg?type=w1600"}},{"insert":"\n"}],
        imageURL: "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMDhfMjA1/MDAxNzI4Mzc1ODQ4MTQ2.FLy1LugOZR-vQCDmjwBvSwXqiByF-e-8hhRHm9-Rh10g.OrDH9AzOG8asf2eL8yXMFEP0TWzuLW1bw18CirIumfQg.JPEG/1%28%EB%8C%80%ED%91%9C%EC%82%AC%EC%A7%84%29.jpg?type=w1600",
        updatedAt: DateTime.parse("2024-10-16T11:59:00.000Z"),
        isLiked: true,
        like: 37,
        comments: 3
    ),
    Post(
        postId: 580674,
        userId: 896390,
        nickname: "하나두",
        title: "사진맛집 올라카페",
        tags: [
            Tag(tagId: 9097, tagName: "사진", grade: 1),
            Tag(tagId: 9859, tagName: "맛집", grade: 2),
            Tag(tagId: 2758, tagName: "카페", grade: 3),
            Tag(tagId: 6254, tagName: "일상", grade: 4),
            Tag(tagId: 5054, tagName: "꽃", grade: 5),
            Tag(tagId: 3603, tagName: "디저트", grade: 6),
            Tag(tagId: 7221, tagName: "포토스팟", grade: 7),
            Tag(tagId: 11111, tagName: "문화", grade: 10, count: 43, bookmarked: 41),
        ],
        summary: "카페투어를 착실히 실천한 이번여행",
        content: [
            {"insert": "카페투어를 착실히 실천한 이번여행\n사진 맛집이라는 올라카페도 다녀왔어요 ㅎㅎ\n\n"},
            {"insert": {"image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMTFfMjk4/MDAxNzI4NjQ1Mzk4OTgx.CkvL5VKbDzmCi9Zl_keBdFNt-8hUjAk8iz05z0275icg.HPU2Dybhw5PW5JrJ6HnNWkLLibH3m7MNpxAYTRsrlKIg.JPEG/20240905%EF%BC%BF083133.jpg?type=w1600"}},
            {"insert": "\n\n입구부터 너무 이쁘죠♡\n요앞에 핀 꽃들이랑 사진찍기 최고\n\n"},
            {"insert": {"image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMTFfMSAg/MDAxNzI4NjQ1NDAyNDU0._znC0Aks32mIrxbJ5srzpnJIx5OqcUHIK12UwEF53BEg.iQpxz2dcIlb5W6mPuCJDMb_WFxP3ELWQ2rhsGnCxv_Ug.JPEG/1728645017177.jpg?type=w1600"}},
            {"insert": "\n\n메뉴도 다양하고 디저트들도 있어요^^\n\n"},
            {"insert": {"image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMTFfMTIy/MDAxNzI4NjQ1NDAwMDA5.Sq3MgirG2V4qzynAceYnRru5SCS0-nCsE2w0EbhOgXgg.Q9u_XhKsPY0N7F62CX3OF08V7BldjXfor1mCTeXz1WAg.JPEG/20240905%EF%BC%BF083405.jpg?type=w1600"}},
            {"insert": "\n\n 요기조기 포토스팟 많은 올라카페 \n\n"}
        ],
        imageURL: "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMTFfMjk4/MDAxNzI4NjQ1Mzk4OTgx.CkvL5VKbDzmCi9Zl_keBdFNt-8hUjAk8iz05z0275icg.HPU2Dybhw5PW5JrJ6HnNWkLLibH3m7MNpxAYTRsrlKIg.JPEG/20240905%EF%BC%BF083133.jpg?type=w1600",
        updatedAt: DateTime.parse("2024-10-16T11:59:00.000Z"),
        isLiked: true,
        like: 216,
        comments: 3
    ),
    Post(
        postId: 568689,
        userId: 427252,
        nickname: "일공사학습도우미1",
        title: "일본어말하기 시험 SJPT 독학 시험 정보",
        tags: [
            Tag(tagId: 8823, tagName: "외국어", grade: 1),
            Tag(tagId: 9196, tagName: "일본어", grade: 2),
            Tag(tagId: 8974, tagName: "일본", grade: 3),
            Tag(tagId: 2360, tagName: "독학", grade: 4),
            Tag(tagId: 9975, tagName: "시험", grade: 5),
            Tag(tagId: 4229, tagName: "정보", grade: 6),
            Tag(tagId: 2821, tagName: "SJPT", grade: 7),
            Tag(tagId: 6527, tagName: "말하기", grade: 8),
        ],
        summary: "일본어말하기 시험을 측정하는",
        content: [
            {
                "insert": {
                    "image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMTdfMjk1/MDAxNzI5MTQ3Njg0NzMw.8125JaGMIIEILIBmArd1o7K93hLSiNbaxS49fOw2TfQg.2RuAQPsiUf3ChTaQ5DPVC2T5BzLagdjiGTKcDddREAYg.PNG/%EC%9D%BC%EB%B3%B8%EC%96%B4%EB%A7%90%ED%95%98%EA%B8%B0_%EC%8B%9C%ED%97%98.png?type=w1600"
                }
            },
            {
                "insert": "\n\n일본어말하기 시험을 측정하는\n\n대표적인 시험 중 하나가\n\n바로 SJPT시험입니다.\n\n영어 말하기 시험은 많이 알려져있으나\n\n일본어말하기 시험에 대해서는\n\n낯설게 느끼시는 분들이 많더라구요.\n\n일본어를 배우는 사람들에게\n\n중요한 기준이 되는 SJPT시험은\n\n실생활이나 비즈니스에서\n\n사용되는 회화 능력을 평가합니다.\n\n이번 포스팅에서는 SJPT 시험의\n\n전반적인 정보와 시험 방식,\n\n점수 체계 등을 소개하여\n\n독학으로 준비하는 분들에게\n\n도움드리는 시간을 가져볼게요!\n\n"
            },
            {
                "insert": {
                    "image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMTdfMTcy/MDAxNzI5MTQ3Njg0NzQ0.LrJwA9QgSsVowdRG6kcLAZbUDHKA1ayz3Tp5-43kbCkg.GuRmOnhvF7-bgQzP7ddUtA-8Y4YZxwrKEKzxxE8jXmgg.PNG/%EC%9D%BC%EB%B3%B8%EC%96%B4%EB%A7%90%ED%95%98%EA%B8%B0_%EC%8B%9C%ED%97%98_1.png?type=w1600"
                }
            },
            {"insert": "\n\n"}
        ],
        imageURL: "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMTdfMjk1/MDAxNzI5MTQ3Njg0NzMw.8125JaGMIIEILIBmArd1o7K93hLSiNbaxS49fOw2TfQg.2RuAQPsiUf3ChTaQ5DPVC2T5BzLagdjiGTKcDddREAYg.PNG/%EC%9D%BC%EB%B3%B8%EC%96%B4%EB%A7%90%ED%95%98%EA%B8%B0_%EC%8B%9C%ED%97%98.png?type=w1600",
        updatedAt: DateTime.parse("2024-10-16T11:59:00.000Z"),
        isLiked: true,
        like: 81,
        comments: 3
    ),
    Post(
        postId: 151947,
        userId: 239048,
        nickname: "닥터큰돌",
        title: "[잡담] 주말에 기대 중인 공연 2개",
        tags: [
            Tag(tagId: 9053, tagName: "공연", grade: 1),
            Tag(tagId: 8303, tagName: "잡담", grade: 2),
            Tag(tagId: 1144, tagName: "주말", grade: 3),
            Tag(tagId: 9637, tagName: "오페라", grade: 4),
            Tag(tagId: 3474, tagName: "투란도트", grade: 5),
            Tag(tagId: 5339, tagName: "매력", grade: 6),
            Tag(tagId: 5495, tagName: "독일어", grade: 7),
            Tag(tagId: 3892, tagName: "추천", grade: 8),
            Tag(tagId: 7893, tagName: "대본", grade: 9),
            Tag(tagId: 11111, tagName: "문화", grade: 10),
        ],
        summary: "공연",
        content: [
            {
                "insert": "공연\n"
            },
            {
                "insert": {
                    "image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMThfODEg/MDAxNzI5MjE0Nzc5OTU2.ac2a5Zu1roV7mfbjDNavGjz23BuxXV835bpCJlisfGEg.TEedZbawD8pCT2fA4UdEQofWcMPCUSYnVnvQ_mwAJtQg.PNG/%ED%88%AC%EB%9E%80%EB%8F%84%ED%8A%B8_%EB%B2%A0%EB%A1%9C%EB%82%98.png?type=w1600"
                }
            },
            {
                "insert": "\n\n"
            },
            {
                "insert": {
                    "image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMThfOTAg/MDAxNzI5MjE0Nzc5NTYy.HaDpFzmKuzfUXUcLnHA38PNvUFDMABsFiTGEbLme26Qg.KFzw2RE92snF75bxnjNjypD-yF0b_kuA4up4Z8Ed_nQg.JPEG/%ED%83%84%ED%98%B8%EC%9D%B4%EC%A0%80%ED%8F%AC%EC%8A%A4%ED%84%B00625_%283%29.jpg?type=w1600"
                }
            },
            {
                "insert": "\n\n여기에는 오페라 좋아하는 분들이 많을 것 같진 않지만 ^^;\n\n토요일, 일요일에 오페라 하나씩 예매를 했는데 올해 가장 기대 중인 공연들입니다!\n\n\n\n오페라 입문한지 1년 정도 밖에 되지 않지만 여러 음반을 듣고 관련 서적과 대본을 읽고 영상물도 보고 실제 공연도 가면서 그 매력에 완전 빠져버렸습니다. 그동안 여러 공연을 봐왔지만 이 두 공연이 가장 기대가 크네요.\n\n 투란도트는 푸치니 서거 100주년 기념으로 명 연출가 제피렐리의 화려한 프로덕션을 그대로 가져와서 공연을 한다고 합니다. 후기들을 보니 진행과 음향 관련해서 크고 작은 문제가 없는건 아니지만 영상물로만 봐왔던 유명한 프로덕션을 국내에서 실제로 보게 되는 것만으로도 기대를 하고 있습니다."
            },
            {"insert": "\n\n"}
        ],
        imageURL: "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMThfODEg/MDAxNzI5MjE0Nzc5OTU2.ac2a5Zu1roV7mfbjDNavGjz23BuxXV835bpCJlisfGEg.TEedZbawD8pCT2fA4UdEQofWcMPCUSYnVnvQ_mwAJtQg.PNG/%ED%88%AC%EB%9E%80%EB%8F%84%ED%8A%B8_%EB%B2%A0%EB%A1%9C%EB%82%98.png?type=w1600",
        updatedAt: DateTime.parse("2024-10-16T11:59:00.000Z"),
        isLiked: true,
        like: 265,
        comments: 2
    ),
    Post(
        postId: 589954,
        userId: 388466,
        nickname: "이디스",
        title: "또 다른 취미글을 보고 올려봅니다...",
        tags: [
            Tag(tagId: 2038, tagName: "취미", grade: 1),
            Tag(tagId: 3583, tagName: "일", grade: 2),
            Tag(tagId: 7591, tagName: "집", grade: 3),
            Tag(tagId: 2072, tagName: "게임", grade: 4),
            Tag(tagId: 6432, tagName: "전자시계", grade: 5),
        ],
        summary: "또 다른 취미가 어떤게 있는지의 글을 보고,",
        content: [{"insert":"또 다른 취미가 어떤게 있는지의 글을 보고,\n제가 하는 취미가 흔치만은 않은 또 다른 취미인거 같아서 한 번 올려봅니다... ㅎㅎㅎ...\n분명 저랑 같은 취미 갖고 계신 분들이 계실거 같은데~~~\n설마 일, 집, 게임만 하시는건 아니죠? ^^;\n\n"},{"insert":{"image":"https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMThfMTE1/MDAxNzI5MjQ2OTExMzI4.JUEzkH3AAc1c1mGGLsS5sbmwO8EUX8g9iqp0QtKlbI8g.pIq9c2Xjvy-h4FapIXbZlfZUKJxOIJldY522h1pki3Qg.JPEG/20231011%EF%BC%BF194148.jpg?type=w1600"}},{"insert":"\n"}],
        imageURL: "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMThfMTE1/MDAxNzI5MjQ2OTExMzI4.JUEzkH3AAc1c1mGGLsS5sbmwO8EUX8g9iqp0QtKlbI8g.pIq9c2Xjvy-h4FapIXbZlfZUKJxOIJldY522h1pki3Qg.JPEG/20231011%EF%BC%BF194148.jpg?type=w1600",
        updatedAt: DateTime.parse("2024-10-16T11:59:00.000Z"),
        isLiked: true,
        like: 353,
        comments: 2
    ),
    Post(postId: 526560, title: "비 오는 날 아이들과 함께 할 실내 놀이", summary: "아이들과 함께 비 오는 날 실내에서 즐길 수 있는 놀이를 알아봅니다.", comments: 3, like: 9, viewed: 265, createdAt: DateTime.parse("2023-12-23T05:51:40.000Z"), tags: [Tag(tagId: 10000068, tagName: "비", grade: 4)]),
    Post(postId: 968149, title: "비를 피해 즐기는 실내 여행지", summary: "비를 피해 실내에서 즐길 수 있는 여행지를 소개합니다.", comments: 3, like: 4, viewed: 928, createdAt: DateTime.parse("2023-11-22T03:22:26.000Z"), tags: [Tag(tagId: 10000068, tagName: "비", grade: 4)]),
    Post(postId: 133826, title: "장마철 대비 필수 아이템 추천", summary: "장마철을 대비해 꼭 필요한 아이템을 소개합니다.", comments: 1, like: 8, viewed: 806, createdAt: DateTime.parse("2023-11-20T17:59:23.000Z"), tags: [Tag(tagId: 10000068, tagName: "비", grade: 4)]),
    Post(postId: 229794, title: "비 내리는 날 감성적인 사진 촬영 팁", summary: "비 내리는 날 감성적인 사진을 찍는 팁을 알려드립니다.", comments: 7, like: 8, viewed: 628, createdAt: DateTime.parse("2023-11-01T23:42:35.000Z"), tags: [Tag(tagId: 10000068, tagName: "비", grade: 4)]),
    Post(postId: 136655, title: "장마철에 유용한 방수 용품", summary: "장마철에 유용한 방수 용품을 추천합니다.", comments: 7, like: 10, viewed: 490, createdAt: DateTime.parse("2023-10-13T02:26:54.000Z"), tags: [Tag(tagId: 10000068, tagName: "비", grade: 4)]),
    Post(postId: 562349, title: "엄마와 함께하는 추억 만들기", summary: "엄마와 함께 만들 수 있는 특별한 추억들을 소개합니다.", comments: 3, like: 8, viewed: 412, createdAt: DateTime.parse("2023-08-01T10:22:45.000Z"), tags: [Tag(tagId: 10000068, tagName: "비", grade: 4)]),
    Post(postId: 864765, title: "비 오는 날 따뜻한 차 종류 소개", summary: "비 오는 날 따뜻한 차와 함께하는 시간을 소개합니다.", comments: 4, like: 6, viewed: 582, createdAt: DateTime.parse("2023-07-22T09:07:05.000Z"), tags: [Tag(tagId: 10000068, tagName: "비", grade: 4)]),
    Post(postId: 155428, title: "빗속에서도 멋스러운 패션 아이템", summary: "비 오는 날에도 스타일을 유지할 수 있는 패션 아이템을 소개합니다.", comments: 1, like: 9, viewed: 406, createdAt: DateTime.parse("2023-06-05T16:51:50.000Z"), tags: [Tag(tagId: 10000068, tagName: "비", grade: 4)]),
    Post(postId: 284975, title: "비 내리는 날의 감성 음악 플레이리스트", summary: "비 내리는 날에 잘 어울리는 음악을 모아봤어요.", comments: 5, like: 3, viewed: 842, createdAt: DateTime.parse("2023-05-19T07:49:51.000Z"), tags: [Tag(tagId: 10000068, tagName: "비", grade: 4)]),
    Post(postId: 717515, title: "비 오는 날의 드라이브 코스 추천", summary: "비 내리는 날 드라이브에 어울리는 코스를 추천해드립니다.", comments: 3, like: 7, viewed: 465, createdAt: DateTime.parse("2023-05-15T06:19:11.000Z"), tags: [Tag(tagId: 10000068, tagName: "비", grade: 4)]),
    Post(postId: 866980, title: "비 오는 날 집에서 만드는 베이킹 레시피", summary: "비 오는 날 집에서 쉽게 만들 수 있는 베이킹 레시피입니다.", comments: 2, like: 7, viewed: 297, createdAt: DateTime.parse("2023-05-17T18:50:20.000Z"), tags: [Tag(tagId: 10000068, tagName: "비", grade: 4)]),
    Post(postId: 653602, title: "빗속에서의 캠핑 팁", summary: "빗속에서의 캠핑을 안전하고 재미있게 즐기는 방법을 소개합니다.", comments: 2, like: 10, viewed: 960, createdAt: DateTime.parse("2023-05-14T06:25:25.000Z"), tags: [Tag(tagId: 10000068, tagName: "비", grade: 4)]),
    Post(postId: 597432, title: "장마철에 필요한 우산 리뷰", summary: "장마철에 대비해 어떤 우산이 좋은지 알아봅니다.", comments: 5, like: 10, viewed: 754, createdAt: DateTime.parse("2022-05-15T20:34:23.000Z"), tags: [Tag(tagId: 10000068, tagName: "비", grade: 4)]),
    Post(postId: 625881, title: "비 오는 날의 도시 풍경 사진 모음", summary: "비 내리는 도시의 다양한 풍경을 사진으로 감상해 보세요.", comments: 8, like: 8, viewed: 739, createdAt: DateTime.parse("2022-12-04T20:34:23.000Z"), imageURL: "https://picsum.photos/200", tags: [Tag(tagId: 10000068, tagName: "비", grade: 4)]),
    Post(postId: 840586, title: "비 오는 날 실내에서 즐기는 취미활동", summary: "비 오는 날 실내에서 재미있게 즐길 수 있는 취미들을 알아봅니다.", comments: 5, like: 4, viewed: 514, createdAt: DateTime.parse("2023-03-23T09:13:01.000Z"), tags: [Tag(tagId: 10000068, tagName: "비", grade: 4)]),
    Post(postId: 219981, title: "빗소리와 함께 즐길 수 있는 영화 추천", summary: "비 오는 날 분위기에 딱 맞는 영화들을 추천합니다.", comments: 1, like: 1, viewed: 367, createdAt: DateTime.parse("2022-02-27T20:34:23.000Z"), tags: [Tag(tagId: 10000068, tagName: "비", grade: 4)]),
    Post(postId: 467289, title: "우산을 제대로 사용하는 법", summary: "우산을 더욱 효과적으로 사용할 수 있는 방법을 알아보세요.", comments: 10, like: 3, viewed: 480, createdAt: DateTime.parse("2023-02-23T14:51:56.000Z"), tags: [Tag(tagId: 10000068, tagName: "비", grade: 4)]),
    Post(postId: 694182, title: "비 오는 날 산책의 매력", summary: "비 오는 날 산책의 매력과 그 즐거움에 대해 이야기합니다.", comments: 7, like: 10, viewed: 223, createdAt: DateTime.parse("2023-01-24T02:32:17.000Z"), tags: [Tag(tagId: 10000068, tagName: "비", grade: 4)]),
    Post(postId: 986314, title: "빗속에서 더 빛나는 아웃도어 액티비티", summary: "빗속에서도 즐길 수 있는 아웃도어 액티비티를 소개합니다.", comments: 5, like: 4, viewed: 877, createdAt: DateTime.parse("2023-01-12T22:31:32.000Z"), tags: [Tag(tagId: 10000068, tagName: "비", grade: 4)]),
    Post(postId: 973629, title: "빗소리와 함께 읽기 좋은 책", summary: "비 내리는 날에 마음을 따뜻하게 해줄 책들을 소개합니다.", comments: 4, like: 9, viewed: 307, createdAt: DateTime.parse("2024-01-19T20:34:23.000Z"), tags: [Tag(tagId: 10000068, tagName: "비", grade: 4)]),
    Post(postId: 87291, title: "오늘의 날씨는?", summary: "비가 올 것 같아요. 우산 챙기세요.", comments: 182, like: 521, viewed: 899, createdAt: DateTime.parse("2021-04-25T12:34:00.000Z"), tags: [Tag(tagId: 10000068, tagName: "비", grade: 4)]),
    Post(postId: 982356, title: "엄마를 위한 스트레스 해소 요가", summary: "엄마들이 쉽게 따라 할 수 있는 스트레스 해소 요가 동작을 소개합니다.", comments: 3, like: 7, viewed: 403, createdAt: DateTime.parse("2023-09-08T15:45:45.000Z"), tags: [Tag(tagId: 10000068, tagName: "비", grade: 4)]),
    Post(postId: 562349, title: "엄마와 함께하는 추억 만들기", summary: "엄마와 함께 만들 수 있는 특별한 추억들을 소개합니다.", comments: 3, like: 8, viewed: 412, createdAt: DateTime.parse("2023-08-01T10:22:45.000Z"), tags: [Tag(tagId: 5006, tagName: "엄마", grade: 3)]),
    Post(postId: 638290, title: "엄마의 체력 관리를 위한 간단 운동법", summary: "엄마들을 위한 간단한 운동 방법을 알려드립니다.", comments: 1, like: 6, viewed: 258, createdAt: DateTime.parse("2023-07-10T08:15:15.000Z"), tags: [Tag(tagId: 5006, tagName: "엄마", grade: 3)]),
    Post(postId: 349128, title: "엄마의 손맛을 살리는 비법", summary: "엄마의 손맛을 더욱 살릴 수 있는 요리 팁을 알려드립니다.", comments: 4, like: 9, viewed: 375, createdAt: DateTime.parse("2023-06-18T08:45:20.000Z"), tags: [Tag(tagId: 5006, tagName: "엄마", grade: 3)]),
    Post(postId: 742183, title: "엄마와 함께하는 정원 가꾸기", summary: "엄마와 함께 정원을 가꾸며 소중한 시간을 보낼 수 있는 방법을 소개합니다.", comments: 4, like: 8, viewed: 382, createdAt: DateTime.parse("2023-06-03T10:00:00.000Z"), tags: [Tag(tagId: 5006, tagName: "엄마", grade: 3)]),
    Post(postId: 214857, title: "엄마의 날, 특별한 선물 아이디어", summary: "엄마의 날을 맞아 엄마에게 줄 수 있는 특별한 선물 아이디어를 소개합니다.", comments: 5, like: 9, viewed: 471, createdAt: DateTime.parse("2023-05-05T11:22:30.000Z"), tags: [Tag(tagId: 5006, tagName: "엄마", grade: 3)]),
    Post(postId: 671029, title: "엄마를 위한 하루 힐링 타임", summary: "엄마가 일상에서 힐링할 수 있는 방법을 공유합니다.", comments: 2, like: 6, viewed: 391, createdAt: DateTime.parse("2023-05-12T14:10:00.000Z"), tags: [Tag(tagId: 5006, tagName: "엄마", grade: 3)]),
    Post(postId: 983467, title: "엄마의 지혜가 담긴 생활 꿀팁", summary: "엄마들이 꼭 알아야 할 생활 꿀팁들을 공유합니다.", comments: 3, like: 8, viewed: 345, createdAt: DateTime.parse("2023-03-25T09:11:50.000Z"), tags: [Tag(tagId: 5006, tagName: "엄마", grade: 3)]),
    Post(postId: 438592, title: "엄마와 함께하는 주말 베이킹 클래스", summary: "주말에 엄마와 함께 할 수 있는 간단한 베이킹 레시피를 소개합니다.", comments: 1, like: 5, viewed: 220, createdAt: DateTime.parse("2023-04-20T17:30:00.000Z"), tags: [Tag(tagId: 5006, tagName: "엄마", grade: 3)]),
    Post(postId: 572931, title: "엄마와 아이가 함께 즐길 수 있는 실내 놀이", summary: "비 오는 날 엄마와 아이가 즐길 수 있는 실내 놀이를 추천합니다.", comments: 2, like: 7, viewed: 298, createdAt: DateTime.parse("2023-02-15T13:00:00.000Z"), tags: [Tag(tagId: 5006, tagName: "엄마", grade: 3)]),
    Post(postId: 846279, title: "세계 각국의 커피 문화", summary: "다양한 나라에서 커피를 즐기는 문화를 소개합니다.", comments: 15, like: 43, viewed: 512, createdAt: DateTime.parse("2023-01-05T12:00:00.000Z"), imageURL: "https://picsum.photos/200"),
    Post(postId: 234758, title: "한국 전통 예술과 현대 문화의 조화", summary: "전통 예술이 현대 문화와 어떻게 조화를 이루는지 알아봅니다.", comments: 12, like: 35, viewed: 482, createdAt: DateTime.parse("2023-02-12T09:30:00.000Z")),
    Post(postId: 574820, title: "일상에서 경험하는 예술 문화", summary: "우리의 일상 속에서 쉽게 접할 수 있는 예술 문화를 소개합니다.", comments: 8, like: 28, viewed: 396, createdAt: DateTime.parse("2023-03-17T14:00:00.000Z"), imageURL: "https://picsum.photos/200"),
    Post(postId: 348926, title: "한국의 음식 문화 깊이 알아보기", summary: "한국 음식 문화의 역사와 의미를 소개합니다.", comments: 20, like: 55, viewed: 658, createdAt: DateTime.parse("2023-04-05T11:00:00.000Z")),
    Post(postId: 183720, title: "세계 여러 나라의 전통 문화 축제", summary: "전 세계에서 열리는 다양한 전통 문화 축제를 소개합니다.", comments: 10, like: 33, viewed: 515, createdAt: DateTime.parse("2023-05-11T18:30:00.000Z")),
    Post(postId: 561472, title: "예술과 문화의 만남: 전시회 이야기", summary: "다양한 예술 전시회를 통해 만나는 문화적 가치에 대해 이야기합니다.", comments: 6, like: 24, viewed: 386, createdAt: DateTime.parse("2023-06-15T10:20:00.000Z"), imageURL: "https://picsum.photos/200"),
    Post(postId: 902671, title: "디지털 시대의 문화 변화", summary: "디지털 기술이 우리 문화에 미치는 영향에 대해 살펴봅니다.", comments: 11, like: 30, viewed: 432, createdAt: DateTime.parse("2023-07-22T14:45:00.000Z")),
    Post(postId: 735281, title: "세계의 다양한 결혼 문화", summary: "각국의 독특한 결혼 문화를 소개합니다.", comments: 18, like: 40, viewed: 592, createdAt: DateTime.parse("2023-08-08T09:50:00.000Z"), imageURL: "https://picsum.photos/200"),
    Post(postId: 417239, title: "음악과 문화의 관계", summary: "음악이 어떻게 문화적 배경을 형성하고 영향을 미치는지 알아봅니다.", comments: 9, like: 27, viewed: 365, createdAt: DateTime.parse("2023-09-01T13:25:00.000Z")),
    Post(postId: 982137, title: "전통 문화와 현대의 공존", summary: "전통 문화와 현대 생활이 어떻게 공존하고 있는지 살펴봅니다.", comments: 7, like: 19, viewed: 342, createdAt: DateTime.parse("2023-10-14T08:40:00.000Z")),
    Post(postId: 540187, title: "패션의 변화와 문화적 의미", summary: "패션의 변화 속에서 드러나는 문화적 의미를 탐구합니다.", comments: 13, like: 34, viewed: 498, createdAt: DateTime.parse("2023-01-30T17:10:00.000Z"), imageURL: "https://picsum.photos/200"),
    Post(postId: 763489, title: "세계 각국의 축제 문화", summary: "세계 각국에서 열리는 축제의 문화적 의미를 소개합니다.", comments: 16, like: 42, viewed: 581, createdAt: DateTime.parse("2023-02-20T15:20:00.000Z")),
    Post(postId: 874912, title: "영화 속에 담긴 사회와 문화", summary: "영화를 통해 사회와 문화적 배경을 이해하는 방법을 소개합니다.", comments: 5, like: 21, viewed: 352, createdAt: DateTime.parse("2023-03-28T11:00:00.000Z")),
    Post(postId: 491276, title: "우리 동네의 전통 문화 체험", summary: "지역 사회에서 전통 문화를 체험할 수 있는 방법을 소개합니다.", comments: 14, like: 33, viewed: 469, createdAt: DateTime.parse("2023-04-16T12:45:00.000Z"), imageURL: "https://picsum.photos/200"),
    Post(postId: 108293, title: "문화적 차이를 이해하는 방법", summary: "문화적 차이를 이해하고 서로 존중하는 방법을 알려드립니다.", comments: 8, like: 29, viewed: 428, createdAt: DateTime.parse("2023-05-30T13:15:00.000Z")),
    Post(postId: 712943, title: "전통 음식과 그 문화적 가치", summary: "전통 음식이 가지는 문화적 가치를 탐구해 봅니다.", comments: 10, like: 25, viewed: 412, createdAt: DateTime.parse("2023-06-10T09:30:00.000Z")),
    Post(postId: 194783, title: "문화 유산 보호의 중요성", summary: "문화 유산을 보호하고 보존해야 하는 이유에 대해 알아봅니다.", comments: 12, like: 31, viewed: 454, createdAt: DateTime.parse("2023-07-02T18:50:00.000Z")),
    Post(postId: 384712, title: "문화 예술 활동이 우리에게 주는 영향", summary: "문화 예술 활동이 우리의 삶에 어떤 영향을 미치는지 소개합니다.", comments: 9, like: 28, viewed: 386, createdAt: DateTime.parse("2023-08-19T08:00:00.000Z"), imageURL: "https://picsum.photos/200"),
    Post(postId: 645389, title: "서로 다른 문화 속에서 살아가기", summary: "다양한 문화 속에서 공존하며 살아가는 방법을 제시합니다.", comments: 11, like: 30, viewed: 424, createdAt: DateTime.parse("2023-09-12T14:25:00.000Z")),
    Post(postId: 372910, title: "문화 교류가 가져오는 변화", summary: "문화 교류가 우리 사회와 개인에게 가져오는 긍정적인 변화를 살펴봅니다.", comments: 13, like: 35, viewed: 453, createdAt: DateTime.parse("2023-10-03T15:55:00.000Z")),
    Post(postId: 582134, title: "도시에서 즐기는 문화 예술 활동", summary: "도시에서 쉽게 접근할 수 있는 문화 예술 활동들을 소개합니다.", comments: 17, like: 38, viewed: 475, createdAt: DateTime.parse("2023-11-08T09:10:00.000Z"), imageURL: "https://picsum.photos/200"),
    Post(postId: 719283, title: "문화와 전통의 의미", summary: "문화와 전통이 우리 삶에 어떤 영향을 미치는지 알아봅니다.", comments: 8, like: 22, viewed: 369, createdAt: DateTime.parse("2023-12-01T16:00:00.000Z")),
    Post(postId: 283617, title: "현대 예술과 문화적 표현", summary: "현대 예술 작품을 통해 나타나는 문화적 표현을 분석해봅니다.", comments: 9, like: 27, viewed: 414, createdAt: DateTime.parse("2024-01-15T11:30:00.000Z")),
    Post(postId: 193875, title: "문화의 중요성과 사회적 역할", summary: "문화가 사회에서 어떤 역할을 하는지에 대해 알아봅니다.", comments: 10, like: 29, viewed: 418, createdAt: DateTime.parse("2024-02-07T10:00:00.000Z")),
    Post(postId: 718946, title: "전통 춤과 문화적 의의", summary: "전통 춤이 가지는 문화적 의미와 사회적 역할을 탐구합니다.", comments: 11, like: 33, viewed: 440, createdAt: DateTime.parse("2024-03-20T14:40:00.000Z"), imageURL: "https://picsum.photos/200"),
    Post(postId: 128467, title: "문화와 기술의 융합", summary: "기술과 문화가 융합되어 만들어내는 새로운 현상을 탐구합니다.", comments: 13, like: 35, viewed: 460, createdAt: DateTime.parse("2024-04-12T13:30:00.000Z")),
    Post(postId: 937184, title: "음악을 통해 전해지는 문화적 가치", summary: "음악이 가지고 있는 문화적 가치에 대해 알아봅니다.", comments: 12, like: 28, viewed: 442, createdAt: DateTime.parse("2024-05-09T17:25:00.000Z")),
    Post(postId: 563912, title: "문화 다양성과 글로벌 사회", summary: "글로벌 사회에서 문화 다양성을 존중하는 방법을 제시합니다.", comments: 9, like: 26, viewed: 414, createdAt: DateTime.parse("2024-06-14T11:45:00.000Z"), imageURL: "https://picsum.photos/200"),
    Post(postId: 284713, title: "문화 자원의 활용과 보호", summary: "문화 자원을 어떻게 활용하고 보호할 수 있는지 알아봅니다.", comments: 10, like: 32, viewed: 432, createdAt: DateTime.parse("2024-07-01T10:00:00.000Z")),
    Post(postId: 904162, title: "예술을 통한 문화적 소통", summary: "예술을 통해 서로 다른 문화가 소통하는 방식을 소개합니다.", comments: 14, like: 36, viewed: 480, createdAt: DateTime.parse("2024-07-01T10:00:00.000Z")),
    Post(postId: 1001, title: "여름을 위한 최적의 음악 플레이리스트", summary: "여름의 햇살을 느끼며 듣기 좋은 음악들을 모았습니다.", comments: 25, like: 42, viewed: 600, createdAt: DateTime.parse("2024-06-01T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1002, title: "비 오는 날 감성 플레이리스트", summary: "비 내리는 날 듣기 좋은 감성 음악을 준비했습니다.", comments: 18, like: 30, viewed: 450, createdAt: DateTime.parse("2024-06-02T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1003, title: "운동할 때 듣기 좋은 플레이리스트", summary: "운동할 때 에너지를 주는 곡들로 구성된 플레이리스트입니다.", comments: 20, like: 55, viewed: 720, createdAt: DateTime.parse("2024-06-03T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1004, title: "밤에 듣기 좋은 재즈 플레이리스트", summary: "편안한 밤을 위한 재즈 음악 모음입니다.", comments: 5, like: 15, viewed: 230, createdAt: DateTime.parse("2024-06-04T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1005, title: "여행 중 듣기 좋은 음악 플레이리스트", summary: "여행의 즐거움을 더해주는 음악들을 소개합니다.", comments: 12, like: 28, viewed: 360, createdAt: DateTime.parse("2024-06-05T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1006, title: "카페에서 듣기 좋은 플레이리스트", summary: "카페의 분위기를 살려주는 음악들을 모았습니다.", comments: 8, like: 22, viewed: 300, createdAt: DateTime.parse("2024-06-06T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1007, title: "힐링을 위한 플레이리스트", summary: "마음을 편안하게 해주는 힐링 음악 모음입니다.", comments: 30, like: 48, viewed: 890, createdAt: DateTime.parse("2024-06-07T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1008, title: "가을에 어울리는 플레이리스트", summary: "가을의 정취를 느낄 수 있는 음악들을 정리했습니다.", comments: 27, like: 37, viewed: 500, createdAt: DateTime.parse("2024-06-08T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1009, title: "주말에 듣기 좋은 플레이리스트", summary: "주말의 여유를 만끽할 수 있는 음악들을 소개합니다.", comments: 15, like: 40, viewed: 480, createdAt: DateTime.parse("2024-06-09T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1010, title: "사랑을 위한 플레이리스트", summary: "사랑하는 사람과 함께 듣기 좋은 음악들을 모았습니다.", comments: 35, like: 60, viewed: 920, createdAt: DateTime.parse("2024-06-10T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1011, title: "가족과 함께하는 플레이리스트", summary: "가족과 함께 즐길 수 있는 음악들로 구성했습니다.", comments: 10, like: 25, viewed: 290, createdAt: DateTime.parse("2024-06-11T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1012, title: "공부할 때 듣기 좋은 플레이리스트", summary: "집중력을 높여주는 음악 모음입니다.", comments: 18, like: 32, viewed: 450, createdAt: DateTime.parse("2024-06-12T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1013, title: "친구와의 만남을 위한 플레이리스트", summary: "친구들과의 만남을 더욱 즐겁게 해줄 음악들입니다.", comments: 22, like: 38, viewed: 520, createdAt: DateTime.parse("2024-06-13T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1014, title: "차에서 듣기 좋은 플레이리스트", summary: "드라이브를 더욱 즐겁게 해줄 음악들을 모았습니다.", comments: 29, like: 45, viewed: 670, createdAt: DateTime.parse("2024-06-14T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1015, title: "명상할 때 듣기 좋은 플레이리스트", summary: "명상과 힐링을 위한 음악 모음입니다.", comments: 14, like: 36, viewed: 480, createdAt: DateTime.parse("2024-06-15T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1016, title: "추억을 담은 플레이리스트", summary: "소중한 추억이 담긴 음악들을 소개합니다.", comments: 19, like: 33, viewed: 400, createdAt: DateTime.parse("2024-06-16T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1017, title: "작업할 때 듣기 좋은 플레이리스트", summary: "효율적으로 작업할 수 있게 도와주는 음악들입니다.", comments: 11, like: 28, viewed: 390, createdAt: DateTime.parse("2024-06-17T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1018, title: "휴식을 위한 플레이리스트", summary: "편안한 휴식을 위한 음악 모음입니다.", comments: 7, like: 20, viewed: 310, createdAt: DateTime.parse("2024-06-18T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1019, title: "이별 후 듣기 좋은 플레이리스트", summary: "이별의 아픔을 달래줄 음악들을 준비했습니다.", comments: 15, like: 35, viewed: 450, createdAt: DateTime.parse("2024-06-19T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1020, title: "크리스마스 분위기를 위한 플레이리스트", summary: "크리스마스의 기분을 느낄 수 있는 음악들을 모았습니다.", comments: 25, like: 50, viewed: 600, createdAt: DateTime.parse("2024-06-20T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1021, title: "여행 중 듣기 좋은 팝송 플레이리스트", summary: "여행의 즐거움을 더해줄 팝송들을 소개합니다.", comments: 12, like: 28, viewed: 320, createdAt: DateTime.parse("2024-06-21T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1022, title: "친구와의 파티를 위한 플레이리스트", summary: "친구들과의 파티를 더욱 즐겁게 해줄 음악들입니다.", comments: 18, like: 45, viewed: 550, createdAt: DateTime.parse("2024-06-22T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1023, title: "하루를 마무리하는 플레이리스트", summary: "하루의 끝을 편안하게 마무리하는 음악 모음입니다.", comments: 16, like: 34, viewed: 410, createdAt: DateTime.parse("2024-06-23T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1024, title: "자연에서 듣기 좋은 플레이리스트", summary: "자연의 소리와 함께 듣기 좋은 음악들을 모았습니다.", comments: 20, like: 39, viewed: 490, createdAt: DateTime.parse("2024-06-24T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1025, title: "마음의 안정을 위한 플레이리스트", summary: "마음을 차분하게 해주는 음악들을 준비했습니다.", comments: 10, like: 27, viewed: 350, createdAt: DateTime.parse("2024-06-25T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1026, title: "주말에 듣기 좋은 플레이리스트", summary: "주말의 여유를 만끽할 수 있는 음악 모음입니다.", comments: 22, like: 48, viewed: 620, createdAt: DateTime.parse("2024-06-26T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1027, title: "소중한 기억을 담은 플레이리스트", summary: "소중한 추억을 떠올리게 해주는 음악들을 소개합니다.", comments: 14, like: 36, viewed: 460, createdAt: DateTime.parse("2024-06-27T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1028, title: "새로운 시작을 위한 플레이리스트", summary: "새로운 시작을 응원하는 음악들을 모았습니다.", comments: 19, like: 42, viewed: 480, createdAt: DateTime.parse("2024-06-28T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1029, title: "사계절에 맞는 플레이리스트", summary: "사계절의 느낌을 담은 음악들을 소개합니다.", comments: 30, like: 50, viewed: 700, createdAt: DateTime.parse("2024-06-29T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
    Post(postId: 1030, title: "모든 순간을 위한 플레이리스트", summary: "각기 다른 순간에 어울리는 음악들을 모았습니다.", comments: 21, like: 43, viewed: 560, createdAt: DateTime.parse("2024-06-30T10:00:00.000Z"), tags: [Tag(tagId: 9041, tagName: "플레이리스트", grade: 4)]),
];
List<Tag> allTag = [
    Tag(tagId: 3765, tagName: "Flutter", grade: 1),
    Tag(tagId: 5432, tagName: "API연동", grade: 5),
    Tag(tagId: 8907, tagName: "개발팁", grade: 11),
    Tag(tagId: 10000001, tagName: "자격증", grade: 9),
    Tag(tagId: 10000002, tagName: "정처기", grade: 5),
    Tag(tagId: 10000003, tagName: "토익", grade: 7),
    Tag(tagId: 10000004, tagName: "SQLD", grade: 2),
    Tag(tagId: 10000005, tagName: "Qnet", grade: 8),
    Tag(tagId: 10000006, tagName: "인공지능", grade: 6),
    Tag(tagId: 10000007, tagName: "GPT", grade: 11),
    Tag(tagId: 10000008, tagName: "빅데이터", grade: 1),
    Tag(tagId: 10000009, tagName: "소금빵", grade: 4),
    Tag(tagId: 10000010, tagName: "빵", grade: 10),
    Tag(tagId: 20000001, tagName: "아이폰", grade: 10),
    Tag(tagId: 20000002, tagName: "13pro중고", grade: 5),
    Tag(tagId: 20000003, tagName: "애플케어", grade: 7),
    Tag(tagId: 20000004, tagName: "애플워치", grade: 2),
    Tag(tagId: 20000005, tagName: "에어팟프로2", grade: 8),
    Tag(tagId: 20000006, tagName: "손흥민", grade: 11),
    Tag(tagId: 20000007, tagName: "토트넘", grade: 11),
    Tag(tagId: 20000008, tagName: "축구", grade: 1),
    Tag(tagId: 20000009, tagName: "흑백요리사", grade: 4),
    Tag(tagId: 20000010, tagName: "백종원", grade: 10),
    Tag(tagId: 20000011, tagName: "안성진", grade: 8),
    Tag(tagId: 20000012, tagName: "롤드컵", grade: 9),
    Tag(tagId: 20000013, tagName: "한화", grade: 6),
    Tag(tagId: 20000014, tagName: "티원", grade: 7),
    Tag(tagId: 20000015, tagName: "젠지", grade: 7),
    Tag(tagId: 20000016, tagName: "딮기", grade: 9),
    Tag(tagId: 5500584, tagName: "정보공유", bookmarked: 2260098, count: 6054472, grade: 1, change: 3),
    Tag(tagId: 6483579, tagName: "꿀팁공유", bookmarked: 1907232, count: 1456826, grade: 3, change: 11),
    Tag(tagId: 7951011, tagName: "생활정보", bookmarked: 3614974, count: 4657548, grade: 7, change: 12),
    Tag(tagId: 2488542, tagName: "유용한팁", bookmarked: 3775929, count: 640068, grade: 9, change: -3),
    Tag(tagId: 7615117, tagName: "건강정보", bookmarked: 1751088, count: 4422214, grade: 11, change: 6),
    Tag(tagId: 714703, tagName: "노하우", bookmarked: 312407, count: 5254348, grade: 10, change: 9),
    Tag(tagId: 215707, tagName: "아이디어", bookmarked: 3795284, count: 5623334, grade: 8, change: 5),
    Tag(tagId: 2557334, tagName: "생활지혜", bookmarked: 8934600, count: 1063798, grade: 6, change: -3),
    Tag(tagId: 5596651, tagName: "DIY정보", bookmarked: 3209647, count: 2237288, grade: 4, change: 12),
    Tag(tagId: 4223100, tagName: "유익한정보", bookmarked: 2794107, count: 7819248, grade: 2, change: 7),
    Tag(tagId: 7080658, tagName: "공유합니다", bookmarked: 6767962, count: 3488927, grade: 1, change: 16),
    Tag(tagId: 9519070, tagName: "재테크팁", bookmarked: 5339900, count: 1616924, grade: 3, change: -8),
    Tag(tagId: 4857952, tagName: "경제정보", bookmarked: 6674531, count: 1682886, grade: 5, change: 17),
    Tag(tagId: 2348171, tagName: "신상정보", bookmarked: 8472470, count: 6828528, grade: 7, change: -5),
    Tag(tagId: 5580618, tagName: "최신트렌드", bookmarked: 5484617, count: 7964309, grade: 8, change: 19),
    Tag(tagId: 2833521, tagName: "취미생활", bookmarked: 7578623, count: 2622905, grade: 2, change: -14),
    Tag(tagId: 2461206, tagName: "자기계발", bookmarked: 3739094, count: 7101079, grade: 9, change: -16),
    Tag(tagId: 7258920, tagName: "공유팁", bookmarked: 7157341, count: 6396799, grade: 11, change: 5),
    Tag(tagId: 1485554, tagName: "효율적인삶", bookmarked: 5595206, count: 9024936, grade: 9, change: -5),
    Tag(tagId: 624399, tagName: "성공팁", bookmarked: 831223, count: 2078251, grade: 6, change: 20),
    Tag(tagId: 2213407, tagName: "일상공유", bookmarked: 6522985, count: 6053842, grade: 9, change: -8),
    Tag(tagId: 9936855, tagName: "정보나눔", bookmarked: 2015806, count: 9322703, grade: 2, change: -7),
    Tag(tagId: 487626, tagName: "자기관리", bookmarked: 5152772, count: 9895017, grade: 3, change: 0),
    Tag(tagId: 6790516, tagName: "꿀정보", bookmarked: 7201143, count: 6108552, grade: 10, change: 11),
    Tag(tagId: 3268746, tagName: "여행팁", bookmarked: 592881, count: 9947549, grade: 9, change: -2),
    Tag(tagId: 9652110, tagName: "핫아이템", bookmarked: 5440574, count: 8987255, grade: 11, change: -7),
    Tag(tagId: 7724125, tagName: "공부비법", bookmarked: 8407184, count: 2061683, grade: 10, change: 15),
    Tag(tagId: 5180552, tagName: "취업정보", bookmarked: 7699420, count: 2133848, grade: 4, change: 3),
    Tag(tagId: 9375815, tagName: "창업정보", bookmarked: 3901958, count: 317588, grade: 8, change: 12),
    Tag(tagId: 5882355, tagName: "트렌드", bookmarked: 2433930, count: 6811400, grade: 9, change: 3),
    Tag(tagId: 7885176, tagName: "생활꿀팁", bookmarked: 238735, count: 7528672, grade: 1, change: -5),
    Tag(tagId: 5114369, tagName: "새로운정보", bookmarked: 5381543, count: 7131875, grade: 2, change: -1),
    Tag(tagId: 638358, tagName: "유익한팁", bookmarked: 3460731, count: 9629388, grade: 6, change: 16),
    Tag(tagId: 8677574, tagName: "시간관리", bookmarked: 4262404, count: 3598322, grade: 8, change: 10),
    Tag(tagId: 8160234, tagName: "성공습관", bookmarked: 2253146, count: 4444424, grade: 11, change: -5),
    Tag(tagId: 1423944, tagName: "인생팁", bookmarked: 1839150, count: 4578354, grade: 1, change: -7),
    Tag(tagId: 5908906, tagName: "효율성향상", bookmarked: 8426309, count: 3904768, grade: 5, change: 18),
    Tag(tagId: 4867188, tagName: "건강관리", bookmarked: 9638543, count: 9545662, grade: 7, change: 8),
    Tag(tagId: 9200925, tagName: "팁공유", bookmarked: 7717298, count: 9629416, grade: 9, change: -20),
    Tag(tagId: 9059860, tagName: "업데이트정보", bookmarked: 4680554, count: 5432244, grade: 11, change: -17),
    Tag(tagId: 11111, tagName: "문화", grade: 10, count: 43, bookmarked: 41),
    Tag(tagId: 192850, tagName: "다문화", grade: 7, count: 12, bookmarked: 20),
    Tag(tagId: 4918, tagName: "드라마", grade: 1),
    Tag(tagId: 9620, tagName: "비", grade: 2),
    Tag(tagId: 2001, tagName: "날씨", grade: 3),
    Tag(tagId: 6520, tagName: "작가", grade: 4),
    Tag(tagId: 9205, tagName: "시그널", grade: 5),
    Tag(tagId: 5886, tagName: "배우", grade: 6),
    Tag(tagId: 4513, tagName: "연기", grade: 7),
    Tag(tagId: 3236, tagName: "정주행", grade: 8),
    Tag(tagId: 1017, tagName: "MBC", grade: 9),
    Tag(tagId: 4774, tagName: "추천", grade: 10),
    Tag(tagId: 5584, tagName: "음악", grade: 1),
    Tag(tagId: 8073, tagName: "유튜브", grade: 2),
    Tag(tagId: 4268, tagName: "쇼츠", grade: 3),
    Tag(tagId: 9041, tagName: "플레이리스트", grade: 4, isBookmarked: true, count: 319734, bookmarked: 950),
    Tag(tagId: 7145, tagName: "일상", grade: 5),
    Tag(tagId: 9481, tagName: "친구", grade: 6),
    Tag(tagId: 1788, tagName: "커피", grade: 7),
    Tag(tagId: 3970, tagName: "행복", grade: 8),
    Tag(tagId: 3636, tagName: "세계여행", grade: 1),
    Tag(tagId: 3425, tagName: "지갑", grade: 2),
    Tag(tagId: 8750, tagName: "모험", grade: 3),
    Tag(tagId: 3188, tagName: "노이슈반타인", grade: 4),
    Tag(tagId: 4578, tagName: "독일", grade: 5),
    Tag(tagId: 2081, tagName: "여행", grade: 6),
    Tag(tagId: 5278, tagName: "유럽", grade: 7),
    Tag(tagId: 2288, tagName: "미술", grade: 1),
    Tag(tagId: 2, tagName: "아이", grade: 2),
    Tag(tagId: 5006, tagName: "엄마", grade: 3),
    Tag(tagId: 9851, tagName: "감기", grade: 4),
    Tag(tagId: 7334, tagName: "집", grade: 5),
    Tag(tagId: 8661, tagName: "놀이", grade: 6),
    Tag(tagId: 2271, tagName: "검색", grade: 7),
    Tag(tagId: 6113, tagName: "색깔", grade: 8),
    Tag(tagId: 4580, tagName: "영화", grade: 1),
    Tag(tagId: 5461, tagName: "비", grade: 2),
    Tag(tagId: 9934, tagName: "저녁", grade: 3),
    Tag(tagId: 6504, tagName: "친구", grade: 4),
    Tag(tagId: 2517, tagName: "시간", grade: 5),
    Tag(tagId: 6677, tagName: "관객", grade: 6),
    Tag(tagId: 7898, tagName: "정보", grade: 7),
    Tag(tagId: 9818, tagName: "눈물", grade: 8),
    Tag(tagId: 1919, tagName: "안경닦이", grade: 9),
    Tag(tagId: 6290, tagName: "일상", grade: 1),
    Tag(tagId: 8667, tagName: "쿠팡", grade: 2, bookmarked: 12, count: 22),
    Tag(tagId: 5723, tagName: "파트너", grade: 3),
    Tag(tagId: 3185, tagName: "아침", grade: 4),
    Tag(tagId: 3578, tagName: "상품", grade: 5),
    Tag(tagId: 5994, tagName: "루틴", grade: 6),
    Tag(tagId: 3438, tagName: "집", grade: 7),
    Tag(tagId: 3704, tagName: "생활용품", grade: 8),
    Tag(tagId: 3711, tagName: "스포츠", grade: 1),
    Tag(tagId: 4991, tagName: "자전거", grade: 2),
    Tag(tagId: 2030, tagName: "힐링", grade: 3),
    Tag(tagId: 6076, tagName: "운동", grade: 4),
    Tag(tagId: 4521, tagName: "한강", grade: 5),
    Tag(tagId: 2498, tagName: "노을", grade: 6),
    Tag(tagId: 9097, tagName: "사진", grade: 1),
    Tag(tagId: 9859, tagName: "맛집", grade: 2),
    Tag(tagId: 2758, tagName: "카페", grade: 3),
    Tag(tagId: 6254, tagName: "일상", grade: 4),
    Tag(tagId: 5054, tagName: "꽃", grade: 5),
    Tag(tagId: 3603, tagName: "디저트", grade: 6),
    Tag(tagId: 7221, tagName: "포토스팟", grade: 7),
    Tag(tagId: 8823, tagName: "외국어", grade: 1),
    Tag(tagId: 9196, tagName: "일본어", grade: 2),
    Tag(tagId: 8974, tagName: "일본", grade: 3),
    Tag(tagId: 2360, tagName: "독학", grade: 4),
    Tag(tagId: 9975, tagName: "시험", grade: 5),
    Tag(tagId: 4229, tagName: "정보", grade: 6),
    Tag(tagId: 2821, tagName: "SJPT", grade: 7),
    Tag(tagId: 6527, tagName: "말하기", grade: 8),
    Tag(tagId: 9053, tagName: "공연", grade: 1),
    Tag(tagId: 8303, tagName: "잡담", grade: 2),
    Tag(tagId: 1144, tagName: "주말", grade: 3),
    Tag(tagId: 9637, tagName: "오페라", grade: 4),
    Tag(tagId: 3474, tagName: "투란도트", grade: 5),
    Tag(tagId: 5339, tagName: "매력", grade: 6),
    Tag(tagId: 5495, tagName: "독일어", grade: 7),
    Tag(tagId: 3892, tagName: "추천", grade: 8),
    Tag(tagId: 7893, tagName: "대본", grade: 9),
    Tag(tagId: 2038, tagName: "취미", grade: 1),
    Tag(tagId: 3583, tagName: "일", grade: 2),
    Tag(tagId: 7591, tagName: "집", grade: 3),
    Tag(tagId: 2072, tagName: "게임", grade: 4),
    Tag(tagId: 6432, tagName: "전자시계", grade: 5),
    Tag(tagId: 153924, tagName: "다이어트", count: 8574866, grade: 7, isBookmarked: true, bookmarked: 151),
    Tag(tagId: 557802, tagName: "트위터", count: 1922750, grade: 1, isBookmarked: true, bookmarked: 3457),
    Tag(tagId: 904148, tagName: "소금빵", count: 5895490, grade: 5, isBookmarked: true, bookmarked: 675),
    Tag(tagId: 962281, tagName: "강아지", count: 3665054, grade: 7, isBookmarked: true, bookmarked: 243),
];
List<Comment> allComment = [
    Comment(commentId: 125837, userId: 672394, postId: 982347, nickname: "CHUYA", contents: "깔끔한 정리 감사합니다! \n 제어센터는 이것저것 커스텀이 가능해진건 너무 좋은데 데이터칸이 사분할 된건 너무 불편해서 별로에요 ㅠ 이 부분까지 완벽하게 커스텀이 가능하면 참 좋을 것 같은데...", likes: 102, isLiked: true, updatedAt: DateTime.parse("2024-09-22T15:30:00.000Z")),
    Comment(commentId: 392485, userId: 238472, postId: 982347, nickname: "FlutterFan", contents: "저도 최근에 비슷한 작업을 했는데, `dio` 패키지를 사용해보니 더 편리하더라고요. 특히 파일 업로드나 에러 처리가 더 쉬웠어요!", likes: 64, isLiked: false, updatedAt: DateTime.parse("2024-09-22T16:10:00.000Z")),
    Comment(commentId: 583749, userId: 912734, postId: 982347, nickname: "개발자준", contents: "저는 상태 관리도 함께 사용해서 API 데이터 관리를 했는데, `provider` 패키지와 함께 사용하니 구조가 더 깔끔해지더라고요. 강추합니다! 저는 상태 관리도 함께 사용해서 API 데이터 관리를 했는데, `provider` 패키지와 함께 사용하니 구조가 더 깔끔해지더라고요. 강추합니다!", likes: 89, isLiked: true, updatedAt: DateTime.parse("2024-09-22T17:05:00.000Z")),
    Comment(commentId: 10001, userId: 67601, nickname: "김민수", contents: "이 글 정말 유익하네요!", likes: 15, isLiked: false, updatedAt: DateTime.parse("2024-09-01T10:00:00.000Z")),
    Comment(commentId: 10002, userId: 67602, nickname: "이영희", contents: "이런 내용은 처음 들어봐요.", likes: 22, isLiked: true, updatedAt: DateTime.parse("2024-09-02T12:30:00.000Z")),
    Comment(commentId: 10003, userId: 67603, nickname: "박준호", contents: "좋은 정보 감사합니다!", likes: 10, isLiked: false, updatedAt: DateTime.parse("2024-09-03T14:15:00.000Z")),
    Comment(commentId: 10004, userId: 67604, nickname: "최지민", contents: "실제로 해보니 더 좋은 것 같아요!", likes: 5, isLiked: false, updatedAt: DateTime.parse("2024-09-04T08:45:00.000Z")),
    Comment(commentId: 10005, userId: 67605, nickname: "정수빈", contents: "다시 한번 읽어봐야겠네요.", likes: 3, isLiked: false, updatedAt: DateTime.parse("2024-09-05T16:20:00.000Z")),
    Comment(commentId: 10006, userId: 67606, nickname: "강서연", contents: "추천해주셔서 감사합니다!", likes: 18, isLiked: true, updatedAt: DateTime.parse("2024-09-06T11:35:00.000Z")),
    Comment(commentId: 10007, userId: 67607, nickname: "임하준", contents: "다음에도 이런 글 부탁드립니다.", likes: 12, isLiked: false, updatedAt: DateTime.parse("2024-09-07T09:50:00.000Z")),
    Comment(commentId: 10008, userId: 67608, nickname: "오세훈", contents: "사실 이 주제가 꽤 중요해요.", likes: 7, isLiked: false, updatedAt: DateTime.parse("2024-09-08T15:20:00.000Z")),
    Comment(commentId: 10009, userId: 67609, nickname: "배수빈", contents: "읽기 쉽고 좋네요!", likes: 11, isLiked: true, updatedAt: DateTime.parse("2024-09-09T17:30:00.000Z")),
    Comment(commentId: 10010, userId: 67610, nickname: "윤찬미", contents: "내용이 더 많으면 좋겠어요.", likes: 8, isLiked: false, updatedAt: DateTime.parse("2024-09-10T10:10:00.000Z")),
    Comment(commentId: 10011, userId: 67611, nickname: "서지혜", contents: "아주 도움이 되었습니다.", likes: 9, isLiked: false, updatedAt: DateTime.parse("2024-09-11T14:00:00.000Z")),
    Comment(commentId: 10012, userId: 67612, nickname: "진호", contents: "내용이 마음에 드네요!", likes: 4, isLiked: true, updatedAt: DateTime.parse("2024-09-12T12:45:00.000Z")),
    Comment(commentId: 10013, userId: 67613, nickname: "장유진", contents: "다음 주제는 뭐가 될까요?", likes: 6, isLiked: false, updatedAt: DateTime.parse("2024-09-13T11:10:00.000Z")),
    Comment(commentId: 10014, userId: 67614, nickname: "한상진", contents: "재미있는 주제네요.", likes: 5, isLiked: false, updatedAt: DateTime.parse("2024-09-14T08:30:00.000Z")),
    Comment(commentId: 10015, userId: 67615, nickname: "송하늘", contents: "좋은 글이에요!", likes: 20, isLiked: true, updatedAt: DateTime.parse("2024-09-15T13:15:00.000Z")),
    Comment(commentId: 10016, userId: 67616, nickname: "이승민", contents: "이런 정보가 필요했어요.", likes: 17, isLiked: false, updatedAt: DateTime.parse("2024-09-16T09:50:00.000Z")),
    Comment(commentId: 10017, userId: 67617, nickname: "안현수", contents: "한 번 더 생각해봐야겠네요.", likes: 2, isLiked: false, updatedAt: DateTime.parse("2024-09-17T10:45:00.000Z")),
    Comment(commentId: 10018, userId: 67618, nickname: "신유정", contents: "정말 훌륭한 글입니다!", likes: 25, isLiked: true, updatedAt: DateTime.parse("2024-09-18T11:05:00.000Z")),
    Comment(commentId: 10019, userId: 67619, nickname: "문주희", contents: "다양한 의견이 있군요.", likes: 12, isLiked: false, updatedAt: DateTime.parse("2024-09-19T13:25:00.000Z")),
    Comment(commentId: 10020, userId: 67620, nickname: "허정훈", contents: "좋은 정보 감사합니다!", likes: 18, isLiked: false, updatedAt: DateTime.parse("2024-09-20T14:10:00.000Z")),
    Comment(commentId: 10021, userId: 67621, nickname: "이재현", contents: "이런 주제는 항상 흥미로워요.", likes: 10, isLiked: true, updatedAt: DateTime.parse("2024-09-21T15:40:00.000Z")),
    Comment(commentId: 10022, userId: 67622, nickname: "양지수", contents: "한번 더 읽어보세요!", likes: 3, isLiked: false, updatedAt: DateTime.parse("2024-09-22T12:00:00.000Z")),
    Comment(commentId: 10023, userId: 67623, nickname: "차유나", contents: "참고가 많이 되었어요.", likes: 14, isLiked: false, updatedAt: DateTime.parse("2024-09-23T11:35:00.000Z")),
    Comment(commentId: 10024, userId: 67624, nickname: "조민호", contents: "좋은 자료 감사합니다.", likes: 8, isLiked: true, updatedAt: DateTime.parse("2024-09-24T13:00:00.000Z")),
    Comment(commentId: 10025, userId: 67625, nickname: "원서연", contents: "유익한 내용이네요!", likes: 16, isLiked: false, updatedAt: DateTime.parse("2024-09-25T09:15:00.000Z")),
    Comment(commentId: 10026, userId: 67626, nickname: "백하늘", contents: "읽어보니 정말 좋습니다.", likes: 11, isLiked: false, updatedAt: DateTime.parse("2024-09-26T10:50:00.000Z")),
    Comment(commentId: 10027, userId: 67627, nickname: "이도현", contents: "다양한 시각이 필요해요.", likes: 7, isLiked: true, updatedAt: DateTime.parse("2024-09-27T08:20:00.000Z")),
    Comment(commentId: 10028, userId: 67628, nickname: "윤소희", contents: "아주 흥미로운 주제입니다!", likes: 5, isLiked: false, updatedAt: DateTime.parse("2024-09-28T15:30:00.000Z")),
    Comment(commentId: 10029, userId: 67629, nickname: "김다은", contents: "감사합니다. 다음 글도 기대할게요.", likes: 21, isLiked: true, updatedAt: DateTime.parse("2024-09-29T14:40:00.000Z")),
    Comment(commentId: 10030, userId: 67630, nickname: "허재훈", contents: "글이 너무 좋네요!", likes: 9, isLiked: false, updatedAt: DateTime.parse("2024-09-30T10:30:00.000Z")),
    Comment(commentId: 10031, userId: 67631, nickname: "강민정", contents: "정말 흥미롭습니다.", likes: 13, isLiked: false, updatedAt: DateTime.parse("2024-10-01T12:55:00.000Z")),
    Comment(commentId: 10032, userId: 67632, nickname: "전진우", contents: "더 많은 글 부탁드립니다!", likes: 6, isLiked: true, updatedAt: DateTime.parse("2024-10-02T11:25:00.000Z")),
    Comment(commentId: 10033, userId: 67633, nickname: "한별", contents: "주제에 대한 생각을 나누고 싶어요.", likes: 8, isLiked: false, updatedAt: DateTime.parse("2024-10-03T14:20:00.000Z")),
    Comment(commentId: 10034, userId: 67634, nickname: "오하늘", contents: "읽는 재미가 있네요!", likes: 10, isLiked: false, updatedAt: DateTime.parse("2024-10-04T09:40:00.000Z")),
    Comment(commentId: 10035, userId: 67635, nickname: "홍지수", contents: "잘 읽었습니다. 감사해요!", likes: 12, isLiked: true, updatedAt: DateTime.parse("2024-10-05T10:10:00.000Z")),
    Comment(commentId: 10036, userId: 67636, nickname: "장서준", contents: "이런 정보가 있었군요.", likes: 4, isLiked: false, updatedAt: DateTime.parse("2024-10-06T12:00:00.000Z")),
    Comment(commentId: 10037, userId: 67637, nickname: "이수현", contents: "읽고 나니 유익한 것 같아요.", likes: 15, isLiked: true, updatedAt: DateTime.parse("2024-10-07T11:45:00.000Z")),
    Comment(commentId: 10038, userId: 67638, nickname: "유태오", contents: "내용이 명쾌하네요.", likes: 9, isLiked: false, updatedAt: DateTime.parse("2024-10-08T14:20:00.000Z")),
    Comment(commentId: 10039, userId: 67639, nickname: "한진수", contents: "더 많은 정보 부탁드려요.", likes: 11, isLiked: true, updatedAt: DateTime.parse("2024-10-09T13:30:00.000Z")),
    Comment(commentId: 10040, userId: 67640, nickname: "최유나", contents: "좋은 주제라 생각합니다.", likes: 19, isLiked: false, updatedAt: DateTime.parse("2024-10-10T12:10:00.000Z")),
    Comment(commentId: 10041, userId: 67641, nickname: "권해리", contents: "이런 글을 많이 써주세요!", likes: 16, isLiked: true, updatedAt: DateTime.parse("2024-10-11T10:30:00.000Z")),
    Comment(commentId: 10042, userId: 67642, nickname: "윤상현", contents: "좋은 생각입니다. 동의해요.", likes: 14, isLiked: false, updatedAt: DateTime.parse("2024-10-12T09:50:00.000Z")),
    Comment(commentId: 10043, userId: 67643, nickname: "김서영", contents: "재미있는 글입니다. 계속 써주세요.", likes: 5, isLiked: false, updatedAt: DateTime.parse("2024-10-13T11:10:00.000Z")),
    Comment(commentId: 10044, userId: 67644, nickname: "박지우", contents: "흥미로운 주제네요.", likes: 8, isLiked: true, updatedAt: DateTime.parse("2024-10-14T12:30:00.000Z")),
    Comment(commentId: 10045, userId: 67645, nickname: "정하늘", contents: "감사합니다. 기대하겠습니다!", likes: 12, isLiked: false, updatedAt: DateTime.parse("2024-10-15T14:40:00.000Z")),
    Comment(commentId: 10046, userId: 67646, nickname: "이하늘", contents: "내용이 좋네요. 잘 읽었습니다.", likes: 7, isLiked: false, updatedAt: DateTime.parse("2024-10-16T10:00:00.000Z")),
    Comment(commentId: 10047, userId: 67647, nickname: "장태연", contents: "훌륭한 정보입니다. 감사합니다.", likes: 15, isLiked: true, updatedAt: DateTime.parse("2024-10-17T09:15:00.000Z")),
    Comment(commentId: 10048, userId: 67648, nickname: "윤수아", contents: "더 많은 정보 공유해주세요.", likes: 11, isLiked: false, updatedAt: DateTime.parse("2024-10-18T11:25:00.000Z")),
    Comment(commentId: 10049, userId: 67649, nickname: "최성민", contents: "매우 유익한 내용이네요!", likes: 20, isLiked: true, updatedAt: DateTime.parse("2024-10-19T12:35:00.000Z")),
    Comment(commentId: 124578, userId: 672394, postId: 865124, nickname: "썸데이", contents: "딸이 연루되잇는거죠..?무섭네유 비오는 날보면", likes: 1, isLiked: true, updatedAt: DateTime.parse("2024-10-18T14:51:00.000Z")),
    Comment(commentId: 137642, userId: 384279, postId: 865124, nickname: "샤이닝스따", contents: "1부보는 중인데 이제 시작인거 알고 아껴 보고 있어요ㅎ 딸이 뭔가 사이코패스나 소시오패스쪽인가 싶은 암시가 있더라고요", likes: 5, isLiked: false, updatedAt: DateTime.parse("2024-10-18T15:11:00.000Z")),
    Comment(commentId: 985431, userId: 125783, postId: 865124, nickname: "매니저쭈니맘", contents: "무서워서 안보려다 봤는데 숨막히게 재밌어요 ㅎㅎ", likes: 2, isLiked: true, updatedAt: DateTime.parse("2024-10-18T16:13:00.000Z")),
    Comment(commentId: 564213, userId: 748159, postId: 656762, nickname: "북극꼼", contents: "아침에 좋아하는 곡을 듣는 느낌, 정말 공감해요!", likes: 81, isLiked: true, updatedAt: DateTime.parse("2024-10-24T03:19:00.000Z")),
    Comment(commentId: 238947, userId: 462735, postId: 656762, nickname: "서울김치", contents: "플레이리스트 공유해 주세요~~", likes: 5, isLiked: false, updatedAt: DateTime.parse("2024-10-24T04:30:00.000Z")),
    Comment(commentId: 847592, userId: 913284, postId: 938118, nickname: "잠실러", contents: "와… 읽는 동안 글쓴이에 빙의되어 안타까웠는데 지갑이 다시돌아오고 세계여행이 다시 진행되었다는 마지막에 같이 안도했습니다. 진짜 다행이네요.", likes: 33, isLiked: true, updatedAt: DateTime.parse("2024-10-03T07:39:00.000Z")),
    Comment(commentId: 305721, userId: 675193, postId: 938118, nickname: "내가간다하와이", contents: "다행입니다. 더욱 재미있는 여행을 응원합니다.", likes: 17, isLiked: false, updatedAt: DateTime.parse("2024-10-03T07:41:00.000Z")),
    Comment(commentId: 459126, userId: 451927, postId: 938118, nickname: "LAXY", contents: "다행히 지갑을 찾고난 다음이라 추억으로 남을 경험이라고 말씀드리지만 당시엔 정말 멘탈 와장창 무너질 아찔한 순간이셨을거 같아요..ㅎ 남은 여행 더더 행운이 따르시길 바래요~^^", likes: 24, isLiked: false, updatedAt: DateTime.parse("2024-10-03T07:42:00.000Z")),
    Comment(commentId: 182304, userId: 573294, postId: 766436, nickname: "은이영이", contents: "아이들 같이 놀아줄게 한 개가 있던데 이렇게 미술 놀이를 할 수 있으니 너무 좋으네요. 성분도 좋아서 더 마음에 드는 제품이네요.", likes: 27, isLiked: true, updatedAt: DateTime.parse("2024-10-16T12:03:00.000Z")),
    Comment(commentId: 720158, userId: 829463, postId: 766436, nickname: "소담맘85", contents: "집에서 이렇게 해주면 좋아하죠~ \n 저희애도 아기때 많이 해줬네요.", likes: 7, isLiked: false, updatedAt: DateTime.parse("2024-10-16T12:04:00.000Z")),
    Comment(commentId: 438201, userId: 194725, postId: 766436, nickname: "카놀라유", contents: "오호~~~ 성분이 좋네요^^", likes: 18, isLiked: true, updatedAt: DateTime.parse("2024-10-16T13:47:00.000Z")),
    Comment(commentId: 597420, userId: 647158, postId: 422069, nickname: "은사시나무", contents: "보고 싶어지는 영화로군요. 룩북. 메모해두었다가 시간 되면 꼭 보고 싶어요. 겨울 냄새... 코 끝이 벌써 시리네요.ㅎㅎㅎ", likes: 100, isLiked: true, updatedAt: DateTime.parse("2024-10-24T12:11:42.000Z")),
    Comment(commentId: 315794, userId: 820364, postId: 422069, nickname: "브라이드", contents: "일본애니 조아하는데 꼭 봐야겠어요 ^^ 영화관에 사람이 요즘 없긴 없나보네요 ㅎㅎ 정말 스키의 계절이 다가오네요! 콘도 예약하고 버스 알아보고 그랬던 시절이 기억이 아련해요 ㅋ", likes: 78, isLiked: true, updatedAt: DateTime.parse("2024-10-24T12:07:00.000Z")),
    Comment(commentId: 829076, userId: 431587, postId: 422069, nickname: "조전", contents: "전 룩북 만화책으로 봤어요 아들이 엄청 명작이라고 꼭 보라해서 강제로요 ㅎㅎㅎ 전 눈물까진 안나던데.. 애니로 보면 좀 다르게 다가올 수도 있을거 같네요.", likes: 45, isLiked: true, updatedAt: DateTime.parse("2024-10-24T12:14:00.000Z")),
    Comment(commentId: 640215, userId: 451927, postId: 495475, nickname: "LAXY", contents: "쿠팡파트너스를 통해 소소한 수익을 올릴 수 있다니, 너무 뿌듯하네요!", likes: 38, isLiked: true, updatedAt: DateTime.parse("2024-10-17T11:46:00.000Z")),
    Comment(commentId: 217684, userId: 956721, postId: 495475, nickname: "샤커", contents: "요즘 집에서 보내는 시간이 많아지니, 쿠팡파트너스가 정말 유용하죠.", likes: 9, isLiked: false, updatedAt: DateTime.parse("2024-10-17T11:47:00.000Z")),
    Comment(commentId: 874930, userId: 582034, postId: 495475, nickname: "북극곰", contents: "가족과 함께 음식을 나누는 시간이 정말 소중한 것 같아요.", likes: 11, isLiked: true, updatedAt: DateTime.parse("2024-10-17T11:48:00.000Z")),
    Comment(commentId: 169452, userId: 423869, postId: 638261, nickname: "투바이마인", contents: "건강한 취미를 찾으셨네요~ 저도 얼른 운동시작해야하는데 몸이 따라주질 않아요ㅠㅠ", likes: 2, isLiked: true, updatedAt: DateTime.parse("2024-10-08T17:25:00.000Z")),
    Comment(commentId: 230178, userId: 159374, postId: 638261, nickname: "플레이맨", contents: "저 얼마전에 테니스칠 때 사려고 스포츠 모자 하나 구매했는데 너무 만족해요!!", likes: 5, isLiked: true, updatedAt: DateTime.parse("2024-10-08T17:25:00.000Z")),
    Comment(commentId: 987620, userId: 648205, postId: 638261, nickname: "뉴트", contents: "저는 등산용으로 모자 알아보는 중인데 가볍고 방수되는 모자로 사려구요~", likes: 10, isLiked: true, updatedAt: DateTime.parse("2024-10-08T17:26:00.000Z")),
    Comment(commentId: 354862, userId: 451927, postId: 580674, nickname: "LAXY", contents: "여긴 정말 사진 맛집인거 같아요", likes: 122, isLiked: true, updatedAt: DateTime.parse("2024-10-22T18:47:00.000Z")),
    Comment(commentId: 470253, userId: 937614, postId: 580674, nickname: "프쉬케의꿈", contents: "카페가 사진찍기에도 예쁜데 두두님이 사진을 또 예쁘게 잘 찍으신걸요^^*", likes: 111, isLiked: true, updatedAt: DateTime.parse("2024-10-22T18:37:00.000Z")),
    Comment(commentId: 213890, userId: 760482, postId: 580674, nickname: "세나", contents: "여길 못가봤넹ㅋ", likes: 11, isLiked: false, updatedAt: DateTime.parse("2024-10-22T18:38:00.000Z")),
    Comment(commentId: 582937, userId: 145736, postId: 568689, nickname: "일공사학습도우미1", contents: "일본어말하기 시험 SJPT 독학 시험 정보가 도움됐다면 좋아요와 댓글 부탁드립니다 :)", likes: 55, isLiked: true, updatedAt: DateTime.parse("2024-10-17T17:25:00.000Z")),
    Comment(commentId: 741206, userId: 354189, postId: 568689, nickname: "오잉36", contents: "일본어말하기 시험 SJPT 독학 시험 정보 감사합니다 :)", likes: 33, isLiked: true, updatedAt: DateTime.parse("2024-10-17T17:35:00.000Z")),
    Comment(commentId: 198504, userId: 451927, postId: 568689, nickname: "LAXY", contents: "일본어말하기 시험 SJPT 독학 시험 정보 잘보고갑니다.", likes: 46, isLiked: false, updatedAt: DateTime.parse("2024-10-17T17:38:00.000Z")),
    Comment(commentId: 426178, userId: 391852, postId: 151947, nickname: "길가", contents: "좋은 정보 감사합니다. 공연은 못 가지만 아쉬운대로 타이달에서 정주행 달리겠습니다~", likes: 210, isLiked: true, updatedAt: DateTime.parse("2024-10-18T12:20:00.000Z")),
    Comment(commentId: 583920, userId: 760294, postId: 151947, nickname: "별남비", contents: "탄호이저 서곡은 한때 제 기상송이었습니다 오페라가 뮤지컬보다 정적이고 성악가도 나이가 많고 마이크 없이 부르기 때문에 실연은 다소 졸린 경우가 많은데 무대연출 잘하면 그만큼 임팩트 있게 다가오더라고요 잘 보시길 바랍니다", likes: 158, isLiked: true, updatedAt: DateTime.parse("2024-10-18T12:56:00.000Z")),
    Comment(commentId: 204681, userId: 318540, postId: 589954, nickname: "맨치", contents: "제 취미는 뒹굴대기와 잠자기인데… 부끄럽군요", likes: 122, isLiked: true, updatedAt: DateTime.parse("2024-10-18T19:51:00.000Z")),
    Comment(commentId: 389576, userId: 462301, postId: 589954, nickname: "이만", contents: "크 취미가 있어야 인생에 감칠맛이 있죠 ㅎㅎ 레코드는 눈썹달lp에 좋은 추억이있어 찾아보고 아.. 추억으로 남겨야되겠더라구요 ㅋㅋ", likes: 300, isLiked: true, updatedAt: DateTime.parse("2024-10-19T04:19:00.000Z")),
];

/// 태그별 커뮤니티 화면구성
List<TempCommunityData> tempCommunityScreenData = [
    TempCommunityData(
        tagId: 11111,
        communityMainData: RankData.fromJson(jsonDecode('''
        {
  "daily": [
    {
      "post_id": 865124,
      "title": "[난지금](7) 비오는 날 추천 드라마!",
      "comments": 3,
      "like": 15,
      "change": 18
    },
    {
      "post_id": 80604,
      "title": "아침에 듣기 좋은 클래식 음악 추천",
      "comments": 3,
      "like": 5,
      "change": 12
    },
    {
      "post_id": 18551,
      "title": "여행을 떠나기 전 꼭 알아야 할 문화 차이",
      "comments": 10,
      "like": 0,
      "change": 3
    },
    {
      "post_id": 70710,
      "title": "전통 공예와 현대 디자인의 만남",
      "comments": 2,
      "like": 7,
      "change": 14
    },
    {
      "post_id": 30828,
      "title": "커피와 함께하는 책 읽기 문화",
      "comments": 6,
      "like": 5,
      "change": 1
    },
    {
      "post_id": 40605,
      "title": "방을 꾸미는 예술적인 소품 추천",
      "comments": 6,
      "like": 7,
      "change": 2
    },
    {
      "post_id": 60881,
      "title": "예술적인 운동 방법: 춤을 통한 자기 표현",
      "comments": 9,
      "like": 6,
      "change": -4
    },
    {
      "post_id": 9755,
      "title": "디지털 시대의 문화 콘텐츠 정리법",
      "comments": 0,
      "like": 8,
      "change": -2
    },
    {
      "post_id": 6669,
      "title": "음식과 함께하는 전통 문화",
      "comments": 2,
      "like": 3,
      "change": 8
    },
    {
      "post_id": 60208,
      "title": "마음을 안정시키는 명상 음악 추천",
      "comments": 8,
      "like": 4,
      "change": 15
    }
  ],
  "weekly": [
    {
      "post_id": 422060,
      "title": "넷플릭스 꿀팁 3가지",
      "comments": 9892,
      "like": 2,
      "change": 6
    },
    {
      "post_id": 422069,
      "title": "영화 룩 백",
      "comments": 3,
      "like": 192,
      "change": 5
    },
    {
      "post_id": 18550,
      "title": "아이들과 함께하는 미술 체험",
      "comments": 1,
      "like": 5,
      "change": -1
    },
    {
      "post_id": 70709,
      "title": "집에서 즐기는 전통 음악 추천",
      "comments": 1,
      "like": 0,
      "change": 18
    },
    {
      "post_id": 30827,
      "title": "공간을 예술로 채우기: 홈 인테리어 팁",
      "comments": 6,
      "like": 6,
      "change": -3
    },
    {
      "post_id": 40604,
      "title": "생산성을 높이는 음악 선택 가이드",
      "comments": 7,
      "like": 2,
      "change": 0
    },
    {
      "post_id": 60880,
      "title": "아침을 시작하는 데 좋은 클래식 추천",
      "comments": 2,
      "like": 0,
      "change": -5
    },
    {
      "post_id": 9754,
      "title": "사진 속에 담긴 문화 이야기",
      "comments": 9,
      "like": 5,
      "change": -5
    },
    {
      "post_id": 6668,
      "title": "창의력을 높이는 예술적 취미",
      "comments": 9,
      "like": 9,
      "change": 9
    },
    {
      "post_id": 60207,
      "title": "일상 속에서 즐길 수 있는 문화 콘텐츠",
      "comments": 5,
      "like": 3,
      "change": 10
    }
  ]
}
        ''')),
        communityGoodPostData: PostData.fromJson(jsonDecode('''
        {
  "posts": [
    {
      "post_id": 151947,
      "title": "[잡담] 주말에 기대 중인 공연 2개",
      "summary": "공연",
      "comments": 2,
      "like": 265,
      "viewed": 899,
      "createdAt": "2024-10-18T11:16:00.000Z",
      "imageURL": "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMThfODEg/MDAxNzI5MjE0Nzc5OTU2.ac2a5Zu1roV7mfbjDNavGjz23BuxXV835bpCJlisfGEg.TEedZbawD8pCT2fA4UdEQofWcMPCUSYnVnvQ_mwAJtQg.PNG/%ED%88%AC%EB%9E%80%EB%8F%84%ED%8A%B8_%EB%B2%A0%EB%A1%9C%EB%82%98.png?type=w1600"
    },
    {
      "post_id": 541684,
      "title": "방 꾸미기용 간편 가구 추천",
      "summary": "방 꾸미기용 간편 가구 추천에 대한 필수 정보를 확인하세요.",
      "comments": 9,
      "like": 229,
      "viewed": 270,
      "createdAt": "2024-02-20T06:22:00.000Z"
    },
    {
      "post_id": 683701,
      "title": "효율적인 사무 환경을 위한 데스크 용품",
      "summary": "효율적인 사무 환경을 위한 데스크 용품에 대한 필수 정보를 확인하세요.",
      "comments": 4,
      "like": 176,
      "viewed": 770,
      "createdAt": "2023-08-15T02:27:00.000Z"
    },
    {
      "post_id": 714623,
      "title": "아늑한 공간을 위한 인테리어 소품",
      "summary": "아늑한 공간을 위한 인테리어 소품에 대한 필수 정보를 확인하세요.",
      "comments": 5,
      "like": 172,
      "viewed": 205,
      "createdAt": "2022-07-12T09:37:00.000Z"
    },
    {
      "post_id": 981521,
      "title": "건강한 식습관을 위한 주방 도구 추천",
      "summary": "건강한 식습관을 위한 주방 도구 추천에 대한 필수 정보를 확인하세요.",
      "comments": 1,
      "like": 152,
      "viewed": 674,
      "createdAt": "2024-12-06T01:58:00.000Z"
    },
    {
      "post_id": 355805,
      "title": "홈카페를 꾸미는 데 필요한 아이템",
      "summary": "홈카페를 꾸미는 데 필요한 아이템에 대한 필수 정보를 확인하세요.",
      "comments": 7,
      "like": 145,
      "viewed": 866,
      "createdAt": "2023-10-25T00:15:00.000Z"
    },
    {
      "post_id": 848802,
      "title": "집에서 편하게 운동하는 헬스용품",
      "summary": "집에서 편하게 운동하는 헬스용품에 대한 필수 정보를 확인하세요.",
      "comments": 7,
      "like": 134,
      "viewed": 856,
      "createdAt": "2022-01-10T20:16:00.000Z"
    },
    {
      "post_id": 954211,
      "title": "집안일을 도와주는 최고의 가전제품",
      "summary": "집안일을 도와주는 최고의 가전제품에 대한 필수 정보를 확인하세요.",
      "comments": 4,
      "like": 98,
      "viewed": 969,
      "createdAt": "2021-06-05T18:38:00.000Z"
    },
    {
      "post_id": 826067,
      "title": "아침을 활기차게 시작하는 요리 도구 3가지",
      "summary": "아침을 활기차게 시작하는 요리 도구 3가지에 대한 필수 정보를 확인하세요.",
      "comments": 9,
      "like": 79,
      "viewed": 766,
      "createdAt": "2021-11-15T10:40:00.000Z"
    },
    {
      "post_id": 368618,
      "title": "효율적인 청소를 위한 필수 청소 용품",
      "summary": "효율적인 청소를 위한 필수 청소 용품에 대한 필수 정보를 확인하세요.",
      "comments": 6,
      "like": 72,
      "viewed": 175,
      "createdAt": "2020-10-11T00:06:00.000Z"
    },
    {
      "post_id": 963102,
      "title": "반려동물 관리를 위한 필수 용품",
      "summary": "반려동물 관리를 위한 필수 용품에 대한 필수 정보를 확인하세요.",
      "comments": 7,
      "like": 67,
      "viewed": 411,
      "createdAt": "2024-05-14T03:47:00.000Z"
    },
    {
      "post_id": 330740,
      "title": "피로를 푸는 편안한 마사지 도구",
      "summary": "피로를 푸는 편안한 마사지 도구에 대한 필수 정보를 확인하세요.",
      "comments": 0,
      "like": 36,
      "viewed": 108,
      "createdAt": "2021-03-17T13:13:00.000Z"
    },
    {
      "post_id": 342890,
      "title": "차량 관리를 위한 자동차 액세서리 추천",
      "summary": "차량 관리를 위한 자동차 액세서리 추천에 대한 필수 정보를 확인하세요.",
      "comments": 7,
      "like": 22,
      "viewed": 543,
      "createdAt": "2024-01-06T00:48:00.000Z"
    },
    {
      "post_id": 395282,
      "title": "일상에서 사용할 수 있는 다용도 공구",
      "summary": "일상에서 사용할 수 있는 다용도 공구에 대한 필수 정보를 확인하세요.",
      "comments": 4,
      "like": 16,
      "viewed": 101,
      "createdAt": "2023-11-10T00:58:00.000Z"
    },
    {
      "post_id": 242245,
      "title": "여행 시 챙겨야 할 필수 생활용품",
      "summary": "여행 시 챙겨야 할 필수 생활용품에 대한 필수 정보를 확인하세요.",
      "comments": 9,
      "like": 13,
      "viewed": 736,
      "createdAt": "2022-07-11T19:18:00.000Z"
    },
    {
      "post_id": 149720,
      "title": "창의력 향상을 위한 문구류 추천",
      "summary": "창의력 향상을 위한 문구류 추천에 대한 필수 정보를 확인하세요.",
      "comments": 9,
      "like": 9,
      "viewed": 821,
      "createdAt": "2020-06-15T10:45:00.000Z"
    }
  ]
}
''')),
        communityPostData: PostData.fromJson(jsonDecode('''
        {
      "posts": [
        {
          "post_id": 580674,
          "title": "사진맛집 올라카페",
          "summary": "카페투어를 착실히 실천한 이번여행 사진 맛집이라는 올라카페도 다녀왔어요 ㅎㅎ",
          "comments": 3,
          "like": 216,
          "viewed": 899,
          "createdAt": "2024-10-24T10:00:00.000Z",
          "imageURL": "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMTFfMjk4/MDAxNzI4NjQ1Mzk4OTgx.CkvL5VKbDzmCi9Zl_keBdFNt-8hUjAk8iz05z0275icg.HPU2Dybhw5PW5JrJ6HnNWkLLibH3m7MNpxAYTRsrlKIg.JPEG/20240905%EF%BC%BF083133.jpg?type=w1600"
        },
        {
          "post_id": 97852,
          "title": "새로운 취미 추천",
          "summary": "요즘 뜨는 취미는 무엇일까요?",
          "comments": 249,
          "like": 783,
          "viewed": 1374,
          "createdAt": "2022-02-15T08:22:00.000Z"
        },
        {
          "post_id": 11237,
          "title": "아침 운동의 중요성",
          "summary": "매일 아침 운동하는 습관!",
          "comments": 321,
          "like": 456,
          "viewed": 1023,
          "createdAt": "2020-09-12T07:40:00.000Z"
        },
        {
          "post_id": 56389,
          "title": "재테크 꿀팁 공유",
          "summary": "소액 투자로 시작하는 재테크",
          "comments": 405,
          "like": 642,
          "viewed": 1845,
          "createdAt": "2023-06-19T15:15:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 23876,
          "title": "여행 준비물 리스트",
          "summary": "꼭 챙겨야 할 필수 아이템들",
          "comments": 92,
          "like": 317,
          "viewed": 744,
          "createdAt": "2021-11-30T09:00:00.000Z"
        },
        {
          "post_id": 46378,
          "title": "추천 영화 리스트",
          "summary": "주말에 보기 좋은 영화들",
          "comments": 533,
          "like": 910,
          "viewed": 2458,
          "createdAt": "2019-07-18T14:10:00.000Z"
        },
        {
          "post_id": 91234,
          "title": "책 읽기의 장점",
          "summary": "매일 책 읽기의 중요성을 알아봅시다.",
          "comments": 67,
          "like": 155,
          "viewed": 481,
          "createdAt": "2020-10-10T18:24:00.000Z"
        },
        {
          "post_id": 66728,
          "title": "반려동물 관리 방법",
          "summary": "강아지 털 관리 팁",
          "comments": 187,
          "like": 259,
          "viewed": 891,
          "createdAt": "2021-08-22T04:05:00.000Z"
        },
        {
          "post_id": 57893,
          "title": "헬스장 추천",
          "summary": "어디 헬스장이 좋은가요?",
          "comments": 200,
          "like": 378,
          "viewed": 1298,
          "createdAt": "2022-01-02T11:45:00.000Z"
        },
        {
          "post_id": 34892,
          "title": "IT 트렌드 분석",
          "summary": "올해 뜨는 IT 기술은?",
          "comments": 450,
          "like": 821,
          "viewed": 2114,
          "createdAt": "2020-02-24T16:18:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 89347,
          "title": "최신 가전제품",
          "summary": "최신 스마트 가전 소개합니다.",
          "comments": 134,
          "like": 452,
          "viewed": 1203,
          "createdAt": "2023-05-14T21:50:00.000Z"
        },
        {
          "post_id": 23901,
          "title": "등산 코스 추천",
          "summary": "가을에 가기 좋은 산",
          "comments": 98,
          "like": 245,
          "viewed": 621,
          "createdAt": "2022-09-21T05:11:00.000Z"
        },
        {
          "post_id": 70483,
          "title": "홈 카페 인테리어",
          "summary": "집에서 즐기는 홈 카페 꾸미기",
          "comments": 301,
          "like": 502,
          "viewed": 1501,
          "createdAt": "2021-03-10T14:55:00.000Z"
        },
        {
          "post_id": 53692,
          "title": "내일의 주식 전망",
          "summary": "주식 시장 분석과 내일의 전망",
          "comments": 775,
          "like": 923,
          "viewed": 3095,
          "createdAt": "2023-02-28T08:40:00.000Z"
        },
        {
          "post_id": 13290,
          "title": "다이어트 식단",
          "summary": "건강한 식단으로 체중 감량하기",
          "comments": 354,
          "like": 620,
          "viewed": 1450,
          "createdAt": "2020-06-17T07:30:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 49723,
          "title": "쇼핑몰 추천",
          "summary": "가성비 좋은 온라인 쇼핑몰 추천",
          "comments": 156,
          "like": 399,
          "viewed": 1084,
          "createdAt": "2019-12-05T03:17:00.000Z"
        },
        {
          "post_id": 89014,
          "title": "내가 사랑하는 음악",
          "summary": "요즘 듣고 있는 음악 추천",
          "comments": 66,
          "like": 289,
          "viewed": 672,
          "createdAt": "2021-07-22T02:02:00.000Z"
        },
        {
          "post_id": 78512,
          "title": "명언 모음집",
          "summary": "삶에 도움이 되는 명언들",
          "comments": 402,
          "like": 703,
          "viewed": 1822,
          "createdAt": "2020-11-12T09:50:00.000Z"
        },
        {
          "post_id": 58329,
          "title": "헬시푸드 레시피",
          "summary": "간단하고 건강한 요리법",
          "comments": 285,
          "like": 563,
          "viewed": 1307,
          "createdAt": "2023-03-23T13:07:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 29387,
          "title": "여행 후기 공유",
          "summary": "최근 다녀온 여행 후기를 남겨요.",
          "comments": 141,
          "like": 329,
          "viewed": 889,
          "createdAt": "2022-05-06T12:14:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 97245,
          "title": "독서 습관 들이기",
          "summary": "하루 10분 독서로 시작하기",
          "comments": 158,
          "like": 487,
          "viewed": 1249,
          "createdAt": "2021-10-18T19:30:00.000Z"
        },
        {
          "post_id": 40982,
          "title": "간단한 운동법",
          "summary": "5분 만에 하는 스트레칭",
          "comments": 72,
          "like": 205,
          "viewed": 654,
          "createdAt": "2023-08-07T17:25:00.000Z"
        },
        {
          "post_id": 89120,
          "title": "요리 초보의 도전",
          "summary": "처음 해본 파스타 요리!",
          "comments": 186,
          "like": 423,
          "viewed": 1140,
          "createdAt": "2019-03-13T05:12:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 67653,
          "title": "매일 아침 루틴",
          "summary": "성공적인 아침 루틴 만들기",
          "comments": 321,
          "like": 612,
          "viewed": 1504,
          "createdAt": "2020-07-29T10:44:00.000Z"
        },
        {
          "post_id": 13987,
          "title": "온라인 클래스 추천",
          "summary": "취미를 배울 수 있는 사이트",
          "comments": 312,
          "like": 581,
          "viewed": 1319,
          "createdAt": "2022-11-02T03:25:00.000Z"
        },
        {
          "post_id": 91208,
          "title": "반려동물 입양",
          "summary": "입양 전 알아야 할 사항들",
          "comments": 128,
          "like": 394,
          "viewed": 1012,
          "createdAt": "2021-06-09T06:20:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 25781,
          "title": "커피 원두 추천",
          "summary": "향과 맛이 좋은 원두 추천",
          "comments": 85,
          "like": 221,
          "viewed": 754,
          "createdAt": "2020-01-15T18:35:00.000Z"
        },
        {
          "post_id": 10987,
          "title": "게임 추천",
          "summary": "요즘 핫한 게임은?",
          "comments": 411,
          "like": 759,
          "viewed": 2023,
          "createdAt": "2019-09-29T13:56:00.000Z"
        },
        {
          "post_id": 78012,
          "title": "자동차 관리 팁",
          "summary": "겨울철 자동차 관리 요령",
          "comments": 142,
          "like": 372,
          "viewed": 936,
          "createdAt": "2022-12-11T20:19:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 47982,
          "title": "집에서 하는 간단 요리",
          "summary": "쉬운 재료로 만드는 요리",
          "comments": 98,
          "like": 310,
          "viewed": 890,
          "createdAt": "2023-07-03T04:12:00.000Z"
        },
        {
          "post_id": 68371,
          "title": "책 추천",
          "summary": "마음의 양식을 채우는 도서",
          "comments": 183,
          "like": 533,
          "viewed": 1211,
          "createdAt": "2021-05-28T09:18:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 29382,
          "title": "공부 자극 글",
          "summary": "열심히 공부하는 법을 배워보세요.",
          "comments": 257,
          "like": 687,
          "viewed": 1589,
          "createdAt": "2022-08-10T14:28:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 47281,
          "title": "의류 쇼핑몰 추천",
          "summary": "저렴하고 트렌디한 의류 추천",
          "comments": 198,
          "like": 489,
          "viewed": 1187,
          "createdAt": "2020-05-05T22:10:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 98237,
          "title": "취미 만들기",
          "summary": "취미로 시작하는 나만의 프로젝트",
          "comments": 223,
          "like": 431,
          "viewed": 1205,
          "createdAt": "2019-01-17T10:55:00.000Z"
        },
        {
          "post_id": 13567,
          "title": "알뜰 쇼핑 팁",
          "summary": "저렴하게 쇼핑하는 방법",
          "comments": 302,
          "like": 675,
          "viewed": 1432,
          "createdAt": "2021-02-13T08:22:00.000Z"
        },
        {
          "post_id": 62589,
          "title": "겨울 스포츠 즐기기",
          "summary": "스키, 스노우보드 즐기는 팁",
          "comments": 109,
          "like": 312,
          "viewed": 819,
          "createdAt": "2022-12-23T05:47:00.000Z"
        },
        {
          "post_id": 32901,
          "title": "맛집 추천",
          "summary": "이번 주말 가볼만한 맛집",
          "comments": 457,
          "like": 801,
          "viewed": 2301,
          "createdAt": "2020-11-27T15:09:00.000Z",
          "imageURL": "https://picsum.photos/200"
        }
      ]
    }
    ''')),
        communityRecommendData: CommunityRecommendData.fromJson(jsonDecode('''
        {
      "tags": [
        {
          "tagId": 5006,
          "tag_name": "엄마",
          "bookmarked": 19,
          "count": 31,
          "grade": 3,
          "change": 3
        },
    {
      "tagId": 1001,
      "tag_name": "대학교생활",
      "bookmarked": 12,
      "count": 40,
      "grade": 7,
      "change": 5
    },
        {
      "tagId": 1028,
      "tag_name": "수학공식정리",
      "bookmarked": 16,
      "count": 38,
      "grade": 7,
      "change": 4
    },
    {
      "tagId": 1033,
      "tag_name": "실내운동",
      "bookmarked": 17,
      "count": 35,
      "grade": 8,
      "change": 3
    },
    {
      "tagId": 1034,
      "tag_name": "재테크",
      "bookmarked": 9,
      "count": 23,
      "grade": 5,
      "change": 4
    },
    {
      "tagId": 1035,
      "tag_name": "독서",
      "bookmarked": 11,
      "count": 31,
      "grade": 7,
      "change": -2
    },
    {
      "tagId": 1036,
      "tag_name": "명화감상",
      "bookmarked": 6,
      "count": 18,
      "grade": 3,
      "change": 0
    },
    {
      "tagId": 1037,
      "tag_name": "캠핑장비",
      "bookmarked": 13,
      "count": 30,
      "grade": 6,
      "change": 5
    },
    {
      "tagId": 1038,
      "tag_name": "실험",
      "bookmarked": 14,
      "count": 26,
      "grade": 5,
      "change": 2
    },
    {
      "tagId": 1039,
      "tag_name": "일러스트",
      "bookmarked": 10,
      "count": 22,
      "grade": 4,
      "change": 1
    },
    {
      "tagId": 1040,
      "tag_name": "요가",
      "bookmarked": 19,
      "count": 41,
      "grade": 9,
      "change": 6
    },
    {
      "tagId": 1029,
      "tag_name": "화장품사용후기",
      "bookmarked": 13,
      "count": 25,
      "grade": 5,
      "change": 3
    },
    {
      "tagId": 1030,
      "tag_name": "영어단어암기",
      "bookmarked": 20,
      "count": 42,
      "grade": 9,
      "change": 5
    },
    {
      "tagId": 10101,
      "tag_name": "서울",
      "bookmarked": 2,
      "count": 20,
      "grade": 7,
      "change": 5
    },
    {
      "tagId": 1002,
      "tag_name": "코딩",
      "bookmarked": 20,
      "count": 38,
      "grade": 8,
      "change": -3
    },
    {
      "tagId": 1003,
      "tag_name": "보드게임",
      "bookmarked": 9,
      "count": 25,
      "grade": 5,
      "change": 2
    },
    {
      "tagId": 1004,
      "tag_name": "전자레인지",
      "bookmarked": 5,
      "count": 15,
      "grade": 3,
      "change": 1
    },
    {
      "tagId": 1005,
      "tag_name": "수학",
      "bookmarked": 18,
      "count": 45,
      "grade": 9,
      "change": 4
    },
    {
      "tagId": 1006,
      "tag_name": "회화",
      "bookmarked": 22,
      "count": 50,
      "grade": 10,
      "change": -2
    },
    {
      "tagId": 1007,
      "tag_name": "화장품리뷰",
      "bookmarked": 14,
      "count": 30,
      "grade": 6,
      "change": 3
    },
    {
      "tagId": 1008,
      "tag_name": "공모전정보",
      "bookmarked": 7,
      "count": 20,
      "grade": 4,
      "change": 0
    },
    {
      "tagId": 1009,
      "tag_name": "벌레퇴치",
      "bookmarked": 10,
      "count": 18,
      "grade": 5,
      "change": -1
    },
    {
      "tagId": 1010,
      "tag_name": "정리",
      "bookmarked": 8,
      "count": 16,
      "grade": 3,
      "change": 2
    },
    {
      "tagId": 1011,
      "tag_name": "세제",
      "bookmarked": 15,
      "count": 28,
      "grade": 7,
      "change": 1
    },
    {
      "tagId": 1012,
      "tag_name": "대학생활",
      "bookmarked": 11,
      "count": 32,
      "grade": 8,
      "change": -3
    },
    {
      "tagId": 1013,
      "tag_name": "코딩공부",
      "bookmarked": 19,
      "count": 42,
      "grade": 9,
      "change": 4
    },
    {
      "tagId": 1014,
      "tag_name": "모임",
      "bookmarked": 6,
      "count": 22,
      "grade": 4,
      "change": 0
    },
    {
      "tagId": 1015,
      "tag_name": "전자레인지요리",
      "bookmarked": 4,
      "count": 14,
      "grade": 2,
      "change": 1
    },
    {
      "tagId": 1016,
      "tag_name": "수학문제풀이",
      "bookmarked": 17,
      "count": 39,
      "grade": 8,
      "change": 3
    },
    {
      "tagId": 1017,
      "tag_name": "영어듣기연습",
      "bookmarked": 21,
      "count": 48,
      "grade": 10,
      "change": -1
    },
    {
      "tagId": 1018,
      "tag_name": "화장품추천",
      "bookmarked": 13,
      "count": 29,
      "grade": 6,
      "change": 2
    },
    {
      "tagId": 1019,
      "tag_name": "공모전팁",
      "bookmarked": 9,
      "count": 19,
      "grade": 5,
      "change": 0
    },
    {
      "tagId": 1020,
      "tag_name": "벌레방지",
      "bookmarked": 12,
      "count": 24,
      "grade": 6,
      "change": -2
    }]
    }
        ''')),
    ),
];

/// 검색어별 화면구성
List<TempSearchData> tempSearchScreenData = [
    TempSearchData(
        term: '검색어',
        searchCommunityData: SearchTagData.fromJson(jsonDecode('''
    {
      "tags": [
        {
          "tagId": 5500584,
          "tag_name": "검색어정보공유",
          "bookmarked": 2260098,
          "count": 6054472,
          "grade": 8
        },
        {
          "tagId": 6483579,
          "tag_name": "검색어꿀팁공유",
          "bookmarked": 1907232,
          "count": 1456826,
          "grade": 10
        },
        {
          "tagId": 7951011,
          "tag_name": "생활정보",
          "bookmarked": 3614974,
          "count": 4657548,
          "grade": 11
        },
        {
          "tagId": 2488542,
          "tag_name": "유용한팁",
          "bookmarked": 3775929,
          "count": 640068,
          "grade": 7
        },
        {
          "tagId": 7615117,
          "tag_name": "건강정보",
          "bookmarked": 1751088,
          "count": 4422214,
          "grade": 6
        },
        {
          "tagId": 714703,
          "tag_name": "노하우",
          "bookmarked": 312407,
          "count": 5254348,
          "grade": 9
        },
        {
          "tagId": 215707,
          "tag_name": "아이디어",
          "bookmarked": 3795284,
          "count": 5623334,
          "grade": 10
        },
        {
          "tagId": 2557334,
          "tag_name": "생활지혜",
          "bookmarked": 8934600,
          "count": 1063798,
          "grade": 11
        },
        {
          "tagId": 5596651,
          "tag_name": "DIY정보",
          "bookmarked": 3209647,
          "count": 2237288,
          "grade": 9
        },
        {
          "tagId": 4223100,
          "tag_name": "유익한정보",
          "bookmarked": 2794107,
          "count": 7819248,
          "grade": 7
        },
        {
          "tagId": 7080658,
          "tag_name": "공유합니다",
          "bookmarked": 6767962,
          "count": 3488927,
          "grade": 8
        },
        {
          "tagId": 9519070,
          "tag_name": "재테크팁",
          "bookmarked": 5339900,
          "count": 1616924,
          "grade": 7
        },
        {
          "tagId": 4857952,
          "tag_name": "경제정보",
          "bookmarked": 6674531,
          "count": 1682886,
          "grade": 6
        },
        {
          "tagId": 2348171,
          "tag_name": "신상정보",
          "bookmarked": 8472470,
          "count": 6828528,
          "grade": 8
        },
        {
          "tagId": 5580618,
          "tag_name": "최신트렌드",
          "bookmarked": 5484617,
          "count": 7964309,
          "grade": 6
        },
        {
          "tagId": 2833521,
          "tag_name": "취미생활",
          "bookmarked": 7578623,
          "count": 2622905,
          "grade": 7
        },
        {
          "tagId": 2461206,
          "tag_name": "자기계발",
          "bookmarked": 3739094,
          "count": 7101079,
          "grade": 10
        },
        {
          "tagId": 7258920,
          "tag_name": "공유팁",
          "bookmarked": 7157341,
          "count": 6396799,
          "grade": 8
        },
        {
          "tagId": 1485554,
          "tag_name": "효율적인삶",
          "bookmarked": 5595206,
          "count": 9024936,
          "grade": 11
        },
        {
          "tagId": 624399,
          "tag_name": "성공팁",
          "bookmarked": 831223,
          "count": 2078251,
          "grade": 7
        },
        {
          "tagId": 2213407,
          "tag_name": "일상공유",
          "bookmarked": 6522985,
          "count": 6053842,
          "grade": 11
        },
        {
          "tagId": 9936855,
          "tag_name": "정보나눔",
          "bookmarked": 2015806,
          "count": 9322703,
          "grade": 8
        },
        {
          "tagId": 487626,
          "tag_name": "자기관리",
          "bookmarked": 5152772,
          "count": 9895017,
          "grade": 9
        },
        {
          "tagId": 6790516,
          "tag_name": "꿀정보",
          "bookmarked": 7201143,
          "count": 6108552,
          "grade": 11
        },
        {
          "tagId": 3268746,
          "tag_name": "여행팁",
          "bookmarked": 592881,
          "count": 9947549,
          "grade": 11
        },
        {
          "tagId": 9652110,
          "tag_name": "핫아이템",
          "bookmarked": 5440574,
          "count": 8987255,
          "grade": 7
        },
        {
          "tagId": 7724125,
          "tag_name": "공부비법",
          "bookmarked": 8407184,
          "count": 2061683,
          "grade": 9
        },
        {
          "tagId": 5180552,
          "tag_name": "취업정보",
          "bookmarked": 7699420,
          "count": 2133848,
          "grade": 8
        },
        {
          "tagId": 9375815,
          "tag_name": "창업정보",
          "bookmarked": 3901958,
          "count": 317588,
          "grade": 11
        },
        {
          "tagId": 5882355,
          "tag_name": "트렌드",
          "bookmarked": 2433930,
          "count": 6811400,
          "grade": 7
        },
        {
          "tagId": 7885176,
          "tag_name": "생활꿀팁",
          "bookmarked": 238735,
          "count": 7528672,
          "grade": 11
        },
        {
          "tagId": 5114369,
          "tag_name": "새로운정보",
          "bookmarked": 5381543,
          "count": 7131875,
          "grade": 10
        },
        {
          "tagId": 638358,
          "tag_name": "유익한팁",
          "bookmarked": 3460731,
          "count": 9629388,
          "grade": 7
        },
        {
          "tagId": 8677574,
          "tag_name": "시간관리",
          "bookmarked": 4262404,
          "count": 3598322,
          "grade": 10
        },
        {
          "tagId": 8160234,
          "tag_name": "성공습관",
          "bookmarked": 2253146,
          "count": 4444424,
          "grade": 6
        },
        {
          "tagId": 1423944,
          "tag_name": "인생팁",
          "bookmarked": 1839150,
          "count": 4578354,
          "grade": 11
        },
        {
          "tagId": 5908906,
          "tag_name": "효율성향상",
          "bookmarked": 8426309,
          "count": 3904768,
          "grade": 6
        },
        {
          "tagId": 4867188,
          "tag_name": "건강관리",
          "bookmarked": 9638543,
          "count": 9545662,
          "grade": 8
        },
        {
          "tagId": 9200925,
          "tag_name": "팁공유",
          "bookmarked": 7717298,
          "count": 9629416,
          "grade": 8
        },
        {
          "tagId": 9059860,
          "tag_name": "업데이트정보",
          "bookmarked": 4680554,
          "count": 5432244,
          "grade": 6
        }
      ]
    }
    ''')),
        searchTagData: SearchTagData.fromJson(jsonDecode('''
    {
      "tags": [
        {
          "tagId": 5500584,
          "tag_name": "검색어정보공유",
          "bookmarked": 2260098,
          "count": 6054472,
          "grade": 8
        },
        {
          "tagId": 6483579,
          "tag_name": "검색어꿀팁공유",
          "bookmarked": 1907232,
          "count": 1456826,
          "grade": 10
        },
        {
          "tagId": 7951011,
          "tag_name": "검색어생활정보",
          "bookmarked": 3614974,
          "count": 4657548,
          "grade": 11
        },
        {
          "tagId": 2488542,
          "tag_name": "유용한팁",
          "bookmarked": 3775929,
          "count": 640068,
          "grade": 7
        },
        {
          "tagId": 7615117,
          "tag_name": "건강정보",
          "bookmarked": 1751088,
          "count": 4422214,
          "grade": 6
        },
        {
          "tagId": 714703,
          "tag_name": "노하우",
          "bookmarked": 312407,
          "count": 5254348,
          "grade": 9
        },
        {
          "tagId": 215707,
          "tag_name": "아이디어",
          "bookmarked": 3795284,
          "count": 5623334,
          "grade": 10
        },
        {
          "tagId": 2557334,
          "tag_name": "생활지혜",
          "bookmarked": 8934600,
          "count": 1063798,
          "grade": 11
        },
        {
          "tagId": 5596651,
          "tag_name": "DIY정보",
          "bookmarked": 3209647,
          "count": 2237288,
          "grade": 9
        },
        {
          "tagId": 4223100,
          "tag_name": "유익한정보",
          "bookmarked": 2794107,
          "count": 7819248,
          "grade": 7
        },
        {
          "tagId": 7080658,
          "tag_name": "공유합니다",
          "bookmarked": 6767962,
          "count": 3488927,
          "grade": 8
        },
        {
          "tagId": 9519070,
          "tag_name": "재테크팁",
          "bookmarked": 5339900,
          "count": 1616924,
          "grade": 7
        },
        {
          "tagId": 4857952,
          "tag_name": "경제정보",
          "bookmarked": 6674531,
          "count": 1682886,
          "grade": 6
        },
        {
          "tagId": 2348171,
          "tag_name": "신상정보",
          "bookmarked": 8472470,
          "count": 6828528,
          "grade": 8
        },
        {
          "tagId": 5580618,
          "tag_name": "최신트렌드",
          "bookmarked": 5484617,
          "count": 7964309,
          "grade": 6
        },
        {
          "tagId": 2833521,
          "tag_name": "취미생활",
          "bookmarked": 7578623,
          "count": 2622905,
          "grade": 7
        },
        {
          "tagId": 2461206,
          "tag_name": "자기계발",
          "bookmarked": 3739094,
          "count": 7101079,
          "grade": 10
        },
        {
          "tagId": 7258920,
          "tag_name": "공유팁",
          "bookmarked": 7157341,
          "count": 6396799,
          "grade": 8
        },
        {
          "tagId": 1485554,
          "tag_name": "효율적인삶",
          "bookmarked": 5595206,
          "count": 9024936,
          "grade": 11
        },
        {
          "tagId": 624399,
          "tag_name": "성공팁",
          "bookmarked": 831223,
          "count": 2078251,
          "grade": 7
        },
        {
          "tagId": 2213407,
          "tag_name": "일상공유",
          "bookmarked": 6522985,
          "count": 6053842,
          "grade": 11
        },
        {
          "tagId": 9936855,
          "tag_name": "정보나눔",
          "bookmarked": 2015806,
          "count": 9322703,
          "grade": 8
        },
        {
          "tagId": 487626,
          "tag_name": "자기관리",
          "bookmarked": 5152772,
          "count": 9895017,
          "grade": 9
        },
        {
          "tagId": 6790516,
          "tag_name": "꿀정보",
          "bookmarked": 7201143,
          "count": 6108552,
          "grade": 11
        },
        {
          "tagId": 3268746,
          "tag_name": "여행팁",
          "bookmarked": 592881,
          "count": 9947549,
          "grade": 11
        },
        {
          "tagId": 9652110,
          "tag_name": "핫아이템",
          "bookmarked": 5440574,
          "count": 8987255,
          "grade": 7
        },
        {
          "tagId": 7724125,
          "tag_name": "공부비법",
          "bookmarked": 8407184,
          "count": 2061683,
          "grade": 9
        },
        {
          "tagId": 5180552,
          "tag_name": "취업정보",
          "bookmarked": 7699420,
          "count": 2133848,
          "grade": 8
        },
        {
          "tagId": 9375815,
          "tag_name": "창업정보",
          "bookmarked": 3901958,
          "count": 317588,
          "grade": 11
        },
        {
          "tagId": 5882355,
          "tag_name": "트렌드",
          "bookmarked": 2433930,
          "count": 6811400,
          "grade": 7
        },
        {
          "tagId": 7885176,
          "tag_name": "생활꿀팁",
          "bookmarked": 238735,
          "count": 7528672,
          "grade": 11
        },
        {
          "tagId": 5114369,
          "tag_name": "새로운정보",
          "bookmarked": 5381543,
          "count": 7131875,
          "grade": 10
        },
        {
          "tagId": 638358,
          "tag_name": "유익한팁",
          "bookmarked": 3460731,
          "count": 9629388,
          "grade": 7
        },
        {
          "tagId": 8677574,
          "tag_name": "시간관리",
          "bookmarked": 4262404,
          "count": 3598322,
          "grade": 10
        },
        {
          "tagId": 8160234,
          "tag_name": "성공습관",
          "bookmarked": 2253146,
          "count": 4444424,
          "grade": 6
        },
        {
          "tagId": 1423944,
          "tag_name": "인생팁",
          "bookmarked": 1839150,
          "count": 4578354,
          "grade": 11
        },
        {
          "tagId": 5908906,
          "tag_name": "효율성향상",
          "bookmarked": 8426309,
          "count": 3904768,
          "grade": 6
        },
        {
          "tagId": 4867188,
          "tag_name": "건강관리",
          "bookmarked": 9638543,
          "count": 9545662,
          "grade": 8
        },
        {
          "tagId": 9200925,
          "tag_name": "팁공유",
          "bookmarked": 7717298,
          "count": 9629416,
          "grade": 8
        },
        {
          "tagId": 9059860,
          "tag_name": "업데이트정보",
          "bookmarked": 4680554,
          "count": 5432244,
          "grade": 6
        }
      ]
    }
    ''')),
        searchPostData: PostData.fromJson(jsonDecode('''
    {
      "posts": [
        {
          "post_id": 87291,
          "title": "오늘의 날씨는?",
          "summary": "검색어비가 올 것 같아요. 우산 챙기세요.",
          "comments": 182,
          "like": 521,
          "viewed": 899,
          "createdAt": "2021-04-25T12:34:00.000Z"
        },
        {
          "post_id": 97852,
          "title": "새로운 취미 추천",
          "summary": "검색어요즘 뜨는 취미는 무엇일까요?",
          "comments": 249,
          "like": 783,
          "viewed": 1374,
          "createdAt": "2022-02-15T08:22:00.000Z"
        },
        {
          "post_id": 11237,
          "title": "아침 운동의 중요성",
          "summary": "검색어매일 아침 운동하는 습관!",
          "comments": 321,
          "like": 456,
          "viewed": 1023,
          "createdAt": "2020-09-12T07:40:00.000Z"
        },
        {
          "post_id": 56389,
          "title": "재테크 꿀팁 공유",
          "summary": "생활정보소액 투자로 시작하는 재테크",
          "comments": 405,
          "like": 642,
          "viewed": 1845,
          "createdAt": "2023-06-19T15:15:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 23876,
          "title": "여행 준비물 리스트",
          "summary": "꼭 챙겨야 할 필수 아이템들",
          "comments": 92,
          "like": 317,
          "viewed": 744,
          "createdAt": "2021-11-30T09:00:00.000Z"
        },
        {
          "post_id": 46378,
          "title": "추천 영화 리스트",
          "summary": "주말에 보기 좋은 영화들",
          "comments": 533,
          "like": 910,
          "viewed": 2458,
          "createdAt": "2019-07-18T14:10:00.000Z"
        },
        {
          "post_id": 91234,
          "title": "책 읽기의 장점",
          "summary": "매일 책 읽기의 중요성을 알아봅시다.",
          "comments": 67,
          "like": 155,
          "viewed": 481,
          "createdAt": "2020-10-10T18:24:00.000Z"
        },
        {
          "post_id": 66728,
          "title": "반려동물 관리 방법",
          "summary": "강아지 털 관리 팁",
          "comments": 187,
          "like": 259,
          "viewed": 891,
          "createdAt": "2021-08-22T04:05:00.000Z"
        },
        {
          "post_id": 57893,
          "title": "헬스장 추천",
          "summary": "어디 헬스장이 좋은가요?",
          "comments": 200,
          "like": 378,
          "viewed": 1298,
          "createdAt": "2022-01-02T11:45:00.000Z"
        },
        {
          "post_id": 34892,
          "title": "IT 트렌드 분석",
          "summary": "올해 뜨는 IT 기술은?",
          "comments": 450,
          "like": 821,
          "viewed": 2114,
          "createdAt": "2020-02-24T16:18:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 89347,
          "title": "최신 가전제품",
          "summary": "최신 스마트 가전 소개합니다.",
          "comments": 134,
          "like": 452,
          "viewed": 1203,
          "createdAt": "2023-05-14T21:50:00.000Z"
        },
        {
          "post_id": 23901,
          "title": "등산 코스 추천",
          "summary": "가을에 가기 좋은 산",
          "comments": 98,
          "like": 245,
          "viewed": 621,
          "createdAt": "2022-09-21T05:11:00.000Z"
        },
        {
          "post_id": 70483,
          "title": "홈 카페 인테리어",
          "summary": "집에서 즐기는 홈 카페 꾸미기",
          "comments": 301,
          "like": 502,
          "viewed": 1501,
          "createdAt": "2021-03-10T14:55:00.000Z"
        },
        {
          "post_id": 53692,
          "title": "내일의 주식 전망",
          "summary": "주식 시장 분석과 내일의 전망",
          "comments": 775,
          "like": 923,
          "viewed": 3095,
          "createdAt": "2023-02-28T08:40:00.000Z"
        },
        {
          "post_id": 13290,
          "title": "다이어트 식단",
          "summary": "건강한 식단으로 체중 감량하기",
          "comments": 354,
          "like": 620,
          "viewed": 1450,
          "createdAt": "2020-06-17T07:30:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 49723,
          "title": "쇼핑몰 추천",
          "summary": "가성비 좋은 온라인 쇼핑몰 추천",
          "comments": 156,
          "like": 399,
          "viewed": 1084,
          "createdAt": "2019-12-05T03:17:00.000Z"
        },
        {
          "post_id": 89014,
          "title": "내가 사랑하는 음악",
          "summary": "요즘 듣고 있는 음악 추천",
          "comments": 66,
          "like": 289,
          "viewed": 672,
          "createdAt": "2021-07-22T02:02:00.000Z"
        },
        {
          "post_id": 78512,
          "title": "명언 모음집",
          "summary": "삶에 도움이 되는 명언들",
          "comments": 402,
          "like": 703,
          "viewed": 1822,
          "createdAt": "2020-11-12T09:50:00.000Z"
        },
        {
          "post_id": 58329,
          "title": "헬시푸드 레시피",
          "summary": "간단하고 건강한 요리법",
          "comments": 285,
          "like": 563,
          "viewed": 1307,
          "createdAt": "2023-03-23T13:07:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 29387,
          "title": "여행 후기 공유",
          "summary": "최근 다녀온 여행 후기를 남겨요.",
          "comments": 141,
          "like": 329,
          "viewed": 889,
          "createdAt": "2022-05-06T12:14:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 97245,
          "title": "독서 습관 들이기",
          "summary": "하루 10분 독서로 시작하기",
          "comments": 158,
          "like": 487,
          "viewed": 1249,
          "createdAt": "2021-10-18T19:30:00.000Z"
        },
        {
          "post_id": 40982,
          "title": "간단한 운동법",
          "summary": "5분 만에 하는 스트레칭",
          "comments": 72,
          "like": 205,
          "viewed": 654,
          "createdAt": "2023-08-07T17:25:00.000Z"
        },
        {
          "post_id": 89120,
          "title": "요리 초보의 도전",
          "summary": "처음 해본 파스타 요리!",
          "comments": 186,
          "like": 423,
          "viewed": 1140,
          "createdAt": "2019-03-13T05:12:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 67653,
          "title": "매일 아침 루틴",
          "summary": "성공적인 아침 루틴 만들기",
          "comments": 321,
          "like": 612,
          "viewed": 1504,
          "createdAt": "2020-07-29T10:44:00.000Z"
        },
        {
          "post_id": 13987,
          "title": "온라인 클래스 추천",
          "summary": "취미를 배울 수 있는 사이트",
          "comments": 312,
          "like": 581,
          "viewed": 1319,
          "createdAt": "2022-11-02T03:25:00.000Z"
        },
        {
          "post_id": 91208,
          "title": "반려동물 입양",
          "summary": "입양 전 알아야 할 사항들",
          "comments": 128,
          "like": 394,
          "viewed": 1012,
          "createdAt": "2021-06-09T06:20:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 25781,
          "title": "커피 원두 추천",
          "summary": "향과 맛이 좋은 원두 추천",
          "comments": 85,
          "like": 221,
          "viewed": 754,
          "createdAt": "2020-01-15T18:35:00.000Z"
        },
        {
          "post_id": 10987,
          "title": "게임 추천",
          "summary": "요즘 핫한 게임은?",
          "comments": 411,
          "like": 759,
          "viewed": 2023,
          "createdAt": "2019-09-29T13:56:00.000Z"
        },
        {
          "post_id": 78012,
          "title": "자동차 관리 팁",
          "summary": "겨울철 자동차 관리 요령",
          "comments": 142,
          "like": 372,
          "viewed": 936,
          "createdAt": "2022-12-11T20:19:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 47982,
          "title": "집에서 하는 간단 요리",
          "summary": "쉬운 재료로 만드는 요리",
          "comments": 98,
          "like": 310,
          "viewed": 890,
          "createdAt": "2023-07-03T04:12:00.000Z"
        },
        {
          "post_id": 68371,
          "title": "책 추천",
          "summary": "마음의 양식을 채우는 도서",
          "comments": 183,
          "like": 533,
          "viewed": 1211,
          "createdAt": "2021-05-28T09:18:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 29382,
          "title": "공부 자극 글",
          "summary": "열심히 공부하는 법을 배워보세요.",
          "comments": 257,
          "like": 687,
          "viewed": 1589,
          "createdAt": "2022-08-10T14:28:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 47281,
          "title": "의류 쇼핑몰 추천",
          "summary": "저렴하고 트렌디한 의류 추천",
          "comments": 198,
          "like": 489,
          "viewed": 1187,
          "createdAt": "2020-05-05T22:10:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 98237,
          "title": "취미 만들기",
          "summary": "취미로 시작하는 나만의 프로젝트",
          "comments": 223,
          "like": 431,
          "viewed": 1205,
          "createdAt": "2019-01-17T10:55:00.000Z"
        },
        {
          "post_id": 13567,
          "title": "알뜰 쇼핑 팁",
          "summary": "저렴하게 쇼핑하는 방법",
          "comments": 302,
          "like": 675,
          "viewed": 1432,
          "createdAt": "2021-02-13T08:22:00.000Z"
        },
        {
          "post_id": 62589,
          "title": "겨울 스포츠 즐기기",
          "summary": "스키, 스노우보드 즐기는 팁",
          "comments": 109,
          "like": 312,
          "viewed": 819,
          "createdAt": "2022-12-23T05:47:00.000Z"
        },
        {
          "post_id": 32901,
          "title": "맛집 추천",
          "summary": "이번 주말 가볼만한 맛집",
          "comments": 457,
          "like": 801,
          "viewed": 2301,
          "createdAt": "2020-11-27T15:09:00.000Z",
          "imageURL": "https://picsum.photos/200"
        }
      ]
    }
    ''')),
        searchUserData: SearchUserData.fromJson(jsonDecode('''
    {
      "users": [
        {
          "user_id": 67601,
          "nickname": "김민수검색어",
          "comments": 1024,
          "posts": 512,
          "updatedAt": "2023-01-10T14:00:00.000Z"
        },
        {
          "user_id": 67602,
          "nickname": "이영희검색어",
          "comments": 2048,
          "posts": 1024,
          "updatedAt": "2023-01-15T08:30:00.000Z"
        },
        {
          "user_id": 67603,
          "nickname": "박준호검색어",
          "comments": 3072,
          "posts": 2048,
          "updatedAt": "2023-01-20T11:15:00.000Z"
        },
        {
          "user_id": 67604,
          "nickname": "최지민",
          "comments": 1500,
          "posts": 800,
          "updatedAt": "2023-01-25T09:00:00.000Z"
        },
        {
          "user_id": 67605,
          "nickname": "정수빈",
          "comments": 800,
          "posts": 1500,
          "updatedAt": "2023-01-30T15:30:00.000Z"
        },
        {
          "user_id": 67606,
          "nickname": "강서연",
          "comments": 2400,
          "posts": 1900,
          "updatedAt": "2023-02-05T13:20:00.000Z"
        },
        {
          "user_id": 67607,
          "nickname": "임하준",
          "comments": 3200,
          "posts": 2500,
          "updatedAt": "2023-02-10T16:45:00.000Z"
        },
        {
          "user_id": 67608,
          "nickname": "오세훈",
          "comments": 1280,
          "posts": 640,
          "updatedAt": "2023-02-15T12:00:00.000Z"
        },
        {
          "user_id": 67609,
          "nickname": "배수빈",
          "comments": 1900,
          "posts": 860,
          "updatedAt": "2023-02-20T09:30:00.000Z"
        },
        {
          "user_id": 67610,
          "nickname": "윤찬미",
          "comments": 2200,
          "posts": 3000,
          "updatedAt": "2023-02-25T11:10:00.000Z"
        },
        {
          "user_id": 67611,
          "nickname": "서지혜",
          "comments": 1750,
          "posts": 1300,
          "updatedAt": "2023-03-02T14:50:00.000Z"
        },
        {
          "user_id": 67612,
          "nickname": "진호",
          "comments": 400,
          "posts": 1000,
          "updatedAt": "2023-03-07T08:00:00.000Z"
        },
        {
          "user_id": 67613,
          "nickname": "장유진",
          "comments": 3100,
          "posts": 2700,
          "updatedAt": "2023-03-12T18:00:00.000Z"
        },
        {
          "user_id": 67614,
          "nickname": "한상진",
          "comments": 2600,
          "posts": 2100,
          "updatedAt": "2023-03-17T09:45:00.000Z"
        },
        {
          "user_id": 67615,
          "nickname": "송하늘",
          "comments": 900,
          "posts": 750,
          "updatedAt": "2023-03-22T12:20:00.000Z"
        },
        {
          "user_id": 67616,
          "nickname": "이승민",
          "comments": 1500,
          "posts": 1900,
          "updatedAt": "2023-03-27T13:15:00.000Z"
        },
        {
          "user_id": 67617,
          "nickname": "안현수",
          "comments": 1850,
          "posts": 900,
          "updatedAt": "2023-04-01T10:40:00.000Z"
        },
        {
          "user_id": 67618,
          "nickname": "신유정",
          "comments": 2900,
          "posts": 1500,
          "updatedAt": "2023-04-06T11:05:00.000Z"
        },
        {
          "user_id": 67619,
          "nickname": "문주희",
          "comments": 3200,
          "posts": 2000,
          "updatedAt": "2023-04-11T15:30:00.000Z"
        },
        {
          "user_id": 67620,
          "nickname": "허정훈",
          "comments": 1800,
          "posts": 2400,
          "updatedAt": "2023-04-16T16:45:00.000Z"
        },
        {
          "user_id": 67621,
          "nickname": "이재현",
          "comments": 1500,
          "posts": 800,
          "updatedAt": "2023-04-21T09:50:00.000Z"
        },
        {
          "user_id": 67622,
          "nickname": "양지수",
          "comments": 2600,
          "posts": 1400,
          "updatedAt": "2023-04-26T12:30:00.000Z"
        },
        {
          "user_id": 67623,
          "nickname": "차유나",
          "comments": 3000,
          "posts": 1800,
          "updatedAt": "2023-05-01T10:00:00.000Z"
        },
        {
          "user_id": 67624,
          "nickname": "조민호",
          "comments": 1300,
          "posts": 1600,
          "updatedAt": "2023-05-06T17:15:00.000Z"
        },
        {
          "user_id": 67625,
          "nickname": "원서연",
          "comments": 2400,
          "posts": 2200,
          "updatedAt": "2023-05-11T14:30:00.000Z"
        },
        {
          "user_id": 67626,
          "nickname": "곽상우",
          "comments": 2100,
          "posts": 1950,
          "updatedAt": "2023-05-16T13:00:00.000Z"
        },
        {
          "user_id": 67627,
          "nickname": "유하은",
          "comments": 800,
          "posts": 1500,
          "updatedAt": "2023-05-21T12:20:00.000Z"
        },
        {
          "user_id": 67628,
          "nickname": "홍민서",
          "comments": 2900,
          "posts": 2700,
          "updatedAt": "2023-05-26T11:00:00.000Z"
        },
        {
          "user_id": 67629,
          "nickname": "한지민",
          "comments": 1700,
          "posts": 1100,
          "updatedAt": "2023-05-31T10:10:00.000Z"
        },
        {
          "user_id": 67630,
          "nickname": "이도현",
          "comments": 2200,
          "posts": 1300,
          "updatedAt": "2023-06-05T14:40:00.000Z"
        },
        {
          "user_id": 67631,
          "nickname": "김하나",
          "comments": 3600,
          "posts": 3200,
          "updatedAt": "2023-06-10T15:00:00.000Z"
        },
        {
          "user_id": 67632,
          "nickname": "윤서영",
          "comments": 2800,
          "posts": 2100,
          "updatedAt": "2023-06-15T17:30:00.000Z"
        },
        {
          "user_id": 67633,
          "nickname": "주원",
          "comments": 1500,
          "posts": 500,
          "updatedAt": "2023-06-20T08:30:00.000Z"
        },
        {
          "user_id": 67634,
          "nickname": "차진우",
          "comments": 1600,
          "posts": 1000,
          "updatedAt": "2023-06-25T09:00:00.000Z"
        },
        {
          "user_id": 67635,
          "nickname": "배현우",
          "comments": 2200,
          "posts": 1500,
          "updatedAt": "2023-06-30T12:45:00.000Z"
        },
        {
          "user_id": 67636,
          "nickname": "정민",
          "comments": 1400,
          "posts": 700,
          "updatedAt": "2023-07-05T11:15:00.000Z"
        },
        {
          "user_id": 67637,
          "nickname": "이재아",
          "comments": 3000,
          "posts": 1800,
          "updatedAt": "2023-07-10T09:00:00.000Z"
        },
        {
          "user_id": 67638,
          "nickname": "남기훈",
          "comments": 3200,
          "posts": 2100,
          "updatedAt": "2023-07-15T14:00:00.000Z"
        },
        {
          "user_id": 67639,
          "nickname": "정희원",
          "comments": 2800,
          "posts": 2500,
          "updatedAt": "2023-07-20T08:30:00.000Z"
        },
        {
          "user_id": 67640,
          "nickname": "오재현",
          "comments": 1700,
          "posts": 1300,
          "updatedAt": "2023-07-25T12:15:00.000Z"
        },
        {
          "user_id": 67641,
          "nickname": "서현",
          "comments": 1900,
          "posts": 800,
          "updatedAt": "2023-07-30T10:00:00.000Z"
        },
        {
          "user_id": 67642,
          "nickname": "추민재",
          "comments": 1500,
          "posts": 900,
          "updatedAt": "2023-08-04T14:30:00.000Z"
        },
        {
          "user_id": 67643,
          "nickname": "윤다솜",
          "comments": 1200,
          "posts": 1100,
          "updatedAt": "2023-08-09T15:45:00.000Z"
        },
        {
          "user_id": 67644,
          "nickname": "고정훈",
          "comments": 800,
          "posts": 600,
          "updatedAt": "2023-08-14T12:00:00.000Z"
        },
        {
          "user_id": 67645,
          "nickname": "이서준",
          "comments": 2100,
          "posts": 1200,
          "updatedAt": "2023-08-19T09:20:00.000Z"
        },
        {
          "user_id": 67646,
          "nickname": "변영수",
          "comments": 1300,
          "posts": 950,
          "updatedAt": "2023-08-24T10:00:00.000Z"
        },
        {
          "user_id": 67647,
          "nickname": "장세훈",
          "comments": 2400,
          "posts": 2000,
          "updatedAt": "2023-08-29T14:00:00.000Z"
        },
        {
          "user_id": 67648,
          "nickname": "서진",
          "comments": 1900,
          "posts": 850,
          "updatedAt": "2023-09-03T16:30:00.000Z"
        },
        {
          "user_id": 67649,
          "nickname": "배가영",
          "comments": 3000,
          "posts": 1800,
          "updatedAt": "2023-09-08T12:00:00.000Z"
        },
        {
          "user_id": 67650,
          "nickname": "김상호",
          "comments": 1800,
          "posts": 1500,
          "updatedAt": "2023-09-13T11:00:00.000Z"
        }
      ]
    }
    ''')),
    ),
];

/// 메인 - 마인드맵
List<OrbitData> mindmapData = [
  OrbitData.fromJson(jsonDecode('''
  {
  "uId": 1231213,
  "orbit": [
    {
      "primary": {
        "tId": 10000001,
        "grade": 10,
        "tagName": "아이폰"
      },
      "satellites": [
        {
          "tId": 10000002,
          "grade": 5,
          "tagName": "13pro중고"
        },
        {
          "tId": 10000003,
          "grade": 7,
          "tagName": "애플케어"
        },
        {
          "tId": 10000004,
          "grade": 2,
          "tagName": "애플워치"
        },
        {
          "tId": 10000005,
          "grade": 8,
          "tagName": "에어팟프로2"
        }
      ]
    },
    {
      "primary": {
        "tId": 10000010,
        "grade": 4,
        "tagName": "흑백요리사"
      },
      "satellites": [
        {
          "tId": 10000011,
          "grade": 10,
          "tagName": "백종원"
        },
        {
          "tId": 10000012,
          "grade": 8,
          "tagName": "안성진"
        }
      ]
    },
    {
      "primary": {
        "tId": 10000013,
        "grade": 9,
        "tagName": "롤드컵"
      },
      "satellites": [
        {
          "tId": 10000014,
          "grade": 6,
          "tagName": "한화"
        },
        {
          "tId": 10000015,
          "grade": 7,
          "tagName": "티원"
        },
        {
          "tId": 10000016,
          "grade": 7,
          "tagName": "젠지"
        },
        {
          "tId": 10000017,
          "grade": 9,
          "tagName": "딮기"
        }
      ]
    }
  ]
}
  ''')),
  OrbitData.fromJson(jsonDecode('''
  {
  "uId": 1231213,
  "orbit": [
    {
      "primary": {
        "tId": 10000036,
        "grade": 9,
        "tagName": "넷플릭스"
      },
      "satellites": [
        {
          "tId": 10000037,
        "grade": 7,
        "tagName": "오징어게임"
        },
        {
          "tId": 10000038,
        "grade": 6,
        "tagName": "종이의집"
        },
        {
          "tId": 10000039,
        "grade": 8,
        "tagName": "킹덤"
        },
        {
          "tId": 10000040,
        "grade": 4,
        "tagName": "더글로리"
        }
      ]
    },
    {
      "primary": {
        "tId": 10000006,
        "grade": 11,
        "tagName": "손흥민"
      },
      "satellites": [
        {
          "tId": 10000007,
          "grade": 11,
          "tagName": "토트넘"
        },
        {
          "tId": 10000008,
          "grade": 1,
          "tagName": "축구"
        },
        {
          "tId": 10000009,
          "grade": 4,
          "tagName": "계약"
        }
      ]
    },
    {
      "primary": {
        "tId": 10000041,
        "grade": 11,
        "tagName": "테슬라"
      },
      "satellites": [
        {
          "tId": 10000042,
        "grade": 10,
        "tagName": "일론머스크"
        },
        {
          "tId": 10000043,
        "grade": 8,
        "tagName": "전기차"
        },
        {
          "tId": 10000044,
        "grade": 7,
        "tagName": "스페이스X"
        },
        {
          "tId": 10000045,
        "grade": 5,
        "tagName": "AI"
        }
      ]
    },
    {
      "primary": {
        "tId": 10000046,
        "grade": 8,
        "tagName": "마블"
      },
      "satellites": [
        {
          "tId": 10000047,
        "grade": 9,
        "tagName": "아이언맨"
        },
        {
          "tId": 10000048,
        "grade": 7,
        "tagName": "스파이더맨"
        },
        {
          "tId": 10000049,
        "grade": 6,
        "tagName": "어벤져스"
        },
        {
          "tId": 10000050,
        "grade": 8,
        "tagName": "블랙팬서"
        }
      ]
    },
    {
      "primary": {
        "tId": 10000051,
        "grade": 10,
        "tagName": "여행"
      },
      "satellites": [
        {
          "tId": 10000052,
        "grade": 8,
        "tagName": "유럽여행"
        },
        {
          "tId": 10000053,
        "grade": 9,
        "tagName": "배낭여행"
        },
        {
          "tId": 10000054,
        "grade": 7,
        "tagName": "세계일주"
        },
        {
          "tId": 10000055,
        "grade": 6,
        "tagName": "국내여행"
        }
      ]
    }
  ]
}
''')),
  OrbitData.fromJson(jsonDecode('''
  {
  "uId": 1231213,
  "orbit": [
    {
      "primary": {
        "tId": 11111,
        "grade": 10,
        "tagName": "문화"
      },
      "satellites": [
        {
          "tId": 10000057,
          "grade": 7,
          "tagName": "락스"
        },
        {
          "tId": 10000058,
          "grade": 6,
          "tagName": "전자제품"
        },
        {
          "tId": 10000059,
          "grade": 8,
          "tagName": "다이소"
        },
        {
          "tId": 10000060,
          "grade": 5,
          "tagName": "진드기"
        }
      ]
    },
    {
      "primary": {
        "tId": 10000061,
        "grade": 10,
        "tagName": "음악"
      },
      "satellites": [
        {
          "tId": 10000062,
          "grade": 9,
          "tagName": "악기"
        },
        {
          "tId": 10000063,
          "grade": 8,
          "tagName": "콘서트"
        },
        {
          "tId": 10000064,
          "grade": 7,
          "tagName": "뮤지컬"
        },
        {
          "tId": 10000065,
          "grade": 6,
          "tagName": "음반제작"
        }
      ]
    },
    {
      "primary": {
        "tId": 10000066,
        "grade": 9,
        "tagName": "겨울"
      },
      "satellites": [
        {
          "tId": 10000067,
          "grade": 8,
          "tagName": "날씨"
        },
        {
          "tId": 10000068,
          "grade": 4,
          "tagName": "비"
        },
        {
          "tId": 10000069,
          "grade": 6,
          "tagName": "환절기"
        },
        {
          "tId": 10000070,
          "grade": 5,
          "tagName": "손난로"
        }
      ]
    },
    {
      "primary": {
        "tId": 10000071,
        "grade": 7,
        "tagName": "운동"
      },
      "satellites": [
        {
          "tId": 10000072,
          "grade": 8,
          "tagName": "러닝"
        },
        {
          "tId": 10000073,
          "grade": 6,
          "tagName": "요가"
        },
        {
          "tId": 10000074,
          "grade": 7,
          "tagName": "크로스핏"
        },
        {
          "tId": 10000075,
          "grade": 5,
          "tagName": "수영"
        }
      ]
    }
  ]
}

  ''')),
];
/// 게시글 상세
PostDetailData fetchPostDetailScreenData(int postId) {
    // allPost 리스트에서 postId 일치하는 post의 isBookmarked를 받아오기 위함
    Post foundPost = allPost.firstWhere(
            (post) => post.postId == postId,
        orElse: () => Post(postId: postId, title: "null") // 기본값
    );
    // allComment 리스트에서 해당 postId가 일치한 comment만 필터링
    List<Comment> filteredComments = allComment.where((comment) {
        return comment.postId == postId;
    }).toList();
    if (filteredComments.isEmpty){
        return PostDetailData(post: foundPost, comments: []);
    }
    return PostDetailData(post: foundPost, comments: filteredComments);
}
void toggleIsLiked(int postId) {
    // allPost 리스트에서 postId와 일치하는 post의 인덱스를 찾음
    int postIndex = allPost.indexWhere((post) => post.postId == postId);
    if (postIndex != -1) {
        // 인덱스가 유효하면 해당 태그의 likes를 변경하고 isLiked 값을 반전시킨 새 객체로 저장
        allPost[postIndex] = allPost[postIndex].toggleIsLiked();
    }
}
PostDetailData postDetailScreenData = PostDetailData.fromJson(jsonDecode('''
    {
      "post": {
        "post_id": 982347,
        "user_id": 451927,
        "nickname": "꼬부7I",
        "title": "[iOS 18] 새로생긴 iOS 18의 기능들 요약 정리",
        "tags": [
          {
            "tagId": 3765,
            "tag_name": "Flutter",
            "grade": 1
          },
          {
            "tagId": 5432,
            "tag_name": "API연동",
            "grade": 5
          },
          {
            "tagId": 8907,
            "tag_name": "개발팁",
            "grade": 11
          }
        ],
        "content": [
          {
            "insert": {
              "image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDA5MTdfMTU0/MDAxNzI2NTE2MDg1NTk5.M_iay-1R8pS0EJ-gByASWK3uIvlzsAgwiOwe2q3Qn0kg.DwXRVt7bVLCKq-b6RdxpGVeMAMNDgvNSA5C8VC1O1eUg.JPEG/Generic-iOS-18-Feature-Real-Mock.jpg?type=w1600"
            }
          },
          {
            "insert": "\\n\\n"
          },
          {
            "insert": "iOS 18의 새로운 기능들을 정리해봤습니다.",
            "attributes": {
              "bold": true
            }
          },
          {
            "insert": "\\n\\n직접 해보면서 간단하게 "
          },
          {
            "insert": "요약정리한",
            "attributes": {
              "background": "#FFFFF59D"
            }
          },
          {
            "insert": " 것이니 참조만 해주세요~\\n\\n"
          },
          {
            "insert": {
              "image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDA5MTdfNTUg/MDAxNzI2NTA4NzY0MDU2.lemsm24MuabUk8kJLYgM0OwHd6bSMdPtoSbWAP2zyYcg.Ljivq_OtVuadsoz-PTgDUHKCgvDRUl1b1UPMmNU1MW8g.PNG/%EC%95%94%ED%98%B8_%EC%95%B1%2C_%EB%B0%B0%EC%97%B4.png?type=w1600"
            },
            "attributes": {
              "style": "width: 392.72727272727275; height: 310.176; "
            }
          },
          {
            "insert": " "
          },
          {
            "insert": "ios 18 ",
            "attributes": {
              "color": "#FF1E88E5"
            }
          },
          {
            "insert": "에서는 홈화면을 자유롭게 꾸밀 수 있습니다.\\n새로운 홈화면 꾸미기"
          },
          {
            "insert": "\\n",
            "attributes": {
              "blockquote": true
            }
          },
          {
            "insert": "앱 배열 사용자화"
          },
          {
            "insert": "\\n",
            "attributes": {
              "list": "bullet"
            }
          },
          {
            "insert": "암호앱"
          },
          {
            "insert": "\\n",
            "attributes": {
              "list": "bullet"
            }
          },
          {
            "insert": "앱 색상 변경"
          },
          {
            "insert": "\\n",
            "attributes": {
              "list": "bullet"
            }
          },
          {
            "insert": "앱과 위젯을 자유롭게 변환하기"
          },
          {
            "insert": "\\n",
            "attributes": {
              "list": "bullet"
            }
          },
          {
            "insert": "잠금화면 설정 기능 선택, 액션 버튼의 기능 다양화"
          },
          {
            "insert": "\\n",
            "attributes": {
              "indent": 1,
              "list": "bullet"
            }
          },
          {
            "insert": {
              "image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDA5MTdfMTI2/MDAxNzI2NTEwMDA3NDAy.0_rVzocXqv7x2VBYMFs1xVM_KXgGUX9R56lEf747YQMg.1uOPiLe74NdSdwFfYDk4aUkfW9owWj4x76_ui9ewsFUg.PNG/KakaoTalk_20240917_030630972.png?type=w1600"
            },
            "attributes": {
              "style": "width: 392.72727272727275; height: 299.2101818181818; "
            }
          },
          {
            "insert": "제어센터 기능의 다양함\\n설정 - 연결된 에어팟 선택 - 머리 제스처 켬\\n\\n끄덕끄덕🙂‍↕️ 도리도리🙂‍↔️로 걸려오는 전화를 수신 및 거부할 수 있습니다.\\n\\n"
          },
          {
            "insert": "블로그 출처",
            "attributes": {
              "link": "https://cafe.naver.com/appleiphone/8515120"
            }
          },
          {
            "insert": "\\n\\n"
          }
        ],
        "imageURL": "https://picsum.photos/500",
        "updatedAt": "2024-09-22T14:05:00.000Z",
        "isLiked": true,
        "like": 483
      },
      "comments": [
        {
          "comment_id": 125837,
          "user_id": 672394,
          "nickname": "CHUYA",
          "contents": "깔끔한 정리 감사합니다! \\n 제어센터는 이것저것 커스텀이 가능해진건 너무 좋은데 데이터칸이 사분할 된건 너무 불편해서 별로에요 ㅠ 이 부분까지 완벽하게 커스텀이 가능하면 참 좋을 것 같은데...",
          "likes": 102,
          "isLiked": true,
          "updatedAt": "2024-09-22T15:30:00.000Z"
        },
        {
          "comment_id": 392485,
          "user_id": 238472,
          "nickname": "FlutterFan",
          "contents": "저도 최근에 비슷한 작업을 했는데, `dio` 패키지를 사용해보니 더 편리하더라고요. 특히 파일 업로드나 에러 처리가 더 쉬웠어요!",
          "likes": 64,
          "isLiked": false,
          "updatedAt": "2024-09-22T16:10:00.000Z"
        },
        {
          "comment_id": 583749,
          "user_id": 912734,
          "nickname": "개발자준",
          "contents": "저는 상태 관리도 함께 사용해서 API 데이터 관리를 했는데, `provider` 패키지와 함께 사용하니 구조가 더 깔끔해지더라고요. 강추합니다! 저는 상태 관리도 함께 사용해서 API 데이터 관리를 했는데, `provider` 패키지와 함께 사용하니 구조가 더 깔끔해지더라고요. 강추합니다!",
          "likes": 89,
          "isLiked": true,
          "updatedAt": "2024-09-22T17:05:00.000Z"
        }
      ]
    }
    '''));
/// 트랜드 - 메인
RankData trendsMainData = RankData.fromJson(jsonDecode('''

    {
      "daily": [
    {
        "post_id": 495475,
        "title": "쿠팡파트너스와 함께하는 일상",
        "comments": 3,
        "like": 88,
        "change": 18
    },
    {
        "post_id": 80604,
        "title": "아침 루틴으로 성공을 잡는 법: 5가지 효과적인 방법",
        "comments": 1020,
        "like": 15823,
        "change": 12
    },
    {
        "post_id": 18551,
        "title": "여행의 즐거움, 꼭 기억해야 할 순간들",
        "comments": 2075,
        "like": 68954,
        "change": 3
    },
    {
        "post_id": 70710,
        "title": "효율적인 시간 관리: 7가지 필수 습관",
        "comments": 3201,
        "like": 258,
        "change": 14
    },
    {
        "post_id": 30828,
        "title": "커피에 대한 모든 것: 알아야 할 정보와 팁",
        "comments": 4260,
        "like": 11034,
        "change": 1
    },
    {
        "post_id": 40605,
        "title": "아늑한 방 만들기: 인테리어 아이디어 5선",
        "comments": 6132,
        "like": 19854,
        "change": 2
    },
    {
        "post_id": 60881,
        "title": "재미있게 운동하는 법: 초보자를 위한 간단한 가이드",
        "comments": 3890,
        "like": 45237,
        "change": -4
    },
    {
        "post_id": 9755,
        "title": "디지털 디톡스: 일주일 SNS 끊기 도전기",
        "comments": 1500,
        "like": 76320,
        "change": -2
    },
    {
        "post_id": 6669,
        "title": "건강한 식습관: 시작하기 위한 간단한 레시피",
        "comments": 6023,
        "like": 49576,
        "change": 8
    },
    {
        "post_id": 60208,
        "title": "긍정적인 사고를 기르는 법: 마음을 다스리기",
        "comments": 950,
        "like": 81245,
        "change": 15
    }
],
      "weekly": [
        {
          "post_id": 80603,
          "title": "성공적인 팀워크의 핵심: 협업을 위한 5가지 팁",
          "comments": 9892,
          "like": 31611,
          "change": 6
        },
        {
          "post_id": 938118,
          "title": "[멍청비용] 오늘, 세계여행 중 모든게 든 지갑을 잃어버렸습니다",
          "comments": 3,
          "like": 1088,
          "change": 15
        },
        {
          "post_id": 18550,
          "title": "집에서 만드는 힐링 스파: DIY 홈케어 방법",
          "comments": 1940,
          "like": 95441,
          "change": -1
        },
        {
          "post_id": 70709,
          "title": "일상 속 작은 변화로 큰 행복 찾기",
          "comments": 4967,
          "like": 149,
          "change": 18
        },
        {
          "post_id": 30827,
          "title": "일 잘하는 사람들의 공통점: 생산성 높이는 습관",
          "comments": 8451,
          "like": 12065,
          "change": -3
        },
        {
          "post_id": 40604,
          "title": "바쁜 아침에도 가능한 10분 아침 요가 루틴",
          "comments": 7243,
          "like": 24354,
          "change": 0
        },
        {
          "post_id": 60880,
          "title": "여행 사진 잘 찍는 법: 초보자를 위한 촬영 팁",
          "comments": 4920,
          "like": 55483,
          "change": -2
        },
        {
          "post_id": 9754,
          "title": "아이디어가 넘치는 사람들의 사고방식: 창의력 향상 비법",
          "comments": 2296,
          "like": 82045,
          "change": 5
        },
        {
          "post_id": 6668,
          "title": "집에서도 가능한 쉬운 운동 루틴: 초보자 가이드",
          "comments": 7811,
          "like": 60625,
          "change": 9
        },
        {
          "post_id": 60207,
          "title": "매일 실천하는 자기 계발 습관: 삶을 바꾸는 작은 행동들",
          "comments": 1427,
          "like": 72095,
          "change": 18
        }
      ]
    }
    '''));
/// 트랜드 - 커뮤니티
CommunityRankData trendsCommunityData = CommunityRankData.fromJson(jsonDecode('''
{
  "rank": [
    {
      "tagId": 4774,
      "tag_name": "추천",
      "bookmarked": 9,
      "count": 6,
      "grade": 10,
      "change": 3
    },
    {
      "tagId": 5584,
      "tag_name": "음악",
      "bookmarked": 12,
      "count": 2,
      "grade": 1,
      "change": 11
    },
    {
      "tagId": 8073,
      "tag_name": "유튜브",
      "bookmarked": 3,
      "count": 12,
      "grade": 2,
      "change": 12
    },
    {
      "tagId": 2488542,
      "tag_name": "유용한팁",
      "bookmarked": 3775929,
      "count": 354720,
      "grade": 8,
      "change": 2
    },
    {
      "tagId": 7615117,
      "tag_name": "건강정보",
      "bookmarked": 0,
      "count": 21,
      "grade": 7,
      "change": 4
    },
    {
      "tagId": 714703,
      "tag_name": "노하우",
      "bookmarked": 9,
      "count": 32,
      "grade": 6,
      "change": 5
    },
    {
      "tagId": 215707,
      "tag_name": "아이디어",
      "bookmarked": 1,
      "count": 5,
      "grade": 5,
      "change": -1
    },
    {
      "tagId": 2557334,
      "tag_name": "생활지혜",
      "bookmarked": 11,
      "count": 7,
      "grade": 4,
      "change": -5
    },
    {
      "tagId": 5596651,
      "tag_name": "DIY정보",
      "bookmarked": 123,
      "count": 74,
      "grade": 3,
      "change": 8
    },
    {
      "tagId": 4223100,
      "tag_name": "유익한정보",
      "bookmarked": 14,
      "count": 17,
      "grade": 3,
      "change": 1
    },
    {
      "tagId": 7080658,
      "tag_name": "공유합니다",
      "bookmarked": 17,
      "count": 9,
      "grade": 2,
      "change": 10
    },
    {
      "tagId": 9519070,
      "tag_name": "재테크팁",
      "bookmarked": 15,
      "count": 9,
      "grade": 4,
      "change": -3
    },
    {
      "tagId": 4857952,
      "tag_name": "경제정보",
      "bookmarked": 10,
      "count": 6,
      "grade": 6,
      "change": 10
    },
    {
      "tagId": 2348171,
      "tag_name": "신상정보",
      "bookmarked": 23,
      "count": 82,
      "grade": 7,
      "change": -4
    },
    {
      "tagId": 5580618,
      "tag_name": "최신트렌드",
      "bookmarked": 74,
      "count": 21,
      "grade": 9,
      "change": 12
    },
    {
      "tagId": 2833521,
      "tag_name": "취미생활",
      "bookmarked": 19,
      "count": 32,
      "grade": 4,
      "change": -10
    },
    {
      "tagId": 2461206,
      "tag_name": "자기계발",
      "bookmarked": 1,
      "count": 3,
      "grade": 6,
      "change": -8
    },
      {
      "tagId": 4774,
      "tag_name": "새로운주제",
      "bookmarked": 14,
      "count": 22,
      "grade": 8,
      "change": -5
    },
    {
      "tagId": 5908906,
      "tag_name": "효율성향상",
      "bookmarked": 8,
      "count": 16,
      "grade": 6,
      "change": -1
    },
    {
      "tagId": 4867188,
      "tag_name": "건강관리",
      "bookmarked": 11,
      "count": 19,
      "grade": 5,
      "change": 3
    },
    {
      "tagId": 9200925,
      "tag_name": "팁공유",
      "bookmarked": 18,
      "count": 27,
      "grade": 9,
      "change": -2
    },
    {
      "tagId": 9059860,
      "tag_name": "업데이트정보",
      "bookmarked": 6,
      "count": 14,
      "grade": 7,
      "change": 4
    },
    {
      "tagId": 2213407,
      "tag_name": "일상공유",
      "bookmarked": 6522985,
      "count": 4984301,
      "grade": 8,
      "change": -6
    },
    {
      "tagId": 9936855,
      "tag_name": "정보나눔",
      "bookmarked": 2015806,
      "count": 6548912,
      "grade": 4,
      "change": -2
    },
    {
      "tagId": 487626,
      "tag_name": "자기관리",
      "bookmarked": 5152772,
      "count": 7548129,
      "grade": 5,
      "change": 3
    },
    {
      "tagId": 6790516,
      "tag_name": "꿀정보",
      "bookmarked": 7201143,
      "count": 4501208,
      "grade": 8,
      "change": 6
    },
    {
      "tagId": 3268746,
      "tag_name": "배낭여행",
      "bookmarked": 592881,
      "count": 6523102,
      "grade": 7,
      "change": -1
    },
    {
      "tagId": 9652110,
      "tag_name": "핫아이템",
      "bookmarked": 5440574,
      "count": 7124300,
      "grade": 10,
      "change": -4
    },
    {
      "tagId": 7724125,
      "tag_name": "공부법",
      "bookmarked": 8407184,
      "count": 1794309,
      "grade": 9,
      "change": 9
    },
    {
      "tagId": 5180552,
      "tag_name": "취업",
      "bookmarked": 0,
      "count": 1459803,
      "grade": 6,
      "change": 2
    },
    {
      "tagId": 9375815,
      "tag_name": "창업정보",
      "bookmarked": 19,
      "count": 21,
      "grade": 5,
      "change": 7
    },
    {
      "tagId": 5882355,
      "tag_name": "트렌드",
      "bookmarked": 21,
      "count": 6,
      "grade": 7,
      "change": 1
    },
    {
      "tagId": 7885176,
      "tag_name": "생활",
      "bookmarked": 1,
      "count": 5,
      "grade": 3,
      "change": -2
    },
    {
      "tagId": 5114369,
      "tag_name": "새로운정보",
      "bookmarked": 4,
      "count": 9,
      "grade": 4,
      "change": -3
    },
    {
      "tagId": 638358,
      "tag_name": "유익한팁",
      "bookmarked": 20,
      "count": 17,
      "grade": 6,
      "change": 12
    },
    {
      "tagId": 8677574,
      "tag_name": "시간관리",
      "bookmarked": 57,
      "count": 21,
      "grade": 7,
      "change": 5
    },
    {
      "tagId": 8160234,
      "tag_name": "성공습관",
      "bookmarked": 15,
      "count": 23,
      "grade": 10,
      "change": -3
    },
    {
      "tagId": 1423944,
      "tag_name": "인생",
      "bookmarked": 1839150,
      "count": 2987349,
      "grade": 3,
      "change": -6
    },
    {
      "tagId": 5908906,
      "tag_name": "갓생",
      "bookmarked": 23,
      "count": 41,
      "grade": 8,
      "change": 14
    },
    {
      "tagId": 4867188,
      "tag_name": "건강관리",
      "bookmarked": 342,
      "count": 6,
      "grade": 9,
      "change": 4
    },
    {
      "tagId": 9200925,
      "tag_name": "팁공유",
      "bookmarked": 23,
      "count": 8,
      "grade": 6,
      "change": -3
    },
    {
      "tagId": 9059860,
      "tag_name": "업데이트정보",
      "bookmarked": 16,
      "count": 10,
      "grade": 7,
      "change": -12
    }
  ]
}
'''));
/// 트랜드 - 전체
PostData trendsPostData = PostData.fromJson(jsonDecode('''
{
  "posts": [
    {
      "post_id": 422069,
      "title": "영화 룩 백",
      "summary": "지난주 비 오는 저녁에 영화 한편 보고 왔어요. 둘째아이가 좋아하는 작가 작품인데, 친구들이랑 시간이 안맞았는지 엄마 호출해 줬어요.",
      "comments": 3,
      "like": 192,
      "viewed": 184,
      "createdAt": "2023-06-19T15:15:00.000000Z",
      "imageURL": "https://cafeptthumb-phinf.pstatic.net/MjAyNDEwMjRfOTUg/MDAxNzI5NzM1NDUyMzE2.q-NG4dnCnHtQQjf02CzxCKk35e9UnyEHS1i3gSj2KLYg.XpTxS9Dlo8oVRu_2wlXWHG2r1bmJuv2Tzf2s_Nq6NYsg.JPEG/common%EF%BC%BF20241024%EF%BC%BF103350.jpg?type=w1600"
    },
    {
      "post_id": 89347,
      "title": "최신 가전제품",
      "summary": "최신 스마트 가전 소개합니다.",
      "comments": 4,
      "like": 288,
      "viewed": 276,
      "createdAt": "2023-05-14T21:50:00.000000Z"
    },
    {
      "post_id": 53692,
      "title": "내일의 주식 전망",
      "summary": "주식 시장 분석과 내일의 전망",
      "comments": 4,
      "like": 288,
      "viewed": 276,
      "createdAt": "2023-02-28T08:40:00.000000Z"
    },
    {
      "post_id": 23901,
      "title": "등산 코스 추천",
      "summary": "가을에 가기 좋은 산",
      "comments": 4,
      "like": 245,
      "viewed": 276,
      "createdAt": "2022-09-21T05:11:00.000000Z"
    },
    {
      "post_id": 97852,
      "title": "새로운 취미 추천",
      "summary": "요즘 뜨는 취미는 무엇일까요?",
      "comments": 4,
      "like": 288,
      "viewed": 276,
      "createdAt": "2022-02-15T08:22:00.000000Z"
    },
    {
      "post_id": 57893,
      "title": "헬스장 추천",
      "summary": "어디 헬스장이 좋은가요?",
      "comments": 4,
      "like": 288,
      "viewed": 276,
      "createdAt": "2022-01-02T11:45:00.000000Z"
    },
    {
      "post_id": 23876,
      "title": "여행 준비물 리스트",
      "summary": "꼭 챙겨야 할 필수 아이템들",
      "comments": 4,
      "like": 288,
      "viewed": 276,
      "createdAt": "2021-11-30T09:00:00.000000Z"
    },
    {
      "post_id": 66728,
      "title": "반려동물 관리 방법",
      "summary": "강아지 털 관리 팁",
      "comments": 4,
      "like": 259,
      "viewed": 276,
      "createdAt": "2021-08-22T04:05:00.000000Z"
    },
    {
      "post_id": 87291,
      "title": "오늘의 날씨는?",
      "summary": "비가 올 것 같아요. 우산 챙기세요.",
      "comments": 4,
      "like": 288,
      "viewed": 276,
      "createdAt": "2021-04-25T12:34:00.000000Z"
    },
    {
      "post_id": 70483,
      "title": "홈 카페 인테리어",
      "summary": "집에서 즐기는 홈 카페 꾸미기",
      "comments": 4,
      "like": 288,
      "viewed": 276,
      "createdAt": "2021-03-10T14:55:00.000000Z"
    },
    {
      "post_id": 91234,
      "title": "책 읽기의 장점",
      "summary": "매일 책 읽기의 중요성을 알아봅시다.",
      "comments": 4,
      "like": 155,
      "viewed": 276,
      "createdAt": "2020-10-10T18:24:00.000000Z"
    },
    {
      "post_id": 11237,
      "title": "아침 운동의 중요성",
      "summary": "매일 아침 운동하는 습관!",
      "comments": 4,
      "like": 288,
      "viewed": 276,
      "createdAt": "2020-09-12T07:40:00.000000Z"
    },
    {
      "post_id": 13290,
      "title": "다이어트 식단",
      "summary": "건강한 식단으로 체중 감량하기",
      "comments": 4,
      "like": 288,
      "viewed": 276,
      "createdAt": "2020-06-17T07:30:00.000000Z",
      "imageURL": "https://picsum.photos/200"
    },
    {
      "post_id": 34892,
      "title": "IT 트렌드 분석",
      "summary": "올해 뜨는 IT 기술은?",
      "comments": 4,
      "like": 288,
      "viewed": 276,
      "createdAt": "2020-02-24T16:18:00.000000Z",
      "imageURL": "https://picsum.photos/200"
    },
    {
      "post_id": 46378,
      "title": "추천 영화 리스트",
      "summary": "주말에 보기 좋은 영화들",
      "comments": 4,
      "like": 288,
      "viewed": 276,
      "createdAt": "2019-07-18T14:10:00.000000Z"
    }
  ]
}
'''));
/// 드로워
DrawerData customDrawerData = DrawerData.fromJson(jsonDecode('''
      {
  "bookmarked": [
    {
      "tagId": 9041,
      "tag_name": "플레이리스트",
      "count": 319734,
      "grade": 4
    },
    {
      "tagId": 153924,
      "tag_name": "다이어트",
      "count": 8574866,
      "grade": 7
    },
    {
      "tagId": 557802,
      "tag_name": "트위터",
      "count": 1922750,
      "grade": 1
    },
    {
      "tagId": 904148,
      "tag_name": "소금빵",
      "count": 5895490,
      "grade": 5
    },
    {
      "tagId": 962281,
      "tag_name": "강아지",
      "count": 3665054,
      "grade": 7
    }
  ],
  "recommended": [
    {
      "tagId": 959591,
      "tag_name": "한강",
      "count": 2772649,
      "grade": 9
    },
    {
      "tagId": 437885,
      "tag_name": "틱톡챌린지",
      "count": 748850,
      "grade": 9
    },
    {
      "tagId": 613899,
      "tag_name": "베이커리",
      "count": 1797862,
      "grade": 9
    },
    {
      "tagId": 638732,
      "tag_name": "바다",
      "count": 6770103,
      "grade": 2
    },
    {
      "tagId": 605484,
      "tag_name": "제주도",
      "count": 1686647,
      "grade": 10
    }
  ]
}
    '''));
/// 태그 스크린
TagData fetchTagScreenData(int tagId) {
    // allTag 리스트에서 tagId가 일치하는 tag의 isBookmarked를 받아오기 위함
    Tag foundTag = allTag.firstWhere(
            (tag) => tag.tagId == tagId,
        orElse: () => Tag(tagId: tagId, tagName: "null", isBookmarked: false) // 기본값
    );
    // allPost 리스트에서 해당 tagId가 포함된 Post만 필터링
    List<Post> filteredPosts = allPost.where((post) {
        return post.tags != null && post.tags!.any((tag) => tag.tagId == tagId);
    }).toList();
    if (filteredPosts.isEmpty){
        return TagData(isBookmarked: foundTag.isBookmarked!, posts: tagScreenData.posts);
    }
    return TagData(isBookmarked: foundTag.isBookmarked!, posts: filteredPosts);
}
void toggleIsBookmarked(int tagId) {
    // allTag 리스트에서 tagId와 일치하는 Tag의 인덱스를 찾음
    int tagIndex = allTag.indexWhere((tag) => tag.tagId == tagId);
    if (tagIndex != -1) {
        // 인덱스가 유효하면 해당 태그의 bookmarked를 변경하고 isBookmarked 값을 반전시킨 새 객체로 저장
        allTag[tagIndex] = allTag[tagIndex].toggleIsBookmarked();
    }
}
TagData tagScreenData = TagData.fromJson(jsonDecode('''
    {
      "is_bookmarked": false,
      "posts": [
        {
          "post_id": 87291,
          "title": "오늘의 날씨는?",
          "summary": "비가 올 것 같아요. 우산 챙기세요.",
          "comments": 182,
          "like": 521,
          "viewed": 899,
          "createdAt": "2021-04-25T12:34:00.000Z"
        },
        {
          "post_id": 97852,
          "title": "새로운 취미 추천",
          "summary": "요즘 뜨는 취미는 무엇일까요?",
          "comments": 249,
          "like": 783,
          "viewed": 1374,
          "createdAt": "2022-02-15T08:22:00.000Z"
        },
        {
          "post_id": 11237,
          "title": "아침 운동의 중요성",
          "summary": "매일 아침 운동하는 습관!",
          "comments": 321,
          "like": 456,
          "viewed": 1023,
          "createdAt": "2020-09-12T07:40:00.000Z"
        },
        {
          "post_id": 56389,
          "title": "재테크 꿀팁 공유",
          "summary": "소액 투자로 시작하는 재테크",
          "comments": 405,
          "like": 642,
          "viewed": 1845,
          "createdAt": "2023-06-19T15:15:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 23876,
          "title": "여행 준비물 리스트",
          "summary": "꼭 챙겨야 할 필수 아이템들",
          "comments": 92,
          "like": 317,
          "viewed": 744,
          "createdAt": "2021-11-30T09:00:00.000Z"
        },
        {
          "post_id": 46378,
          "title": "추천 영화 리스트",
          "summary": "주말에 보기 좋은 영화들",
          "comments": 533,
          "like": 910,
          "viewed": 2458,
          "createdAt": "2019-07-18T14:10:00.000Z"
        },
        {
          "post_id": 91234,
          "title": "책 읽기의 장점",
          "summary": "매일 책 읽기의 중요성을 알아봅시다.",
          "comments": 67,
          "like": 155,
          "viewed": 481,
          "createdAt": "2020-10-10T18:24:00.000Z"
        },
        {
          "post_id": 66728,
          "title": "반려동물 관리 방법",
          "summary": "강아지 털 관리 팁",
          "comments": 187,
          "like": 259,
          "viewed": 891,
          "createdAt": "2021-08-22T04:05:00.000Z"
        },
        {
          "post_id": 57893,
          "title": "헬스장 추천",
          "summary": "어디 헬스장이 좋은가요?",
          "comments": 200,
          "like": 378,
          "viewed": 1298,
          "createdAt": "2022-01-02T11:45:00.000Z"
        },
        {
          "post_id": 34892,
          "title": "IT 트렌드 분석",
          "summary": "올해 뜨는 IT 기술은?",
          "comments": 450,
          "like": 821,
          "viewed": 2114,
          "createdAt": "2020-02-24T16:18:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 89347,
          "title": "최신 가전제품",
          "summary": "최신 스마트 가전 소개합니다.",
          "comments": 134,
          "like": 452,
          "viewed": 1203,
          "createdAt": "2023-05-14T21:50:00.000Z"
        },
        {
          "post_id": 23901,
          "title": "등산 코스 추천",
          "summary": "가을에 가기 좋은 산",
          "comments": 98,
          "like": 245,
          "viewed": 621,
          "createdAt": "2022-09-21T05:11:00.000Z"
        },
        {
          "post_id": 70483,
          "title": "홈 카페 인테리어",
          "summary": "집에서 즐기는 홈 카페 꾸미기",
          "comments": 301,
          "like": 502,
          "viewed": 1501,
          "createdAt": "2021-03-10T14:55:00.000Z"
        },
        {
          "post_id": 53692,
          "title": "내일의 주식 전망",
          "summary": "주식 시장 분석과 내일의 전망",
          "comments": 775,
          "like": 923,
          "viewed": 3095,
          "createdAt": "2023-02-28T08:40:00.000Z"
        },
        {
          "post_id": 13290,
          "title": "다이어트 식단",
          "summary": "건강한 식단으로 체중 감량하기",
          "comments": 354,
          "like": 620,
          "viewed": 1450,
          "createdAt": "2020-06-17T07:30:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 49723,
          "title": "쇼핑몰 추천",
          "summary": "가성비 좋은 온라인 쇼핑몰 추천",
          "comments": 156,
          "like": 399,
          "viewed": 1084,
          "createdAt": "2019-12-05T03:17:00.000Z"
        },
        {
          "post_id": 89014,
          "title": "내가 사랑하는 음악",
          "summary": "요즘 듣고 있는 음악 추천",
          "comments": 66,
          "like": 289,
          "viewed": 672,
          "createdAt": "2021-07-22T02:02:00.000Z"
        },
        {
          "post_id": 78512,
          "title": "명언 모음집",
          "summary": "삶에 도움이 되는 명언들",
          "comments": 402,
          "like": 703,
          "viewed": 1822,
          "createdAt": "2020-11-12T09:50:00.000Z"
        },
        {
          "post_id": 58329,
          "title": "헬시푸드 레시피",
          "summary": "간단하고 건강한 요리법",
          "comments": 285,
          "like": 563,
          "viewed": 1307,
          "createdAt": "2023-03-23T13:07:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 29387,
          "title": "여행 후기 공유",
          "summary": "최근 다녀온 여행 후기를 남겨요.",
          "comments": 141,
          "like": 329,
          "viewed": 889,
          "createdAt": "2022-05-06T12:14:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 97245,
          "title": "독서 습관 들이기",
          "summary": "하루 10분 독서로 시작하기",
          "comments": 158,
          "like": 487,
          "viewed": 1249,
          "createdAt": "2021-10-18T19:30:00.000Z"
        },
        {
          "post_id": 40982,
          "title": "간단한 운동법",
          "summary": "5분 만에 하는 스트레칭",
          "comments": 72,
          "like": 205,
          "viewed": 654,
          "createdAt": "2023-08-07T17:25:00.000Z"
        },
        {
          "post_id": 89120,
          "title": "요리 초보의 도전",
          "summary": "처음 해본 파스타 요리!",
          "comments": 186,
          "like": 423,
          "viewed": 1140,
          "createdAt": "2019-03-13T05:12:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 67653,
          "title": "매일 아침 루틴",
          "summary": "성공적인 아침 루틴 만들기",
          "comments": 321,
          "like": 612,
          "viewed": 1504,
          "createdAt": "2020-07-29T10:44:00.000Z"
        },
        {
          "post_id": 13987,
          "title": "온라인 클래스 추천",
          "summary": "취미를 배울 수 있는 사이트",
          "comments": 312,
          "like": 581,
          "viewed": 1319,
          "createdAt": "2022-11-02T03:25:00.000Z"
        },
        {
          "post_id": 91208,
          "title": "반려동물 입양",
          "summary": "입양 전 알아야 할 사항들",
          "comments": 128,
          "like": 394,
          "viewed": 1012,
          "createdAt": "2021-06-09T06:20:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 25781,
          "title": "커피 원두 추천",
          "summary": "향과 맛이 좋은 원두 추천",
          "comments": 85,
          "like": 221,
          "viewed": 754,
          "createdAt": "2020-01-15T18:35:00.000Z"
        },
        {
          "post_id": 10987,
          "title": "게임 추천",
          "summary": "요즘 핫한 게임은?",
          "comments": 411,
          "like": 759,
          "viewed": 2023,
          "createdAt": "2019-09-29T13:56:00.000Z"
        },
        {
          "post_id": 78012,
          "title": "자동차 관리 팁",
          "summary": "겨울철 자동차 관리 요령",
          "comments": 142,
          "like": 372,
          "viewed": 936,
          "createdAt": "2022-12-11T20:19:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 47982,
          "title": "집에서 하는 간단 요리",
          "summary": "쉬운 재료로 만드는 요리",
          "comments": 98,
          "like": 310,
          "viewed": 890,
          "createdAt": "2023-07-03T04:12:00.000Z"
        },
        {
          "post_id": 68371,
          "title": "책 추천",
          "summary": "마음의 양식을 채우는 도서",
          "comments": 183,
          "like": 533,
          "viewed": 1211,
          "createdAt": "2021-05-28T09:18:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 29382,
          "title": "공부 자극 글",
          "summary": "열심히 공부하는 법을 배워보세요.",
          "comments": 257,
          "like": 687,
          "viewed": 1589,
          "createdAt": "2022-08-10T14:28:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 47281,
          "title": "의류 쇼핑몰 추천",
          "summary": "저렴하고 트렌디한 의류 추천",
          "comments": 198,
          "like": 489,
          "viewed": 1187,
          "createdAt": "2020-05-05T22:10:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 98237,
          "title": "취미 만들기",
          "summary": "취미로 시작하는 나만의 프로젝트",
          "comments": 223,
          "like": 431,
          "viewed": 1205,
          "createdAt": "2019-01-17T10:55:00.000Z"
        },
        {
          "post_id": 13567,
          "title": "알뜰 쇼핑 팁",
          "summary": "저렴하게 쇼핑하는 방법",
          "comments": 302,
          "like": 675,
          "viewed": 1432,
          "createdAt": "2021-02-13T08:22:00.000Z"
        },
        {
          "post_id": 62589,
          "title": "겨울 스포츠 즐기기",
          "summary": "스키, 스노우보드 즐기는 팁",
          "comments": 109,
          "like": 312,
          "viewed": 819,
          "createdAt": "2022-12-23T05:47:00.000Z"
        },
        {
          "post_id": 32901,
          "title": "맛집 추천",
          "summary": "이번 주말 가볼만한 맛집",
          "comments": 457,
          "like": 801,
          "viewed": 2301,
          "createdAt": "2020-11-27T15:09:00.000Z",
          "imageURL": "https://picsum.photos/200"
        }
      ]
    }
    '''));
/// 커뮤니티 스크린
CommunityData fetchCommunityScreenData(int tagId) {
    Tag foundTag = allTag.firstWhere(
            (tag) => tag.tagId == tagId,
        orElse: () => Tag(tagId: tagId, tagName: "null", isBookmarked: false) // 기본값
    );
    return CommunityData(isBookmarked: foundTag.isBookmarked!);
}
CommunityData communityScreenData = CommunityData.fromJson(jsonDecode('''
    {
      "is_bookmarked": false
    }
    '''));
/// 커뮤니티 메인
RankData fetchCommunityMainData(int tagId) {
    TempCommunityData foundData = tempCommunityScreenData.firstWhere(
            (data) => data.tagId == tagId,
        orElse: () => TempCommunityData(tagId: tagId) // 기본값
    );
    if(foundData.communityMainData == null){
        return communityMainData;
    }
    return foundData.communityMainData!;
}
RankData communityMainData = RankData.fromJson(jsonDecode('''
    {
      "daily": [
        {
          "post_id": 67638,
          "title": "새로운 취미를 찾다: 하루 만에 시작하는 5가지 방법",
          "comments": 6600,
          "like": 7797,
          "change": 18
        },
        {
          "post_id": 80603,
          "title": "아침 루틴으로 성공을 잡는 법: 7가지 필수 팁",
          "comments": 9892,
          "like": 31611,
          "change": 6
        },
        {
          "post_id": 18550,
          "title": "여행의 설렘, 그리고 놓치지 말아야 할 순간들",
          "comments": 1940,
          "like": 95441,
          "change": -9
        },
        {
          "post_id": 70709,
          "title": "시간 관리의 비밀: 효율적으로 일하는 10가지 습관",
          "comments": 4967,
          "like": 149,
          "change": 18
        },
        {
          "post_id": 30827,
          "title": "내가 몰랐던 커피의 세계: 당신이 알아야 할 정보",
          "comments": 8451,
          "like": 12065,
          "change": -5
        },
        {
          "post_id": 40604,
          "title": "내 방을 아늑하게 꾸미는 방법: 인테리어 팁 5선",
          "comments": 7243,
          "like": 24354,
          "change": 0
        },
        {
          "post_id": 60880,
          "title": "운동을 즐기는 방법: 초보자를 위한 가이드",
          "comments": 4920,
          "like": 55483,
          "change": -7
        },
        {
          "post_id": 9754,
          "title": "디지털 디톡스: 일주일 동안 SNS 없이 살아보기",
          "comments": 2296,
          "like": 82045,
          "change": -5
        },
        {
          "post_id": 6668,
          "title": "건강한 식습관으로의 첫걸음: 간단한 레시피 3가지",
          "comments": 7811,
          "like": 60625,
          "change": 9
        },
        {
          "post_id": 60207,
          "title": "어떻게 하면 긍정적으로 생각할 수 있을까? 마음을 다스리는 법",
          "comments": 1427,
          "like": 72095,
          "change": 10
        }
      ],
      "weekly": [
        {
          "post_id": 67638,
          "title": "미래 직업 전망: 2030년에 뜰 산업 7가지",
          "comments": 6600,
          "like": 7797,
          "change": 18
        },
        {
          "post_id": 80603,
          "title": "성공적인 팀워크의 핵심: 협업을 위한 5가지 팁",
          "comments": 9892,
          "like": 31611,
          "change": 6
        },
        {
          "post_id": 18550,
          "title": "집에서 만드는 힐링 스파: DIY 홈케어 방법",
          "comments": 1940,
          "like": 95441,
          "change": -9
        },
        {
          "post_id": 70709,
          "title": "일상 속 작은 변화로 큰 행복 찾기",
          "comments": 4967,
          "like": 149,
          "change": 18
        },
        {
          "post_id": 30827,
          "title": "일 잘하는 사람들의 공통점: 생산성 높이는 습관",
          "comments": 8451,
          "like": 12065,
          "change": -5
        },
        {
          "post_id": 40604,
          "title": "바쁜 아침에도 가능한 10분 아침 요가 루틴",
          "comments": 7243,
          "like": 24354,
          "change": 0
        },
        {
          "post_id": 60880,
          "title": "여행 사진 잘 찍는 법: 초보자를 위한 촬영 팁",
          "comments": 4920,
          "like": 55483,
          "change": -7
        },
        {
          "post_id": 9754,
          "title": "아이디어가 넘치는 사람들의 사고방식: 창의력 향상 비법",
          "comments": 2296,
          "like": 82045,
          "change": -5
        },
        {
          "post_id": 6668,
          "title": "집에서도 가능한 쉬운 운동 루틴: 초보자 가이드",
          "comments": 7811,
          "like": 60625,
          "change": 9
        },
        {
          "post_id": 60207,
          "title": "매일 실천하는 자기 계발 습관: 삶을 바꾸는 작은 행동들",
          "comments": 1427,
          "like": 72095,
          "change": 10
        }
      ]
    }
    '''));
/// 커뮤니티 - 공감글
PostData fetchCommunityGoodData(int tagId) {
    TempCommunityData foundData = tempCommunityScreenData.firstWhere(
            (data) => data.tagId == tagId,
        orElse: () => TempCommunityData(tagId: tagId) // 기본값
    );
    if(foundData.communityGoodPostData == null){
        return communityGoodPostData;
    }
    return foundData.communityGoodPostData!;
}
PostData communityGoodPostData = PostData.fromJson(jsonDecode('''
    {
      "posts": [
        {
          "post_id": 87291,
          "title": "오늘의 날씨는?",
          "summary": "비가 올 것 같아요. 우산 챙기세요.",
          "comments": 182,
          "like": 521,
          "viewed": 899,
          "createdAt": "2021-04-25T12:34:00.000Z"
        },
        {
          "post_id": 97852,
          "title": "새로운 취미 추천",
          "summary": "요즘 뜨는 취미는 무엇일까요?",
          "comments": 249,
          "like": 783,
          "viewed": 1374,
          "createdAt": "2022-02-15T08:22:00.000Z"
        },
        {
          "post_id": 11237,
          "title": "아침 운동의 중요성",
          "summary": "매일 아침 운동하는 습관!",
          "comments": 321,
          "like": 456,
          "viewed": 1023,
          "createdAt": "2020-09-12T07:40:00.000Z"
        },
        {
          "post_id": 56389,
          "title": "재테크 꿀팁 공유",
          "summary": "소액 투자로 시작하는 재테크",
          "comments": 405,
          "like": 642,
          "viewed": 1845,
          "createdAt": "2023-06-19T15:15:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 23876,
          "title": "여행 준비물 리스트",
          "summary": "꼭 챙겨야 할 필수 아이템들",
          "comments": 92,
          "like": 317,
          "viewed": 744,
          "createdAt": "2021-11-30T09:00:00.000Z"
        },
        {
          "post_id": 46378,
          "title": "추천 영화 리스트",
          "summary": "주말에 보기 좋은 영화들",
          "comments": 533,
          "like": 910,
          "viewed": 2458,
          "createdAt": "2019-07-18T14:10:00.000Z"
        },
        {
          "post_id": 91234,
          "title": "책 읽기의 장점",
          "summary": "매일 책 읽기의 중요성을 알아봅시다.",
          "comments": 67,
          "like": 155,
          "viewed": 481,
          "createdAt": "2020-10-10T18:24:00.000Z"
        },
        {
          "post_id": 66728,
          "title": "반려동물 관리 방법",
          "summary": "강아지 털 관리 팁",
          "comments": 187,
          "like": 259,
          "viewed": 891,
          "createdAt": "2021-08-22T04:05:00.000Z"
        },
        {
          "post_id": 57893,
          "title": "헬스장 추천",
          "summary": "어디 헬스장이 좋은가요?",
          "comments": 200,
          "like": 378,
          "viewed": 1298,
          "createdAt": "2022-01-02T11:45:00.000Z"
        },
        {
          "post_id": 34892,
          "title": "IT 트렌드 분석",
          "summary": "올해 뜨는 IT 기술은?",
          "comments": 450,
          "like": 821,
          "viewed": 2114,
          "createdAt": "2020-02-24T16:18:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 89347,
          "title": "최신 가전제품",
          "summary": "최신 스마트 가전 소개합니다.",
          "comments": 134,
          "like": 452,
          "viewed": 1203,
          "createdAt": "2023-05-14T21:50:00.000Z"
        },
        {
          "post_id": 23901,
          "title": "등산 코스 추천",
          "summary": "가을에 가기 좋은 산",
          "comments": 98,
          "like": 245,
          "viewed": 621,
          "createdAt": "2022-09-21T05:11:00.000Z"
        },
        {
          "post_id": 70483,
          "title": "홈 카페 인테리어",
          "summary": "집에서 즐기는 홈 카페 꾸미기",
          "comments": 301,
          "like": 502,
          "viewed": 1501,
          "createdAt": "2021-03-10T14:55:00.000Z"
        },
        {
          "post_id": 53692,
          "title": "내일의 주식 전망",
          "summary": "주식 시장 분석과 내일의 전망",
          "comments": 775,
          "like": 923,
          "viewed": 3095,
          "createdAt": "2023-02-28T08:40:00.000Z"
        },
        {
          "post_id": 13290,
          "title": "다이어트 식단",
          "summary": "건강한 식단으로 체중 감량하기",
          "comments": 354,
          "like": 620,
          "viewed": 1450,
          "createdAt": "2020-06-17T07:30:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 49723,
          "title": "쇼핑몰 추천",
          "summary": "가성비 좋은 온라인 쇼핑몰 추천",
          "comments": 156,
          "like": 399,
          "viewed": 1084,
          "createdAt": "2019-12-05T03:17:00.000Z"
        },
        {
          "post_id": 89014,
          "title": "내가 사랑하는 음악",
          "summary": "요즘 듣고 있는 음악 추천",
          "comments": 66,
          "like": 289,
          "viewed": 672,
          "createdAt": "2021-07-22T02:02:00.000Z"
        },
        {
          "post_id": 78512,
          "title": "명언 모음집",
          "summary": "삶에 도움이 되는 명언들",
          "comments": 402,
          "like": 703,
          "viewed": 1822,
          "createdAt": "2020-11-12T09:50:00.000Z"
        },
        {
          "post_id": 58329,
          "title": "헬시푸드 레시피",
          "summary": "간단하고 건강한 요리법",
          "comments": 285,
          "like": 563,
          "viewed": 1307,
          "createdAt": "2023-03-23T13:07:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 29387,
          "title": "여행 후기 공유",
          "summary": "최근 다녀온 여행 후기를 남겨요.",
          "comments": 141,
          "like": 329,
          "viewed": 889,
          "createdAt": "2022-05-06T12:14:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 97245,
          "title": "독서 습관 들이기",
          "summary": "하루 10분 독서로 시작하기",
          "comments": 158,
          "like": 487,
          "viewed": 1249,
          "createdAt": "2021-10-18T19:30:00.000Z"
        },
        {
          "post_id": 40982,
          "title": "간단한 운동법",
          "summary": "5분 만에 하는 스트레칭",
          "comments": 72,
          "like": 205,
          "viewed": 654,
          "createdAt": "2023-08-07T17:25:00.000Z"
        },
        {
          "post_id": 89120,
          "title": "요리 초보의 도전",
          "summary": "처음 해본 파스타 요리!",
          "comments": 186,
          "like": 423,
          "viewed": 1140,
          "createdAt": "2019-03-13T05:12:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 67653,
          "title": "매일 아침 루틴",
          "summary": "성공적인 아침 루틴 만들기",
          "comments": 321,
          "like": 612,
          "viewed": 1504,
          "createdAt": "2020-07-29T10:44:00.000Z"
        },
        {
          "post_id": 13987,
          "title": "온라인 클래스 추천",
          "summary": "취미를 배울 수 있는 사이트",
          "comments": 312,
          "like": 581,
          "viewed": 1319,
          "createdAt": "2022-11-02T03:25:00.000Z"
        },
        {
          "post_id": 91208,
          "title": "반려동물 입양",
          "summary": "입양 전 알아야 할 사항들",
          "comments": 128,
          "like": 394,
          "viewed": 1012,
          "createdAt": "2021-06-09T06:20:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 25781,
          "title": "커피 원두 추천",
          "summary": "향과 맛이 좋은 원두 추천",
          "comments": 85,
          "like": 221,
          "viewed": 754,
          "createdAt": "2020-01-15T18:35:00.000Z"
        },
        {
          "post_id": 10987,
          "title": "게임 추천",
          "summary": "요즘 핫한 게임은?",
          "comments": 411,
          "like": 759,
          "viewed": 2023,
          "createdAt": "2019-09-29T13:56:00.000Z"
        },
        {
          "post_id": 78012,
          "title": "자동차 관리 팁",
          "summary": "겨울철 자동차 관리 요령",
          "comments": 142,
          "like": 372,
          "viewed": 936,
          "createdAt": "2022-12-11T20:19:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 47982,
          "title": "집에서 하는 간단 요리",
          "summary": "쉬운 재료로 만드는 요리",
          "comments": 98,
          "like": 310,
          "viewed": 890,
          "createdAt": "2023-07-03T04:12:00.000Z"
        },
        {
          "post_id": 68371,
          "title": "책 추천",
          "summary": "마음의 양식을 채우는 도서",
          "comments": 183,
          "like": 533,
          "viewed": 1211,
          "createdAt": "2021-05-28T09:18:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 29382,
          "title": "공부 자극 글",
          "summary": "열심히 공부하는 법을 배워보세요.",
          "comments": 257,
          "like": 687,
          "viewed": 1589,
          "createdAt": "2022-08-10T14:28:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 47281,
          "title": "의류 쇼핑몰 추천",
          "summary": "저렴하고 트렌디한 의류 추천",
          "comments": 198,
          "like": 489,
          "viewed": 1187,
          "createdAt": "2020-05-05T22:10:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 98237,
          "title": "취미 만들기",
          "summary": "취미로 시작하는 나만의 프로젝트",
          "comments": 223,
          "like": 431,
          "viewed": 1205,
          "createdAt": "2019-01-17T10:55:00.000Z"
        },
        {
          "post_id": 13567,
          "title": "알뜰 쇼핑 팁",
          "summary": "저렴하게 쇼핑하는 방법",
          "comments": 302,
          "like": 675,
          "viewed": 1432,
          "createdAt": "2021-02-13T08:22:00.000Z"
        },
        {
          "post_id": 62589,
          "title": "겨울 스포츠 즐기기",
          "summary": "스키, 스노우보드 즐기는 팁",
          "comments": 109,
          "like": 312,
          "viewed": 819,
          "createdAt": "2022-12-23T05:47:00.000Z"
        },
        {
          "post_id": 32901,
          "title": "맛집 추천",
          "summary": "이번 주말 가볼만한 맛집",
          "comments": 457,
          "like": 801,
          "viewed": 2301,
          "createdAt": "2020-11-27T15:09:00.000Z",
          "imageURL": "https://picsum.photos/200"
        }
      ]
    }
    '''));
/// 커뮤니티 - 전체
PostData fetchCommunityPostData(int tagId) {
    TempCommunityData foundData = tempCommunityScreenData.firstWhere(
            (data) => data.tagId == tagId,
        orElse: () => TempCommunityData(tagId: tagId) // 기본값
    );
    if(foundData.communityPostData == null){
        return communityPostData;
    }
    return foundData.communityPostData!;
}
PostData communityPostData = PostData.fromJson(jsonDecode('''
    {
      "posts": [
        {
          "post_id": 87291,
          "title": "오늘의 날씨는?",
          "summary": "비가 올 것 같아요. 우산 챙기세요.",
          "comments": 182,
          "like": 521,
          "viewed": 899,
          "createdAt": "2021-04-25T12:34:00.000Z"
        },
        {
          "post_id": 97852,
          "title": "새로운 취미 추천",
          "summary": "요즘 뜨는 취미는 무엇일까요?",
          "comments": 249,
          "like": 783,
          "viewed": 1374,
          "createdAt": "2022-02-15T08:22:00.000Z"
        },
        {
          "post_id": 11237,
          "title": "아침 운동의 중요성",
          "summary": "매일 아침 운동하는 습관!",
          "comments": 321,
          "like": 456,
          "viewed": 1023,
          "createdAt": "2020-09-12T07:40:00.000Z"
        },
        {
          "post_id": 56389,
          "title": "재테크 꿀팁 공유",
          "summary": "소액 투자로 시작하는 재테크",
          "comments": 405,
          "like": 642,
          "viewed": 1845,
          "createdAt": "2023-06-19T15:15:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 23876,
          "title": "여행 준비물 리스트",
          "summary": "꼭 챙겨야 할 필수 아이템들",
          "comments": 92,
          "like": 317,
          "viewed": 744,
          "createdAt": "2021-11-30T09:00:00.000Z"
        },
        {
          "post_id": 46378,
          "title": "추천 영화 리스트",
          "summary": "주말에 보기 좋은 영화들",
          "comments": 533,
          "like": 910,
          "viewed": 2458,
          "createdAt": "2019-07-18T14:10:00.000Z"
        },
        {
          "post_id": 91234,
          "title": "책 읽기의 장점",
          "summary": "매일 책 읽기의 중요성을 알아봅시다.",
          "comments": 67,
          "like": 155,
          "viewed": 481,
          "createdAt": "2020-10-10T18:24:00.000Z"
        },
        {
          "post_id": 66728,
          "title": "반려동물 관리 방법",
          "summary": "강아지 털 관리 팁",
          "comments": 187,
          "like": 259,
          "viewed": 891,
          "createdAt": "2021-08-22T04:05:00.000Z"
        },
        {
          "post_id": 57893,
          "title": "헬스장 추천",
          "summary": "어디 헬스장이 좋은가요?",
          "comments": 200,
          "like": 378,
          "viewed": 1298,
          "createdAt": "2022-01-02T11:45:00.000Z"
        },
        {
          "post_id": 34892,
          "title": "IT 트렌드 분석",
          "summary": "올해 뜨는 IT 기술은?",
          "comments": 450,
          "like": 821,
          "viewed": 2114,
          "createdAt": "2020-02-24T16:18:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 89347,
          "title": "최신 가전제품",
          "summary": "최신 스마트 가전 소개합니다.",
          "comments": 134,
          "like": 452,
          "viewed": 1203,
          "createdAt": "2023-05-14T21:50:00.000Z"
        },
        {
          "post_id": 23901,
          "title": "등산 코스 추천",
          "summary": "가을에 가기 좋은 산",
          "comments": 98,
          "like": 245,
          "viewed": 621,
          "createdAt": "2022-09-21T05:11:00.000Z"
        },
        {
          "post_id": 70483,
          "title": "홈 카페 인테리어",
          "summary": "집에서 즐기는 홈 카페 꾸미기",
          "comments": 301,
          "like": 502,
          "viewed": 1501,
          "createdAt": "2021-03-10T14:55:00.000Z"
        },
        {
          "post_id": 53692,
          "title": "내일의 주식 전망",
          "summary": "주식 시장 분석과 내일의 전망",
          "comments": 775,
          "like": 923,
          "viewed": 3095,
          "createdAt": "2023-02-28T08:40:00.000Z"
        },
        {
          "post_id": 13290,
          "title": "다이어트 식단",
          "summary": "건강한 식단으로 체중 감량하기",
          "comments": 354,
          "like": 620,
          "viewed": 1450,
          "createdAt": "2020-06-17T07:30:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 49723,
          "title": "쇼핑몰 추천",
          "summary": "가성비 좋은 온라인 쇼핑몰 추천",
          "comments": 156,
          "like": 399,
          "viewed": 1084,
          "createdAt": "2019-12-05T03:17:00.000Z"
        },
        {
          "post_id": 89014,
          "title": "내가 사랑하는 음악",
          "summary": "요즘 듣고 있는 음악 추천",
          "comments": 66,
          "like": 289,
          "viewed": 672,
          "createdAt": "2021-07-22T02:02:00.000Z"
        },
        {
          "post_id": 78512,
          "title": "명언 모음집",
          "summary": "삶에 도움이 되는 명언들",
          "comments": 402,
          "like": 703,
          "viewed": 1822,
          "createdAt": "2020-11-12T09:50:00.000Z"
        },
        {
          "post_id": 58329,
          "title": "헬시푸드 레시피",
          "summary": "간단하고 건강한 요리법",
          "comments": 285,
          "like": 563,
          "viewed": 1307,
          "createdAt": "2023-03-23T13:07:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 29387,
          "title": "여행 후기 공유",
          "summary": "최근 다녀온 여행 후기를 남겨요.",
          "comments": 141,
          "like": 329,
          "viewed": 889,
          "createdAt": "2022-05-06T12:14:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 97245,
          "title": "독서 습관 들이기",
          "summary": "하루 10분 독서로 시작하기",
          "comments": 158,
          "like": 487,
          "viewed": 1249,
          "createdAt": "2021-10-18T19:30:00.000Z"
        },
        {
          "post_id": 40982,
          "title": "간단한 운동법",
          "summary": "5분 만에 하는 스트레칭",
          "comments": 72,
          "like": 205,
          "viewed": 654,
          "createdAt": "2023-08-07T17:25:00.000Z"
        },
        {
          "post_id": 89120,
          "title": "요리 초보의 도전",
          "summary": "처음 해본 파스타 요리!",
          "comments": 186,
          "like": 423,
          "viewed": 1140,
          "createdAt": "2019-03-13T05:12:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 67653,
          "title": "매일 아침 루틴",
          "summary": "성공적인 아침 루틴 만들기",
          "comments": 321,
          "like": 612,
          "viewed": 1504,
          "createdAt": "2020-07-29T10:44:00.000Z"
        },
        {
          "post_id": 13987,
          "title": "온라인 클래스 추천",
          "summary": "취미를 배울 수 있는 사이트",
          "comments": 312,
          "like": 581,
          "viewed": 1319,
          "createdAt": "2022-11-02T03:25:00.000Z"
        },
        {
          "post_id": 91208,
          "title": "반려동물 입양",
          "summary": "입양 전 알아야 할 사항들",
          "comments": 128,
          "like": 394,
          "viewed": 1012,
          "createdAt": "2021-06-09T06:20:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 25781,
          "title": "커피 원두 추천",
          "summary": "향과 맛이 좋은 원두 추천",
          "comments": 85,
          "like": 221,
          "viewed": 754,
          "createdAt": "2020-01-15T18:35:00.000Z"
        },
        {
          "post_id": 10987,
          "title": "게임 추천",
          "summary": "요즘 핫한 게임은?",
          "comments": 411,
          "like": 759,
          "viewed": 2023,
          "createdAt": "2019-09-29T13:56:00.000Z"
        },
        {
          "post_id": 78012,
          "title": "자동차 관리 팁",
          "summary": "겨울철 자동차 관리 요령",
          "comments": 142,
          "like": 372,
          "viewed": 936,
          "createdAt": "2022-12-11T20:19:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 47982,
          "title": "집에서 하는 간단 요리",
          "summary": "쉬운 재료로 만드는 요리",
          "comments": 98,
          "like": 310,
          "viewed": 890,
          "createdAt": "2023-07-03T04:12:00.000Z"
        },
        {
          "post_id": 68371,
          "title": "책 추천",
          "summary": "마음의 양식을 채우는 도서",
          "comments": 183,
          "like": 533,
          "viewed": 1211,
          "createdAt": "2021-05-28T09:18:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 29382,
          "title": "공부 자극 글",
          "summary": "열심히 공부하는 법을 배워보세요.",
          "comments": 257,
          "like": 687,
          "viewed": 1589,
          "createdAt": "2022-08-10T14:28:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 47281,
          "title": "의류 쇼핑몰 추천",
          "summary": "저렴하고 트렌디한 의류 추천",
          "comments": 198,
          "like": 489,
          "viewed": 1187,
          "createdAt": "2020-05-05T22:10:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 98237,
          "title": "취미 만들기",
          "summary": "취미로 시작하는 나만의 프로젝트",
          "comments": 223,
          "like": 431,
          "viewed": 1205,
          "createdAt": "2019-01-17T10:55:00.000Z"
        },
        {
          "post_id": 13567,
          "title": "알뜰 쇼핑 팁",
          "summary": "저렴하게 쇼핑하는 방법",
          "comments": 302,
          "like": 675,
          "viewed": 1432,
          "createdAt": "2021-02-13T08:22:00.000Z"
        },
        {
          "post_id": 62589,
          "title": "겨울 스포츠 즐기기",
          "summary": "스키, 스노우보드 즐기는 팁",
          "comments": 109,
          "like": 312,
          "viewed": 819,
          "createdAt": "2022-12-23T05:47:00.000Z"
        },
        {
          "post_id": 32901,
          "title": "맛집 추천",
          "summary": "이번 주말 가볼만한 맛집",
          "comments": 457,
          "like": 801,
          "viewed": 2301,
          "createdAt": "2020-11-27T15:09:00.000Z",
          "imageURL": "https://picsum.photos/200"
        }
      ]
    }
    '''));
/// 커뮤니티 - 추천
CommunityRecommendData fetchCommunityRecommendData(int tagId) {
    TempCommunityData foundData = tempCommunityScreenData.firstWhere(
            (data) => data.tagId == tagId,
        orElse: () => TempCommunityData(tagId: tagId) // 기본값
    );
    if(foundData.communityRecommendData == null){
        return communityRecommendData;
    }
    return foundData.communityRecommendData!;
}
CommunityRecommendData communityRecommendData = CommunityRecommendData.fromJson(jsonDecode('''
    {
      "tags": [
        {
          "tagId": 5500584,
          "tag_name": "정보공유",
          "bookmarked": 2260098,
          "count": 6054472,
          "grade": 1,
          "change": 3
        },
        {
          "tagId": 6483579,
          "tag_name": "꿀팁공유",
          "bookmarked": 1907232,
          "count": 1456826,
          "grade": 3,
          "change": 11
        },
        {
          "tagId": 7951011,
          "tag_name": "생활정보",
          "bookmarked": 3614974,
          "count": 4657548,
          "grade": 7,
          "change": 12
        },
        {
          "tagId": 2488542,
          "tag_name": "유용한팁",
          "bookmarked": 3775929,
          "count": 640068,
          "grade": 9,
          "change": -3
        },
        {
          "tagId": 7615117,
          "tag_name": "건강정보",
          "bookmarked": 1751088,
          "count": 4422214,
          "grade": 11,
          "change": 6
        },
        {
          "tagId": 714703,
          "tag_name": "노하우",
          "bookmarked": 312407,
          "count": 5254348,
          "grade": 10,
          "change": 9
        },
        {
          "tagId": 215707,
          "tag_name": "아이디어",
          "bookmarked": 3795284,
          "count": 5623334,
          "grade": 8,
          "change": 5
        },
        {
          "tagId": 2557334,
          "tag_name": "생활지혜",
          "bookmarked": 8934600,
          "count": 1063798,
          "grade": 6,
          "change": -3
        },
        {
          "tagId": 5596651,
          "tag_name": "DIY정보",
          "bookmarked": 3209647,
          "count": 2237288,
          "grade": 4,
          "change": 12
        },
        {
          "tagId": 4223100,
          "tag_name": "유익한정보",
          "bookmarked": 2794107,
          "count": 7819248,
          "grade": 2,
          "change": 7
        },
        {
          "tagId": 7080658,
          "tag_name": "공유합니다",
          "bookmarked": 6767962,
          "count": 3488927,
          "grade": 1,
          "change": 16
        },
        {
          "tagId": 9519070,
          "tag_name": "재테크팁",
          "bookmarked": 5339900,
          "count": 1616924,
          "grade": 3,
          "change": -8
        },
        {
          "tagId": 4857952,
          "tag_name": "경제정보",
          "bookmarked": 6674531,
          "count": 1682886,
          "grade": 5,
          "change": 17
        },
        {
          "tagId": 2348171,
          "tag_name": "신상정보",
          "bookmarked": 8472470,
          "count": 6828528,
          "grade": 7,
          "change": -5
        },
        {
          "tagId": 5580618,
          "tag_name": "최신트렌드",
          "bookmarked": 5484617,
          "count": 7964309,
          "grade": 8,
          "change": 19
        },
        {
          "tagId": 2833521,
          "tag_name": "취미생활",
          "bookmarked": 7578623,
          "count": 2622905,
          "grade": 2,
          "change": -14
        },
        {
          "tagId": 2461206,
          "tag_name": "자기계발",
          "bookmarked": 3739094,
          "count": 7101079,
          "grade": 9,
          "change": -16
        },
        {
          "tagId": 7258920,
          "tag_name": "공유팁",
          "bookmarked": 7157341,
          "count": 6396799,
          "grade": 11,
          "change": 5
        },
        {
          "tagId": 1485554,
          "tag_name": "효율적인삶",
          "bookmarked": 5595206,
          "count": 9024936,
          "grade": 9,
          "change": -5
        },
        {
          "tagId": 624399,
          "tag_name": "성공팁",
          "bookmarked": 831223,
          "count": 2078251,
          "grade": 6,
          "change": 20
        },
        {
          "tagId": 2213407,
          "tag_name": "일상공유",
          "bookmarked": 6522985,
          "count": 6053842,
          "grade": 9,
          "change": -8
        },
        {
          "tagId": 9936855,
          "tag_name": "정보나눔",
          "bookmarked": 2015806,
          "count": 9322703,
          "grade": 2,
          "change": -7
        },
        {
          "tagId": 487626,
          "tag_name": "자기관리",
          "bookmarked": 5152772,
          "count": 9895017,
          "grade": 3,
          "change": 0
        },
        {
          "tagId": 6790516,
          "tag_name": "꿀정보",
          "bookmarked": 7201143,
          "count": 6108552,
          "grade": 10,
          "change": 11
        },
        {
          "tagId": 3268746,
          "tag_name": "여행팁",
          "bookmarked": 592881,
          "count": 9947549,
          "grade": 9,
          "change": -2
        },
        {
          "tagId": 9652110,
          "tag_name": "핫아이템",
          "bookmarked": 5440574,
          "count": 8987255,
          "grade": 11,
          "change": -7
        },
        {
          "tagId": 7724125,
          "tag_name": "공부비법",
          "bookmarked": 8407184,
          "count": 2061683,
          "grade": 10,
          "change": 15
        },
        {
          "tagId": 5180552,
          "tag_name": "취업정보",
          "bookmarked": 7699420,
          "count": 2133848,
          "grade": 4,
          "change": 3
        },
        {
          "tagId": 9375815,
          "tag_name": "창업정보",
          "bookmarked": 3901958,
          "count": 317588,
          "grade": 8,
          "change": 12
        },
        {
          "tagId": 5882355,
          "tag_name": "트렌드",
          "bookmarked": 2433930,
          "count": 6811400,
          "grade": 9,
          "change": 3
        },
        {
          "tagId": 7885176,
          "tag_name": "생활꿀팁",
          "bookmarked": 238735,
          "count": 7528672,
          "grade": 1,
          "change": -5
        },
        {
          "tagId": 5114369,
          "tag_name": "새로운정보",
          "bookmarked": 5381543,
          "count": 7131875,
          "grade": 2,
          "change": -1
        },
        {
          "tagId": 638358,
          "tag_name": "유익한팁",
          "bookmarked": 3460731,
          "count": 9629388,
          "grade": 6,
          "change": 16
        },
        {
          "tagId": 8677574,
          "tag_name": "시간관리",
          "bookmarked": 4262404,
          "count": 3598322,
          "grade": 8,
          "change": 10
        },
        {
          "tagId": 8160234,
          "tag_name": "성공습관",
          "bookmarked": 2253146,
          "count": 4444424,
          "grade": 11,
          "change": -5
        },
        {
          "tagId": 1423944,
          "tag_name": "인생팁",
          "bookmarked": 1839150,
          "count": 4578354,
          "grade": 1,
          "change": -7
        },
        {
          "tagId": 5908906,
          "tag_name": "효율성향상",
          "bookmarked": 8426309,
          "count": 3904768,
          "grade": 5,
          "change": 18
        },
        {
          "tagId": 4867188,
          "tag_name": "건강관리",
          "bookmarked": 9638543,
          "count": 9545662,
          "grade": 7,
          "change": 8
        },
        {
          "tagId": 9200925,
          "tag_name": "팁공유",
          "bookmarked": 7717298,
          "count": 9629416,
          "grade": 9,
          "change": -20
        },
        {
          "tagId": 9059860,
          "tag_name": "업데이트정보",
          "bookmarked": 4680554,
          "count": 5432244,
          "grade": 11,
          "change": -17
        }
      ]
    }
    '''));
/// 검색결과 - 커뮤니티
SearchTagData fetchSearchCommunityData(String term) {
    TempSearchData foundData = tempSearchScreenData.firstWhere(
            (data) => data.term == term,
        orElse: () => TempSearchData(term: term) // 기본값
    );
    if(foundData.searchCommunityData == null){
        List<Tag> filteredTag = allTag.where((tag){
            return tag.tagName.contains(term) && tag.grade! > 5;
        }).toList();
        return SearchTagData(tags: filteredTag);
    }
    return foundData.searchCommunityData!;
}
SearchTagData searchCommunityData = SearchTagData.fromJson(jsonDecode('''
    {
      "tags": [
        {
          "tagId": 5500584,
          "tag_name": "정보공유",
          "bookmarked": 2260098,
          "count": 6054472,
          "grade": 8
        },
        {
          "tagId": 6483579,
          "tag_name": "꿀팁공유",
          "bookmarked": 1907232,
          "count": 1456826,
          "grade": 10
        },
        {
          "tagId": 7951011,
          "tag_name": "생활정보",
          "bookmarked": 3614974,
          "count": 4657548,
          "grade": 11
        },
        {
          "tagId": 2488542,
          "tag_name": "유용한팁",
          "bookmarked": 3775929,
          "count": 640068,
          "grade": 7
        },
        {
          "tagId": 7615117,
          "tag_name": "건강정보",
          "bookmarked": 1751088,
          "count": 4422214,
          "grade": 6
        },
        {
          "tagId": 714703,
          "tag_name": "노하우",
          "bookmarked": 312407,
          "count": 5254348,
          "grade": 9
        },
        {
          "tagId": 215707,
          "tag_name": "아이디어",
          "bookmarked": 3795284,
          "count": 5623334,
          "grade": 10
        },
        {
          "tagId": 2557334,
          "tag_name": "생활지혜",
          "bookmarked": 8934600,
          "count": 1063798,
          "grade": 11
        },
        {
          "tagId": 5596651,
          "tag_name": "DIY정보",
          "bookmarked": 3209647,
          "count": 2237288,
          "grade": 9
        },
        {
          "tagId": 4223100,
          "tag_name": "유익한정보",
          "bookmarked": 2794107,
          "count": 7819248,
          "grade": 7
        },
        {
          "tagId": 7080658,
          "tag_name": "공유합니다",
          "bookmarked": 6767962,
          "count": 3488927,
          "grade": 8
        },
        {
          "tagId": 9519070,
          "tag_name": "재테크팁",
          "bookmarked": 5339900,
          "count": 1616924,
          "grade": 7
        },
        {
          "tagId": 4857952,
          "tag_name": "경제정보",
          "bookmarked": 6674531,
          "count": 1682886,
          "grade": 6
        },
        {
          "tagId": 2348171,
          "tag_name": "신상정보",
          "bookmarked": 8472470,
          "count": 6828528,
          "grade": 8
        },
        {
          "tagId": 5580618,
          "tag_name": "최신트렌드",
          "bookmarked": 5484617,
          "count": 7964309,
          "grade": 6
        },
        {
          "tagId": 2833521,
          "tag_name": "취미생활",
          "bookmarked": 7578623,
          "count": 2622905,
          "grade": 7
        },
        {
          "tagId": 2461206,
          "tag_name": "자기계발",
          "bookmarked": 3739094,
          "count": 7101079,
          "grade": 10
        },
        {
          "tagId": 7258920,
          "tag_name": "공유팁",
          "bookmarked": 7157341,
          "count": 6396799,
          "grade": 8
        },
        {
          "tagId": 1485554,
          "tag_name": "효율적인삶",
          "bookmarked": 5595206,
          "count": 9024936,
          "grade": 11
        },
        {
          "tagId": 624399,
          "tag_name": "성공팁",
          "bookmarked": 831223,
          "count": 2078251,
          "grade": 7
        },
        {
          "tagId": 2213407,
          "tag_name": "일상공유",
          "bookmarked": 6522985,
          "count": 6053842,
          "grade": 11
        },
        {
          "tagId": 9936855,
          "tag_name": "정보나눔",
          "bookmarked": 2015806,
          "count": 9322703,
          "grade": 8
        },
        {
          "tagId": 487626,
          "tag_name": "자기관리",
          "bookmarked": 5152772,
          "count": 9895017,
          "grade": 9
        },
        {
          "tagId": 6790516,
          "tag_name": "꿀정보",
          "bookmarked": 7201143,
          "count": 6108552,
          "grade": 11
        },
        {
          "tagId": 3268746,
          "tag_name": "여행팁",
          "bookmarked": 592881,
          "count": 9947549,
          "grade": 11
        },
        {
          "tagId": 9652110,
          "tag_name": "핫아이템",
          "bookmarked": 5440574,
          "count": 8987255,
          "grade": 7
        },
        {
          "tagId": 7724125,
          "tag_name": "공부비법",
          "bookmarked": 8407184,
          "count": 2061683,
          "grade": 9
        },
        {
          "tagId": 5180552,
          "tag_name": "취업정보",
          "bookmarked": 7699420,
          "count": 2133848,
          "grade": 8
        },
        {
          "tagId": 9375815,
          "tag_name": "창업정보",
          "bookmarked": 3901958,
          "count": 317588,
          "grade": 11
        },
        {
          "tagId": 5882355,
          "tag_name": "트렌드",
          "bookmarked": 2433930,
          "count": 6811400,
          "grade": 7
        },
        {
          "tagId": 7885176,
          "tag_name": "생활꿀팁",
          "bookmarked": 238735,
          "count": 7528672,
          "grade": 11
        },
        {
          "tagId": 5114369,
          "tag_name": "새로운정보",
          "bookmarked": 5381543,
          "count": 7131875,
          "grade": 10
        },
        {
          "tagId": 638358,
          "tag_name": "유익한팁",
          "bookmarked": 3460731,
          "count": 9629388,
          "grade": 7
        },
        {
          "tagId": 8677574,
          "tag_name": "시간관리",
          "bookmarked": 4262404,
          "count": 3598322,
          "grade": 10
        },
        {
          "tagId": 8160234,
          "tag_name": "성공습관",
          "bookmarked": 2253146,
          "count": 4444424,
          "grade": 6
        },
        {
          "tagId": 1423944,
          "tag_name": "인생팁",
          "bookmarked": 1839150,
          "count": 4578354,
          "grade": 11
        },
        {
          "tagId": 5908906,
          "tag_name": "효율성향상",
          "bookmarked": 8426309,
          "count": 3904768,
          "grade": 6
        },
        {
          "tagId": 4867188,
          "tag_name": "건강관리",
          "bookmarked": 9638543,
          "count": 9545662,
          "grade": 8
        },
        {
          "tagId": 9200925,
          "tag_name": "팁공유",
          "bookmarked": 7717298,
          "count": 9629416,
          "grade": 8
        },
        {
          "tagId": 9059860,
          "tag_name": "업데이트정보",
          "bookmarked": 4680554,
          "count": 5432244,
          "grade": 6
        }
      ]
    }
    '''));
/// 검색결과 - 태그
SearchTagData fetchSearchTagData(String term) {
    TempSearchData foundData = tempSearchScreenData.firstWhere(
            (data) => data.term == term,
        orElse: () => TempSearchData(term: term) // 기본값
    );
    if(foundData.searchTagData == null){
        List<Tag> filteredTag = allTag.where((tag){
            return tag.tagName.contains(term) && tag.grade! < 6;
        }).toList();
        return SearchTagData(tags: filteredTag);
    }
    return foundData.searchTagData!;
}
SearchTagData searchTagData = SearchTagData.fromJson(jsonDecode('''
    {
      "tags": [
        {
          "tagId": 5500584,
          "tag_name": "정보공유",
          "bookmarked": 2260098,
          "count": 6054472,
          "grade": 8
        },
        {
          "tagId": 6483579,
          "tag_name": "꿀팁공유",
          "bookmarked": 1907232,
          "count": 1456826,
          "grade": 10
        },
        {
          "tagId": 7951011,
          "tag_name": "생활정보",
          "bookmarked": 3614974,
          "count": 4657548,
          "grade": 11
        },
        {
          "tagId": 2488542,
          "tag_name": "유용한팁",
          "bookmarked": 3775929,
          "count": 640068,
          "grade": 7
        },
        {
          "tagId": 7615117,
          "tag_name": "건강정보",
          "bookmarked": 1751088,
          "count": 4422214,
          "grade": 6
        },
        {
          "tagId": 714703,
          "tag_name": "노하우",
          "bookmarked": 312407,
          "count": 5254348,
          "grade": 9
        },
        {
          "tagId": 215707,
          "tag_name": "아이디어",
          "bookmarked": 3795284,
          "count": 5623334,
          "grade": 10
        },
        {
          "tagId": 2557334,
          "tag_name": "생활지혜",
          "bookmarked": 8934600,
          "count": 1063798,
          "grade": 11
        },
        {
          "tagId": 5596651,
          "tag_name": "DIY정보",
          "bookmarked": 3209647,
          "count": 2237288,
          "grade": 9
        },
        {
          "tagId": 4223100,
          "tag_name": "유익한정보",
          "bookmarked": 2794107,
          "count": 7819248,
          "grade": 7
        },
        {
          "tagId": 7080658,
          "tag_name": "공유합니다",
          "bookmarked": 6767962,
          "count": 3488927,
          "grade": 8
        },
        {
          "tagId": 9519070,
          "tag_name": "재테크팁",
          "bookmarked": 5339900,
          "count": 1616924,
          "grade": 7
        },
        {
          "tagId": 4857952,
          "tag_name": "경제정보",
          "bookmarked": 6674531,
          "count": 1682886,
          "grade": 6
        },
        {
          "tagId": 2348171,
          "tag_name": "신상정보",
          "bookmarked": 8472470,
          "count": 6828528,
          "grade": 8
        },
        {
          "tagId": 5580618,
          "tag_name": "최신트렌드",
          "bookmarked": 5484617,
          "count": 7964309,
          "grade": 6
        },
        {
          "tagId": 2833521,
          "tag_name": "취미생활",
          "bookmarked": 7578623,
          "count": 2622905,
          "grade": 7
        },
        {
          "tagId": 2461206,
          "tag_name": "자기계발",
          "bookmarked": 3739094,
          "count": 7101079,
          "grade": 10
        },
        {
          "tagId": 7258920,
          "tag_name": "공유팁",
          "bookmarked": 7157341,
          "count": 6396799,
          "grade": 8
        },
        {
          "tagId": 1485554,
          "tag_name": "효율적인삶",
          "bookmarked": 5595206,
          "count": 9024936,
          "grade": 11
        },
        {
          "tagId": 624399,
          "tag_name": "성공팁",
          "bookmarked": 831223,
          "count": 2078251,
          "grade": 7
        },
        {
          "tagId": 2213407,
          "tag_name": "일상공유",
          "bookmarked": 6522985,
          "count": 6053842,
          "grade": 11
        },
        {
          "tagId": 9936855,
          "tag_name": "정보나눔",
          "bookmarked": 2015806,
          "count": 9322703,
          "grade": 8
        },
        {
          "tagId": 487626,
          "tag_name": "자기관리",
          "bookmarked": 5152772,
          "count": 9895017,
          "grade": 9
        },
        {
          "tagId": 6790516,
          "tag_name": "꿀정보",
          "bookmarked": 7201143,
          "count": 6108552,
          "grade": 11
        },
        {
          "tagId": 3268746,
          "tag_name": "여행팁",
          "bookmarked": 592881,
          "count": 9947549,
          "grade": 11
        },
        {
          "tagId": 9652110,
          "tag_name": "핫아이템",
          "bookmarked": 5440574,
          "count": 8987255,
          "grade": 7
        },
        {
          "tagId": 7724125,
          "tag_name": "공부비법",
          "bookmarked": 8407184,
          "count": 2061683,
          "grade": 9
        },
        {
          "tagId": 5180552,
          "tag_name": "취업정보",
          "bookmarked": 7699420,
          "count": 2133848,
          "grade": 8
        },
        {
          "tagId": 9375815,
          "tag_name": "창업정보",
          "bookmarked": 3901958,
          "count": 317588,
          "grade": 11
        },
        {
          "tagId": 5882355,
          "tag_name": "트렌드",
          "bookmarked": 2433930,
          "count": 6811400,
          "grade": 7
        },
        {
          "tagId": 7885176,
          "tag_name": "생활꿀팁",
          "bookmarked": 238735,
          "count": 7528672,
          "grade": 11
        },
        {
          "tagId": 5114369,
          "tag_name": "새로운정보",
          "bookmarked": 5381543,
          "count": 7131875,
          "grade": 10
        },
        {
          "tagId": 638358,
          "tag_name": "유익한팁",
          "bookmarked": 3460731,
          "count": 9629388,
          "grade": 7
        },
        {
          "tagId": 8677574,
          "tag_name": "시간관리",
          "bookmarked": 4262404,
          "count": 3598322,
          "grade": 10
        },
        {
          "tagId": 8160234,
          "tag_name": "성공습관",
          "bookmarked": 2253146,
          "count": 4444424,
          "grade": 6
        },
        {
          "tagId": 1423944,
          "tag_name": "인생팁",
          "bookmarked": 1839150,
          "count": 4578354,
          "grade": 11
        },
        {
          "tagId": 5908906,
          "tag_name": "효율성향상",
          "bookmarked": 8426309,
          "count": 3904768,
          "grade": 6
        },
        {
          "tagId": 4867188,
          "tag_name": "건강관리",
          "bookmarked": 9638543,
          "count": 9545662,
          "grade": 8
        },
        {
          "tagId": 9200925,
          "tag_name": "팁공유",
          "bookmarked": 7717298,
          "count": 9629416,
          "grade": 8
        },
        {
          "tagId": 9059860,
          "tag_name": "업데이트정보",
          "bookmarked": 4680554,
          "count": 5432244,
          "grade": 6
        }
      ]
    }
    '''));
/// 검색결과 - 게시글
PostData fetchSearchPostData(String term) {
    TempSearchData foundData = tempSearchScreenData.firstWhere(
            (data) => data.term == term,
        orElse: () => TempSearchData(term: term) // 기본값
    );
    if(foundData.searchPostData == null){
        List<Post> filteredPost = allPost.where((post){
            return post.title.contains(term) || post.content.toString().contains(term);
        }).toList();
        return PostData(posts: filteredPost);
    }
    return foundData.searchPostData!;
}
PostData searchPostData = PostData.fromJson(jsonDecode('''
    {
      "posts": [
        {
          "post_id": 87291,
          "title": "오늘의 날씨는?",
          "summary": "비가 올 것 같아요. 우산 챙기세요.",
          "comments": 182,
          "like": 521,
          "viewed": 899,
          "createdAt": "2021-04-25T12:34:00.000Z"
        },
        {
          "post_id": 97852,
          "title": "새로운 취미 추천",
          "summary": "요즘 뜨는 취미는 무엇일까요?",
          "comments": 249,
          "like": 783,
          "viewed": 1374,
          "createdAt": "2022-02-15T08:22:00.000Z"
        },
        {
          "post_id": 11237,
          "title": "아침 운동의 중요성",
          "summary": "매일 아침 운동하는 습관!",
          "comments": 321,
          "like": 456,
          "viewed": 1023,
          "createdAt": "2020-09-12T07:40:00.000Z"
        },
        {
          "post_id": 56389,
          "title": "재테크 꿀팁 공유",
          "summary": "소액 투자로 시작하는 재테크",
          "comments": 405,
          "like": 642,
          "viewed": 1845,
          "createdAt": "2023-06-19T15:15:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 23876,
          "title": "여행 준비물 리스트",
          "summary": "꼭 챙겨야 할 필수 아이템들",
          "comments": 92,
          "like": 317,
          "viewed": 744,
          "createdAt": "2021-11-30T09:00:00.000Z"
        },
        {
          "post_id": 46378,
          "title": "추천 영화 리스트",
          "summary": "주말에 보기 좋은 영화들",
          "comments": 533,
          "like": 910,
          "viewed": 2458,
          "createdAt": "2019-07-18T14:10:00.000Z"
        },
        {
          "post_id": 91234,
          "title": "책 읽기의 장점",
          "summary": "매일 책 읽기의 중요성을 알아봅시다.",
          "comments": 67,
          "like": 155,
          "viewed": 481,
          "createdAt": "2020-10-10T18:24:00.000Z"
        },
        {
          "post_id": 66728,
          "title": "반려동물 관리 방법",
          "summary": "강아지 털 관리 팁",
          "comments": 187,
          "like": 259,
          "viewed": 891,
          "createdAt": "2021-08-22T04:05:00.000Z"
        },
        {
          "post_id": 57893,
          "title": "헬스장 추천",
          "summary": "어디 헬스장이 좋은가요?",
          "comments": 200,
          "like": 378,
          "viewed": 1298,
          "createdAt": "2022-01-02T11:45:00.000Z"
        },
        {
          "post_id": 34892,
          "title": "IT 트렌드 분석",
          "summary": "올해 뜨는 IT 기술은?",
          "comments": 450,
          "like": 821,
          "viewed": 2114,
          "createdAt": "2020-02-24T16:18:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 89347,
          "title": "최신 가전제품",
          "summary": "최신 스마트 가전 소개합니다.",
          "comments": 134,
          "like": 452,
          "viewed": 1203,
          "createdAt": "2023-05-14T21:50:00.000Z"
        },
        {
          "post_id": 23901,
          "title": "등산 코스 추천",
          "summary": "가을에 가기 좋은 산",
          "comments": 98,
          "like": 245,
          "viewed": 621,
          "createdAt": "2022-09-21T05:11:00.000Z"
        },
        {
          "post_id": 70483,
          "title": "홈 카페 인테리어",
          "summary": "집에서 즐기는 홈 카페 꾸미기",
          "comments": 301,
          "like": 502,
          "viewed": 1501,
          "createdAt": "2021-03-10T14:55:00.000Z"
        },
        {
          "post_id": 53692,
          "title": "내일의 주식 전망",
          "summary": "주식 시장 분석과 내일의 전망",
          "comments": 775,
          "like": 923,
          "viewed": 3095,
          "createdAt": "2023-02-28T08:40:00.000Z"
        },
        {
          "post_id": 13290,
          "title": "다이어트 식단",
          "summary": "건강한 식단으로 체중 감량하기",
          "comments": 354,
          "like": 620,
          "viewed": 1450,
          "createdAt": "2020-06-17T07:30:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 49723,
          "title": "쇼핑몰 추천",
          "summary": "가성비 좋은 온라인 쇼핑몰 추천",
          "comments": 156,
          "like": 399,
          "viewed": 1084,
          "createdAt": "2019-12-05T03:17:00.000Z"
        },
        {
          "post_id": 89014,
          "title": "내가 사랑하는 음악",
          "summary": "요즘 듣고 있는 음악 추천",
          "comments": 66,
          "like": 289,
          "viewed": 672,
          "createdAt": "2021-07-22T02:02:00.000Z"
        },
        {
          "post_id": 78512,
          "title": "명언 모음집",
          "summary": "삶에 도움이 되는 명언들",
          "comments": 402,
          "like": 703,
          "viewed": 1822,
          "createdAt": "2020-11-12T09:50:00.000Z"
        },
        {
          "post_id": 58329,
          "title": "헬시푸드 레시피",
          "summary": "간단하고 건강한 요리법",
          "comments": 285,
          "like": 563,
          "viewed": 1307,
          "createdAt": "2023-03-23T13:07:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 29387,
          "title": "여행 후기 공유",
          "summary": "최근 다녀온 여행 후기를 남겨요.",
          "comments": 141,
          "like": 329,
          "viewed": 889,
          "createdAt": "2022-05-06T12:14:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 97245,
          "title": "독서 습관 들이기",
          "summary": "하루 10분 독서로 시작하기",
          "comments": 158,
          "like": 487,
          "viewed": 1249,
          "createdAt": "2021-10-18T19:30:00.000Z"
        },
        {
          "post_id": 40982,
          "title": "간단한 운동법",
          "summary": "5분 만에 하는 스트레칭",
          "comments": 72,
          "like": 205,
          "viewed": 654,
          "createdAt": "2023-08-07T17:25:00.000Z"
        },
        {
          "post_id": 89120,
          "title": "요리 초보의 도전",
          "summary": "처음 해본 파스타 요리!",
          "comments": 186,
          "like": 423,
          "viewed": 1140,
          "createdAt": "2019-03-13T05:12:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 67653,
          "title": "매일 아침 루틴",
          "summary": "성공적인 아침 루틴 만들기",
          "comments": 321,
          "like": 612,
          "viewed": 1504,
          "createdAt": "2020-07-29T10:44:00.000Z"
        },
        {
          "post_id": 13987,
          "title": "온라인 클래스 추천",
          "summary": "취미를 배울 수 있는 사이트",
          "comments": 312,
          "like": 581,
          "viewed": 1319,
          "createdAt": "2022-11-02T03:25:00.000Z"
        },
        {
          "post_id": 91208,
          "title": "반려동물 입양",
          "summary": "입양 전 알아야 할 사항들",
          "comments": 128,
          "like": 394,
          "viewed": 1012,
          "createdAt": "2021-06-09T06:20:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 25781,
          "title": "커피 원두 추천",
          "summary": "향과 맛이 좋은 원두 추천",
          "comments": 85,
          "like": 221,
          "viewed": 754,
          "createdAt": "2020-01-15T18:35:00.000Z"
        },
        {
          "post_id": 10987,
          "title": "게임 추천",
          "summary": "요즘 핫한 게임은?",
          "comments": 411,
          "like": 759,
          "viewed": 2023,
          "createdAt": "2019-09-29T13:56:00.000Z"
        },
        {
          "post_id": 78012,
          "title": "자동차 관리 팁",
          "summary": "겨울철 자동차 관리 요령",
          "comments": 142,
          "like": 372,
          "viewed": 936,
          "createdAt": "2022-12-11T20:19:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 47982,
          "title": "집에서 하는 간단 요리",
          "summary": "쉬운 재료로 만드는 요리",
          "comments": 98,
          "like": 310,
          "viewed": 890,
          "createdAt": "2023-07-03T04:12:00.000Z"
        },
        {
          "post_id": 68371,
          "title": "책 추천",
          "summary": "마음의 양식을 채우는 도서",
          "comments": 183,
          "like": 533,
          "viewed": 1211,
          "createdAt": "2021-05-28T09:18:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 29382,
          "title": "공부 자극 글",
          "summary": "열심히 공부하는 법을 배워보세요.",
          "comments": 257,
          "like": 687,
          "viewed": 1589,
          "createdAt": "2022-08-10T14:28:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 47281,
          "title": "의류 쇼핑몰 추천",
          "summary": "저렴하고 트렌디한 의류 추천",
          "comments": 198,
          "like": 489,
          "viewed": 1187,
          "createdAt": "2020-05-05T22:10:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 98237,
          "title": "취미 만들기",
          "summary": "취미로 시작하는 나만의 프로젝트",
          "comments": 223,
          "like": 431,
          "viewed": 1205,
          "createdAt": "2019-01-17T10:55:00.000Z"
        },
        {
          "post_id": 13567,
          "title": "알뜰 쇼핑 팁",
          "summary": "저렴하게 쇼핑하는 방법",
          "comments": 302,
          "like": 675,
          "viewed": 1432,
          "createdAt": "2021-02-13T08:22:00.000Z"
        },
        {
          "post_id": 62589,
          "title": "겨울 스포츠 즐기기",
          "summary": "스키, 스노우보드 즐기는 팁",
          "comments": 109,
          "like": 312,
          "viewed": 819,
          "createdAt": "2022-12-23T05:47:00.000Z"
        },
        {
          "post_id": 32901,
          "title": "맛집 추천",
          "summary": "이번 주말 가볼만한 맛집",
          "comments": 457,
          "like": 801,
          "viewed": 2301,
          "createdAt": "2020-11-27T15:09:00.000Z",
          "imageURL": "https://picsum.photos/200"
        }
      ]
    }
    '''));
/// 검색결과 - 사용자
SearchUserData fetchSearchUserData(String term) {
    TempSearchData foundData = tempSearchScreenData.firstWhere(
            (data) => data.term == term,
        orElse: () => TempSearchData(term: term) // 기본값
    );
    if(foundData.searchUserData == null){
        List<User> filteredUser = allUser.where((user){
            return user.nickname!.contains(term);
        }).toList();
        return SearchUserData(users: filteredUser);
    }
    return foundData.searchUserData!;
}
SearchUserData searchUserData = SearchUserData.fromJson(jsonDecode('''
    {
      "users": [
        {
          "user_id": 67601,
          "nickname": "김민수",
          "comments": 1024,
          "posts": 512,
          "updatedAt": "2023-01-10T14:00:00.000Z"
        },
        {
          "user_id": 67602,
          "nickname": "이영희",
          "comments": 2048,
          "posts": 1024,
          "updatedAt": "2023-01-15T08:30:00.000Z"
        },
        {
          "user_id": 67603,
          "nickname": "박준호",
          "comments": 3072,
          "posts": 2048,
          "updatedAt": "2023-01-20T11:15:00.000Z"
        },
        {
          "user_id": 67604,
          "nickname": "최지민",
          "comments": 1500,
          "posts": 800,
          "updatedAt": "2023-01-25T09:00:00.000Z"
        },
        {
          "user_id": 67605,
          "nickname": "정수빈",
          "comments": 800,
          "posts": 1500,
          "updatedAt": "2023-01-30T15:30:00.000Z"
        },
        {
          "user_id": 67606,
          "nickname": "강서연",
          "comments": 2400,
          "posts": 1900,
          "updatedAt": "2023-02-05T13:20:00.000Z"
        },
        {
          "user_id": 67607,
          "nickname": "임하준",
          "comments": 3200,
          "posts": 2500,
          "updatedAt": "2023-02-10T16:45:00.000Z"
        },
        {
          "user_id": 67608,
          "nickname": "오세훈",
          "comments": 1280,
          "posts": 640,
          "updatedAt": "2023-02-15T12:00:00.000Z"
        },
        {
          "user_id": 67609,
          "nickname": "배수빈",
          "comments": 1900,
          "posts": 860,
          "updatedAt": "2023-02-20T09:30:00.000Z"
        },
        {
          "user_id": 67610,
          "nickname": "윤찬미",
          "comments": 2200,
          "posts": 3000,
          "updatedAt": "2023-02-25T11:10:00.000Z"
        },
        {
          "user_id": 67611,
          "nickname": "서지혜",
          "comments": 1750,
          "posts": 1300,
          "updatedAt": "2023-03-02T14:50:00.000Z"
        },
        {
          "user_id": 67612,
          "nickname": "진호",
          "comments": 400,
          "posts": 1000,
          "updatedAt": "2023-03-07T08:00:00.000Z"
        },
        {
          "user_id": 67613,
          "nickname": "장유진",
          "comments": 3100,
          "posts": 2700,
          "updatedAt": "2023-03-12T18:00:00.000Z"
        },
        {
          "user_id": 67614,
          "nickname": "한상진",
          "comments": 2600,
          "posts": 2100,
          "updatedAt": "2023-03-17T09:45:00.000Z"
        },
        {
          "user_id": 67615,
          "nickname": "송하늘",
          "comments": 900,
          "posts": 750,
          "updatedAt": "2023-03-22T12:20:00.000Z"
        },
        {
          "user_id": 67616,
          "nickname": "이승민",
          "comments": 1500,
          "posts": 1900,
          "updatedAt": "2023-03-27T13:15:00.000Z"
        },
        {
          "user_id": 67617,
          "nickname": "안현수",
          "comments": 1850,
          "posts": 900,
          "updatedAt": "2023-04-01T10:40:00.000Z"
        },
        {
          "user_id": 67618,
          "nickname": "신유정",
          "comments": 2900,
          "posts": 1500,
          "updatedAt": "2023-04-06T11:05:00.000Z"
        },
        {
          "user_id": 67619,
          "nickname": "문주희",
          "comments": 3200,
          "posts": 2000,
          "updatedAt": "2023-04-11T15:30:00.000Z"
        },
        {
          "user_id": 67620,
          "nickname": "허정훈",
          "comments": 1800,
          "posts": 2400,
          "updatedAt": "2023-04-16T16:45:00.000Z"
        },
        {
          "user_id": 67621,
          "nickname": "이재현",
          "comments": 1500,
          "posts": 800,
          "updatedAt": "2023-04-21T09:50:00.000Z"
        },
        {
          "user_id": 67622,
          "nickname": "양지수",
          "comments": 2600,
          "posts": 1400,
          "updatedAt": "2023-04-26T12:30:00.000Z"
        },
        {
          "user_id": 67623,
          "nickname": "차유나",
          "comments": 3000,
          "posts": 1800,
          "updatedAt": "2023-05-01T10:00:00.000Z"
        },
        {
          "user_id": 67624,
          "nickname": "조민호",
          "comments": 1300,
          "posts": 1600,
          "updatedAt": "2023-05-06T17:15:00.000Z"
        },
        {
          "user_id": 67625,
          "nickname": "원서연",
          "comments": 2400,
          "posts": 2200,
          "updatedAt": "2023-05-11T14:30:00.000Z"
        },
        {
          "user_id": 67626,
          "nickname": "곽상우",
          "comments": 2100,
          "posts": 1950,
          "updatedAt": "2023-05-16T13:00:00.000Z"
        },
        {
          "user_id": 67627,
          "nickname": "유하은",
          "comments": 800,
          "posts": 1500,
          "updatedAt": "2023-05-21T12:20:00.000Z"
        },
        {
          "user_id": 67628,
          "nickname": "홍민서",
          "comments": 2900,
          "posts": 2700,
          "updatedAt": "2023-05-26T11:00:00.000Z"
        },
        {
          "user_id": 67629,
          "nickname": "한지민",
          "comments": 1700,
          "posts": 1100,
          "updatedAt": "2023-05-31T10:10:00.000Z"
        },
        {
          "user_id": 67630,
          "nickname": "이도현",
          "comments": 2200,
          "posts": 1300,
          "updatedAt": "2023-06-05T14:40:00.000Z"
        },
        {
          "user_id": 67631,
          "nickname": "김하나",
          "comments": 3600,
          "posts": 3200,
          "updatedAt": "2023-06-10T15:00:00.000Z"
        },
        {
          "user_id": 67632,
          "nickname": "윤서영",
          "comments": 2800,
          "posts": 2100,
          "updatedAt": "2023-06-15T17:30:00.000Z"
        },
        {
          "user_id": 67633,
          "nickname": "주원",
          "comments": 1500,
          "posts": 500,
          "updatedAt": "2023-06-20T08:30:00.000Z"
        },
        {
          "user_id": 67634,
          "nickname": "차진우",
          "comments": 1600,
          "posts": 1000,
          "updatedAt": "2023-06-25T09:00:00.000Z"
        },
        {
          "user_id": 67635,
          "nickname": "배현우",
          "comments": 2200,
          "posts": 1500,
          "updatedAt": "2023-06-30T12:45:00.000Z"
        },
        {
          "user_id": 67636,
          "nickname": "정민",
          "comments": 1400,
          "posts": 700,
          "updatedAt": "2023-07-05T11:15:00.000Z"
        },
        {
          "user_id": 67637,
          "nickname": "이재아",
          "comments": 3000,
          "posts": 1800,
          "updatedAt": "2023-07-10T09:00:00.000Z"
        },
        {
          "user_id": 67638,
          "nickname": "남기훈",
          "comments": 3200,
          "posts": 2100,
          "updatedAt": "2023-07-15T14:00:00.000Z"
        },
        {
          "user_id": 67639,
          "nickname": "정희원",
          "comments": 2800,
          "posts": 2500,
          "updatedAt": "2023-07-20T08:30:00.000Z"
        },
        {
          "user_id": 67640,
          "nickname": "오재현",
          "comments": 1700,
          "posts": 1300,
          "updatedAt": "2023-07-25T12:15:00.000Z"
        },
        {
          "user_id": 67641,
          "nickname": "서현",
          "comments": 1900,
          "posts": 800,
          "updatedAt": "2023-07-30T10:00:00.000Z"
        },
        {
          "user_id": 67642,
          "nickname": "추민재",
          "comments": 1500,
          "posts": 900,
          "updatedAt": "2023-08-04T14:30:00.000Z"
        },
        {
          "user_id": 67643,
          "nickname": "윤다솜",
          "comments": 1200,
          "posts": 1100,
          "updatedAt": "2023-08-09T15:45:00.000Z"
        },
        {
          "user_id": 67644,
          "nickname": "고정훈",
          "comments": 800,
          "posts": 600,
          "updatedAt": "2023-08-14T12:00:00.000Z"
        },
        {
          "user_id": 67645,
          "nickname": "이서준",
          "comments": 2100,
          "posts": 1200,
          "updatedAt": "2023-08-19T09:20:00.000Z"
        },
        {
          "user_id": 67646,
          "nickname": "변영수",
          "comments": 1300,
          "posts": 950,
          "updatedAt": "2023-08-24T10:00:00.000Z"
        },
        {
          "user_id": 67647,
          "nickname": "장세훈",
          "comments": 2400,
          "posts": 2000,
          "updatedAt": "2023-08-29T14:00:00.000Z"
        },
        {
          "user_id": 67648,
          "nickname": "서진",
          "comments": 1900,
          "posts": 850,
          "updatedAt": "2023-09-03T16:30:00.000Z"
        },
        {
          "user_id": 67649,
          "nickname": "배가영",
          "comments": 3000,
          "posts": 1800,
          "updatedAt": "2023-09-08T12:00:00.000Z"
        },
        {
          "user_id": 67650,
          "nickname": "김상호",
          "comments": 1800,
          "posts": 1500,
          "updatedAt": "2023-09-13T11:00:00.000Z"
        }
      ]
    }
    '''));
/// 마이페이지 - 즐겨찾기한 태그
SearchTagData fetchBookmarkedData() {
    List<Tag> filteredTag = allTag.where((tag) {
        return tag.isBookmarked == true;
    }).toList();
    if (filteredTag.isEmpty){
        return SearchTagData(tags: bookmarkedScreenData.tags);
    }
    return SearchTagData(tags: filteredTag);
}
SearchTagData bookmarkedScreenData = SearchTagData.fromJson(jsonDecode('''
    {
      "tags": [
        {
          "tagId": 5500584,
          "tag_name": "정보공유",
          "bookmarked": 2260098,
          "count": 6054472,
          "grade": 8
        },
        {
          "tagId": 6483579,
          "tag_name": "꿀팁공유",
          "bookmarked": 1907232,
          "count": 1456826,
          "grade": 10
        },
        {
          "tagId": 7951011,
          "tag_name": "생활정보",
          "bookmarked": 3614974,
          "count": 4657548,
          "grade": 11
        },
        {
          "tagId": 2488542,
          "tag_name": "유용한팁",
          "bookmarked": 3775929,
          "count": 640068,
          "grade": 7
        },
        {
          "tagId": 7615117,
          "tag_name": "건강정보",
          "bookmarked": 1751088,
          "count": 4422214,
          "grade": 6
        },
        {
          "tagId": 714703,
          "tag_name": "노하우",
          "bookmarked": 312407,
          "count": 5254348,
          "grade": 9
        },
        {
          "tagId": 215707,
          "tag_name": "아이디어",
          "bookmarked": 3795284,
          "count": 5623334,
          "grade": 10
        },
        {
          "tagId": 2557334,
          "tag_name": "생활지혜",
          "bookmarked": 8934600,
          "count": 1063798,
          "grade": 11
        },
        {
          "tagId": 5596651,
          "tag_name": "DIY정보",
          "bookmarked": 3209647,
          "count": 2237288,
          "grade": 9
        },
        {
          "tagId": 4223100,
          "tag_name": "유익한정보",
          "bookmarked": 2794107,
          "count": 7819248,
          "grade": 7
        },
        {
          "tagId": 7080658,
          "tag_name": "공유합니다",
          "bookmarked": 6767962,
          "count": 3488927,
          "grade": 8
        },
        {
          "tagId": 9519070,
          "tag_name": "재테크팁",
          "bookmarked": 5339900,
          "count": 1616924,
          "grade": 7
        },
        {
          "tagId": 4857952,
          "tag_name": "경제정보",
          "bookmarked": 6674531,
          "count": 1682886,
          "grade": 6
        },
        {
          "tagId": 2348171,
          "tag_name": "신상정보",
          "bookmarked": 8472470,
          "count": 6828528,
          "grade": 8
        },
        {
          "tagId": 5580618,
          "tag_name": "최신트렌드",
          "bookmarked": 5484617,
          "count": 7964309,
          "grade": 6
        },
        {
          "tagId": 2833521,
          "tag_name": "취미생활",
          "bookmarked": 7578623,
          "count": 2622905,
          "grade": 7
        },
        {
          "tagId": 2461206,
          "tag_name": "자기계발",
          "bookmarked": 3739094,
          "count": 7101079,
          "grade": 10
        },
        {
          "tagId": 7258920,
          "tag_name": "공유팁",
          "bookmarked": 7157341,
          "count": 6396799,
          "grade": 8
        },
        {
          "tagId": 1485554,
          "tag_name": "효율적인삶",
          "bookmarked": 5595206,
          "count": 9024936,
          "grade": 11
        },
        {
          "tagId": 624399,
          "tag_name": "성공팁",
          "bookmarked": 831223,
          "count": 2078251,
          "grade": 7
        },
        {
          "tagId": 2213407,
          "tag_name": "일상공유",
          "bookmarked": 6522985,
          "count": 6053842,
          "grade": 11
        },
        {
          "tagId": 9936855,
          "tag_name": "정보나눔",
          "bookmarked": 2015806,
          "count": 9322703,
          "grade": 8
        },
        {
          "tagId": 487626,
          "tag_name": "자기관리",
          "bookmarked": 5152772,
          "count": 9895017,
          "grade": 9
        },
        {
          "tagId": 6790516,
          "tag_name": "꿀정보",
          "bookmarked": 7201143,
          "count": 6108552,
          "grade": 11
        },
        {
          "tagId": 3268746,
          "tag_name": "여행팁",
          "bookmarked": 592881,
          "count": 9947549,
          "grade": 11
        },
        {
          "tagId": 9652110,
          "tag_name": "핫아이템",
          "bookmarked": 5440574,
          "count": 8987255,
          "grade": 7
        },
        {
          "tagId": 7724125,
          "tag_name": "공부비법",
          "bookmarked": 8407184,
          "count": 2061683,
          "grade": 9
        },
        {
          "tagId": 5180552,
          "tag_name": "취업정보",
          "bookmarked": 7699420,
          "count": 2133848,
          "grade": 8
        },
        {
          "tagId": 9375815,
          "tag_name": "창업정보",
          "bookmarked": 3901958,
          "count": 317588,
          "grade": 11
        },
        {
          "tagId": 5882355,
          "tag_name": "트렌드",
          "bookmarked": 2433930,
          "count": 6811400,
          "grade": 7
        },
        {
          "tagId": 7885176,
          "tag_name": "생활꿀팁",
          "bookmarked": 238735,
          "count": 7528672,
          "grade": 11
        },
        {
          "tagId": 5114369,
          "tag_name": "새로운정보",
          "bookmarked": 5381543,
          "count": 7131875,
          "grade": 10
        },
        {
          "tagId": 638358,
          "tag_name": "유익한팁",
          "bookmarked": 3460731,
          "count": 9629388,
          "grade": 7
        },
        {
          "tagId": 8677574,
          "tag_name": "시간관리",
          "bookmarked": 4262404,
          "count": 3598322,
          "grade": 10
        },
        {
          "tagId": 8160234,
          "tag_name": "성공습관",
          "bookmarked": 2253146,
          "count": 4444424,
          "grade": 6
        },
        {
          "tagId": 1423944,
          "tag_name": "인생팁",
          "bookmarked": 1839150,
          "count": 4578354,
          "grade": 11
        },
        {
          "tagId": 5908906,
          "tag_name": "효율성향상",
          "bookmarked": 8426309,
          "count": 3904768,
          "grade": 6
        },
        {
          "tagId": 4867188,
          "tag_name": "건강관리",
          "bookmarked": 9638543,
          "count": 9545662,
          "grade": 8
        },
        {
          "tagId": 9200925,
          "tag_name": "팁공유",
          "bookmarked": 7717298,
          "count": 9629416,
          "grade": 8
        },
        {
          "tagId": 9059860,
          "tag_name": "업데이트정보",
          "bookmarked": 4680554,
          "count": 5432244,
          "grade": 6
        }
      ]
    }
    '''));
/// 마이페이지 - 좋아요한 글
PostData fetchLikedData() {
    List<Post> filteredPost = allPost.where((post) {
        return post.isLiked == true;
    }).toList();
    if (filteredPost.isEmpty){
        return likedScreenData;
    }
    return PostData(posts: filteredPost);
}
PostData likedScreenData = PostData.fromJson(jsonDecode('''
    {
      "posts": [
        {
          "post_id": 87291,
          "title": "오늘의 날씨는?",
          "summary": "비가 올 것 같아요. 우산 챙기세요.",
          "comments": 182,
          "like": 521,
          "viewed": 899,
          "createdAt": "2021-04-25T12:34:00.000Z"
        },
        {
          "post_id": 97852,
          "title": "새로운 취미 추천",
          "summary": "요즘 뜨는 취미는 무엇일까요?",
          "comments": 249,
          "like": 783,
          "viewed": 1374,
          "createdAt": "2022-02-15T08:22:00.000Z"
        },
        {
          "post_id": 11237,
          "title": "아침 운동의 중요성",
          "summary": "매일 아침 운동하는 습관!",
          "comments": 321,
          "like": 456,
          "viewed": 1023,
          "createdAt": "2020-09-12T07:40:00.000Z"
        },
        {
          "post_id": 56389,
          "title": "재테크 꿀팁 공유",
          "summary": "소액 투자로 시작하는 재테크",
          "comments": 405,
          "like": 642,
          "viewed": 1845,
          "createdAt": "2023-06-19T15:15:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 23876,
          "title": "여행 준비물 리스트",
          "summary": "꼭 챙겨야 할 필수 아이템들",
          "comments": 92,
          "like": 317,
          "viewed": 744,
          "createdAt": "2021-11-30T09:00:00.000Z"
        },
        {
          "post_id": 46378,
          "title": "추천 영화 리스트",
          "summary": "주말에 보기 좋은 영화들",
          "comments": 533,
          "like": 910,
          "viewed": 2458,
          "createdAt": "2019-07-18T14:10:00.000Z"
        },
        {
          "post_id": 91234,
          "title": "책 읽기의 장점",
          "summary": "매일 책 읽기의 중요성을 알아봅시다.",
          "comments": 67,
          "like": 155,
          "viewed": 481,
          "createdAt": "2020-10-10T18:24:00.000Z"
        },
        {
          "post_id": 66728,
          "title": "반려동물 관리 방법",
          "summary": "강아지 털 관리 팁",
          "comments": 187,
          "like": 259,
          "viewed": 891,
          "createdAt": "2021-08-22T04:05:00.000Z"
        },
        {
          "post_id": 57893,
          "title": "헬스장 추천",
          "summary": "어디 헬스장이 좋은가요?",
          "comments": 200,
          "like": 378,
          "viewed": 1298,
          "createdAt": "2022-01-02T11:45:00.000Z"
        },
        {
          "post_id": 34892,
          "title": "IT 트렌드 분석",
          "summary": "올해 뜨는 IT 기술은?",
          "comments": 450,
          "like": 821,
          "viewed": 2114,
          "createdAt": "2020-02-24T16:18:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 89347,
          "title": "최신 가전제품",
          "summary": "최신 스마트 가전 소개합니다.",
          "comments": 134,
          "like": 452,
          "viewed": 1203,
          "createdAt": "2023-05-14T21:50:00.000Z"
        },
        {
          "post_id": 23901,
          "title": "등산 코스 추천",
          "summary": "가을에 가기 좋은 산",
          "comments": 98,
          "like": 245,
          "viewed": 621,
          "createdAt": "2022-09-21T05:11:00.000Z"
        },
        {
          "post_id": 70483,
          "title": "홈 카페 인테리어",
          "summary": "집에서 즐기는 홈 카페 꾸미기",
          "comments": 301,
          "like": 502,
          "viewed": 1501,
          "createdAt": "2021-03-10T14:55:00.000Z"
        },
        {
          "post_id": 53692,
          "title": "내일의 주식 전망",
          "summary": "주식 시장 분석과 내일의 전망",
          "comments": 775,
          "like": 923,
          "viewed": 3095,
          "createdAt": "2023-02-28T08:40:00.000Z"
        },
        {
          "post_id": 13290,
          "title": "다이어트 식단",
          "summary": "건강한 식단으로 체중 감량하기",
          "comments": 354,
          "like": 620,
          "viewed": 1450,
          "createdAt": "2020-06-17T07:30:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 49723,
          "title": "쇼핑몰 추천",
          "summary": "가성비 좋은 온라인 쇼핑몰 추천",
          "comments": 156,
          "like": 399,
          "viewed": 1084,
          "createdAt": "2019-12-05T03:17:00.000Z"
        },
        {
          "post_id": 89014,
          "title": "내가 사랑하는 음악",
          "summary": "요즘 듣고 있는 음악 추천",
          "comments": 66,
          "like": 289,
          "viewed": 672,
          "createdAt": "2021-07-22T02:02:00.000Z"
        },
        {
          "post_id": 78512,
          "title": "명언 모음집",
          "summary": "삶에 도움이 되는 명언들",
          "comments": 402,
          "like": 703,
          "viewed": 1822,
          "createdAt": "2020-11-12T09:50:00.000Z"
        },
        {
          "post_id": 58329,
          "title": "헬시푸드 레시피",
          "summary": "간단하고 건강한 요리법",
          "comments": 285,
          "like": 563,
          "viewed": 1307,
          "createdAt": "2023-03-23T13:07:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 29387,
          "title": "여행 후기 공유",
          "summary": "최근 다녀온 여행 후기를 남겨요.",
          "comments": 141,
          "like": 329,
          "viewed": 889,
          "createdAt": "2022-05-06T12:14:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 97245,
          "title": "독서 습관 들이기",
          "summary": "하루 10분 독서로 시작하기",
          "comments": 158,
          "like": 487,
          "viewed": 1249,
          "createdAt": "2021-10-18T19:30:00.000Z"
        },
        {
          "post_id": 40982,
          "title": "간단한 운동법",
          "summary": "5분 만에 하는 스트레칭",
          "comments": 72,
          "like": 205,
          "viewed": 654,
          "createdAt": "2023-08-07T17:25:00.000Z"
        },
        {
          "post_id": 89120,
          "title": "요리 초보의 도전",
          "summary": "처음 해본 파스타 요리!",
          "comments": 186,
          "like": 423,
          "viewed": 1140,
          "createdAt": "2019-03-13T05:12:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 67653,
          "title": "매일 아침 루틴",
          "summary": "성공적인 아침 루틴 만들기",
          "comments": 321,
          "like": 612,
          "viewed": 1504,
          "createdAt": "2020-07-29T10:44:00.000Z"
        },
        {
          "post_id": 13987,
          "title": "온라인 클래스 추천",
          "summary": "취미를 배울 수 있는 사이트",
          "comments": 312,
          "like": 581,
          "viewed": 1319,
          "createdAt": "2022-11-02T03:25:00.000Z"
        },
        {
          "post_id": 91208,
          "title": "반려동물 입양",
          "summary": "입양 전 알아야 할 사항들",
          "comments": 128,
          "like": 394,
          "viewed": 1012,
          "createdAt": "2021-06-09T06:20:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 25781,
          "title": "커피 원두 추천",
          "summary": "향과 맛이 좋은 원두 추천",
          "comments": 85,
          "like": 221,
          "viewed": 754,
          "createdAt": "2020-01-15T18:35:00.000Z"
        },
        {
          "post_id": 10987,
          "title": "게임 추천",
          "summary": "요즘 핫한 게임은?",
          "comments": 411,
          "like": 759,
          "viewed": 2023,
          "createdAt": "2019-09-29T13:56:00.000Z"
        },
        {
          "post_id": 78012,
          "title": "자동차 관리 팁",
          "summary": "겨울철 자동차 관리 요령",
          "comments": 142,
          "like": 372,
          "viewed": 936,
          "createdAt": "2022-12-11T20:19:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 47982,
          "title": "집에서 하는 간단 요리",
          "summary": "쉬운 재료로 만드는 요리",
          "comments": 98,
          "like": 310,
          "viewed": 890,
          "createdAt": "2023-07-03T04:12:00.000Z"
        },
        {
          "post_id": 68371,
          "title": "책 추천",
          "summary": "마음의 양식을 채우는 도서",
          "comments": 183,
          "like": 533,
          "viewed": 1211,
          "createdAt": "2021-05-28T09:18:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 29382,
          "title": "공부 자극 글",
          "summary": "열심히 공부하는 법을 배워보세요.",
          "comments": 257,
          "like": 687,
          "viewed": 1589,
          "createdAt": "2022-08-10T14:28:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 47281,
          "title": "의류 쇼핑몰 추천",
          "summary": "저렴하고 트렌디한 의류 추천",
          "comments": 198,
          "like": 489,
          "viewed": 1187,
          "createdAt": "2020-05-05T22:10:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 98237,
          "title": "취미 만들기",
          "summary": "취미로 시작하는 나만의 프로젝트",
          "comments": 223,
          "like": 431,
          "viewed": 1205,
          "createdAt": "2019-01-17T10:55:00.000Z"
        },
        {
          "post_id": 13567,
          "title": "알뜰 쇼핑 팁",
          "summary": "저렴하게 쇼핑하는 방법",
          "comments": 302,
          "like": 675,
          "viewed": 1432,
          "createdAt": "2021-02-13T08:22:00.000Z"
        },
        {
          "post_id": 62589,
          "title": "겨울 스포츠 즐기기",
          "summary": "스키, 스노우보드 즐기는 팁",
          "comments": 109,
          "like": 312,
          "viewed": 819,
          "createdAt": "2022-12-23T05:47:00.000Z"
        },
        {
          "post_id": 32901,
          "title": "맛집 추천",
          "summary": "이번 주말 가볼만한 맛집",
          "comments": 457,
          "like": 801,
          "viewed": 2301,
          "createdAt": "2020-11-27T15:09:00.000Z",
          "imageURL": "https://picsum.photos/200"
        }
      ]
    }
    '''));
/// 마이페이지 - 작성한 글
PostData fetchMyPostData(int userId) {
    List<Post> filteredPost = allPost.where((post) {
        return post.userId == userId;
    }).toList();
    if (filteredPost.isEmpty){
        return likedScreenData;
    }
    return PostData(posts: filteredPost);
}
PostData myPostData = PostData.fromJson(jsonDecode('''
    {
      "posts": [
        {
          "post_id": 87291,
          "title": "오늘의 날씨는?",
          "summary": "비가 올 것 같아요. 우산 챙기세요.",
          "comments": 182,
          "like": 521,
          "viewed": 899,
          "createdAt": "2021-04-25T12:34:00.000Z"
        },
        {
          "post_id": 97852,
          "title": "새로운 취미 추천",
          "summary": "요즘 뜨는 취미는 무엇일까요?",
          "comments": 249,
          "like": 783,
          "viewed": 1374,
          "createdAt": "2022-02-15T08:22:00.000Z"
        },
        {
          "post_id": 11237,
          "title": "아침 운동의 중요성",
          "summary": "매일 아침 운동하는 습관!",
          "comments": 321,
          "like": 456,
          "viewed": 1023,
          "createdAt": "2020-09-12T07:40:00.000Z"
        },
        {
          "post_id": 56389,
          "title": "재테크 꿀팁 공유",
          "summary": "소액 투자로 시작하는 재테크",
          "comments": 405,
          "like": 642,
          "viewed": 1845,
          "createdAt": "2023-06-19T15:15:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 23876,
          "title": "여행 준비물 리스트",
          "summary": "꼭 챙겨야 할 필수 아이템들",
          "comments": 92,
          "like": 317,
          "viewed": 744,
          "createdAt": "2021-11-30T09:00:00.000Z"
        },
        {
          "post_id": 46378,
          "title": "추천 영화 리스트",
          "summary": "주말에 보기 좋은 영화들",
          "comments": 533,
          "like": 910,
          "viewed": 2458,
          "createdAt": "2019-07-18T14:10:00.000Z"
        },
        {
          "post_id": 91234,
          "title": "책 읽기의 장점",
          "summary": "매일 책 읽기의 중요성을 알아봅시다.",
          "comments": 67,
          "like": 155,
          "viewed": 481,
          "createdAt": "2020-10-10T18:24:00.000Z"
        },
        {
          "post_id": 66728,
          "title": "반려동물 관리 방법",
          "summary": "강아지 털 관리 팁",
          "comments": 187,
          "like": 259,
          "viewed": 891,
          "createdAt": "2021-08-22T04:05:00.000Z"
        },
        {
          "post_id": 57893,
          "title": "헬스장 추천",
          "summary": "어디 헬스장이 좋은가요?",
          "comments": 200,
          "like": 378,
          "viewed": 1298,
          "createdAt": "2022-01-02T11:45:00.000Z"
        },
        {
          "post_id": 34892,
          "title": "IT 트렌드 분석",
          "summary": "올해 뜨는 IT 기술은?",
          "comments": 450,
          "like": 821,
          "viewed": 2114,
          "createdAt": "2020-02-24T16:18:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 89347,
          "title": "최신 가전제품",
          "summary": "최신 스마트 가전 소개합니다.",
          "comments": 134,
          "like": 452,
          "viewed": 1203,
          "createdAt": "2023-05-14T21:50:00.000Z"
        },
        {
          "post_id": 23901,
          "title": "등산 코스 추천",
          "summary": "가을에 가기 좋은 산",
          "comments": 98,
          "like": 245,
          "viewed": 621,
          "createdAt": "2022-09-21T05:11:00.000Z"
        },
        {
          "post_id": 70483,
          "title": "홈 카페 인테리어",
          "summary": "집에서 즐기는 홈 카페 꾸미기",
          "comments": 301,
          "like": 502,
          "viewed": 1501,
          "createdAt": "2021-03-10T14:55:00.000Z"
        },
        {
          "post_id": 53692,
          "title": "내일의 주식 전망",
          "summary": "주식 시장 분석과 내일의 전망",
          "comments": 775,
          "like": 923,
          "viewed": 3095,
          "createdAt": "2023-02-28T08:40:00.000Z"
        },
        {
          "post_id": 13290,
          "title": "다이어트 식단",
          "summary": "건강한 식단으로 체중 감량하기",
          "comments": 354,
          "like": 620,
          "viewed": 1450,
          "createdAt": "2020-06-17T07:30:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 49723,
          "title": "쇼핑몰 추천",
          "summary": "가성비 좋은 온라인 쇼핑몰 추천",
          "comments": 156,
          "like": 399,
          "viewed": 1084,
          "createdAt": "2019-12-05T03:17:00.000Z"
        },
        {
          "post_id": 89014,
          "title": "내가 사랑하는 음악",
          "summary": "요즘 듣고 있는 음악 추천",
          "comments": 66,
          "like": 289,
          "viewed": 672,
          "createdAt": "2021-07-22T02:02:00.000Z"
        },
        {
          "post_id": 78512,
          "title": "명언 모음집",
          "summary": "삶에 도움이 되는 명언들",
          "comments": 402,
          "like": 703,
          "viewed": 1822,
          "createdAt": "2020-11-12T09:50:00.000Z"
        },
        {
          "post_id": 58329,
          "title": "헬시푸드 레시피",
          "summary": "간단하고 건강한 요리법",
          "comments": 285,
          "like": 563,
          "viewed": 1307,
          "createdAt": "2023-03-23T13:07:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 29387,
          "title": "여행 후기 공유",
          "summary": "최근 다녀온 여행 후기를 남겨요.",
          "comments": 141,
          "like": 329,
          "viewed": 889,
          "createdAt": "2022-05-06T12:14:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 97245,
          "title": "독서 습관 들이기",
          "summary": "하루 10분 독서로 시작하기",
          "comments": 158,
          "like": 487,
          "viewed": 1249,
          "createdAt": "2021-10-18T19:30:00.000Z"
        },
        {
          "post_id": 40982,
          "title": "간단한 운동법",
          "summary": "5분 만에 하는 스트레칭",
          "comments": 72,
          "like": 205,
          "viewed": 654,
          "createdAt": "2023-08-07T17:25:00.000Z"
        },
        {
          "post_id": 89120,
          "title": "요리 초보의 도전",
          "summary": "처음 해본 파스타 요리!",
          "comments": 186,
          "like": 423,
          "viewed": 1140,
          "createdAt": "2019-03-13T05:12:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 67653,
          "title": "매일 아침 루틴",
          "summary": "성공적인 아침 루틴 만들기",
          "comments": 321,
          "like": 612,
          "viewed": 1504,
          "createdAt": "2020-07-29T10:44:00.000Z"
        },
        {
          "post_id": 13987,
          "title": "온라인 클래스 추천",
          "summary": "취미를 배울 수 있는 사이트",
          "comments": 312,
          "like": 581,
          "viewed": 1319,
          "createdAt": "2022-11-02T03:25:00.000Z"
        },
        {
          "post_id": 91208,
          "title": "반려동물 입양",
          "summary": "입양 전 알아야 할 사항들",
          "comments": 128,
          "like": 394,
          "viewed": 1012,
          "createdAt": "2021-06-09T06:20:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 25781,
          "title": "커피 원두 추천",
          "summary": "향과 맛이 좋은 원두 추천",
          "comments": 85,
          "like": 221,
          "viewed": 754,
          "createdAt": "2020-01-15T18:35:00.000Z"
        },
        {
          "post_id": 10987,
          "title": "게임 추천",
          "summary": "요즘 핫한 게임은?",
          "comments": 411,
          "like": 759,
          "viewed": 2023,
          "createdAt": "2019-09-29T13:56:00.000Z"
        },
        {
          "post_id": 78012,
          "title": "자동차 관리 팁",
          "summary": "겨울철 자동차 관리 요령",
          "comments": 142,
          "like": 372,
          "viewed": 936,
          "createdAt": "2022-12-11T20:19:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 47982,
          "title": "집에서 하는 간단 요리",
          "summary": "쉬운 재료로 만드는 요리",
          "comments": 98,
          "like": 310,
          "viewed": 890,
          "createdAt": "2023-07-03T04:12:00.000Z"
        },
        {
          "post_id": 68371,
          "title": "책 추천",
          "summary": "마음의 양식을 채우는 도서",
          "comments": 183,
          "like": 533,
          "viewed": 1211,
          "createdAt": "2021-05-28T09:18:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 29382,
          "title": "공부 자극 글",
          "summary": "열심히 공부하는 법을 배워보세요.",
          "comments": 257,
          "like": 687,
          "viewed": 1589,
          "createdAt": "2022-08-10T14:28:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 47281,
          "title": "의류 쇼핑몰 추천",
          "summary": "저렴하고 트렌디한 의류 추천",
          "comments": 198,
          "like": 489,
          "viewed": 1187,
          "createdAt": "2020-05-05T22:10:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 98237,
          "title": "취미 만들기",
          "summary": "취미로 시작하는 나만의 프로젝트",
          "comments": 223,
          "like": 431,
          "viewed": 1205,
          "createdAt": "2019-01-17T10:55:00.000Z"
        },
        {
          "post_id": 13567,
          "title": "알뜰 쇼핑 팁",
          "summary": "저렴하게 쇼핑하는 방법",
          "comments": 302,
          "like": 675,
          "viewed": 1432,
          "createdAt": "2021-02-13T08:22:00.000Z"
        },
        {
          "post_id": 62589,
          "title": "겨울 스포츠 즐기기",
          "summary": "스키, 스노우보드 즐기는 팁",
          "comments": 109,
          "like": 312,
          "viewed": 819,
          "createdAt": "2022-12-23T05:47:00.000Z"
        },
        {
          "post_id": 32901,
          "title": "맛집 추천",
          "summary": "이번 주말 가볼만한 맛집",
          "comments": 457,
          "like": 801,
          "viewed": 2301,
          "createdAt": "2020-11-27T15:09:00.000Z",
          "imageURL": "https://picsum.photos/200"
        }
      ]
    }
    '''));
/// 마이페이지 - 작성한 댓글
CommentData fetchMyCommentData(int userId) {
    List<Comment> filteredComment = allComment.where((comment) {
        return comment.userId == userId;
    }).toList();
    if (filteredComment.isEmpty){
        return myCommentData;
    }
    return CommentData(comments: filteredComment);
}
void toggleIsLikedComment(int commentId) {
    // allComment 리스트에서 commentId와 일치하는 comment의 인덱스를 찾음
    int commentIndex = allComment.indexWhere((comment) => comment.commentId == commentId);
    if (commentIndex != -1) {
        // 인덱스가 유효하면 해당 태그의 likes를 변경하고 isLiked 값을 반전시킨 새 객체로 저장
        allComment[commentIndex] = allComment[commentIndex].toggleIsLiked();
    }
}
CommentData myCommentData = CommentData.fromJson(jsonDecode('''
    {
      "comments": [
        {
          "comment_id": 10001,
          "user_id": 67601,
          "nickname": "김민수",
          "contents": "이 글 정말 유익하네요!",
          "likes": 15,
          "isLiked": false,
          "updatedAt": "2024-09-01T10:00:00.000Z"
        },
        {
          "comment_id": 10002,
          "user_id": 67602,
          "nickname": "이영희",
          "contents": "이런 내용은 처음 들어봐요.",
          "likes": 22,
          "isLiked": true,
          "updatedAt": "2024-09-02T12:30:00.000Z"
        },
        {
          "comment_id": 10003,
          "user_id": 67603,
          "nickname": "박준호",
          "contents": "좋은 정보 감사합니다!",
          "likes": 10,
          "isLiked": false,
          "updatedAt": "2024-09-03T14:15:00.000Z"
        },
        {
          "comment_id": 10004,
          "user_id": 67604,
          "nickname": "최지민",
          "contents": "실제로 해보니 더 좋은 것 같아요!",
          "likes": 5,
          "isLiked": false,
          "updatedAt": "2024-09-04T08:45:00.000Z"
        },
        {
          "comment_id": 10005,
          "user_id": 67605,
          "nickname": "정수빈",
          "contents": "다시 한번 읽어봐야겠네요.",
          "likes": 3,
          "isLiked": false,
          "updatedAt": "2024-09-05T16:20:00.000Z"
        },
        {
          "comment_id": 10006,
          "user_id": 67606,
          "nickname": "강서연",
          "contents": "추천해주셔서 감사합니다!",
          "likes": 18,
          "isLiked": true,
          "updatedAt": "2024-09-06T11:35:00.000Z"
        },
        {
          "comment_id": 10007,
          "user_id": 67607,
          "nickname": "임하준",
          "contents": "다음에도 이런 글 부탁드립니다.",
          "likes": 12,
          "isLiked": false,
          "updatedAt": "2024-09-07T09:50:00.000Z"
        },
        {
          "comment_id": 10008,
          "user_id": 67608,
          "nickname": "오세훈",
          "contents": "사실 이 주제가 꽤 중요해요.",
          "likes": 7,
          "isLiked": false,
          "updatedAt": "2024-09-08T15:20:00.000Z"
        },
        {
          "comment_id": 10009,
          "user_id": 67609,
          "nickname": "배수빈",
          "contents": "읽기 쉽고 좋네요!",
          "likes": 11,
          "isLiked": true,
          "updatedAt": "2024-09-09T17:30:00.000Z"
        },
        {
          "comment_id": 10010,
          "user_id": 67610,
          "nickname": "윤찬미",
          "contents": "내용이 더 많으면 좋겠어요.",
          "likes": 8,
          "isLiked": false,
          "updatedAt": "2024-09-10T10:10:00.000Z"
        },
        {
          "comment_id": 10011,
          "user_id": 67611,
          "nickname": "서지혜",
          "contents": "아주 도움이 되었습니다.",
          "likes": 9,
          "isLiked": false,
          "updatedAt": "2024-09-11T14:00:00.000Z"
        },
        {
          "comment_id": 10012,
          "user_id": 67612,
          "nickname": "진호",
          "contents": "내용이 마음에 드네요!",
          "likes": 4,
          "isLiked": true,
          "updatedAt": "2024-09-12T12:45:00.000Z"
        },
        {
          "comment_id": 10013,
          "user_id": 67613,
          "nickname": "장유진",
          "contents": "다음 주제는 뭐가 될까요?",
          "likes": 6,
          "isLiked": false,
          "updatedAt": "2024-09-13T11:10:00.000Z"
        },
        {
          "comment_id": 10014,
          "user_id": 67614,
          "nickname": "한상진",
          "contents": "재미있는 주제네요.",
          "likes": 5,
          "isLiked": false,
          "updatedAt": "2024-09-14T08:30:00.000Z"
        },
        {
          "comment_id": 10015,
          "user_id": 67615,
          "nickname": "송하늘",
          "contents": "좋은 글이에요!",
          "likes": 20,
          "isLiked": true,
          "updatedAt": "2024-09-15T13:15:00.000Z"
        },
        {
          "comment_id": 10016,
          "user_id": 67616,
          "nickname": "이승민",
          "contents": "이런 정보가 필요했어요.",
          "likes": 17,
          "isLiked": false,
          "updatedAt": "2024-09-16T09:50:00.000Z"
        },
        {
          "comment_id": 10017,
          "user_id": 67617,
          "nickname": "안현수",
          "contents": "한 번 더 생각해봐야겠네요.",
          "likes": 2,
          "isLiked": false,
          "updatedAt": "2024-09-17T10:45:00.000Z"
        },
        {
          "comment_id": 10018,
          "user_id": 67618,
          "nickname": "신유정",
          "contents": "정말 훌륭한 글입니다!",
          "likes": 25,
          "isLiked": true,
          "updatedAt": "2024-09-18T11:05:00.000Z"
        },
        {
          "comment_id": 10019,
          "user_id": 67619,
          "nickname": "문주희",
          "contents": "다양한 의견이 있군요.",
          "likes": 12,
          "isLiked": false,
          "updatedAt": "2024-09-19T13:25:00.000Z"
        },
        {
          "comment_id": 10020,
          "user_id": 67620,
          "nickname": "허정훈",
          "contents": "좋은 정보 감사합니다!",
          "likes": 18,
          "isLiked": false,
          "updatedAt": "2024-09-20T14:10:00.000Z"
        },
        {
          "comment_id": 10021,
          "user_id": 67621,
          "nickname": "이재현",
          "contents": "이런 주제는 항상 흥미로워요.",
          "likes": 10,
          "isLiked": true,
          "updatedAt": "2024-09-21T15:40:00.000Z"
        },
        {
          "comment_id": 10022,
          "user_id": 67622,
          "nickname": "양지수",
          "contents": "한번 더 읽어보세요!",
          "likes": 3,
          "isLiked": false,
          "updatedAt": "2024-09-22T12:00:00.000Z"
        },
        {
          "comment_id": 10023,
          "user_id": 67623,
          "nickname": "차유나",
          "contents": "참고가 많이 되었어요.",
          "likes": 14,
          "isLiked": false,
          "updatedAt": "2024-09-23T11:35:00.000Z"
        },
        {
          "comment_id": 10024,
          "user_id": 67624,
          "nickname": "조민호",
          "contents": "좋은 자료 감사합니다.",
          "likes": 8,
          "isLiked": true,
          "updatedAt": "2024-09-24T13:00:00.000Z"
        },
        {
          "comment_id": 10025,
          "user_id": 67625,
          "nickname": "원서연",
          "contents": "유익한 내용이네요!",
          "likes": 16,
          "isLiked": false,
          "updatedAt": "2024-09-25T09:15:00.000Z"
        },
        {
          "comment_id": 10026,
          "user_id": 67626,
          "nickname": "백하늘",
          "contents": "읽어보니 정말 좋습니다.",
          "likes": 11,
          "isLiked": false,
          "updatedAt": "2024-09-26T10:50:00.000Z"
        },
        {
          "comment_id": 10027,
          "user_id": 67627,
          "nickname": "이도현",
          "contents": "다양한 시각이 필요해요.",
          "likes": 7,
          "isLiked": true,
          "updatedAt": "2024-09-27T08:20:00.000Z"
        },
        {
          "comment_id": 10028,
          "user_id": 67628,
          "nickname": "윤소희",
          "contents": "아주 흥미로운 주제입니다!",
          "likes": 5,
          "isLiked": false,
          "updatedAt": "2024-09-28T15:30:00.000Z"
        },
        {
          "comment_id": 10029,
          "user_id": 67629,
          "nickname": "김다은",
          "contents": "감사합니다. 다음 글도 기대할게요.",
          "likes": 21,
          "isLiked": true,
          "updatedAt": "2024-09-29T14:40:00.000Z"
        },
        {
          "comment_id": 10030,
          "user_id": 67630,
          "nickname": "허재훈",
          "contents": "글이 너무 좋네요!",
          "likes": 9,
          "isLiked": false,
          "updatedAt": "2024-09-30T10:30:00.000Z"
        },
        {
          "comment_id": 10031,
          "user_id": 67631,
          "nickname": "강민정",
          "contents": "정말 흥미롭습니다.",
          "likes": 13,
          "isLiked": false,
          "updatedAt": "2024-10-01T12:55:00.000Z"
        },
        {
          "comment_id": 10032,
          "user_id": 67632,
          "nickname": "전진우",
          "contents": "더 많은 글 부탁드립니다!",
          "likes": 6,
          "isLiked": true,
          "updatedAt": "2024-10-02T11:25:00.000Z"
        },
        {
          "comment_id": 10033,
          "user_id": 67633,
          "nickname": "한별",
          "contents": "주제에 대한 생각을 나누고 싶어요.",
          "likes": 8,
          "isLiked": false,
          "updatedAt": "2024-10-03T14:20:00.000Z"
        },
        {
          "comment_id": 10034,
          "user_id": 67634,
          "nickname": "오하늘",
          "contents": "읽는 재미가 있네요!",
          "likes": 10,
          "isLiked": false,
          "updatedAt": "2024-10-04T09:40:00.000Z"
        },
        {
          "comment_id": 10035,
          "user_id": 67635,
          "nickname": "홍지수",
          "contents": "잘 읽었습니다. 감사해요!",
          "likes": 12,
          "isLiked": true,
          "updatedAt": "2024-10-05T10:10:00.000Z"
        },
        {
          "comment_id": 10036,
          "user_id": 67636,
          "nickname": "장서준",
          "contents": "이런 정보가 있었군요.",
          "likes": 4,
          "isLiked": false,
          "updatedAt": "2024-10-06T12:00:00.000Z"
        },
        {
          "comment_id": 10037,
          "user_id": 67637,
          "nickname": "이수현",
          "contents": "읽고 나니 유익한 것 같아요.",
          "likes": 15,
          "isLiked": true,
          "updatedAt": "2024-10-07T11:45:00.000Z"
        },
        {
          "comment_id": 10038,
          "user_id": 67638,
          "nickname": "유태오",
          "contents": "내용이 명쾌하네요.",
          "likes": 9,
          "isLiked": false,
          "updatedAt": "2024-10-08T14:20:00.000Z"
        },
        {
          "comment_id": 10039,
          "user_id": 67639,
          "nickname": "한진수",
          "contents": "더 많은 정보 부탁드려요.",
          "likes": 11,
          "isLiked": true,
          "updatedAt": "2024-10-09T13:30:00.000Z"
        },
        {
          "comment_id": 10040,
          "user_id": 67640,
          "nickname": "최유나",
          "contents": "좋은 주제라 생각합니다.",
          "likes": 19,
          "isLiked": false,
          "updatedAt": "2024-10-10T12:10:00.000Z"
        },
        {
          "comment_id": 10041,
          "user_id": 67641,
          "nickname": "권해리",
          "contents": "이런 글을 많이 써주세요!",
          "likes": 16,
          "isLiked": true,
          "updatedAt": "2024-10-11T10:30:00.000Z"
        },
        {
          "comment_id": 10042,
          "user_id": 67642,
          "nickname": "윤상현",
          "contents": "좋은 생각입니다. 동의해요.",
          "likes": 14,
          "isLiked": false,
          "updatedAt": "2024-10-12T09:50:00.000Z"
        },
        {
          "comment_id": 10043,
          "user_id": 67643,
          "nickname": "김서영",
          "contents": "재미있는 글입니다. 계속 써주세요.",
          "likes": 5,
          "isLiked": false,
          "updatedAt": "2024-10-13T11:10:00.000Z"
        },
        {
          "comment_id": 10044,
          "user_id": 67644,
          "nickname": "박지우",
          "contents": "흥미로운 주제네요.",
          "likes": 8,
          "isLiked": true,
          "updatedAt": "2024-10-14T12:30:00.000Z"
        },
        {
          "comment_id": 10045,
          "user_id": 67645,
          "nickname": "정하늘",
          "contents": "감사합니다. 기대하겠습니다!",
          "likes": 12,
          "isLiked": false,
          "updatedAt": "2024-10-15T14:40:00.000Z"
        },
        {
          "comment_id": 10046,
          "user_id": 67646,
          "nickname": "이하늘",
          "contents": "내용이 좋네요. 잘 읽었습니다.",
          "likes": 7,
          "isLiked": false,
          "updatedAt": "2024-10-16T10:00:00.000Z"
        },
        {
          "comment_id": 10047,
          "user_id": 67647,
          "nickname": "장태연",
          "contents": "훌륭한 정보입니다. 감사합니다.",
          "likes": 15,
          "isLiked": true,
          "updatedAt": "2024-10-17T09:15:00.000Z"
        },
        {
          "comment_id": 10048,
          "user_id": 67648,
          "nickname": "윤수아",
          "contents": "더 많은 정보 공유해주세요.",
          "likes": 11,
          "isLiked": false,
          "updatedAt": "2024-10-18T11:25:00.000Z"
        },
        {
          "comment_id": 10049,
          "user_id": 67649,
          "nickname": "최성민",
          "contents": "매우 유익한 내용이네요!",
          "likes": 20,
          "isLiked": true,
          "updatedAt": "2024-10-19T12:35:00.000Z"
        }
      ]
    }
    '''));