//
//  SingleImagetrueSingleImagePresenter.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 17/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

import Foundation

class SingleImagePresenter {
    
    weak var view: SingleImageViewInput!
    var router: SingleImageRouterInput!
    
    let imageURL: URL
    
    init(imageURL: URL) {
        self.imageURL = imageURL
    }

    func viewIsReady() {
        view.pass(imageURL: imageURL)
    }
}

extension SingleImagePresenter: SingleImageModuleInput {
}

extension SingleImagePresenter: SingleImageViewOutput {
}


