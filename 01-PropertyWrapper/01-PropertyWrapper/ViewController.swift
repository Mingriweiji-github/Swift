//
//  ViewController.swift
//  01-PropertyWrapper
//
//  Created by longhuadmin on 2020/7/14.
//  Copyright © 2020 KM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @Converter(initialValue: "100", from: "USD", to: "CNY", rate: 6.88)
    var usd_cny

    @Converter(initialValue: "100", from: "CNY", to: "EUR", rate: 0.13)
    var cny_eur
    
    struct UserDefaultConfig {
        @UserDefault(key: "app_showed", defaultValue: false)
        static var app_has_showed: Bool
        
        @UserDefault(key: "email", defaultValue: "66666@qq.com")
        static var email: String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .red
        
        print("\(usd_cny)=\(usd_cny)")
        print("\(cny_eur)=\(cny_eur)")
        
        print(UserDefaultConfig.app_has_showed)
        print(UserDefaultConfig.email)
    }


}

