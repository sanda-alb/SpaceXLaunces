//
//  trueLaunchListtrueLaunchListConfigurator.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 11/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

import UIKit

class LaunchListModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        
        if let viewController = viewInput as? LaunchListViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: LaunchListViewController) {

        let router = LaunchListRouter()

        let presenter = LaunchListPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = LaunchListInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
