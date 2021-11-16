//
//  LaunchInfotrueLaunchInfoViewController.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 16/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

import UIKit
import SnapKit

class LaunchInfoViewController: UIViewController, LaunchInfoViewInput {
    
    var output: LaunchInfoViewOutput!

    var patch = UIImageView()
    var missionName = UILabel()
    var launchDate = UILabel()
    var rocketName = UILabel()
    var imageScroll = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    var wikipedia = UIButton()
    var article = UIButton()
    var video = UIButton()
    var reddit = UIButton()

    private let placeholderImage = UIImage(systemName: "shield")

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()

        embedViews()
        setupLayout()
        setupAppereance()
    }

    // MARK: LaunchInfoViewInput
    func setupInitialState() {
    }
    
    func passMissionVM(mission: LaunchMissionCell.ViewModel) {
        
        missionName.text = mission.missionName
        launchDate.text = mission.launchDate?.formatDate()
        let patchLink = URL(string: mission.patch ?? "")
        patch.kf.setImage(with: patchLink, placeholder: placeholderImage, options: nil, completionHandler: nil)
        rocketName.text = mission.rocketName
    }
    
    private func embedViews() {
        [ patch,
          missionName,
          launchDate,
          rocketName,
          imageScroll,
          wikipedia,
          article,
          video,
          reddit
        ].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupLayout() {
        
        missionName.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(20)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        launchDate.snp.makeConstraints { make in
            make.top.equalTo(missionName.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        rocketName.snp.makeConstraints {make in
            make.top.equalTo(launchDate.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
    }
        
        patch.snp.makeConstraints {make in
            make.top.equalTo(rocketName.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
        
        imageScroll.snp.makeConstraints {make in
            make.top.equalTo(patch.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            
        }
        
        wikipedia.snp.makeConstraints {make in
            make.top.equalTo(imageScroll.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(10)
            make.width.height.equalTo(40)
        }
        
        article.snp.makeConstraints {make in
            make.top.equalTo(imageScroll.snp.bottom).offset(20)
            make.leading.equalTo(wikipedia.snp.trailing).offset(10)
            make.width.height.equalTo(40)
        }
        
        reddit.snp.makeConstraints {make in
            make.top.equalTo(imageScroll.snp.bottom).offset(20)
            make.leading.equalTo(article.snp.trailing).offset(10)
            make.width.height.equalTo(40)
        }
        
        video.snp.makeConstraints {make in
            make.top.equalTo(imageScroll.snp.bottom).offset(20)
            make.leading.equalTo(reddit.snp.trailing).offset(10)
            make.width.height.equalTo(40)
        }
    }
        
    
    private func setupAppereance() {
        view.backgroundColor = .white
        
        missionName.textAlignment = .center
        missionName.font = .boldSystemFont(ofSize: 40)
        missionName.numberOfLines = 3
        
        launchDate.textAlignment = .center
        launchDate.font = .systemFont(ofSize: 15)
        
        rocketName.textAlignment = .center
        rocketName.font = .boldSystemFont(ofSize: 20)
        
    }
    
}
