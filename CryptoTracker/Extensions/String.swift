//
//  String.swift
//  CryptoTracker
//
//  Created by Anna Olak on 01/03/2023.
//

import Foundation

extension String {
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
