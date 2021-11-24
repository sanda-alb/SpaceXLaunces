//
//  LaunchListtrueLaunchListPresenter.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 11/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

import Foundation

class LaunchListPresenter: LaunchListModuleInput, LaunchListViewOutput, LaunchListInteractorOutput {    
    
    weak var view: LaunchListViewInput!
    var interactor: LaunchListInteractorInput!
    var router: LaunchListRouterInput!

    func viewIsReady() {
        interactor.fetchData()
    }
    
    func passData(missions: [Mission]) {
        let missions = missions.map(LaunchMissionCell.ViewModel.init(mission: ))
        view.fetchMissions(missions: missions)
    }
    
    func cellTapped(missionInfo: LaunchMissionCell.ViewModel) {
        router.openInfoScreen(missionInfo: missionInfo)
    }
    
  
}


