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

protocol ComicsInteractorPresenterInterface: InteractorPresenterInterface {
    func fetchDataInteractor()
}

class ComicsInteractor: InteractorInterface {

    // MARK: VIPER Dependencies
    weak var presenter: ComicsPresenterInteractorInterface!
    var provider: ComicsProviderProtocol = ComicsProvider()
    
    // MARK: Private Functions

}

extension ComicsInteractor: ComicsInteractorPresenterInterface {

    func fetchDataInteractor() {
        //1
        self.provider.fetchDataComicsFromWeb { [weak self] (resultComicsModel) in
            guard let self = self else { return }
            if let resultComicsModelDes = resultComicsModel {
                self.presenter.getDataComicsModelFromInteractor(data: resultComicsModelDes.data?.results)
                //2
                self.provider.fetchDataSeriesFromWeb { (resultSeriesModel) in
                    if let resultSeriesModelDes = resultSeriesModel {
                        self.presenter.getDataSeriesModelFromInteractor(data: resultSeriesModelDes.data?.results)
                        
                        //3
                        self.provider.fetchDataStoriesFromWeb { (resultStoriesModel) in
                            if let resultStoriesModelDes = resultStoriesModel {
                                self.presenter.getDataStoriesModelFromInteractor(data: resultStoriesModelDes.data?.results)
                            }
                        } failure: { (errorApi) in
                            print(errorApi)
                        }

                    }
                } failure: { (errorApi) in
                    print(errorApi.localizedDescription)
                }

            }
        } failure: { (errorApi) in
            print(errorApi.localizedDescription)
        }

    }
}
