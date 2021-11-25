//
//  LaunchInfotrueLaunchInfoRouter.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 16/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

import Foundation

class InfoDetailRouter: InfoDetailRouterInput {

    weak var viewController: InfoDetailViewController?
    
    init (viewController: InfoDetailViewController) {
        self.viewController = viewController
    }
    
    func openLargeImage(imageURL: URL) {
        let vc = SingleImageViewController()
        SingleImageModuleConfigurator().configureModuleForViewInput(viewInput: vc, imageURL: imageURL)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
