//
//  XMarkButton.swift
//  CryptoTracker
//
//  Created by Anna Olak on 16/02/2023.
//

import SwiftUI

struct XMarkButton: View {
    var dismiss: () -> Void = {}
    
    var body: some View {
        Button(action: {
            print("DISMISS")
            dismiss()
        }, label:  {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton()
    }
}
