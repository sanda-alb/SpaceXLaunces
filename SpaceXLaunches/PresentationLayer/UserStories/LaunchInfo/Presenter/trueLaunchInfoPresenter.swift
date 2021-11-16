//
//  LaunchInfotrueLaunchInfoPresenter.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 16/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

class LaunchInfoPresenter: LaunchInfoModuleInput, LaunchInfoViewOutput, LaunchInfoInteractorOutput {

    weak var view: LaunchInfoViewInput!
    var interactor: LaunchInfoInteractorInput!
    var router: LaunchInfoRouterInput!
    let missionInfo: LaunchMissionCell.ViewModel
    
    init(missionInfo: LaunchMissionCell.ViewModel) {
        self.missionInfo = missionInfo
    }
    
//    func setInfo(missionInfo: LaunchMissionCell.ViewModel) {
//        view.passMissionVM(mission: missionInfo)
//    }
    

    func viewIsReady() {
        view.passMissionVM(mission: missionInfo)
    }
}
