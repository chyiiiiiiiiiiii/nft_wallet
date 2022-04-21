import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nft_wallet/pages/begin/domain/providers/home_provider.dart';

import '../../../../core/provider/shared_provider.dart';
import '../../../../core/util/theme.dart';
import '../../data/models/token_info.dart';
import '../../data/models/wallet_info.dart';
import '../../data/states/transfer_coin_state.dart';
import '../widgets/common_button.dart';
import '../widgets/common_loading.dart';
import '../widgets/common_textfield.dart';

class TransferCoinDialog extends ConsumerWidget {
  TransferCoinDialog({
    Key? key,
    this.tokenInfo,
  }) : super(key: key);

  final TokenInfo? tokenInfo;

  final TextEditingController etherEditController = TextEditingController();
  final TextEditingController toAddressEditController = TextEditingController();

  static Future<void> show(
    BuildContext context, {
    TokenInfo? tokenInfo,
  }) async {
    await showDialog<TransferCoinDialog>(
      context: context,
      builder: (context) {
        return TransferCoinDialog(tokenInfo: tokenInfo);
      },
    );
  }

  void _onConfirm({
    required WidgetRef ref,
    required WalletInfo walletInfo,
  }) {
    String coinString = etherEditController.text.trim();
    String toAddress = toAddressEditController.text.trim();
    if (coinString.isEmpty) {
      Fluttertoast.showToast(msg: '請輸入轉帳金額');
      return;
    } else if (toAddress.isEmpty) {
      Fluttertoast.showToast(msg: '請輸入目的錢包位址');
      return;
    }

    double inputCoinAmount = double.parse(coinString);

    // 檢查是否為以太幣，轉帳的方式不同
    bool isHaveEnoughCoin = false;
    if (tokenInfo == null) {
      double currentEtherBalance = walletInfo.etherAmount;
      isHaveEnoughCoin = currentEtherBalance > inputCoinAmount;
    } else {
      isHaveEnoughCoin = tokenInfo!.amount > inputCoinAmount;
    }

    if (!isHaveEnoughCoin) {
      Fluttertoast.showToast(msg: '錢包不夠錢哦，請重新輸入');
      return;
    }

    final TransferCoinNotifier transferCoinNotifier = ref.read(transferCoinProvider.notifier);
    transferCoinNotifier.transferCoin(
      toAddress: toAddress,
      sendAmount: inputCoinAmount,
      tokenInfo: tokenInfo,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String imagePath = tokenInfo == null ? 'assets/images/eth-token.png' : tokenInfo!.getCoinImagePath();

    final WalletInfo? walletInfo = ref.watch(currentWalletProvider);
    if (walletInfo == null) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: '錢包有問題，請稍後再試');
    }

    TransferCoinState transferCoinState = ref.watch(transferCoinProvider);
    ref.listen<TransferCoinState>(transferCoinProvider, (prev, next) {
      if (next is TransferCoinData) {
        Navigator.pop(context);
        Fluttertoast.showToast(msg: '轉帳處理中，請耐心等候5~10分鐘');
      } else if (next is TransferCoinError) {
        Fluttertoast.showToast(msg: next.msg);
      }
    });

    return Dialog(
      backgroundColor: Colors.white,
      elevation: 10.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 32,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title
            Container(
              alignment: Alignment.center,
              child: const Text(
                '轉帳',
                style: CustomTheme.textBoldBlack,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32.0),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      imagePath,
                      width: 24.0,
                    ),
                    const SizedBox(width: 32.0),
                    SizedBox(
                      width: 200.0,
                      child: CommonTextField(
                        textEditingController: etherEditController,
                        hint: 'ether',
                        hintStyle: CustomTheme.textGray,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                          signed: false,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'to',
                      style: CustomTheme.textBlack,
                    ),
                    const SizedBox(width: 32.0),
                    SizedBox(
                      width: 200.0,
                      child: CommonTextField(
                        textEditingController: toAddressEditController,
                        hint: 'address',
                        hintStyle: CustomTheme.textGray,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 24.0),
            CommonButton(
              onPress: () => _onConfirm(
                ref: ref,
                walletInfo: walletInfo!,
              ),
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              color: CustomTheme.secondColor,
              child: SizedBox(
                child: transferCoinState.whenOrNull(
                  loading: () => const CustomLoading(size: 40.0),
                  data: () => const Text(
                    '送出',
                    textAlign: TextAlign.center,
                    style: CustomTheme.textWhite,
                  ),
                  error: (e) => const Text(
                    '送出',
                    textAlign: TextAlign.center,
                    style: CustomTheme.textWhite,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
