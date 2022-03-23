import 'package:fpdart/fpdart.dart';

import '../error/failures.dart';

class InputConverter {
  Either<Failure, List<int>> stringToIntList(String str) {
    try {
      if (isValidInput(str) == false) throw const FormatException();
      List<String> strList = str.split("");
      List<int> intList = strList.map(int.parse).toList();
      return Right(intList);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}

bool isValidInput(String s) {
  if (s == null) return false;

  if (int.parse(s) < 0) return false;

  if (s.contains("0")) return false;

  return double.tryParse(s) != null;
}

class InvalidInputFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
