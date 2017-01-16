//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Takahiro Suzuki on 2016/12/13.
//  Copyright © 2016年 Takahiro Suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    
    @IBOutlet weak var image: UIImageView!
   
    /* var playButton: UIButton! = 再生*/
     
    @IBAction func pushPlayButton(_ sender: Any) {
        
        var timer: Timer? = nil
        if timer == nil {
            // button play
            // アニメーションを開始
            image.startAnimating()
           //pushPlayButton.text = "停止"
            
        } else {
            // button stop
            // アニメーションを終了
            image.stopAnimating()
        }
        timer = nil
    }
 
    @IBAction func pushNextButton(_ sender: Any) {
    }
    @IBAction func pushPreviousButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func slideImages () -> Array<UIImage> {
            var theArray = Array<UIImage>()
            for num in 1...4 {
                // slideのイメージを作る
                let imageName = "image0" + String(num)
                let image = UIImage(named: imageName)
                // 配列に追加する
                theArray.append(image!)
            }
            return theArray
        }

       // if !image.isAnimating {
        // 画像の配列をアニメーションにセット
        image.animationImages = slideImages()
        // 2秒間隔 ✕ 画像4枚
        image.animationDuration = 8
        // 3回繰り返し
        image.animationRepeatCount = 3
        // アニメーションをスタートする
        image.startAnimating()
        //}
        
        
    }
    
    // 画像にタッチで画面遷移
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("touchesBegan")//
        performSegue(withIdentifier: "largerImage", sender: nil)
        
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

