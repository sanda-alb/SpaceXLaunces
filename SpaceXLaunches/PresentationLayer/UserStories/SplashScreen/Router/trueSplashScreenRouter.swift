//
//  SplashScreentrueSplashScreenRouter.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 22/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

class SplashScreenRouter: SplashScreenRouterInput {
    
    weak var viewController: SplashScreenViewController?
    
    init (viewController: SplashScreenViewController) {
        self.viewController = viewController
    }

    func goToLaunchList() {
        
        let vc = LaunchListViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        LaunchListModuleConfigurator().configureModuleForViewInput(viewInput: vc)
        viewController?.navigationController?.present(vc, animated: true, completion: nil)
    }
}
