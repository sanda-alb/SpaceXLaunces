//
//  LaunchInfotrueLaunchInfoViewOutput.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 16/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//
import Foundation

protocol LaunchInfoViewOutput {

    /**
        @author Albrekht Sanda
        Notify presenter that view is ready
    */

    func viewIsReady()
    
    func imageTapped(imageURL: URL)
}
