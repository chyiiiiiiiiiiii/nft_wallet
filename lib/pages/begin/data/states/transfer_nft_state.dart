import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/wallet_info.dart';

part 'transfer_nft_state.freezed.dart';

@freezed
class TransferNFTState with _$TransferNFTState {
  const factory TransferNFTState.init() = TransferNFTInitial;
  const factory TransferNFTState.loading() = TransferNFTLoading;
  const factory TransferNFTState.data() = TransferNFTData;
  const factory TransferNFTState.error({required String msg}) = TransferNFTError;
}
