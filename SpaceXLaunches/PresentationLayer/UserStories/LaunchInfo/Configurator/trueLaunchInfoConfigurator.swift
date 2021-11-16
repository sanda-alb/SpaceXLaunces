//
//  trueLaunchInfotrueLaunchInfoConfigurator.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 16/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

import UIKit

class LaunchInfoModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, missionInfo: LaunchMissionCell.ViewModel) {

        if let viewController = viewInput as? LaunchInfoViewController {
            configure(viewController: viewController, missionInfo: missionInfo)
        }
    }

    private func configure(viewController: LaunchInfoViewController, missionInfo: LaunchMissionCell.ViewModel ) {

        let router = LaunchInfoRouter()

        let presenter = LaunchInfoPresenter(missionInfo: missionInfo)
        presenter.view = viewController
        presenter.router = router

        let interactor = LaunchInfoInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
