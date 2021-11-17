//
//  SingleImagetrueSingleImagePresenter.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 17/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

class SingleImagePresenter: SingleImageModuleInput, SingleImageViewOutput, SingleImageInteractorOutput {
    
    weak var view: SingleImageViewInput!
    var interactor: SingleImageInteractorInput!
    var router: SingleImageRouterInput!
    let imageURL: String
    
    init(imageURL: String) {
        self.imageURL = imageURL
    }

    func viewIsReady() {

    }
    
    func imageTapped(imageURL: String) {
    //
    }
    
    
}
