//
//  Created on 24/03/2021.
// subfolder/Filename.swift - Very brief description
//
// This source file is part of the everis open source project in iOS Desktop
//
// Copyright (c) 2020 EVERIS Sl. and the Swift project authors iOS Desktop
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://steps.everis.com/git/MOVILIDAD/architecture-swiftui-ios/-/blob/master/README.md for text information
//
// -----------------------------------------------------------------------------
///
/// This file contains stuff that I am describing here in the header and will
/// be sure to keep up to date.
///
// -----------------------------------------------------------------------------

import Foundation
import SwiftUI

final class ComicsModule: ModuleInterface {
    
    typealias ContentView = ComicsView
    typealias Presenter = ComicsPresenter
    typealias Interactor = ComicsInteractor
    
    func navigation() -> NavigationView<ContentView> {
        NavigationView {
            build()
        }
    }
    
    func build() -> ContentView {
        let presenter = Presenter()
        let interactor = Interactor()
        let view = ContentView(viewModel: presenter)
        self.assemble(presenter: presenter, interactor: interactor)
        return view
    }
}

