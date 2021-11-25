//
//  LaunchListtrueLaunchListRouter.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 11/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

class LaunchListRouter {    
    
    weak var viewController: LaunchListViewController?
    
    init (viewController: LaunchListViewController) {
        self.viewController = viewController
    }

    func showReleaseCard(missionInfo: LaunchMissionCell.ViewModel) {
        let vc = InfoDetailViewController()
        InfoDetailModuleConfigurator().configureModuleForViewInput(viewInput: vc, missionInfo: missionInfo)
        
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

extension  LaunchListRouter: LaunchListRouterInput {
}
