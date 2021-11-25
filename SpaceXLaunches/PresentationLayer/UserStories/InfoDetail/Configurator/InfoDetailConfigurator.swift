//
//  trueLaunchInfotrueLaunchInfoConfigurator.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 16/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

import UIKit
import Foundation

class InfoDetailModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, missionInfo: LaunchMissionCell.ViewModel) {

        if let viewController = viewInput as? InfoDetailViewController {
            configure(viewController: viewController, missionInfo: missionInfo)
        }
    }

    private func configure(viewController: InfoDetailViewController, missionInfo: LaunchMissionCell.ViewModel ) {

        let router = InfoDetailRouter(viewController: viewController)

        let presenter = InfoDetailPresenter(missionInfo: missionInfo)
        presenter.view = viewController
        presenter.router = router

        viewController.output = presenter
    }
}
