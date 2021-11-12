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
    let missonName = UILabel()
    let lauchDate = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
     
        embedViews()
        setupLayout()
        setupAppereance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func embedViews() {
        [ patch,
          missonName,
          lauchDate
        ].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setupLayout() {
        patch.snp.makeConstraints {make in
            make.top.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        missonName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-20)
            make.leading.equalTo(patch.snp.trailing).offset(30)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        lauchDate.snp.makeConstraints { make in
            make.top.equalTo(missonName).offset(20)
            make.leading.equalTo(patch.snp.trailing).offset(30)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    private func setupAppereance() {
        missonName.font = UIFont.boldSystemFont(ofSize: 30)
        missonName.textAlignment = .center
        missonName.numberOfLines = 2
        
        lauchDate.textAlignment = .center
        lauchDate.font = .systemFont(ofSize: 20)
    }
}
