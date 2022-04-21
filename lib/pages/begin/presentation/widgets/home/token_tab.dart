import 'package:flutter/material.dart';

import '../../../../../core/util/theme.dart';
import '../../../data/models/token_info.dart';
import '../../dialogs/transfer_coin_dialog.dart';
import '../common_button.dart';

class TokenTab extends StatelessWidget {
  final List<TokenInfo> tokenInfoList;
  final Function(TokenInfo) onTransfer;

  const TokenTab({
    Key? key,
    required this.tokenInfoList,
    required this.onTransfer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tokenInfoList.length,
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      itemBuilder: (context, index) {
        final TokenInfo tokenInfo = tokenInfoList[index];
        return _CoinItem(
          onTransfer: onTransfer,
          tokenInfo: tokenInfo,
        );
      },
    );
  }
}

class _CoinItem extends StatelessWidget {
  const _CoinItem({
    Key? key,
    required this.onTransfer,
    required this.tokenInfo,
  }) : super(key: key);

  final Function(TokenInfo p1) onTransfer;
  final TokenInfo tokenInfo;

  @override
  Widget build(BuildContext context) {
    final String amount = tokenInfo.amount == 0
        ? '0'
        : tokenInfo.amount.toString().length > 4
            ? tokenInfo.amount.toStringAsFixed(4)
            : tokenInfo.amount.toString();
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: CommonButton(
        color: Colors.white,
        onPress: () => onTransfer(tokenInfo),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Row(
            children: [
              Image.asset(
                tokenInfo.imgPath,
                width: 25,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      tokenInfo.name,
                      textAlign: TextAlign.left,
                      style: CustomTheme.textBlack,
                    ),
                    Text(
                      "\$$amount",
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              CommonButton(
                onPress: () => TransferCoinDialog.show(
                  context,
                  tokenInfo: tokenInfo,
                ),
                child: const Text(
                  '轉帳',
                  style: CustomTheme.textBlack,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
