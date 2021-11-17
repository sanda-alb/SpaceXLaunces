//
//  LaunchInfotrueLaunchInfoRouter.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 16/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

class LaunchInfoRouter: LaunchInfoRouterInput {

    
    weak var viewController: LaunchInfoViewController?
    
    init (viewController: LaunchInfoViewController) {
        self.viewController = viewController
    }
    
    func goToLargeImage(imageURL: String) {
        let vc = SingleImageViewController()
        SingleImageModuleConfigurator().configureModuleForViewInput(viewInput: vc, imageURL: imageURL)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}


