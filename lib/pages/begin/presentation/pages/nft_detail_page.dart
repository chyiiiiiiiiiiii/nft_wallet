import 'package:flutter/material.dart';
import 'package:nft_wallet/pages/begin/presentation/dialogs/transfer_nft_dialog.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../../../core/router/router.dart';
import '../../../../core/util/theme.dart';
import '../dialogs/transfer_coin_dialog.dart';
import '../widgets/common_button.dart';

class NftDetailPage extends StatefulWidget {
  const NftDetailPage({Key? key}) : super(key: key);

  static void show(BuildContext context) {
    Navigator.of(context).push(slideRoute(const NftDetailPage()));
  }

  @override
  State<NftDetailPage> createState() => _NftDetailPageState();
}

class _NftDetailPageState extends State<NftDetailPage> {
  double screenOpacity = 0;

  List<Widget> warframeList() {
    return List<Widget>.generate(
      6,
      (index) => Padding(
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
                  'assets/images/ck-${index + 1}.png',
                  height: 40,
                ),
                const SizedBox(width: 5),
                const Text('我是賦能', style: CustomTheme.textBlack),
              ],
            ),
          ),
        ),
      ),
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
                      child: Image.asset(
                        'assets/images/ck-1.png',
                      ),
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
                                  _metaDataBox(),
                                  const SizedBox(width: 15),
                                  _metaDataBox(),
                                  const SizedBox(width: 15),
                                  _metaDataBox(),
                                ],
                              ),
                              const SizedBox(height: 25),
                              Wrap(
                                spacing: 5,
                                runSpacing: 5,
                                children: [
                                  _metaDataTag(),
                                  _metaDataTag(),
                                  _metaDataTag(),
                                  _metaDataTag(),
                                  _metaDataTag(),
                                  _metaDataTag(),
                                ],
                              ),
                              const SizedBox(height: 25),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Address',
                                    style: CustomTheme.textSmallPrimary,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '0x899bd466D50e861351fb1fAa303CaB08Bdb03725',
                                    style: CustomTheme.textSmallWhite,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 25),
                              CommonButton(
                                onPress: () => TransferNFTDialog.show(context),
                                color: CustomTheme.secondColor,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'send',
                                      style: CustomTheme.textWhite,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              CommonButton(
                                onPress: () {},
                                color: Colors.white,
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(20),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/images/opensea.png', width: 24),
                                      const SizedBox(width: 5),
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
                                    ...warframeList()
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

  Widget _metaDataBox() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        decoration: BoxDecoration(
          color: CustomTheme.bgSecondColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Name',
              style: CustomTheme.textPrimary,
            ),
            SizedBox(height: 10),
            Text(
              '123',
              style: CustomTheme.textSmallWhite,
            ),
          ],
        ),
      ),
    );
  }

  Widget _metaDataTag() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: CustomTheme.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        '# body1',
        style: CustomTheme.textBlack,
      ),
    );
  }
}
