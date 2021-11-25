//
//  LaunchInfotrueLaunchInfoPresenter.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 16/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

import Foundation

class InfoDetailPresenter {

    weak var view: InfoDetailViewInput!
    var router: InfoDetailRouterInput!
    
    let missionInfo: LaunchMissionCell.ViewModel
    
    init(missionInfo: LaunchMissionCell.ViewModel) {
        self.missionInfo = missionInfo
    }
    
    func viewIsReady() {
        view.setMission(mission: missionInfo)
    }
    
    func onImageTap(imageURL: URL) {
        router.openLargeImage(imageURL: imageURL)
    }
}

extension InfoDetailPresenter: InfoDetailViewOutput {
}


