//
//  ViewController.swift
//  SlideshowApp
//
//  Created by HY on 2020/12/04.
//  Copyright © 2020 HY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 画像ビュー
    @IBOutlet weak var displayImage: UIImageView!

    // 進むボタン
    @IBOutlet weak var nextButton: UIButton!
    
    // 戻るボタン
    @IBOutlet weak var backButton: UIButton!
    
    // 再生/停止ボタン
    @IBOutlet weak var playStopButton: UIButton!
    
    // 画像を配列にセットする
    var images: Array<UIImage> = [UIImage(named:"tonakai")!,UIImage(named:"santa")!,UIImage(named:"boy")!]

    // 表示中の画像番号をここで保持する
    var imageNo = 0
    
    // タイマー
    var timer: Timer!

    // 初期処理
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 画像表示
        displayImage.image = images[imageNo]
    }

    // 再生/停止ボタン押下
    @IBAction func playStopButton(_ sender: Any) {

        // タイマーがnilの場合は、再生
        if self.timer == nil {

            // タイマー開始
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)

            // 進む、戻るボタン非活性化
            nextButton.isEnabled = false
            backButton.isEnabled = false

            // 再生ボタンを停止ボタンにする
            playStopButton.setTitle("停止", for: .normal)
            
        // タイマーが既に存在する場合は、停止
        }else{
            timer.invalidate()
            timer = nil

            // 進む、戻るボタン活性化
            nextButton.isEnabled = true
            backButton.isEnabled = true
            
            // 停止ボタンを再生ボタンにする
            playStopButton.setTitle("再生", for: .normal)
        }
    }

    // タイマーが更新されたとき
    // timeInterval: 2, repeats: true で指定された通り、2秒毎に呼び出され続ける
    @objc func updateTimer(_ timer: Timer) {

        // 最後の番号だったら最初にする
        if imageNo == images.count - 1 {
            imageNo = 0
        }else{
            imageNo += 1
        }
        // 画像表示
        displayImage.image = images[imageNo]
    }

    // 進むボタン押下
    @IBAction func nextButton(_ sender: Any) {

        // 最後の番号だったら最初にする
        if imageNo == images.count - 1 {
            imageNo = 0
        }else{
            imageNo += 1
        }
        // 画像表示
        displayImage.image = images[imageNo]
    }
 
    // 戻るボタン押下
    @IBAction func backButton(_ sender: Any) {

        // 最初の番号だったら最後にする
        if imageNo == 0{
            imageNo = images.count - 1
        }else{
            imageNo -= 1
        }
        // 画像表示
        displayImage.image = images[imageNo]
    }

    // 画像を押された時に画面遷移する
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // タイマーが既に存在する場合は、停止
        if self.timer != nil {
            timer.invalidate()
            timer = nil

            // 進む、戻るボタン活性化
            nextButton.isEnabled = true
            backButton.isEnabled = true
            
            // 停止ボタンを再生ボタンにする
            playStopButton.setTitle("再生", for: .normal)
        }

        // segueから遷移先のResultViewControllerを取得する
        let secondViewController:SecondViewController = segue.destination as! SecondViewController

        // 画像を遷移先へ渡す
        secondViewController.image = self.images[imageNo]
        
    }

    // 遷移先から戻ってきたとき
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

