import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../../../core/router/router.dart';
import '../../../../core/util/theme.dart';
import '../../data/models/nft.dart';
import '../dialogs/transfer_nft_dialog.dart';
import '../widgets/common_button.dart';

class NftDetailPage extends StatefulWidget {
  const NftDetailPage({
    Key? key,
    required this.nftCollection,
    required this.nftInfo,
  }) : super(key: key);

  final NFTCollection nftCollection;
  final NFTInfo nftInfo;

  static void show(
    BuildContext context, {
    required NFTCollection nftCollection,
    required NFTInfo nftInfo,
  }) {
    Navigator.of(context).push(slideRoute(NftDetailPage(
      nftCollection: nftCollection,
      nftInfo: nftInfo,
    )));
  }

  @override
  State<NftDetailPage> createState() => _NftDetailPageState();
}

class _NftDetailPageState extends State<NftDetailPage> {
  NFTCollection get nftCollection => widget.nftCollection;
  NFTInfo get nftInfo => widget.nftInfo;

  double screenOpacity = 0;

  Future<void> _showTransferNFTDialog() async {
    await TransferNFTDialog.show(
      context,
      contract: nftCollection.contract,
      nftInfo: nftInfo,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<double>(
      tween: Tween<double>(begin: 0.0, end: 0.3),
      delay: const Duration(milliseconds: 100),
      duration: const Duration(milliseconds: 300),
      builder: (context, child, snapshot) {
        return Material(
          color: Colors.black.withOpacity(screenOpacity + snapshot <= 0 ? 0 : screenOpacity + snapshot),
          child: Listener(
            onPointerMove: (PointerMoveEvent event) {
              if (event.delta.dy > 0) {
                if (screenOpacity <= -0.3) {
                  return;
                }
                screenOpacity -= event.delta.dy * 0.01;
                setState(() {});
              }
            },
            child: Dismissible(
              key: const Key('some key here'),
              direction: DismissDirection.down,
              onDismissed: (_) {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 100),
                decoration: const BoxDecoration(
                  color: CustomTheme.bgColor,
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: CustomTheme.secondColor,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                      ),
                      height: 240,
                      width: double.infinity,
                      child: CachedNetworkImage(imageUrl: widget.nftInfo.imgPath, fit: BoxFit.cover),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  _InfoBox(
                                    title: 'Name',
                                    text: "${nftCollection.tokenName} #${nftInfo.tokenId}",
                                  ),
                                  const SizedBox(width: 15),
                                  _InfoBox(
                                    title: 'Collection',
                                    text: nftCollection.name,
                                  ),
                                  const SizedBox(width: 15),
                                  const _InfoBox(
                                    title: 'Total Supply',
                                    text: '-',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 25),
                              Wrap(
                                spacing: 5,
                                runSpacing: 5,
                                children: const [
                                  _Tag(text: 'level1'),
                                  _Tag(text: 'gold'),
                                  _Tag(text: 'hair'),
                                  _Tag(text: 'girl'),
                                  _Tag(text: 'damn'),
                                ],
                              ),
                              const SizedBox(height: 25),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Address',
                                    style: CustomTheme.textSmallPrimary,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    nftCollection.contract.self.address.toString(),
                                    style: CustomTheme.textSmallWhite,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 25),
                              CommonButton(
                                onPress: () => _showTransferNFTDialog(),
                                color: CustomTheme.secondColor,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Transfer',
                                    style: CustomTheme.textWhite,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              CommonButton(
                                onPress: () {},
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/images/opensea.png', width: 24),
                                      const SizedBox(width: 8),
                                      const Text('Sell on Opensea', style: CustomTheme.textBlack),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 25),
                              Container(
                                padding: const EdgeInsets.all(20),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10), color: CustomTheme.bgSecondColor),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset('assets/images/crown.png', width: 30),
                                        const Text(
                                          '賦能',
                                          style: CustomTheme.textWhite,
                                        ),
                                      ],
                                    ),
                                    ...List<Widget>.generate(
                                      6,
                                      (index) => _FunctionalityItem(imgPath: 'assets/images/ck-${index + 1}.png'),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _FunctionalityItem extends StatelessWidget {
  const _FunctionalityItem({Key? key, required this.imgPath}) : super(key: key);

  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: CommonButton(
        onPress: () {},
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(5),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                imgPath,
                height: 40,
              ),
              const SizedBox(width: 5),
              const Text('我是賦能', style: CustomTheme.textBlack),
            ],
          ),
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: CustomTheme.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '#$text',
        style: CustomTheme.textBlack,
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  const _InfoBox({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        decoration: BoxDecoration(
          color: CustomTheme.bgSecondColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: CustomTheme.textPrimary,
            ),
            const SizedBox(height: 8.0),
            Text(
              text,
              style: CustomTheme.textSmallWhite,
            ),
          ],
        ),
      ),
    );
  }
}
