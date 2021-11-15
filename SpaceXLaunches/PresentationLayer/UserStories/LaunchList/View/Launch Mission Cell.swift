//
//  launchCell.swift
//  SpaceXLaunches
//
//  Created by TK_User on 12.11.2021.
//

import Foundation
import UIKit

class LaunchMissionCell: UITableViewCell {
    let patch = UIImageView()
    let missionName = UILabel()
    let launchDate = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
     
        embedViews()
        setupLayout()
        setupAppereance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func apply(model: LaunchMissionCell.ViewModel) {
//        patch = viewModel.patch
//        missionName = viewModel.missionName
//        launchDate = viewModel.launchDate
//        
//    }
    
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
        let patch: UIImageView
        let missionName: UILabel
        let launchDate: UILabel
        
        init(patch: UIImageView, missionName: UILabel, launchDate: UILabel) {
            self.patch = patch
            self.missionName = missionName
            self.launchDate = launchDate
            
        }
        
    }
}

