import 'package:equatable/equatable.dart';

class Account extends Equatable {
  final String uid;

  const Account({
    required this.uid,
  });

  @override
  List<Object> get props => [
        uid,
      ];
}
