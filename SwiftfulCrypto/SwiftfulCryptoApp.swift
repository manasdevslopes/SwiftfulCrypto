//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by MANAS VIJAYWARGIYA on 05/03/22.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
