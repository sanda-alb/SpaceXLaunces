//
//  LaunchInfotrueLaunchInfoViewController.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 16/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

import UIKit
import SnapKit
import SwiftUI


class LaunchInfoViewController: UIViewController, LaunchInfoViewInput {
    
    var output: LaunchInfoViewOutput!

    // views
    private let patch = UIImageView()
    private let missionName = UILabel()
    private let launchDate = UILabel()
    private let rocketName = UILabel()
    private let stackView = UIStackView()
    private let wikipedia = UIButton()
    private let article = UIButton()
    private let video = UIButton()
    private let reddit = UIButton()
    private var images: [URL] = []
    private var redditURL: URL?
    private var wikipediaURL: URL?
    private var articleURL: URL?
    private var videoURL: URL?
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
   
    // images
    private let placeholderImage = UIImage(systemName: "shield")
    private let buttonImage = UIImage(systemName: "arrowshape.turn.up.left.fill" )
    private let wikipediaLogo = UIImage(named: "wikipediaLogo")
    private let redditLogo = UIImage(named: "redditLogo")
    private let articleLogo = UIImage(named: "articleLogo")
    private let youtubeLogo = UIImage(named: "youtubeLogo")
    

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()

        embedViews()
        setupLayout()
        setupAppereance()
        configureCollectionView()
        configureStackView()
        setupBehavior()
        
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
       
        redditURL = URL(string: mission.reddit ?? "")
        wikipediaURL = URL(string: mission.wikipedia ?? "")
        videoURL = URL(string: mission.video ?? "")
        articleURL = URL(string: mission.article ?? "")
        
    }
    
    func apply(mission: LaunchMissionCell.ViewModel) {
        
    }
    
    private func embedViews() {
        
        [  wikipedia,
           article,
           video,
           reddit
        ].forEach {
            stackView.addArrangedSubview($0)
        }
        
        [ patch,
          missionName,
          launchDate,
          rocketName,
          collectionView,
          stackView
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
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        wikipedia.snp.makeConstraints { make in
            make.width.height.equalTo(80)
        }
        
        article.snp.makeConstraints { make in
            make.width.height.equalTo(80)
               }

        reddit.snp.makeConstraints { make in
            make.width.height.equalTo(80)
        }

        video.snp.makeConstraints { make in
            make.width.height.equalTo(80)
        }
    }
        
    private func setupAppereance() {
        view.backgroundColor = .white
        self.navigationController?.navigationBar.backIndicatorImage = buttonImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = buttonImage
        
        missionName.textAlignment = .center
        missionName.font = .boldSystemFont(ofSize: 40)
        missionName.numberOfLines = 3
        
        launchDate.textAlignment = .center
        launchDate.font = .systemFont(ofSize: 15)
        
        rocketName.textAlignment = .center
        rocketName.font = .boldSystemFont(ofSize: 20)
        
        video.backgroundColor = .cyan
    
        wikipedia.setImage(wikipediaLogo!, for: .normal)
        video.setImage(youtubeLogo!, for: .normal)
        article.setImage(articleLogo!, for: .normal)
        reddit.setImage(redditLogo!, for: .normal)
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
    
    private func configureStackView() {
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
    }
    
    private func setupBehavior() {
        wikipedia.addTarget (
            self,
            action: #selector(openWikipedia),
            for: .touchUpInside
        )
        
        reddit.addTarget(
            self,
            action: #selector(openReddit),
            for: .touchUpInside
        )
        
        article.addTarget(
            self,
            action: #selector(openArticle),
            for: .touchUpInside
        )
        
        video.addTarget(
            self,
            action: #selector(openVideo),
            for: .touchUpInside
        )
    }
    
    
    @objc private func openWikipedia(sender: UIButton) {
        
        if let url = wikipediaURL {
            UIApplication.shared.open(url)
        } else {
            wikipedia.isHidden = true
        }
    }
    
    @objc private func openReddit(sender: UIButton) {
        
        if redditURL ==  nil {
            reddit.isHidden = true
        }
        
        if let url = redditURL {
            UIApplication.shared.open(url)
        }
    }
    
    @objc private func openArticle(sender: UIButton) {
        
        if let url = articleURL {
            UIApplication.shared.open(url)
        } else {
            article.isHidden = true
        }
    }
    
    @objc private func openVideo(sender: UIButton) {
   
        if let url = videoURL {
            UIApplication.shared.open(url)
        } else {
            video.isHidden = true
        }
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
