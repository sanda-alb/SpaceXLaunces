//
//  LaunchListtrueLaunchListRouter.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 11/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

class LaunchListRouter: LaunchListRouterInput {    
    
    weak var viewController: LaunchListViewController?
    
    init (viewController: LaunchListViewController) {
        self.viewController = viewController
    }

    func openInfoScreen(missionInfo: LaunchMissionCell.ViewModel) {
        let vc = LaunchInfoViewController()
        LaunchInfoModuleConfigurator().configureModuleForViewInput(viewInput: vc, missionInfo: missionInfo)
        
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
