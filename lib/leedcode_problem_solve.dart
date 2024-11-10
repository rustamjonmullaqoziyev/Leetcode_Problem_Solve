import 'dart:collection';
import 'dart:ffi';

main() {
  String s = "dvdf";
  // int result = searchInsert([1, 3, 5, 6], 2);
  // int result = lengthOfLastWord("Hello World");
  // print(result);
  // String result = addBinary('1010', '1011');
  // print(result);
  int result = mySqrt(10);
  print("result hdvfsjhfs $result");
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

bool isValid(String s) {
  Queue<String> queue = Queue();
  bool isSuccess = true;
  for (int i = 0; i < s.length && isSuccess; i++) {
    if (s[i] == '(') {
      queue.addLast(s[i]);
    }
    if (s[i] == '[') {
      queue.addLast(s[i]);
    }
    if (s[i] == '{') {
      queue.addLast(s[i]);
    }
    if (s[i] == ')') {
      if (queue.isNotEmpty) {
        if (queue.last != '(') {
          isSuccess = false;
        } else {
          queue.removeLast();
        }
      } else {
        isSuccess = false;
      }
    }
    if (s[i] == '}') {
      if (queue.isNotEmpty) {
        if (queue.last == '{') {
          queue.removeLast();
        } else {
          isSuccess = false;
        }
      } else {
        isSuccess = false;
      }
    }
    if (s[i] == ']') {
      if (queue.isNotEmpty) {
        if (queue.last == '[') {
          queue.removeLast();
        } else {
          isSuccess = false;
        }
      } else {
        isSuccess = false;
      }
    }
  }
  return queue.isEmpty && isSuccess;
}

class ListNode {
  int val;
  ListNode? next;

  ListNode([this.val = 0, this.next]);
}

ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
  ListNode? list1New = list1;
  ListNode? list2New = list2;
  ListNode? resultNode;
  List<int> intList = <int>[];
  while (list1New != null || list2New != null) {
    if (list1New != null && list2New != null) {
      if (list1New.val > list2New.val) {
        intList.add(list2New.val);
        list2New = list2New.next;
      } else {
        intList.add(list1New.val);
        list1New = list1New.next;
      }
    } else {
      if (list1New != null) {
        intList.add(list1New.val);
        list1New = list1New.next;
      } else {
        if (list2New != null) {
          intList.add(list2New.val);
          list2New = list2New.next;
        }
      }
    }
  }
  intList = intList.reversed.toList();
  for (int i = 0; i < intList.length; i++) {
    resultNode = ListNode(intList[i], resultNode);
  }
  return resultNode;
}


int lengthOfLastWord(String s) {
  int max = 0;
  int counter = 0;
  for (int i = 0; i < s.length; i++) {
    print(s[i]);
    if (s[i] == " ") {
      // if (counter > max) {
      if (counter != 0) {
        max = counter;
        print("Max ${max}");
      }
      // }
      counter = 0;
    } else {
      counter++;
      print("counter ${counter}");
    }
  }
  max = counter != 0 ? counter : max;
  return max;
}

List<int> plusOne(List<int> digits) {
  List<int> reverseDigits = digits;
  reverseDigits = reverseDigits.reversed.toList();
  List<int> result = <int>[];
  int sam = 0;
  for (int i = 0; i < reverseDigits.length; i++) {
    if (i == 0) {
      sam = sam + reverseDigits[i] + 1;
    } else {
      sam = sam + reverseDigits[i];
    }
    if (sam >= 9) {
      result.add(sam);
      sam = 0;
    } else {
      result.add(sam % 10);
      sam = sam ~/ 10;
    }
  }
  if (sam != 0) {
    result.add(sam);
  }
  result = result.reversed.toList();
  return result;
}

String addBinary(String a, String b) {
  // String result = addBinary('1010', '1011');
  String an = a.split('').reversed.join('');
  String bn = b.split('').reversed.join('');
  print("an ${an}");
  print("bn ${bn}");
  int index = 0;
  int counter = 0;
  List<String> result = <String>[];
  while (an.length > index || bn.length > index) {
    if (an.length > index) {
      if (an[index] == '1') {
        print("a[${index}]=${an[index]}");
        counter++;
      }
    }
    if (bn.length > index) {
      if (bn[index] == '1') {
        print("b[${index}]=${bn[index]}");
        counter++;
      }
    }
    print("counter $counter");
    if (counter == 0) {
      result.add('0');
    } else {
      if (counter == 1) {
        result.add('1');
        counter = 0;
      } else {
        if (counter == 2) {
          result.add('0');
          counter = 1;
        } else {
          result.add('1');
          counter = 1;
        }
      }
    }
    index++;
  }
  if (counter != 0) {
    result.add('1');
  }
  result = result.reversed.toList();
  String ex = result.join('');
  return ex;
}

int mySqrt(int x) {
  int counter = 0;
  int result = 0;
  while (counter * counter <= x) {
    if (counter * counter <= x) {
      result = counter;
    }
    counter++;
  }
  print("result ${result}");
  return result;
}

int maxDepth(TreeNode? root) {
  return depth(root, 0);
}

int depth(TreeNode? root, int counter) {
  if (root == null) return counter;
  int leftDepth = depth(root.left, counter + 1);
  int rightDepth = depth(root.right, counter + 1);
  int maxDepth = leftDepth > rightDepth ? leftDepth : rightDepth;
  return maxDepth;
}
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode([this.val = 0, this.left, this.right]);
}
