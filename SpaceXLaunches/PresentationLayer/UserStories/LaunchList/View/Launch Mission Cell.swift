//
//  launchCell.swift
//  SpaceXLaunches
//
//  Created by TK_User on 12.11.2021.
//

import Foundation
import UIKit
import Kingfisher

class LaunchMissionCell: UITableViewCell {
    var patch = UIImageView()
    var missionName = UILabel()
    var launchDate = UILabel()
    private let placeholderImage = UIImage(systemName: "shield")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
     
        embedViews()
        setupLayout()
        setupAppereance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func apply(model: LaunchMissionCell.ViewModel) {
        let patchLink = URL(string: model.patch ?? "")
        patch.kf.setImage(with: patchLink, placeholder: placeholderImage, options: nil, completionHandler: nil)
        missionName.text = model.missionName
        launchDate.text = model.launchDate?.formatDate()
    }
    
    private func embedViews() {
        [ patch,
          missionName,
          launchDate
        ].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setupLayout() {
        patch.snp.makeConstraints {make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalTo(100)
            make.width.equalTo(110)
    
        }
        
        missionName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(patch.snp.trailing).offset(30)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        launchDate.snp.makeConstraints { make in
            make.top.equalTo(missionName.snp.bottom).offset(10)
            make.leading.equalTo(patch.snp.trailing).offset(30)
        }
    }
    
    private func setupAppereance() {
        missionName.font = UIFont.boldSystemFont(ofSize: 20)
        missionName.numberOfLines = 2
        
        launchDate.font = .systemFont(ofSize: 15)
    }
    
    struct ViewModel {
        let patch: String?
        let missionName: String?
        let launchDate: String?
        let rocketName: String?
        let images: [String]
        
        init(mission: Mission) {
            self.patch = mission.links.patchPath
            self.missionName = mission.missionName
            self.launchDate = mission.launchDate
            self.rocketName = mission.rocket.rocketName
            self.images = mission.links.images
        }
        
    }
}

