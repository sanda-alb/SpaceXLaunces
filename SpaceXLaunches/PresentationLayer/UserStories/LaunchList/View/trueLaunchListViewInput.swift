//
//  LaunchListtrueLaunchListViewInput.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 11/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

protocol LaunchListViewInput: class {

    /**
        @author Albrekht Sanda
        Setup initial state of the view
    */

    func setupInitialState()
    
    func setData(missions: [Mission])
}
