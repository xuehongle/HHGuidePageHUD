//
//  HHGuidePageHUD.swift
//  HHGuidePageHUDExample
//
//  Created by 薛乐 on 2018/1/14.
//  Copyright © 2018年 薛乐. All rights reserved.
//

import UIKit

let HHScreenWidth = UIScreen.main.bounds.size.width
let HHScreenHeight = UIScreen.main.bounds.size.height

class HHGuidePageHUD: UIView {
    
    var imageArray:[String]?
    var guidePageView: UIScrollView!
    
    
    
    // MARK: - /************************View life************************/
    /// init
    ///
    /// - Parameters:
    ///   - imageNameArray: 引导页图片数组
    ///   - isHidden:  跳过按钮是否隐藏
    init(imageNameArray:[String], isHiddenSkipButton: Bool) {
        let frame = CGRect.init(x: 0, y: 0, width: HHScreenWidth, height: HHScreenHeight)
        super.init(frame: frame)
        self.imageArray = imageNameArray
        if self.imageArray == nil || self.imageArray?.count == 0 {
            return
        }
        self.addScrollView(frame: frame)
        self.addSkipButton(isHiddenSkipButton: isHiddenSkipButton)
        self.addImages()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        print("deinit")
    }
}

// MARK: - /************************普通方法************************/
extension HHGuidePageHUD {
    func addScrollView(frame: CGRect)  {
        self.guidePageView = UIScrollView.init(frame: frame)
        guidePageView.backgroundColor = UIColor.lightGray
        guidePageView.contentSize = CGSize.init(width: HHScreenWidth * (CGFloat)((self.imageArray?.count)!), height: HHScreenHeight)
        guidePageView.bounces = false
        guidePageView.isPagingEnabled = true
        guidePageView.showsHorizontalScrollIndicator = false
        guidePageView.delegate = self
        self.addSubview(guidePageView)
    }
    // MARK: - 跳过按钮
    func addSkipButton(isHiddenSkipButton: Bool) -> Void {
        if isHiddenSkipButton {
            return
        }
        let skipButton = UIButton.init(frame: CGRect.init(x: HHScreenWidth * 0.8, y: HHScreenWidth * 0.1, width: 70, height: 35))
        skipButton.setTitle("跳过", for: .normal)
        skipButton.backgroundColor = UIColor.gray
        skipButton.setTitleColor(UIColor.white, for: .normal)
        skipButton.layer.cornerRadius = skipButton.frame.size.height * 0.5
        skipButton.addTarget(self, action: #selector(skipButtonClick), for: .touchUpInside)
        self.addSubview(skipButton)
    }
    @objc func skipButtonClick() -> Void {
        UIView.animate(withDuration: 1, animations: {
            self.alpha = 0
        }) { (finish) in
            self.removeFromSuperview()
        }
    }
    // MARK: - 图片
    func addImages() -> Void {
        guard let imageArray = self.imageArray else {
            return
        }
        for i in 0..<imageArray.count {
            let imageView = UIImageView.init(frame: CGRect.init(x: HHScreenWidth * CGFloat(i), y: 0, width: HHScreenWidth, height: HHScreenHeight))
            imageView.image = UIImage.init(named: imageArray[i])
            self.guidePageView.addSubview(imageView)
            // 在最后一张图片上显示开始体验按钮
            if i == imageArray.count - 1 {
                imageView.isUserInteractionEnabled = true
                let startButton = UIButton.init(frame: CGRect.init(x: HHScreenWidth*0.1, y: HHScreenHeight*0.8, width: HHScreenWidth*0.8, height: HHScreenHeight*0.08))
                startButton.setTitle("开始体验", for: .normal)
                startButton.setTitleColor(UIColor.white, for: .normal)
                startButton.setBackgroundImage(UIImage.init(named: "guide_btn_bg"), for: .normal)
                startButton.addTarget(self, action: #selector(skipButtonClick), for: .touchUpInside)
                imageView.addSubview(startButton)
            }
        }
    }
}
// MARK: - /************************代理方法************************/
extension HHGuidePageHUD: UIScrollViewDelegate {
    
}
