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
    func getDataSeriesModelFromInteractor(data: [ResultSeries]?)
    func getDataStoriesModelFromInteractor(data: [ResultStories]?)
    func getDataEventsModelFromInteractor(data: [ResultEvents]?)
    func getDataCharactersModelFromInteractor(data: [ResultCharacter]?)
}

final class ComicsPresenter: PresenterInterface, ObservableObject {
    
    // MARK: Variables
    @Published var comicsList: [ResultComics] = []
    @Published var seriesList: [ResultSeries] = []
    @Published var storiesList: [ResultStories] = []
    @Published var eventsList: [ResultEvents] = []
    @Published var charectersList: [ResultCharacter] = []

    // MARK: VIPER Dependencies
    var interactor: ComicsInteractorPresenterInterface!
    
    // MARK: Private Functions
    func viewDidLoad() {
        self.interactor.fetchDataComicsInteractor()
        self.interactor.fetchDataSeriesInteractor()
        self.interactor.fetchDataStoriesInteractor()
        self.interactor.fetchDataEventsInteractor()
        self.interactor.fetchDataCharactersInteractor()
    }
}

extension ComicsPresenter: ComicsPresenterInteractorInterface {

    func getDataComicsModelFromInteractor(data: [ResultComics]?) {
        guard let dataDes = data else { return }
        self.comicsList = dataDes
    }
    
    func getDataSeriesModelFromInteractor(data: [ResultSeries]?) {
        guard let dataDes = data else { return }
        self.seriesList = dataDes
    }
    
    func getDataStoriesModelFromInteractor(data: [ResultStories]?) {
        guard let dataDes = data else { return }
        self.storiesList = dataDes
    }
    
    func getDataEventsModelFromInteractor(data: [ResultEvents]?) {
        guard let dataDes = data else { return }
        self.eventsList = dataDes
    }
    
    func getDataCharactersModelFromInteractor(data: [ResultCharacter]?) {
        guard let dataDes = data else { return }
        self.charectersList = dataDes
    }
}
