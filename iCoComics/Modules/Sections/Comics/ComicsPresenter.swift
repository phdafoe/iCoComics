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

protocol ComicsPresenterInteractorInterface: PresenterInteractorInterface {
    func getDataComicsModelFromInteractor(data: [ResultComics]?)
}

final class ComicsPresenter: PresenterInterface, ObservableObject {
    
    // MARK: Variables
    @Published var comicsList: [ResultComics] = []

    // MARK: VIPER Dependencies
    var interactor: ComicsInteractorPresenterInterface!
    
    // MARK: Private Functions
    func viewDidLoad() {
        self.interactor.fetchDataInteractor()
    }
}

extension ComicsPresenter: ComicsPresenterInteractorInterface {

    func getDataComicsModelFromInteractor(data: [ResultComics]?) {
        guard let dataDes = data else { return }
        self.comicsList = dataDes
    }
}
