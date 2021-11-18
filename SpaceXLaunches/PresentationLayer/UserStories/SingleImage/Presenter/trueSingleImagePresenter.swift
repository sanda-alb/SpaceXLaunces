//
//  SingleImagetrueSingleImagePresenter.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 17/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

import Foundation

class SingleImagePresenter: SingleImageModuleInput, SingleImageViewOutput, SingleImageInteractorOutput {
    
    weak var view: SingleImageViewInput!
    var interactor: SingleImageInteractorInput!
    var router: SingleImageRouterInput!
    let imageURL: URL
    
    init(imageURL: URL) {
        self.imageURL = imageURL
    }

    func viewIsReady() {
        view.passURL(imageURL: imageURL)
    }
}
