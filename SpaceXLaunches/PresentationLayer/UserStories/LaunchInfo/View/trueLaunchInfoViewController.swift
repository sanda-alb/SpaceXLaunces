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

    private var patch = UIImageView()
    private var missionName = UILabel()
    private var launchDate = UILabel()
    private var rocketName = UILabel()
    private var wikipedia = UIButton()
    private var article = UIButton()
    private var video = UIButton()
    private var reddit = UIButton()
    private var images: [URL] = []
    private var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
   
    private let placeholderImage = UIImage(systemName: "shield")
    private let buttonImage = UIImage(systemName: "arrowshape.turn.up.left.fill" )

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()

        embedViews()
        setupLayout()
        setupAppereance()
        configureCollectionView()
        
    }

    // MARK: LaunchInfoViewInput
    func setupInitialState() {
    }
    
    func passMissionVM(mission: LaunchMissionCell.ViewModel) {
        
        let patchLink = URL(string: mission.patch ?? "")
        let imagesURLArray = mission.images.compactMap { URL(string: $0) }
        images = imagesURLArray
        missionName.text = mission.missionName
        launchDate.text = mission.launchDate?.formatDate()
        patch.kf.setImage(with: patchLink, placeholder: placeholderImage, options: nil, completionHandler: nil)
        rocketName.text = mission.rocketName
    }
    
    func apply(mission: LaunchMissionCell.ViewModel) {
        
    }
    
    private func embedViews() {
        [
          patch,
          missionName,
          launchDate,
          rocketName,
          collectionView,
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
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        launchDate.snp.makeConstraints { make in
            make.top.equalTo(missionName.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        rocketName.snp.makeConstraints { make in
            make.top.equalTo(launchDate.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
    }
        
        patch.snp.makeConstraints { make in
            make.top.equalTo(rocketName.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
        
       collectionView.snp.makeConstraints { make in
            make.top.equalTo(patch.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(200)
            
        }
        
        wikipedia.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(10)
            make.width.height.equalTo(40)
        }
        
        article.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(20)
            make.leading.equalTo(wikipedia.snp.trailing).offset(10)
            make.width.height.equalTo(40)
        }
        
        reddit.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(20)
            make.leading.equalTo(article.snp.trailing).offset(10)
            make.width.height.equalTo(40)
        }
        
        video.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(20)
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
        
        self.navigationController?.navigationBar.backIndicatorImage = buttonImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = buttonImage
    }
    
    private func configureCollectionView() {
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.scrollDirection = .horizontal
            layout.itemSize = CGSize( width: 185, height: 185)
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right:0)
        }
        
        collectionView.register(LaunchImageCell.self, forCellWithReuseIdentifier: "LaunchImageCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isUserInteractionEnabled = true
    }
}

extension LaunchInfoViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "LaunchImageCell",
            for: indexPath
        ) as! LaunchImageCell
        
            imageCell.apply(url: images[indexPath.item])
            return imageCell
    }
}

extension LaunchInfoViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output.imageTapped(imageURL: images[indexPath.row])
       print("User tapped on item \(indexPath.row)")
    }
}
