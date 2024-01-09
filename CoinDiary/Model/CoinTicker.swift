//
//  CoinTicker.swift
//  CoinDiary
//
//  Created by 장혜성 on 1/9/24.
//

import Foundation

struct CoinTicker: Codable {
    let code: String
    let highPrice: Double       // 고가
    let lowPrice: Double        // 저가
    let tradePrice: Double      // 현재가
    let accTradePrice: Double  // 누적 거래대금
    
    var tradePriceValue: String {
        if tradePrice < 1 {
            return "\(round(tradePrice * 10000) / 10000)"
        } else {
            let numberFormatter: NumberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let resultNum = numberFormatter.string(for: tradePrice)
            return resultNum ?? "0"
        }
    }
    
    var accTradePriceValue: String {
        let acc = accTradePrice / 1000000
        let convert = Int(round(acc))
        
        return if convert < 1 {
            "\(round(accTradePrice * 1000) / 1000)"
        } else {
            "\(convert)백만"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case code
        case highPrice = "high_price"
        case lowPrice = "low_price"
        case tradePrice = "trade_price"
        case accTradePrice = "acc_trade_price"
    }
}