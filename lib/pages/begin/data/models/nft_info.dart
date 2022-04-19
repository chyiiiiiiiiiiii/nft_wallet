import 'package:flutter/material.dart';

class NFTCollection {
  final List<NFTInfo> nftInfoList;
  final String name;
  final String tokenName;

  NFTCollection({
    required this.nftInfoList,
    required this.name,
    required this.tokenName,
  });
}

class NFTInfo {
  final int tokenId;
  final String imgPath;
  final Color bgColor;
  final NFTMetaData metaData = NFTMetaData();

  NFTInfo({
    required this.tokenId,
    required this.imgPath,
    required this.bgColor,
  });
}

class NFTMetaData {
  final String body = '1';
  final String head = '5';
  final String beak = '3';
}
