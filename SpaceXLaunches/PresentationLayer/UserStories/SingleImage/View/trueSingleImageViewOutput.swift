//
//  SingleImagetrueSingleImageViewOutput.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 17/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

protocol SingleImageViewOutput {

    /**
        @author Albrekht Sanda
        Notify presenter that view is ready
    */

    func viewIsReady()
    
    func imageTapped(imageURL: String)
}
