import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/provider/shared_provider.dart';
import '../../../../core/util/theme.dart';
import '../../data/models/wallet_info.dart';

class TransferMoneyDialog extends ConsumerWidget {
  const TransferMoneyDialog({
    Key? key,
  }) : super(key: key);

  static Future<void> show(BuildContext context) async {
    await showDialog<TransferMoneyDialog>(
      context: context,
      builder: (context) {
        return const TransferMoneyDialog();
      },
    );
  }

  void _onTransfer() {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final WalletInfo walletInfo = ref.watch(currentWalletProvider);
    return Dialog(
      backgroundColor: Colors.white,
      insetAnimationCurve: Curves.easeInOut,
      insetAnimationDuration: const Duration(milliseconds: 100),
      elevation: 10.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
