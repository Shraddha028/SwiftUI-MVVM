//
//  SwiftUI_MVVMApp.swift
//  SwiftUI+MVVM
//
//  Created by shraddha.sutar@accenture.com on 31/01/23.
//

import SwiftUI

@main
struct SwiftUI_MVVMApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(imageViewModel: ImageViewModel())
        }
    }
}
