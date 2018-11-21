//
//  StatusBarMessageView.swift
//  Pods-StatusBarMessage_Example
//
//  Created by linaicai on 2018/11/19.
//

import UIKit
import Foundation

open class StatusBarMessage: UIView {
    var duration:TimeInterval?
    var text:String?{
        get {
            return textLabel.text
        }
        set {
            textLabel.text = newValue
        }
    }
    var style:StatusBarMessageStyle?
    
    static let height:CGFloat = UIApplication.shared.statusBarFrame.size.height + 64
    static let currentWindow:UIWindow! = UIApplication.shared.windows.last
    
    lazy var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.font = UIFont.systemFont(ofSize: 18)
        textLabel.textColor = UIColor.white
        textLabel.textAlignment = .center
        return textLabel
    }()
    
    public enum StatusBarMessageStyle {
        case success
        case error
        case info
        case warning
    }
    
    func colorWithStyle(style:StatusBarMessageStyle) -> UIColor {
        switch style {
        case .success:
            return UIColor(red: 49/255.0, green: 211/255.0, blue: 150/255.0, alpha: 1.0)
        case .error:
            return UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)
        case .info:
            return UIColor(red: 15/255.0, green: 200/255.0, blue: 245/255.0, alpha: 1.0)
        case .warning:
            return UIColor.orange
        }

    }
    
    public static func show(with text:String, style:StatusBarMessageStyle? = .success, duration:TimeInterval? = 2.0){
        
        guard let duration = duration , let style = style else {
            return
        }
        
        let messageVIew = StatusBarMessage(text, style: style, duration: duration)
        messageVIew.frame = originFrame()
        currentWindow.addSubview(messageVIew)
        currentWindow.bringSubviewToFront(messageVIew)
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            messageVIew.frame = animateFrame()
        }) { (finish) in
            if finish{
                DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute:{
                    UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
                        messageVIew.frame = originFrame()
                    })
                })
            }
        }
    }

   static func originFrame() -> CGRect {
        return CGRect.init(x: 0, y: -height, width: currentWindow.bounds.size.width, height: height)
    }
    
   static func animateFrame() -> CGRect {
        return CGRect.init(x: 0, y: 0, width: currentWindow.bounds.size.width, height: height)
    }

    
    convenience init(_ text:String, style:StatusBarMessageStyle , duration:TimeInterval) {
        self.init(frame: CGRect.zero)
        self.text = text
        self.style = style
        self.duration = duration
        self.backgroundColor = colorWithStyle(style: style)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(textLabel)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        textLabel.frame = CGRect(x: 0, y: bounds.size.height - 50, width: bounds.size.width, height: 50)
    }
    
    
    
}
