import 'package:dart_basics/dart_basics.dart' as dart_basics;
import 'dart:math';

void main() {
  var nc = NumberConvert();
  print(nc.intToBinary(95));
  print(nc.binaryToInt('1011111'));
  print(nc.multipliers(9875000));
  print(nc.nodInt(126, 12));
  print(nc.nokInt(24, 35));
}

class NumberConvert {
// Реализуйте методы вычисления НОД и НОК целых чисел. Реализуйте метод, который разбивает число на простые множители и возвращает их.
  int nodInt(int numX, int numY) {
    int nod;
    List multiArr = [1];
    for (var i = 2; i <= numX; i++) {
      if (numX % i == 0) {
        for (var j = 2; j <= numY; j++) {
          if (numY % i == 0) {
            multiArr.add(i);
          }
        }
      }
    }
    multiArr.sort();
    nod = multiArr.last;
    return nod;
  }

  int nokInt(int numX, int numY) {
    int nok = 0;
    int maxNum = (numX > numY) ? numX : numY;
    for (var i = maxNum; i <= numX * numY; i++) {
      if (i % numX == 0 && i % numY == 0) {
        nok = i;
        break;
      }
    }
    return nok;
  }

  List multipliers(var num) {
    List multipliers = [];
    int n = 0;
    for (var i = 2; i <= sqrt(num); i++) {
      n = 0;
      if (num % i == 0) {
        for (var j = 2; j < i; j++) {
          if (i % j == 0) {
            n++;
          }
        }
        if (n == 0) {
          multipliers.add(i);
        }
      }
    }
    return multipliers;
  }

// Реализуйте методы для преобразования целых чисел из десятичной системы в двоичную и обратно.
  int binaryToInt(String strNum) {
    int intNum = 0;
    List strlist = strNum.split('');
    int j = -1;
    for (var i = strlist.length - 1; i >= 0; i--) {
      j++;
      int n = int.parse(strlist[i]);
      if (n > 0) {
        intNum = intNum + (pow(2, j)).toInt();
      }
    }
    return intNum;
  }

  String intToBinary(var num) {
    List<String> binaryArr = [];
    while (num >= 1) {
      if ((num % 2) == 0) {
        binaryArr.add('0');
        num = num ~/ 2;
      }
      if ((num % 2) != 0) {
        binaryArr.add('1');
        num = num ~/ 2;
      }
    }
    String binNum = "";
    for (var i = binaryArr.length - 1; i >= 0; i--) {
      binNum += binaryArr[i];
    }
    return binNum;
  }
}
