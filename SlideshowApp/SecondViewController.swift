//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by HY on 2020/12/07.
//  Copyright © 2020 HY. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    // 画像ビュー
    @IBOutlet weak var displayImage: UIImageView!
    
    // 遷移元から画像を受け取る変数
    var image: UIImage!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 画像表示
        displayImage.image = self.image
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
