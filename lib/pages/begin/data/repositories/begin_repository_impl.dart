import 'package:tdd_example/core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/entities/account.dart';
import '../../domain/repositories/account_repository.dart';
import '../datasources/begin_local_data_source.dart';
import '../datasources/begin_remote_data_source.dart';

class AccountRepositoryImpl implements AccountRepository {
  final BeginRemoteDataSource remoteDataSource;
  final BeginLocalDataSource localDataSource;
  // final NetworkInfo networkInfo;

  AccountRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    // required this.networkInfo,
  });

  @override
  Future<Either<Failure, Account>> getAccountData(String uid) {
    throw UnimplementedError();
  }

  // @override
  // Future<Either<Failure, Account>> getConcreteAccount(
  //   int number,
  // ) async {
  //   return await _getTrivia(() {
  //     return remoteDataSource.getConcreteAccount(number);
  //   });
  // }

  // Future<Either<Failure, Account>> _getTrivia(
  //   _ConcreteOrRandomChooser getConcreteOrRandom,
  // ) async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       final remoteTrivia = await getConcreteOrRandom();
  //       localDataSource.cacheAccount(remoteTrivia);
  //       return Right(remoteTrivia);
  //     } on ServerException {
  //       return Left(ServerFailure());
  //     }
  //   } else {
  //     try {
  //       final localTrivia = await localDataSource.getLastAccount();
  //       return Right(localTrivia);
  //     } on CacheException {
  //       return Left(CacheFailure());
  //     }
  //   }
  // }
}
