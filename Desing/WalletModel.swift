//
//  WalletModel.swift
//  Desing
//
//  Created by Roja on 17/11/22.
//

import UIKit

struct WalletModel {
    let btc: String
    let amount: String
    let progress: String
    let points: String
    let walletIcon: String
    let iconColor: UIColor
    
    static func getWalletBalance() -> [WalletModel] {
        let wallet1 = WalletModel(btc: "3.529020 BTC",
                                  amount: "$ 5.441",
                                  progress: "$ 19.153",
                                  points: "+ 4.32%",
                                  walletIcon: "BTC", iconColor: .orange)
        let wallet2 = WalletModel(btc: "12.633681 ETH",
                                  amount: "$ 401",
                                  progress: "$4.822",
                                  points: "+ 3.97",
                                  walletIcon: "ETH", iconColor: .magenta)
        let wallet3 = WalletModel(btc: "1911.633681 XRP",
                                  amount: "$ 0.45",
                                  progress: "$859",
                                  points: "-13.55%",
                                  walletIcon: "cross", iconColor: .blue)
        
        let balance = [wallet1, wallet2, wallet3]
        return balance
    
    }
}
