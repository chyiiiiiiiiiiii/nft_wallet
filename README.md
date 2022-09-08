# nft_wallet

<img src="media/demo.gif" width="300" height="648" />

## Introduction
此專案為Side project，主要實作一個區塊鏈錢包APP，進行一些合約操作，可以取得貨幣與NFT資訊，並將他們轉移出去。

## Function Implement
- [x] 連結錢包，Metamask、匯入私鑰
- [x] 切換多個錢包
- [x] 提供測試鏈上的ERC20合約，ETH、USDT
- [x] 提供有支援的ERC721合約，NFT 
- [x] 取得錢包裡擁有的貨幣
- [x] 取得錢包擁有的NFT，StreamChicken2
- [x] 瀏覽NFT的詳情頁面
- [x] 轉移貨幣
- [x] 轉移NFT

## Issue
- [x] 交易完成後，Metamask會發出錯誤通知(Oops Something Went Wrong)，實際上操作有成功
- 在Metamask v5.3.0已修正，詳細資訊可查看 [#3927](https://github.com/MetaMask/metamask-mobile/issues/3927)、[#4446](https://github.com/MetaMask/metamask-mobile/issues/4446)、[#4060](https://github.com/MetaMask/metamask-mobile/issues/4060) 

## Packages
- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod)
- [walletconnect_dart](https://pub.dev/packages/wallet_connect)
- [web3dart](https://pub.dev/packages/web3dart)
- [url_launcher](https://pub.dev/packages/url_launcher)

## Artical
- [Riverpod 輕鬆學，原來這麼好用！](https://ab20803.medium.com/riverpod-%E8%BC%95%E9%AC%86%E5%AD%B8-%E5%8E%9F%E4%BE%86%E9%80%99%E9%BA%BC%E5%A5%BD%E7%94%A8-7e7b231570bc)
- [Riverpod 輕鬆學(二)，一些進階用法！](https://ab20803.medium.com/riverpod-%E8%BC%95%E9%AC%86%E5%AD%B8-%E4%BA%8C-%E4%B8%80%E4%BA%9B%E9%80%B2%E9%9A%8E%E7%94%A8%E6%B3%95-80acf4f27ef4)

## Contribute
- You can star and share with other developers if you feel good and learn something from this repository.
- If you have some ideas, please discuss them with me or commit PR.

## More of me
[![Medium](https://img.shields.io/badge/medium-fff?style=for-the-badge&logo=medium&logoColor=black)](https://yiichenhi.medium.com)
[![Linkedin](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/yiichenhi/)
[![Twitter](https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/yiichenhi)
[![instagram](https://img.shields.io/badge/instagram-C6317F?style=for-the-badge&logo=instagram&logoColor=white)](http://instagram.com/flutterluvr.yii/)

## Donate and encourage me
[![BuyMeACoffee][buy_me_a_coffee_badge]][buy_me_a_coffee]

<!-- Links -->
[buy_me_a_coffee]: https://www.buymeacoffee.com/yiichenhi
[buy_me_a_coffee_badge]: https://img.buymeacoffee.com/button-api/?text=Sponsor&emoji=&slug=yiichenhi&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=ffffff&size=64
