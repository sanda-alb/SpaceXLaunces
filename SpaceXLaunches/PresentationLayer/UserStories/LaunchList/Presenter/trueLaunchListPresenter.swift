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
    
    func convertToViewModel(missions: [Mission]) {
 
        let cellViewModels = missions.map(LaunchMissionCell.ViewModel.init(mission: ))
        view.passViewModels(cellViewModels: cellViewModels)
    }
    
    func passDataFromInteractor(missions: [Mission]) {
        
        convertToViewModel(missions: missions)
    }
    
  
}


