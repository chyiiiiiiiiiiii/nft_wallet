// import 'package:mockito/mockito.dart';
// import 'package:flutter_test/flutter_test.dart';

// class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

// void main() {
//   NetworkInfoImpl networkInfo;
//   MockDataConnectionChecker mockDataConnectionChecker;

//   setUp(() {
//     mockDataConnectionChecker = MockDataConnectionChecker();
//     networkInfo = NetworkInfoImpl(mockDataConnectionChecker);
//   });

//   group('isConnected', () {
//     test(
//       'should forward the call to DataConnectionChecker.hasConnection',
//       () async {
//         // arrange
//         final tHasConnectionFuture = Future.value(true);

//         when(mockDataConnectionChecker.hasConnection).thenAnswer((_) => tHasConnectionFuture);
//         // act
//         final result = networkInfo.isConnected;
//         // assert
//         verify(mockDataConnectionChecker.hasConnection);
//         expect(result, tHasConnectionFuture);
//       },
//     );
//   });
// }
