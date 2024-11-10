main() {
  String s = "dvdf";
  print(lengthOfLongestSubstring(s));
}

int lengthOfLongestSubstring(String s) {
  Set<String> charSet = <String>{};
  int max = 0;
  for (int j = 0; j < s.length; j++) {
    bool isSuccess = true;
    for (int i = j; (i < s.length) && isSuccess; i++) {
      int lengthOld = charSet.length;
      charSet.add(s[i]);
      int lengthNew = charSet.length;
      if (lengthNew == lengthOld) {
        max = max > lengthNew ? max : lengthNew;
        charSet.clear();
        isSuccess = false;
      }
    }
  }
  max = max > charSet.length ? max : charSet.length;
  return max;
}