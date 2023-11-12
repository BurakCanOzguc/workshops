import 'dart:math';

bool isArmstrongNumber(int number) {
  int sum = 0;
  int temp = number;
  int numberOfDigits = number.toString().length;

  while (temp > 0) {
    int remainder = temp % 10;
    sum += pow(remainder, numberOfDigits).toInt();
    temp = temp ~/ 10;
  }

  return sum == number;
}

void main() {
  int testNumber = 153;
  if (isArmstrongNumber(testNumber)) {
    print('$testNumber Armstrong bir sayıdır.');
  } else {
    print('$testNumber Armstrong bir sayı değildir.');
  }
}
