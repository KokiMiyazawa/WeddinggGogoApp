//
//  PhotoViewController.swift
//  WeddinggGogoApp
//
//  Created by Koki Miyazawa on 2019/09/16.
//  Copyright © 2019 Koki_Miyazawa. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var weddingImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //0-9の写真をランダムで表示
        let RAMDOM = String(arc4random_uniform(9))
        let IMAGE = UIImage(named: "WEDDINGPHOTO\(RAMDOM)")
        weddingImage.image = IMAGE
        //UIImageViewにタップイベントを追加
        weddingImage.isUserInteractionEnabled = true
        weddingImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.saveImage(_:))))
    }
    
    //画像の保存処理
    @objc func saveImage(_ sender: UITapGestureRecognizer) {
        
        let targetImageView = sender.view! as! UIImageView
        let targetImage = targetImageView.image!

        UIImageWriteToSavedPhotosAlbum(targetImage, self, #selector(self.showResultOfSaveImage(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    //保存を試みた結果をダイヤログに表示
    @objc func showResultOfSaveImage(_ image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutableRawPointer) {
        
        var title = "♡保存完了だっちゃ♡"
        var message = "ちなみに確率は1/69でした"
        if error != nil {
            title = "エラーだよ！みやざわーるどに連絡だ！！"
            message = "保存に失敗しました"
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "末永くお幸せに:)byみやざわーるど", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
