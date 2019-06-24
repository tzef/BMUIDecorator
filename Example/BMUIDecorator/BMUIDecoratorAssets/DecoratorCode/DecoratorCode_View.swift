//
//  DecoratorCode_View.swift
//  BMUIDecorator
//
//  Created by LEE ZHE YU on 2019/6/23.
//

import UIKit
import BMUIDecorator

class DecoratorCode_View: BMUIDecoratorCode {
    func installTo(store: BMUIDecoratorStore) {
        self.decoratorCodeExpand(name: "setBorder", codeWithInfo: { (view, info)  in
            self.setBorder(view, info: info)
        }, store: store)
        self.decoratorCodeExpand(name: "setCorner", codeWithInfo: { (view, info)  in
            self.setCorner(view, info: info)
        }, store: store)
    }

    func setBorder(_ view: UIView?, info: [String: Any]) {
        if let width = info["width"] as? CGFloat {
            view?.layer.borderWidth = width
        }
        if let color = info["color"] as? String {
            view?.layer.borderColor = UIColor.initWithHex(color)?.cgColor
        }
    }
    func setCorner(_ view: UIView?, info: [String: Any]) {
        if let radius = info["radius"] as? CGFloat {
            view?.layer.cornerRadius = radius
        }
    }
}
