//
//  SplashScreentrueSplashScreenViewController.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 22/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

import UIKit

private let splashScreenImage =  UIImage(named: "SplashScreen")
private let imageView = UIImageView()

class SplashScreenViewController: UIViewController, SplashScreenViewInput {

    var output: SplashScreenViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        
        embedViews()
        setupLayout()
        setupAppereance()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.output.goToLaunchList()
        }
    }

    // MARK: SplashScreenViewInput
    func setupInitialState() {
    }
    
    private func embedViews() {
        view.addSubview(imageView)
    }
    
    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.bottom.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(-10)
            make.trailing.equalToSuperview().offset(-10)
        }
    }
    
    private func setupAppereance() {
        view.backgroundColor = .white
        imageView.image = splashScreenImage
        imageView.contentMode = .scaleAspectFit
    }
}
