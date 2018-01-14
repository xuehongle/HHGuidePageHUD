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
        //    if (![[NSUserDefaults standardUserDefaults] boolForKey:BOOLFORKEY]) {
        //        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:BOOLFORKEY];
        // 静态引导页
//        [self setStaticGuidePage];
        self.setStaticGuidePage()
        
        // 动态引导页
        //         [self setDynamicGuidePage];
        
        // 视频引导页
        //         [self setVideoGuidePage];
        //    }
        
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
        
    }

}

