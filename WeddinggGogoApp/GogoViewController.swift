//
//  GogoViewController.swift
//  WeddinggGogoApp
//
//  Created by Koki Miyazawa on 2019/09/16.
//  Copyright © 2019 Koki_Miyazawa. All rights reserved.
//

import UIKit
import AVFoundation

class GogoViewController: UIViewController {

    //Game数
    @IBOutlet weak var gameNumber: UILabel!
    var number = 0
    
    @IBOutlet weak var button: UIButton!
    
    //GOGOCHANCE画像
    @IBOutlet weak var gogoImage: UIImageView!
    let GOGOIMAGE = UIImage(named: "GOGOCHANCE")
    
    //指定した乱数と一致するか否かのフラグ
    //1:はずれ, 2:当たり, 3:多重当たり防止
    var isHit = 1
    var randomNumber: UInt32!
    
    //大当たり時の効果音
    var player: AVAudioPlayer!
    
    //ボタンを押した時の処理
    @IBAction func tappedDownButton(_ sender: Any) {
        if isHit == 1 {
            button.layer.borderColor = UIColor.purple.cgColor
            
            number = number + 1
            gameNumber.text = String(number)
            randomNumber = arc4random_uniform(68)
            
            if randomNumber == 0 {
                isHit = 2
            }
        }
    }
    
    //ボタンから離した時の処理
    @IBAction func tappedUpButton(_ sender: Any) {
        button.layer.borderColor = UIColor.black.cgColor
        if isHit == 2 {
            gogoImage.image = GOGOIMAGE
            player?.play()
            AudioServicesPlaySystemSound(SystemSoundID(1011))
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.performSegue(withIdentifier: "ToCongratulations", sender: self)
            }
            isHit = 3
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.backgroundColor = UIColor.gray.cgColor
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 8.0
        button.layer.cornerRadius = 60.0
        
        if let sound = NSDataAsset(name: "GOGOSOUND") {
            player = try? AVAudioPlayer(data: sound.data)
        }
    }
    
}
