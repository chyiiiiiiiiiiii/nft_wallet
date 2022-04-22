import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nft_wallet/main.dart';
import 'package:nft_wallet/pages/begin/data/states/transfer_nft_state.dart';
import 'package:nft_wallet/pages/begin/domain/providers/home_provider.dart';

import '../../../../core/provider/shared_provider.dart';
import '../../../../core/util/theme.dart';
import '../../../../core/util/web3/abi/stream_chicken_2.g.dart';
import '../../data/models/nft.dart';
import '../../data/models/wallet_info.dart';
import '../widgets/common_button.dart';
import '../widgets/common_loading.dart';
import '../widgets/common_textfield.dart';

class TransferNFTDialog extends ConsumerWidget {
  TransferNFTDialog({
    Key? key,
    required this.contract,
    required this.nftInfo,
  }) : super(key: key);

  final Stream_chicken_2 contract;
  final NFTInfo nftInfo;

  final TextEditingController fromAddressEditController = TextEditingController();
  final TextEditingController toAddressEditController = TextEditingController();

  static Future<void> show(
    BuildContext context, {
    required Stream_chicken_2 contract,
    required NFTInfo nftInfo,
  }) async {
    await showDialog<TransferNFTDialog>(
      context: context,
      builder: (context) {
        return TransferNFTDialog(
          contract: contract,
          nftInfo: nftInfo,
        );
      },
    );
  }

  void _onConfirm({required WidgetRef ref}) {
    String toAddress = toAddressEditController.text;
    if (toAddress.isEmpty) {
      Fluttertoast.showToast(msg: '請輸入目的錢包位址');
      return;
    }

    ref.read(transferNFTProvider.notifier).transferNFT(
          contract: contract,
          nftTokenId: nftInfo.tokenId,
          toAddress: toAddress,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final WalletInfo? walletInfo = ref.watch(currentWalletProvider);
    if (walletInfo == null) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: '錢包有問題，請稍後再試');
    }
    //補上目前使用的錢包地址
    fromAddressEditController.text = walletInfo?.address ?? '';

    final TransferNFTState transferNFTState = ref.watch(transferNFTProvider);
    ref.listen<TransferNFTState>(transferNFTProvider, (prev, next) {
      if (next is TransferNFTData) {
        Navigator.pop(context);
        Navigator.pop(context);

        showToast(msg: 'NFT轉移中，請耐心等候5~10分鐘');
      } else if (next is TransferNFTError) {
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
              onPress: () => _onConfirm(ref: ref),
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              color: CustomTheme.secondColor,
              child: SizedBox(
                child: transferNFTState.whenOrNull(
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
