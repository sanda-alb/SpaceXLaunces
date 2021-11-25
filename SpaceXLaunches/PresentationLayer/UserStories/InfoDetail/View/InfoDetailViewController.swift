//
//  LaunchInfotrueLaunchInfoViewController.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 16/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

import UIKit
import SnapKit

class InfoDetailViewController: UIViewController, InfoDetailViewInput {
    
    var output: InfoDetailViewOutput!

    // MARK: Views
    private let patch = UIImageView()
    private let missionName = UILabel()
    private let launchDate = UILabel()
    private let rocketName = UILabel()
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    private let stackView = UIStackView()
    
    // MARK: Buttons
    private let wikipedia = UIButton()
    private let article = UIButton()
    private let video = UIButton()
    private let reddit = UIButton()
    
    // MARK: Data
    private var images: [URL] = []
    private var buttonsURLs: [UIButton: URL] = [:]
  
    // MARK: Images
    private let placeholderImage = UIImage(systemName: "shield")
    private let buttonImage = UIImage(systemName: "arrowshape.turn.up.left.fill" )
    private let wikipediaLogo = UIImage(named: "wikipediaLogo")
    private let redditLogo = UIImage(named: "redditLogo")
    private let articleLogo = UIImage(named: "articleLogo")
    private let youtubeLogo = UIImage(named: "youtubeLogo")
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAll()
        output.viewIsReady()
    }
    
    func setMission(mission: LaunchMissionCell.ViewModel) {
    
        images = mission.images.compactMap { URL(string: $0) }
       
        missionName.text = mission.missionName
        launchDate.text = mission.launchDate?.formatDate()
        rocketName.text = mission.rocketName
        
        let patchLink = URL(string: mission.patch ?? "")
        patch.kf.setImage(
            with: patchLink,
            placeholder: placeholderImage,
            options: nil,
            completionHandler: nil
        )
        
        let buttonsLinks = [ reddit: mission.reddit,
                             wikipedia: mission.wikipedia,
                             video: mission.video,
                             article: mission.article
        ]
        
        hideButtons(links: buttonsLinks)
        hideCollectionView()
    }
    
    private func hideButtons(links: [UIButton : String?]) {
        for (key, value) in links {
            
            if value != nil {
                buttonsURLs[key] = URL(string: value ?? "")
            } else {
                key.isHidden = true
            }
        }
    }
    
    private func hideCollectionView() {
        collectionView.snp.updateConstraints { make in
            make.height.equalTo(images.isEmpty ? 0 : 200)
        }
    }
    
    private func setupAll() {
        embedViews()
        setupLayout()
        setupAppereance()
        configureCollectionView()
        configureStackView()
        setupBehavior()
    }
    
    private func embedViews() {
        [ wikipedia,
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
            make.centerX.equalToSuperview()
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
    
        wikipedia.setImage(wikipediaLogo, for: .normal)
        video.setImage(youtubeLogo, for: .normal)
        article.setImage(articleLogo, for: .normal)
        reddit.setImage(redditLogo, for: .normal)
    }
    
    private func configureCollectionView() {
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            flowLayout.scrollDirection = .horizontal
            flowLayout.itemSize = CGSize( width: 185, height: 185)
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right:0)
        }
        
        collectionView.register(InfoDetailCell.self, forCellWithReuseIdentifier: "LaunchImageCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isUserInteractionEnabled = true
    }
    
    private func configureStackView() {
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
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
        if let url = buttonsURLs[wikipedia] {
            UIApplication.shared.open(url)
        }
    }
    
    @objc private func openReddit(sender: UIButton) {
        if let url = buttonsURLs[reddit] {
            UIApplication.shared.open(url)
        }
    }
    
    @objc private func openArticle(sender: UIButton) {
        if let url = buttonsURLs[article] {
            UIApplication.shared.open(url)
        }
    }
    
    @objc private func openVideo(sender: UIButton) {
        if let url = buttonsURLs[video] {
            UIApplication.shared.open(url)
        }
    }
}

extension InfoDetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "LaunchImageCell",
            for: indexPath
        ) as! InfoDetailCell
        
        imageCell.apply(url: images[indexPath.item])
        return imageCell
    }
}

extension InfoDetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output.onImageTap(imageURL: images[indexPath.row])
    }
}
