// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NFTInfo _$NFTInfoFromJson(Map<String, dynamic> json) => NFTInfo(
      tokenId: json['token_id'] as int,
      imgPath: json['img_path'] as String,
    )..attributes =
        (json['attributes'] as List<dynamic>).map((e) => NFTAttributes.fromJson(e as Map<String, dynamic>)).toList();

Map<String, dynamic> _$NFTInfoToJson(NFTInfo instance) => <String, dynamic>{
      'token_id': instance.tokenId,
      'img_path': instance.imgPath,
      'attributes': instance.attributes,
    };

NFTAttributes _$NFTAttributesFromJson(Map<String, dynamic> json) => NFTAttributes(
      type: json['type'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$NFTAttributesToJson(NFTAttributes instance) => <String, dynamic>{
      'type': instance.type,
      'value': instance.value,
    };
