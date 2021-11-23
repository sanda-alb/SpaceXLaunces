//
//  trueSplashScreentrueSplashScreenConfigurator.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 22/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

import UIKit

class SplashScreenModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? SplashScreenViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: SplashScreenViewController) {

        let router = SplashScreenRouter(viewController: viewController)

        let presenter = SplashScreenPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = SplashScreenInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
