//
//  LaunchInfotrueLaunchInfoViewInput.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 16/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

protocol LaunchInfoViewInput: class {

    /**
        @author Albrekht Sanda
        Setup initial state of the view
    */

    func setupInitialState()
    
    func passMission(mission: LaunchMissionCell.ViewModel)
}
