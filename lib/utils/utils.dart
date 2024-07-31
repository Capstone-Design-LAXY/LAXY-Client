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
