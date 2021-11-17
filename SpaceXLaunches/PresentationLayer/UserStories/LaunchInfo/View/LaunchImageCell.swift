//
//  LaunchImageCell.swift
//  SpaceXLaunches
//
//  Created by TK_User on 17.11.2021.
//

import Foundation
import UIKit
import Kingfisher


class LaunchImageCell: UICollectionViewCell {
    
    var launchImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
     
        embedViews()
        setupLayout()
        setupAppereance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func embedViews() {
        contentView.addSubview(launchImage)
    }
    
    private func setupLayout() {
        launchImage.snp.makeConstraints {make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupAppereance() {
        launchImage.contentMode = .scaleAspectFill
        launchImage.layer.cornerRadius = 20
        launchImage.layer.borderWidth = 1
        launchImage.clipsToBounds = true
    }
    
    func apply(url: URL) {
        launchImage.kf.setImage(with: url, placeholder: nil, options: nil, completionHandler: nil)
    }
}
