//
//  ViewController.swift
//  BackgroundRemover
//
//  Created by 古智鹏 on 2020/4/26.
//  Copyright © 2020 MasterGu. All rights reserved.
//

import UIKit
import CoreML
import Toolkit
import CoreMLHelpers

class ViewController: UIViewController {
    
    lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        DispatchQueue.main.async {
//            let path = Bundle.main.url(forResource: "profile4232.png", withExtension: nil)
            let image = #imageLiteral(resourceName: "profile4232")//UIImage.init(contentsOfFile: path!.path)
            self.predictScene(image: image)
        }
    }
    
    func setupUI() {
        self.view.backgroundColor = .orange
        self.view.addSubview(imageView)
    }

}

extension ViewController {
    
    func predictScene(image: UIImage) {
        let model = DeepLabV3FP16()
        imageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(400)
            let height = image.size.height / image.size.width * 400
            make.height.equalTo(height)
        }

//        let image = image.scaled(to: CGSize(width: 513, height: 513))
        
        if let pixelBufferRef = image.pixelBuffer(width: 513, height: 513) {
            if let output = try? model.prediction(image: pixelBufferRef) {
                if let arrayImage = output.semanticPredictions.image(min: 0, max: 1, channel: nil, axes: nil) {
                    self.imageView.image = arrayImage
                }
                
            }
            
        }
        
        
        
    }
    
}

