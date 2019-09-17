//
//  ViewController.swift
//  WeddinggGogoApp
//
//  Created by Koki Miyazawa on 2019/09/15.
//  Copyright © 2019 Koki_Miyazawa. All rights reserved.
//

import UIKit
import AudioToolbox

class EntryViewController: UIViewController {

    @IBAction func tappedEnter(_ sender: Any) {
        
        let alert: UIAlertController = UIAlertController(title: "しんあいなる、さとうさんへ", message: "ごけっこんおめでとうございます。きょうのしゃしんがかくされているよ。みつけられるかな", preferredStyle: UIAlertController.Style.alert)
        
        let selectYesAction: UIAlertAction = UIAlertAction(title: "みつける", style: UIAlertAction.Style.default, handler: {
            (action: UIAlertAction!) -> Void in
            //YESボタン押下でGOGOCHANCE画面に遷移する
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.performSegue(withIdentifier: "toGogoChanceView", sender: nil)
            }
            print("みつける")
        })
        
        let selectNoAction: UIAlertAction = UIAlertAction(title: "やるかばか", style: UIAlertAction.Style.default, handler: {
            (action: UIAlertAction!) -> Void in
            print("やるかばか")
        })
        
        alert.addAction(selectYesAction)
        alert.addAction(selectNoAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

