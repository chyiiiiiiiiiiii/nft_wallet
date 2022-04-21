import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/provider/shared_provider.dart';
import '../../../../core/util/theme.dart';
import '../../data/models/wallet_info.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

class TransferNFTDialog extends ConsumerWidget {
  TransferNFTDialog({
    Key? key,
  }) : super(key: key);

  final TextEditingController fromAddressEditController = TextEditingController();
  final TextEditingController toAddressEditController = TextEditingController();

  static Future<void> show(BuildContext context) async {
    await showDialog<TransferNFTDialog>(
      context: context,
      builder: (context) {
        return TransferNFTDialog();
      },
    );
  }

  void _onConfirm() {
    String toAddress = toAddressEditController.text;
    if (toAddress.isEmpty) {
      Fluttertoast.showToast(msg: '請輸入目的錢包位址');
      return;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final WalletInfo? walletInfo = ref.watch(currentWalletProvider);
    fromAddressEditController.text = walletInfo?.address ?? '';

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
                '轉移NFT',
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
                    const Text(
                      'from',
                      style: CustomTheme.textBlack,
                    ),
                    const SizedBox(width: 32.0),
                    SizedBox(
                      width: 200.0,
                      child: CommonTextField(
                        textEditingController: fromAddressEditController,
                        hint: 'address',
                        hintStyle: CustomTheme.textGray,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                          signed: false,
                        ),
                        readOnly: true,
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
              onPress: () => _onConfirm(),
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              color: CustomTheme.secondColor,
              child: const Text(
                '送出',
                textAlign: TextAlign.center,
                style: CustomTheme.textWhite,
              ),
            )
          ],
        ),
      ),
    );
  }
}
