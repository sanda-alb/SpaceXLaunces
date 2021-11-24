//
//  SingleImagetrueSingleImageViewInput.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 17/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//
import Foundation

protocol SingleImageViewInput: class {

    /**
        @author Albrekht Sanda
        Setup initial state of the view
    */

    func setupInitialState()
    
    func passImageURL(imageURL: URL)
}
