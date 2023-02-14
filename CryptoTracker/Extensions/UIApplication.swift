//
//  UIApplication.swift
//  CryptoTracker
//
//  Created by Anna Olak on 14/02/2023.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
