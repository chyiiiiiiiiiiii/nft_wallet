import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/util/theme.dart';
import '../../data/models/wallet_info.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

class AddWalletDialog extends StatelessWidget {
  AddWalletDialog({
    Key? key,
  }) : super(key: key);

  static Future<dynamic> show(BuildContext context) async {
    return showDialog<dynamic>(
      context: context,
      builder: (context) {
        return AddWalletDialog();
      },
    );
  }

  /// 匯入方式
  final importMethodProvider = StateProvider<WalletImportMethod>((ref) {
    return WalletImportMethod.privateKey;
  });

  final TextEditingController privateKeyEditController = TextEditingController();

  /// 取得匯入方式的文字
  String getImportMethodText(WalletImportMethod method) {
    String text = '';
    switch (method) {
      case WalletImportMethod.privateKey:
        text = 'PrivateKey';
        break;
      case WalletImportMethod.local:
        text = '創建新錢包';
        break;
      default:
    }
    return text;
  }

  /// 選擇匯入錢包的方式
  void _onSelectImportMethod({required WidgetRef ref}) {}

  /// 貼上複製到剪貼簿的文字
  Future<void> _onPastePrivateKey() async {
    ClipboardData? clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    String copiedtext = clipboardData?.text ?? '';
    privateKeyEditController.text = copiedtext;
    privateKeyEditController.selection =
        TextSelection.fromPosition(TextPosition(offset: privateKeyEditController.text.length));
  }

  /// 確認送出
  void _onConfirm(BuildContext context) {
    if (privateKeyEditController.text.isNotEmpty) {
      Navigator.maybePop(context, privateKeyEditController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      elevation: 10.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title
            Container(
              alignment: Alignment.center,
              child: const Text(
                '加入錢包',
                style: CustomTheme.textBoldBlack,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32.0),
            Row(
              children: [
                const Text(
                  '導入方式',
                  style: CustomTheme.textBlack,
                ),
                const SizedBox(width: 32.0),
                Expanded(
                  child: Consumer(builder: (context, ref, _) {
                    final WalletImportMethod method = ref.watch(importMethodProvider);
                    final String text = getImportMethodText(method);

                    return CommonButton(
                      onPress: () => _onSelectImportMethod(ref: ref),
                      padding: const EdgeInsets.all(16.0),
                      color: CustomTheme.primaryColor,
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: CustomTheme.textBlack,
                      ),
                    );
                  }),
                )
              ],
            ),
            const SizedBox(height: 36.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '私鑰',
                  style: CustomTheme.textSmallGray,
                ),
                GestureDetector(
                  onTap: () => _onPastePrivateKey(),
                  child: const Text(
                    '貼上',
                    style: CustomTheme.textSmallSecond,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            CommonTextField(textEditingController: privateKeyEditController),
            const SizedBox(height: 24.0),
            CommonButton(
              onPress: () => _onConfirm(context),
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
