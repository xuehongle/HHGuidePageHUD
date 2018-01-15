//
//  ViewController.swift
//  HHGuidePageHUDExample
//
//  Created by 薛乐 on 2018/1/14.
//  Copyright © 2018年 薛乐. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "首页"
        // 静态引导页
        self.setStaticGuidePage()
        
        // 动态引导页
//         self.setDynamicGuidePage()
        
        // 视频引导页
//         self.setVideoGuidePage()
        
        let textLabel = UILabel()
        textLabel.text = "Hello!"
        textLabel.textColor = UIColor.black
        textLabel.frame = CGRect.init(x: 130, y: 200, width: UIScreen.main.bounds.size.width, height: 70)
        textLabel.font = UIFont.boldSystemFont(ofSize: 50)
        self.view.addSubview(textLabel)
    }
    
    // MARK: - 静态图片引导页
    func setStaticGuidePage() {
        let imageNameArray: [String] = ["guide00", "guide01", "guide02"]
        let guideView = HHGuidePageHUD.init(imageNameArray: imageNameArray, isHiddenSkipButton: false)
        self.navigationController?.view.addSubview(guideView)
    }
    // MARK: - 动态图片引导页
    func setDynamicGuidePage() {
        let imageNameArray: [String] = ["guideImage6.gif", "guideImage7.gif", "guideImage8.gif"]
        let guideView = HHGuidePageHUD.init(imageNameArray: imageNameArray, isHiddenSkipButton: false)
        self.navigationController?.view.addSubview(guideView)
    }
    
    // MARK: - 视频引导页
    func setVideoGuidePage() {
        let urlStr = Bundle.main.path(forResource: "1.mp4", ofType: nil)
        let videoUrl = NSURL.fileURL(withPath: urlStr!)
        let guideView = HHGuidePageHUD.init(videoURL:videoUrl, isHiddenSkipButton: false)
        self.navigationController?.view.addSubview(guideView)
    }
    
}

