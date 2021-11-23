//
//  SingleImagetrueSingleImageViewController.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 17/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class SingleImageViewController: UIViewController, SingleImageViewInput {
   
    var output: SingleImageViewOutput!
    private let scrollView = UIScrollView()
    private let imageView = UIImageView()
    private let rocket = UIImage(named: "rocket")

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        
        embedViews()
        setupLayout()
        setupAppereance()
        configureScrollView()
    }
    
    override func viewWillLayoutSubviews() {
      super.viewWillLayoutSubviews()
        updateMinZoomScaleForSize(view.bounds.size)
    }

    // MARK: SingleImageViewInput
    func setupInitialState() {
    }
    
    func updateMinZoomScaleForSize(_ size: CGSize) {
      let widthScale = size.width / imageView.bounds.width
      let heightScale = size.height / imageView.bounds.height
      let minScale = min(widthScale, heightScale)
        
      scrollView.minimumZoomScale = minScale
      scrollView.zoomScale = minScale
    }
    
    private func embedViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
    }
    
    private func setupLayout() {
       
        scrollView.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
//            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin)
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
    }
    
    private func setupAppereance() {
        view.backgroundColor = .white
    }
    
    private func configureScrollView() {
        scrollView.delegate = self
    }
    
    func passURL(imageURL: URL) {
        
        let resizingProcessor = ResizingImageProcessor(referenceSize: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 1), mode: .aspectFit)
        
        imageView.kf.setImage(with: imageURL, placeholder: nil, options: [.processor(resizingProcessor),], completionHandler: nil)
    }
    

    override func updateViewConstraints() {
        imageView.snp.updateConstraints { make in

        make.centerY.centerX.equalToSuperview()
        }
        super.updateViewConstraints()
    }
    
}

extension SingleImageViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

