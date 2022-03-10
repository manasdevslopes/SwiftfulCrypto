//
//  HapticsManager.swift
//  SwiftfulCrypto
//
//  Created by MANAS VIJAYWARGIYA on 10/03/22.
//

import Foundation
import SwiftUI

class HapticsManager {
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
