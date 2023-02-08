//
//  Double.swift
//  CryptoTracker
//
//  Created by Anna Olak on 08/02/2023.
//

import Foundation

extension Double {
    
    /// Converts a Doble into a Currency with 2 decimal places
    /// ```
    /// Convert 1234,56 to $1,234.56
    /// ```
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        //formatter.locale = .current
        //formatter.currencyCode = "usd"
        //formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    /// Converts a Doble into a Currency as a String with 2 decimal places
    /// ```
    /// Convert 1234,56 to "$1,234.56"
    /// Convert 12.3456 to "$12.34"
    /// Convert 0.123456 to "$0.12"
    /// ```
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    /// Converts a Doble into a Currency with 2-6 decimal places
    /// ```
    /// Convert 1234,56 to $1,234.56
    /// Convert 12.3456 to $12.3456
    /// Convert 0.123456 to $0.123456
    /// ```
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        //formatter.locale = .current
        //formatter.currencyCode = "usd"
        //formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    /// Converts a Doble into a Currency as a String with 2-6 decimal places
    /// ```
    /// Convert 1234,56 to "$1,234.56"
    /// Convert 12.3456 to "$12.3456"
    /// Convert 0.123456 to "$0.123456"
    /// ```
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    /// Converts a Doble into a String with 2 decimal places
    /// ```
    /// Convert 12.3456 to "12.34"
    /// ```
    func asNumberString() -> String {
        String(format: "%.2f", self)
    }
    
    /// Converts a Doble into a percent String with 2 decimal places
    /// ```
    /// Convert 12.3456 to "12.34%"
    /// ```
    func asPercentString() -> String {
        asNumberString() + "%"
    }
}
