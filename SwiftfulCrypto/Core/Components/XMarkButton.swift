//
//  XMarkButton.swift
//  SwiftfulCrypto
//
//  Created by MANAS VIJAYWARGIYA on 09/03/22.
//

import SwiftUI

struct XMarkButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "xmark")
                .font(.headline)
        }
    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var action: () -> Void = {}
    static var previews: some View {
        XMarkButton(action: action)
    }
}
