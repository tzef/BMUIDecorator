//
//  DecoratorCode_Button.swift
//  BMUIDecorator
//
//  Created by LEE ZHE YU on 2019/6/23.
//

import UIKit
import BMUIDecorator

class DecoratorCode_Button: BMUIDecoratorCode {
    func installTo(store: BMUIDecoratorStore) {
        self.decoratorCodeExpand(name: "setBackgroundColor", codeWithInfo: { (button, info)  in
            self.setBackgroundColor(button as? UIButton, info: info)
        }, store: store)
        self.decoratorCodeExpand(name: "setHighLightedBackgroundColor", codeWithInfo: { (button, info)  in
            self.setHighLightedBackgroundColor(button as? UIButton, info: info)
        }, store: store)
        self.decoratorCodeExpand(name: "setTitleColor", codeWithInfo: { (button, info)  in
            self.setTitleColor(button as? UIButton, info: info)
        }, store: store)
        self.decoratorCodeExpand(name: "setHighLightedTitleColor", codeWithInfo: { (button, info)  in
            self.setHighLightedTitleColor(button as? UIButton, info: info)
        }, store: store)
        self.decoratorCodeExpand(name: "setTitleFontSize", codeWithInfo: { (button, info)  in
            self.setTitleFontSize(button as? UIButton, info: info)
        }, store: store)
    }

    func setBackgroundColor(_ button: UIButton?, info: [String: Any]) {
        if let color = info["color"] as? String {
            button?.backgroundColor = UIColor.initWithHex(color)
        }
    }
    func setHighLightedBackgroundColor(_ button: UIButton?, info: [String: Any]) {
        if let color = info["color"] as? String {
            button?.setBackgroundImage(UIColor.initWithHex(color)?.pixelImage(), for: .highlighted)
        } else {
            if let color = button?.backgroundColor {
                button?.setBackgroundImage(color.darker()?.pixelImage(), for: .highlighted)
            }
        }
    }
    func setTitleColor(_ button: UIButton?, info: [String: Any]) {
        if let color = info["color"] as? String {
            button?.setTitleColor(UIColor.initWithHex(color), for: .normal)
        }
    }
    func setHighLightedTitleColor(_ button: UIButton?, info: [String: Any]) {
        if let color = info["color"] as? String {
            button?.setTitleColor(UIColor.initWithHex(color), for: .highlighted)
        } else {
            if let color = button?.titleColor(for: .normal) {
                button?.setTitleColor(color.darker(), for: .highlighted)
            }
        }
    }
    func setTitleFontSize(_ button: UIButton?, info: [String: Any]) {
        guard let fontSize = info["size"] as? CGFloat else {
            return
        }
        if let font = button?.titleLabel?.font.withSize(fontSize) {
            button?.titleLabel?.font = font
        } else {
            button?.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        }
    }
}

