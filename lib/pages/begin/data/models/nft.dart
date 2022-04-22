import 'package:json_annotation/json_annotation.dart';

import '../../../../core/util/web3/abi/stream_chicken_2.g.dart';

part 'nft.g.dart';

class NFTCollection {
  final List<NFTInfo> nftInfoList;
  final String name;
  final String tokenName;
  final Stream_chicken_2 contract;

  NFTCollection({
    required this.nftInfoList,
    required this.name,
    required this.tokenName,
    required this.contract,
  });
}

@JsonSerializable(fieldRename: FieldRename.snake)
class NFTInfo {
  final int tokenId;
  final String imgPath;
  List<NFTAttributes> attributes = [];

  NFTInfo({
    required this.tokenId,
    required this.imgPath,
  });
}

@JsonSerializable(fieldRename: FieldRename.snake)
class NFTAttributes {
  @JsonKey(defaultValue: '')
  String type = '';
  @JsonKey(defaultValue: '')
  String value = '';

  NFTAttributes({
    required this.type,
    required this.value,
  });

  factory NFTAttributes.fromJson(Map<String, dynamic> json) => _$NFTAttributesFromJson(json);
  Map<String, dynamic> toJson() => _$NFTAttributesToJson(this);
}
