import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

import '../../../../core/provider/shared_provider.dart';
import '../../../../core/util/theme.dart';
import '../../data/models/wallet_info.dart';
import '../../data/states/load_coin_state.dart';
import '../../data/states/load_nft_state.dart';
import '../dialogs/add_wallet_dialog.dart';
import '../dialogs/transfer_coin_dialog.dart';
import '../widgets/common_button.dart';
import '../widgets/common_loading.dart';
import '../widgets/home/nft_tab.dart';
import '../widgets/home/token_tab.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static void show(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends ConsumerState<HomePage> with SingleTickerProviderStateMixin {
  late SwiperController _swiperController;
  late TabController _tabController;

  /// 一開始先取得錢包相關資料，保持最新
  void _loadData() {
    ref.read(loadCoinDataProvider.notifier).loadCoinData();
    ref.read(loadNFTDataProvider.notifier).loadNFTData();
  }

  /// 匯入錢包
  Future<void> _importWallet(
    BuildContext context, {
    required WidgetRef ref,
  }) async {
    final privateKey = await AddWalletDialog.show(context) as String?;
    if (privateKey != null) {
      ref.read(importWalletProvider.notifier).importWallet(privateKey: privateKey);
    }
  }

  @override
  void initState() {
    _swiperController = SwiperController();
    _tabController = TabController(vsync: this, length: 2);
    _loadData();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _swiperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<WalletInfo> walletList = ref.watch(walletConnectedProvider);

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
                      Expanded(
                        child: Row(
                          children: [
                            const Text(
                              'Wallet',
                              style: CustomTheme.textBoldWhite,
                            ),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: () => _importWallet(context, ref: ref),
                              child: const Icon(
                                Icons.add_circle_outlined,
                                color: CustomTheme.primaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      Consumer(
                        builder: (context, ref, _) {
                          return IconButton(
                            onPressed: () {
                              _loadData();
                            },
                            icon: const Icon(
                              Icons.refresh_rounded,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                      Consumer(
                        builder: (context, ref, _) {
                          return IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(
                              Icons.door_back_door,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 210,
                  child: Swiper(
                    controller: _swiperController,
                    itemBuilder: (BuildContext context, int index) {
                      final WalletInfo walletInfo = walletList[index];
                      return _WalletCard(
                        index: index,
                        walletInfo: walletInfo,
                      );
                    },
                    itemCount: walletList.length,
                    viewportFraction: 0.8,
                    scale: 0.9,
                    onIndexChanged: (index) {
                      // 更新目前的錢包索引
                      ref.read(currentWalletIndexProvider.notifier).state = index;
                      // 刷新
                      _loadData();
                    },
                  ),
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
                          child: Consumer(
                            builder: (context, ref, _) {
                              final WalletInfo? walletInfo = ref.watch(currentWalletProvider);
                              final LoadCoinState loadCoinState = ref.watch(loadCoinDataProvider);
                              final LoadNFTState loadNFTState = ref.watch(loadNFTDataProvider);

                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    SizedBox(
                                      child: loadCoinState.whenOrNull(
                                        loading: () => const CustomLoading(),
                                        data: (tokenInfoList) => TokenTab(
                                          tokenInfoList: walletInfo?.tokenInfoList ?? [],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      child: loadNFTState.whenOrNull(
                                        loading: () => const CustomLoading(),
                                        data: (nftCollectionList) => NFTTab(
                                          nftCollectionList: walletInfo?.nftCollectionList ?? [],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
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
    required this.walletInfo,
  }) : super(key: key);

  final int index;
  final WalletInfo walletInfo;

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
              final String imgPath = walletInfo.getSourceImagePath();

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
                    '${walletInfo.address.substring(0, 5)}...${walletInfo.address.substring(walletInfo.address.length - 3)}',
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
              Text(
                "${walletInfo.etherAmount.toStringAsFixed(4)} eth",
                style: CustomTheme.textBlack,
              ),
            ],
          ),
          const SizedBox(height: 10),
          CommonButton(
            onPress: () => TransferCoinDialog.show(context),
            child: const Text(
              '轉帳',
              style: CustomTheme.textBlack,
            ),
          )
        ],
      ),
    );
  }
}
