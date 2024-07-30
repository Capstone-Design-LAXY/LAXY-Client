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
