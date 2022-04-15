import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/account.dart';
import '../repositories/account_repository.dart';

class GetAccountData implements UseCase<Account, GetAccountDataParams> {
  final AccountRepository repository;

  GetAccountData(this.repository);

  @override
  Future<Either<Failure, Account>> call(GetAccountDataParams params) async {
    return await repository.getAccountData(params.uid);
  }
}

class GetAccountDataParams extends Equatable {
  final String uid;

  const GetAccountDataParams({required this.uid});

  @override
  List<Object> get props => [uid];
}
