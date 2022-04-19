import 'package:flutter/material.dart';

import '../../../../../core/util/theme.dart';
import '../../../data/models/token_info.dart';
import '../../dialogs/transfer_money_dialog.dart';
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
    return Builder(builder: (context) {
      return ListView.builder(
        itemCount: tokenInfoList.length,
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        itemBuilder: (context, index) {
          final TokenInfo tokenInfo = tokenInfoList[index];
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
                      tokenInfoList[index].imgPath,
                      width: 25,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      tokenInfoList[index].name,
                      style: CustomTheme.textBlack,
                    ),
                    const Spacer(),
                    Text(tokenInfo.amount.toStringAsFixed(5)),
                    const SizedBox(width: 10),
                    CommonButton(
                      onPress: () => TransferMoneyDialog.show(context),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          '轉帳',
                          style: CustomTheme.textBlack,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
