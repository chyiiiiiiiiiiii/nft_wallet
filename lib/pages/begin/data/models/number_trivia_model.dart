import '../../domain/entities/account.dart';

class AccountModel extends Account {
  const AccountModel({
    required String uid,
  }) : super(uid: uid);

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
    };
  }
}
