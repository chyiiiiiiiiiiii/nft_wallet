import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/account.dart';

abstract class AccountRepository {
  Future<Either<Failure, Account>> getAccountData(String uid);
  // Future<Either<Failure, Account>> getRandomNumberTrivia();
}
