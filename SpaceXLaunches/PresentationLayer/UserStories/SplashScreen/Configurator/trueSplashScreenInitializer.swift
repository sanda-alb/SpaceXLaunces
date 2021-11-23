//
//  trueSplashScreentrueSplashScreenInitializer.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 22/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

import UIKit

class SplashScreenModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var splashscreenViewController: SplashScreenViewController!

    override func awakeFromNib() {

        let configurator = SplashScreenModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: splashscreenViewController)
    }

}
