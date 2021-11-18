//
//  trueSingleImagetrueSingleImageConfigurator.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 17/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

import UIKit
import Foundation

class SingleImageModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, imageURL: URL) {

        if let viewController = viewInput as? SingleImageViewController {
            configure(viewController: viewController, imageURL: imageURL)
        }
    }

    private func configure(viewController: SingleImageViewController, imageURL: URL) {

        let router = SingleImageRouter()

        let presenter = SingleImagePresenter(imageURL: imageURL)
        presenter.view = viewController
        presenter.router = router

        let interactor = SingleImageInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
