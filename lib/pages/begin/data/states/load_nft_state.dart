import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/nft.dart';


part 'load_nft_state.freezed.dart';

@freezed
class LoadNFTState with _$LoadNFTState {
  const factory LoadNFTState.init() = LoadNFTInitial;
  const factory LoadNFTState.loading() = LoadNFTLoading;
  const factory LoadNFTState.data({required List<NFTCollection> nftCollectionList}) = LoadNFTData;
  const factory LoadNFTState.error({required String msg}) = LoadNFTError;
}
