import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/util/theme.dart';
import '../../../data/models/nft.dart';
import '../../pages/nft_detail_page.dart';

class NFTTab extends StatelessWidget {
  final List<NFTCollection> nftCollectionList;

  const NFTTab({
    Key? key,
    required this.nftCollectionList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final NFTCollection nftCollection = nftCollectionList[index];
        return _NFTCollectionItem(nftCollection: nftCollection);
      },
      itemCount: nftCollectionList.length,
    );
  }
}

class _NFTCollectionItem extends StatelessWidget {
  const _NFTCollectionItem({
    Key? key,
    required this.nftCollection,
  }) : super(key: key);

  final NFTCollection nftCollection;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      nftCollection.name,
                      style: CustomTheme.textWhite,
                    ),
                    Text(
                      nftCollection.tokenName,
                      style: CustomTheme.textSmallPrimary,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Total: ',
                      style: CustomTheme.textWhite,
                    ),
                    Text(
                      nftCollection.nftInfoList.length.toString(),
                      style: CustomTheme.textSmallPrimary,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: 170,
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 24),
                    itemCount: nftCollection.nftInfoList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final NFTInfo nftInfo = nftCollection.nftInfoList[index];
                      return GestureDetector(
                        onTap: () => NftDetailPage.show(
                          context,
                          nftCollection: nftCollection,
                          nftInfo: nftInfo,
                        ),
                        child: _NFTItem(nftInfo: nftInfo),
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _NFTItem extends StatelessWidget {
  const _NFTItem({Key? key, required this.nftInfo}) : super(key: key);

  final NFTInfo nftInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 136,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomTheme.nftBgColors[Random().nextInt(2) % 3],
        image: DecorationImage(
          image: CachedNetworkImageProvider(nftInfo.imgPath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                CustomTheme.bgColor.withAlpha(190),
                CustomTheme.bgColor.withAlpha(80),
                CustomTheme.bgColor.withAlpha(0),
                CustomTheme.bgColor.withAlpha(0),
              ],
            )),
        alignment: Alignment.bottomLeft,
        child: Text(
          "#${nftInfo.tokenId.toString()}",
          style: CustomTheme.textWhite,
        ),
      ),
    );
  }
}
