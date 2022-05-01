import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/provider/shared_provider.dart';
import '../../../../core/util/theme.dart';
import '../../domain/providers/begin_provider.dart';
import '../dialogs/add_wallet_dialog.dart';
import '../widgets/common_button.dart';
import 'home_page.dart';

class BeginPage extends StatelessWidget {
  const BeginPage({Key? key}) : super(key: key);

  void onTapStart({
    required BuildContext context,
    required WidgetRef ref,
  }) {
    // 檢查是否已有錢包連結了
    if (ref.read(walletConnectedProvider.notifier).isWalletConnected) {
      HomePage.show(context);
    } else {
      Fluttertoast.showToast(msg: '請先連結或匯入錢包');
    }
  }

  /// 匯入錢包
  Future<void> _importWallet({
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    final privateKey = await AddWalletDialog.show(context) as String?;
    if (privateKey != null) {
      ref.read(importWalletProvider.notifier).importWallet(privateKey: privateKey);
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: CustomTheme.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Consumer(builder: (context, ref, _) {
                    return CommonButton(
                      onPress: () => onTapStart(context: context, ref: ref),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/chicken-btn.png',
                            width: 48,
                          ),
                          const SizedBox(width: 8.0),
                          const Text(
                            '直接開始',
                            style: CustomTheme.textBlack,
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            color: CustomTheme.bgColor,
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ),
              const Text(
                '其他連接方式',
                textAlign: TextAlign.center,
                style: CustomTheme.textSmallGray,
              ),
              const SizedBox(height: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Consumer(builder: (context, ref, _) {
                    return CommonButton(
                      onPress: () => ref.read(connectWalletProvider.notifier).connectWallet(),
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ref.watch(connectWalletProvider).whenOrNull(
                              init: () => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/metamask-icon.png',
                                    width: 26,
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Connect Wallet',
                                    style: CustomTheme.textBlack,
                                  ),
                                ],
                              ),
                              loading: () => const SizedBox(
                                width: 24.0,
                                height: 24.0,
                                child: CircularProgressIndicator(
                                  color: CustomTheme.primaryColor,
                                ),
                              ),
                              data: (wallet) => Text(
                                wallet.address,
                                style: CustomTheme.textBlack,
                              ),
                            ),
                      ),
                    );
                  }),
                  const SizedBox(height: 18),
                  Consumer(builder: (context, ref, _) {
                    return CommonButton(
                      onPress: () => _importWallet(context: context, ref: ref),
                      color: CustomTheme.secondColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ref.watch(importWalletProvider).whenOrNull(
                              init: () => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/key-btn.png',
                                    width: 26,
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Import PrivateKey',
                                    style: CustomTheme.textWhite,
                                  ),
                                ],
                              ),
                              loading: () => const SizedBox(
                                width: 24.0,
                                height: 24.0,
                                child: CircularProgressIndicator(
                                  color: CustomTheme.primaryColor,
                                ),
                              ),
                              data: (wallet) => Text(
                                wallet.address,
                                style: CustomTheme.textBlack,
                              ),
                            ),
                      ),
                    );
                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
