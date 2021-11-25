//
//  LaunchListtrueLaunchListViewInput.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 11/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

protocol LaunchListViewInput: class {
    func setMissions(missions: [LaunchMissionCell.ViewModel])
}
