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
    Post(postId: 982347, title: "[iOS 18] 새로생긴 iOS 18의 기능들 요약 정리", userId: 451927, nickname: "꼬부7I", tags: [Tag(tagId: 3765, tagName: "Flutter", grade: 1), Tag(tagId: 5432, tagName: "API연동", grade: 5), Tag(tagId: 8907, tagName: "개발팁", grade: 11)], content: [
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
    ], imageURL: "https://cafeptthumb-phinf.pstatic.net/MjAyNDA5MTdfMTU0/MDAxNzI2NTE2MDg1NTk5.M_iay-1R8pS0EJ-gByASWK3uIvlzsAgwiOwe2q3Qn0kg.DwXRVt7bVLCKq-b6RdxpGVeMAMNDgvNSA5C8VC1O1eUg.JPEG/Generic-iOS-18-Feature-Real-Mock.jpg?type=w1600", updatedAt: DateTime.parse("2024-09-22T14:05:00.000Z"), isLiked: true, like: 483),
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
];
List<Comment> allComment = [
    Comment(commentId: 125837, userId: 672394, postId: 982347, nickname: "CHUYA", contents: "깔끔한 정리 감사합니다! \\n 제어센터는 이것저것 커스텀이 가능해진건 너무 좋은데 데이터칸이 사분할 된건 너무 불편해서 별로에요 ㅠ 이 부분까지 완벽하게 커스텀이 가능하면 참 좋을 것 같은데...", likes: 102, isLiked: true, updatedAt: DateTime.parse("2024-09-22T15:30:00.000Z")),
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
];

/// 메인 - 마인드맵
List<OrbitData> mindmapData = [
  OrbitData.fromJson(jsonDecode('{"uId": 123123123, "orbit": [{"primary": {"tId": 20000001, "grade": 10, "tagName": "아이폰"}, "satellites": [{"tId": 20000002, "grade": 5, "tagName": "13pro중고"}, {"tId": 20000003, "grade": 7, "tagName": "애플케어"}, {"tId": 20000004, "grade": 2, "tagName": "애플워치"}, {"tId": 20000005, "grade": 8, "tagName": "에어팟프로2"}]}, {"primary": {"tId": 20000006, "grade": 11, "tagName": "손흥민"}, "satellites": [{"tId": 20000007, "grade": 11, "tagName": "토트넘"}, {"tId": 20000008, "grade": 1, "tagName": "축구"}, {"tId": 20000008, "grade": 4, "tagName": "계약"}]}, {"primary": {"tId": 20000009, "grade": 4, "tagName": "흑백요리사"}, "satellites": [{"tId": 20000010, "grade": 10, "tagName": "백종원"}, {"tId": 20000010, "grade": 8, "tagName": "안성진"}]}, {"primary": {"tId": 20000001, "grade": 9, "tagName": "롤드컵"}, "satellites": [{"tId": 20000002, "grade": 6, "tagName": "한화"}, {"tId": 20000003, "grade": 7, "tagName": "티원"}, {"tId": 20000004, "grade": 7, "tagName": "젠지"}, {"tId": 20000005, "grade": 9, "tagName": "딮기"}]}]}')),
  OrbitData.fromJson(jsonDecode('{"uId": 123123123, "orbit": [{"primary": {"tId": 10000001, "grade": 9, "tagName": "자격증"}, "satellites": [{"tId": 10000002, "grade": 5, "tagName": "정처기"}, {"tId": 10000003, "grade": 7, "tagName": "토익"}, {"tId": 10000004, "grade": 2, "tagName": "SQLD"}, {"tId": 10000005, "grade": 8, "tagName": "Qnet"}]}, {"primary": {"tId": 10000006, "grade": 6, "tagName": "인공지능"}, "satellites": [{"tId": 10000007, "grade": 11, "tagName": "GPT"}, {"tId": 10000008, "grade": 1, "tagName": "빅데이터"}]}, {"primary": {"tId": 10000009, "grade": 4, "tagName": "소금빵"}, "satellites": [{"tId": 10000010, "grade": 10, "tagName": "빵"}]}]}')),
  OrbitData.fromJson(jsonDecode('{"uId": 123123123, "orbit": [{"primary": {"tId": 20000001, "grade": 10, "tagName": "아이폰"}, "satellites": [{"tId": 20000002, "grade": 5, "tagName": "13pro중고"}, {"tId": 20000003, "grade": 7, "tagName": "애플케어"}, {"tId": 20000004, "grade": 2, "tagName": "애플워치"}, {"tId": 20000005, "grade": 8, "tagName": "에어팟프로2"}]}, {"primary": {"tId": 20000001, "grade": 10, "tagName": "아이폰"}, "satellites": [{"tId": 20000002, "grade": 5, "tagName": "13pro중고"}, {"tId": 20000003, "grade": 7, "tagName": "애플케어"}, {"tId": 20000004, "grade": 2, "tagName": "애플워치"}, {"tId": 20000005, "grade": 8, "tagName": "에어팟프로2"}]}, {"primary": {"tId": 20000006, "grade": 11, "tagName": "손흥민"}, "satellites": [{"tId": 20000007, "grade": 11, "tagName": "토트넘"}, {"tId": 20000008, "grade": 1, "tagName": "축구"}, {"tId": 20000008, "grade": 4, "tagName": "계약"}]}, {"primary": {"tId": 20000009, "grade": 4, "tagName": "흑백요리사"}, "satellites": [{"tId": 20000010, "grade": 10, "tagName": "백종원"}, {"tId": 20000010, "grade": 8, "tagName": "안성진"}]}, {"primary": {"tId": 20000001, "grade": 9, "tagName": "롤드컵"}, "satellites": [{"tId": 20000002, "grade": 6, "tagName": "한화"}, {"tId": 20000003, "grade": 7, "tagName": "티원"}, {"tId": 20000004, "grade": 7, "tagName": "젠지"}, {"tId": 20000005, "grade": 9, "tagName": "딮기"}]}]}')),
];
/// 트랜드 - 메인
RankData trendsMainData = RankData.fromJson(jsonDecode('''
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
/// 트랜드 - 커뮤니티
CommunityRankData trendsCommunityData = CommunityRankData.fromJson(jsonDecode('''
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
/// 트랜드 - 전체
PostData trendsPostData = PostData.fromJson(jsonDecode('''
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
/// 드로워
DrawerData customDrawerData = DrawerData.fromJson(jsonDecode('''
      {
        "bookmarked": [
          {"tagId": 44327, "tag_name": "결혼", "count": 1940, "grade": 3},
          {"tagId": 859603, "tag_name": "팩", "count": 2732, "grade": 5},
          {"tagId": 13217, "tag_name": "감", "count": 7988, "grade": 7},
          {"tagId": 656626, "tag_name": "색종", "count": 43766, "grade": 9},
          {"tagId": 181591, "tag_name": "앵무", "count": 80723, "grade": 11}
        ],
        "recommended": [
          {"tagId": 156313, "tag_name": "공기청정기", "count": 63285, "grade": 3},
          {"tagId": 120401, "tag_name": "대중교통", "count": 46609, "grade": 5},
          {"tagId": 605716, "tag_name": "크리스마스", "count": 2559411, "grade": 7},
          {"tagId": 835111, "tag_name": "게", "count": 4186504, "grade": 9},
          {"tagId": 282296, "tag_name": "가상화폐", "count": 6823010, "grade": 11}
        ]
      }
    '''));
/// 태그 스크린
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
CommunityData communityScreenData = CommunityData.fromJson(jsonDecode('''
    {
      "is_bookmarked": false
    }
    '''));
/// 커뮤니티 메인
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