//
//  LaunchListtrueLaunchListPresenter.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 11/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

class LaunchListPresenter: LaunchListModuleInput, LaunchListViewOutput, LaunchListInteractorOutput {
    
    weak var view: LaunchListViewInput!
    var interactor: LaunchListInteractorInput!
    var router: LaunchListRouterInput!

    func viewIsReady() {
        
        interactor.fetchMissions()
    }
    
    func setData(missions: [Mission]) {
        
        view.setData(missions: missions )
    }
    

}
