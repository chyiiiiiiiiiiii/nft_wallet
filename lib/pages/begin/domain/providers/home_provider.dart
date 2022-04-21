import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/provider/shared_provider.dart';
import '../../../../core/util/web3/abi/stream_chicken_2.g.dart';
import '../../../../core/util/web3/wallet_helper.dart';
import '../../data/models/token_info.dart';
import '../../data/states/transfer_coin_state.dart';
import '../../data/states/transfer_nft_state.dart';

final StateProvider<int> tabCurrentIndexProvider = StateProvider<int>((ref) {
  return 0;
});

///
final transferCoinProvider = StateNotifierProvider<TransferCoinNotifier, TransferCoinState>((ref) {
  WalletHelper walletHelper = ref.watch(walletHelperProvider);
  return TransferCoinNotifier(walletHelper: walletHelper);
});

class TransferCoinNotifier extends StateNotifier<TransferCoinState> {
  final WalletHelper walletHelper;

  TransferCoinNotifier({required this.walletHelper}) : super(const TransferCoinState.data());

  Future<void> transferCoin({
    required String toAddress,
    required num sendAmount,
    TokenInfo? tokenInfo,
  }) async {
    state = const TransferCoinState.loading();
    try {
      final String transactionHash = await walletHelper.transferCoin(
        toAddress: toAddress,
        amount: sendAmount,
        tokenInfo: tokenInfo,
      );
      state = const TransferCoinState.data();
    } catch (e) {
      state = TransferCoinState.error(msg: e.toString());
    }
  }
}

///
final transferNFTProvider = StateNotifierProvider<TransferNFTNotifier, TransferNFTState>((ref) {
  WalletHelper walletHelper = ref.watch(walletHelperProvider);
  return TransferNFTNotifier(walletHelper: walletHelper);
});

class TransferNFTNotifier extends StateNotifier<TransferNFTState> {
  final WalletHelper walletHelper;
  TransferNFTNotifier({required this.walletHelper}) : super(const TransferNFTState.data());

  Future<void> transferNFT({
    required Stream_chicken_2 contract,
    required int nftTokenId,
    required String toAddress,
  }) async {
    state = const TransferNFTState.loading();
    try {
      final String transactionHash = await walletHelper.transferNFT(
        contract: contract,
        toAddress: toAddress,
        nftTokenId: nftTokenId,
      );
      state = const TransferNFTState.data();
    } catch (e) {
      state = TransferNFTState.error(msg: e.toString());
    }
  }
}
