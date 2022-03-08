//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by MANAS VIJAYWARGIYA on 08/03/22.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
