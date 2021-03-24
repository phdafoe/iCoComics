//
//  iCoComicsApp.swift
//  iCoComics
//
//  Created by Andres Felipe Ocampo Eljaiek on 24/03/2021.
//

import SwiftUI

@main
struct iCoComicsApp: App {
    var body: some Scene {
        WindowGroup {
            ComicsModule().navigation().environment(\.colorScheme, .dark)
        }
    }
}
