//
//  LaunchListtrueLaunchListPresenter.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 11/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

class LaunchListPresenter {
    
    weak var view: LaunchListViewInput!
    var interactor: LaunchListInteractorInput!
    var router: LaunchListRouterInput!

    func viewIsReady() {
        interactor.fetchData()
    }
    
    func obtainData(missions: [Mission]) {
        let missions = missions.map {
            LaunchMissionCell.ViewModel.init(mission: $0)
        }
        view.setMissions(missions: missions)
    }
    
    func onCellTap(missionInfo: LaunchMissionCell.ViewModel) {
        router.showReleaseCard(missionInfo: missionInfo)
    }
}

extension LaunchListPresenter: LaunchListViewOutput {
}

extension LaunchListPresenter: LaunchListInteractorOutput {
}
