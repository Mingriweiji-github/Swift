//
//  PropertyWrapper.swift
//  01-PropertyWrapper
//
//  Created by longhuadmin on 2020/7/14.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation
/// 示例一：货币转换器
/// 使用见:ViewController.swift
@propertyWrapper
struct Converter {
    let from: String
    let to: String
    let rate: Double
    
    var value: Double
    
    var wrappedValue: String {
        get { "\(from)\(value)" }
        set { value = Double(newValue) ?? -1 }
    }
    
    var projectedValue: String {
        return "\(to)\(value * rate)"
    }
    
    init(
        initialValue: String,
        from: String,
        to: String,
        rate: Double
    ) {
        self.rate = rate
        self.value = 0
        self.from = from
        self.to = to
        self.wrappedValue = initialValue
    }
}

///示例二：UserDefault属性包装器
/// 使用见:ViewController.swift

@propertyWrapper //这里告诉编译器 下面这个UserDefault是一个属性包裹器
struct UserDefault<T> {
    let key: String
    let defaultValue: T
    
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    ///  wrappedValue是@propertyWrapper必须要实现的属性
    /// 当操作我们要包裹的属性时  其具体set get方法实际上走的都是wrappedValue 的set get 方法。
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
        
    }
    
}


