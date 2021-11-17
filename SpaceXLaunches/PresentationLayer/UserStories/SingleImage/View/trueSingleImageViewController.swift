//
//  SingleImagetrueSingleImageViewController.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 17/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

import UIKit

class SingleImageViewController: UIViewController, SingleImageViewInput {

    var output: SingleImageViewOutput!
    var tappedImage = UIImageView ()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        
        embedViews()
        setupLayout()
        setupAppereance()
    }


    // MARK: SingleImageViewInput
    func setupInitialState() {
    }
    
    private func embedViews() {
        
        view.addSubview(tappedImage)
    }
    
    private func setupLayout() {
        
        tappedImage.snp.makeConstraints {make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(10)
            make.center.centerY.equalToSuperview()
        }
    }
    
    private func setupAppereance() {
        view.backgroundColor = .cyan
        
        tappedImage.contentMode = .scaleAspectFit
        tappedImage.clipsToBounds = true
    }
}
