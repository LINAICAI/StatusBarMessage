//
//  ViewController.swift
//  StatusBarMessage
//
//  Created by 李柰财 on 11/19/2018.
//  Copyright (c) 2018 李柰财. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    override func loadView() {
        super.loadView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let button = UIButton.init(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        button.setTitle("弹出提示", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        view.addSubview(button)
        button.center = view.center
        

        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func buttonClick(_ sender:UIButton) -> Void {

        let message = StatusBarMessage.show(with: "正在加载中...", style: .loading)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute:{
            message.dismiss({
                StatusBarMessage.show(with: "提交成功!", style: .success, duration: 2.0)
            })
        })
       
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

