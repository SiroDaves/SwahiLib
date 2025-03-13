String progressDesc(int value) {
  if (value <= 5) {
    return 'Inapakia maneno (words) 16,641 ...';
  } else if (value <= 10) {
    return 'Inapakia maneno ...';
  } else if (value <= 20) {
    return 'Kuwa mvumilivu ...';
  } else if (value <= 35) {
    return 'Mvumilivu hula mbivu ...';
  } else if (value <= 50) {
    return 'Kama una haraka, shuka ukimbie ...';
  } else if (value <= 75) {
    return 'Asante kwa uvumilivu wako!';
  } else if (value <= 85) {
    return 'Hatimaye';
  } else if (value <= 90) {
    return 'Inapakia maneno ...';
  } else if (value <= 95) {
    return 'Karibu tunamalizia';
  } else {
    return 'Inapakia maneno (words)';
  }
}
