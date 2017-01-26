//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Takahiro Suzuki on 2016/12/13.
//  Copyright © 2016年 Takahiro Suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let imageArray = [
        #imageLiteral(resourceName: "image01"),
        #imageLiteral(resourceName: "image02"),
        #imageLiteral(resourceName: "image03"),
        #imageLiteral(resourceName: "image04")
    ]
    var imageIndex = 0
    
    var timer: Timer? = nil
    
    @IBOutlet weak var image: UIImageView!
    
    /* var playButton: UIButton! = 再生*/
    
    @IBAction func pushPlayButton(_ sender: Any) {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.pushNextButton(_:)), userInfo: nil, repeats: true)
            timer?.fire()
        } else {
            timer?.invalidate()
            timer = nil
        }
    }
    
    @IBAction func pushNextButton(_ sender: Any) {
        if imageIndex == imageArray.count - 1 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        image.image = imageArray[imageIndex]
    }
    @IBAction func pushPreviousButton(_ sender: Any) {
        if imageIndex == imageArray.count - 1 {
            imageIndex = 3
        } else {
            imageIndex -= 1
        }
        image.image = imageArray[imageIndex]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        func slideImages () -> Array<UIImage> {
        //            var theArray = Array<UIImage>()
        //            for num in 1...4 {
        //                // slideのイメージを作る
        //                let imageName = "image0" + String(num)
        //                let image = UIImage(named: imageName)
        //                // 配列に追加する
        //                theArray.append(image!)
        //            }
        //            return theArray
        //        }
        //
        //       // if !image.isAnimating {
        //        // 画像の配列をアニメーションにセット
        //        image.animationImages = slideImages()
        //        // 2秒間隔 ✕ 画像4枚
        //        image.animationDuration = 8
        //        // 3回繰り返し
        //        image.animationRepeatCount = 3
        //        // アニメーションをスタートする
        //        image.startAnimating()
        //        //}
        //
        
        image.image = imageArray[imageIndex]
        
    }
    
    // 画像にタッチで画面遷移
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("touchesBegan")//
        performSegue(withIdentifier: "largerImage", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ImageViewController
        // controller.image = imageArray[imageIndex]
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

