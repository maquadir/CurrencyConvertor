//
//  Data.swift
//  CurrencyConvertor
//
//  Created by Quadir on 1/21/20.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct CurrencyConv {
    let apiVersion: String
    let status: Int
    let data: DataClass
}

// MARK: - DataClass
struct DataClass {
    let brands: Brands

}

// MARK: - Brands
struct Brands {
    let wbc: Wbc

}

// MARK: - Wbc
struct Wbc {
    let brand: String
    let portfolios: Portfolios

}

// MARK: - Portfolios
struct Portfolios {
    let fx: Fx

}

// MARK: - Fx
struct Fx {
    let portfolioID: String
    let products: Products

}

// MARK: - Products
struct Products {
    let currency: Curr

}

// MARK: - Usd
struct Curr {
    let productID: String
    let rates: Rates
}

// MARK: - USDRates
struct Rates {
    let curr: PuneHedgehog
}



// MARK: - PuneHedgehog
struct PuneHedgehog {
    let currencyCode, currencyName, country, buyTT: String
    let sellTT, buyTC, buyNotes, sellNotes: String
    let spotRateDateFmt: String
    let effectiveDateFmt, updateDateFmt: String
    let lastupdated: String
}
