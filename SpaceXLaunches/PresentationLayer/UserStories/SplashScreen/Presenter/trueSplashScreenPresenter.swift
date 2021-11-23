//
//  SplashScreentrueSplashScreenPresenter.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 22/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

class SplashScreenPresenter: SplashScreenModuleInput, SplashScreenViewOutput, SplashScreenInteractorOutput {
    
    weak var view: SplashScreenViewInput!
    var interactor: SplashScreenInteractorInput!
    var router: SplashScreenRouterInput!

    func viewIsReady() {

    }
    func goToLaunchList() {
        router.goToLaunchList()
    }
}
