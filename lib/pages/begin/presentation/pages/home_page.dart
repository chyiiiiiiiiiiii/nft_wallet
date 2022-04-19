import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

import '../../../../core/provider/shared_provider.dart';
import '../../../../core/util/theme.dart';
import '../../data/models/token_info.dart';
import '../../data/models/wallet_info.dart';
import '../dialogs/add_wallet_dialog.dart';
import '../dialogs/transfer_money_dialog.dart';
import '../widgets/common_button.dart';
import '../widgets/home/nft_tab.dart';
import '../widgets/home/token_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static void show(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  void onTokenTransfer(TokenInfo tokenInfo) {}

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Material(
        color: CustomTheme.bgColor,
        child: SafeArea(
          bottom: false,
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Wallet',
                            style: CustomTheme.textBoldWhite,
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () => AddWalletDialog.show(context),
                            child: const Icon(
                              Icons.add_circle_outlined,
                              color: CustomTheme.primaryColor,
                            ),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Text(
                          'logOut',
                          style: CustomTheme.textPrimary,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 210,
                  child: Consumer(builder: (context, ref, _) {
                    final List<WalletInfo> walletList = ref.watch(walletConnectedProvider);

                    return Swiper(
                      controller: SwiperController(),
                      itemBuilder: (BuildContext context, int index) {
                        return _WalletCard(index: index);
                      },
                      itemCount: walletList.length,
                      viewportFraction: 0.8,
                      scale: 0.9,
                      onIndexChanged: (index) {
                        ref.read(currentWalletIndexProvider.notifier).state = index;
                      },
                    );
                  }),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: Container(
                    decoration:
                        BoxDecoration(color: CustomTheme.bgSecondColor, borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _tabController.animateTo(0);
                                  setState(() {});
                                },
                                child: const Text(
                                  'Token',
                                  style: CustomTheme.textWhite,
                                ),
                              ),
                              const SizedBox(width: 30),
                              GestureDetector(
                                onTap: () {
                                  _tabController.animateTo(1);
                                  setState(() {});
                                },
                                child: const Text(
                                  'NFT',
                                  style: CustomTheme.textWhite,
                                ),
                              ),
                            ],
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          transform: Matrix4Transform().translate(x: _tabController.index == 0 ? -30 : 38).matrix4,
                          width: 46,
                          height: 4,
                          decoration: const BoxDecoration(
                            color: CustomTheme.primaryColor,
                          ),
                        ),
                        Expanded(
                          child: Consumer(builder: (context, ref, _) {
                            final WalletInfo walletInfo = ref.watch(currentWalletProvider);
                            return TabBarView(
                              controller: _tabController,
                              children: [
                                TokenTab(
                                  tokenInfoList: walletInfo.tokenInfoList,
                                  onTransfer: onTokenTransfer,
                                ),
                                NFTTab(nftCollectionList: walletInfo.nftCollectionList),
                              ],
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WalletCard extends StatelessWidget {
  _WalletCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  final List<String> walletBgs = [
    'assets/images/wallet-bg-01.png',
    'assets/images/wallet-bg-02.png',
    'assets/images/wallet-bg-03.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(walletBgs[index % 3]),
          fit: BoxFit.cover,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Consumer(builder: (context, ref, _) {
              final List<WalletInfo> walletList = ref.watch(walletConnectedProvider);
              final WalletInfo wallet = walletList[index];
              final String imgPath = wallet.getSourceImagePath();

              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (imgPath.isNotEmpty)
                    Image.asset(
                      imgPath,
                      width: 26,
                    ),
                  const SizedBox(width: 8.0),
                  Text(
                    '${wallet.address.substring(0, 5)}...${wallet.address.substring(wallet.address.length - 3)}',
                    style: CustomTheme.textBlack,
                  ),
                ],
              );
            }),
          ),
          const Spacer(),
          Row(
            children: [
              Image.asset('assets/images/eth-token.png', width: 20),
              const SizedBox(width: 10),
              Consumer(builder: (context, ref, _) {
                final List<WalletInfo> walletList = ref.watch(walletConnectedProvider);
                final WalletInfo wallet = walletList[index];

                return Text(
                  "${wallet.etherAmount.toStringAsFixed(5)} eth",
                  style: CustomTheme.textBlack,
                );
              }),
            ],
          ),
          const SizedBox(height: 10),
          CommonButton(
            onPress: () => TransferMoneyDialog.show(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: Text(
                '轉帳',
                style: CustomTheme.textBlack,
              ),
            ),
          )
        ],
      ),
    );
  }
}
