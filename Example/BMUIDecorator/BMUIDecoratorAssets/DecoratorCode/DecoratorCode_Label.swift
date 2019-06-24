//
//  DecoratorCode_Label.swift
//  BMUIDecorator
//
//  Created by LEE ZHE YU on 2019/6/23.
//

import UIKit
import BMUIDecorator

class DecoratorCode_Label: BMUIDecoratorCode {
    func installTo(store: BMUIDecoratorStore) {
        self.decoratorCodeExpand(name: "setShadow", codeWithInfo: { (label, info)  in
            self.setShadow(label: label as? UILabel, info: info)
        }, store: store)
        self.decoratorCodeExpand(name: "setTextColor", codeWithInfo: { (label, info)  in
            self.setColor(label: label as? UILabel, info: info)
        }, store: store)
        self.decoratorCodeExpand(name: "setNumberOfLines", codeWithInfo: { (label, info)  in
            self.setNumberOfLines(label: label as? UILabel, info: info)
        }, store: store)
        self.decoratorCodeExpand(name: "setTextAlignment", codeWithInfo: { (label, info)  in
            self.setTextAlignment(label: label as? UILabel, info: info)
        }, store: store)
        self.decoratorCodeExpand(name: "setFontSize", codeWithInfo: { (label, info)  in
            self.setFontSize(label: label as? UILabel, info: info)
        }, store: store)
        self.decoratorCodeExpand(name: "setFontType", codeWithInfo: { (label, info)  in
            self.setFontType(label: label as? UILabel, info: info)
        }, store: store)
        self.decoratorCodeExpand(name: "setLineSpacing", codeWithInfo: { (label, info)  in
            self.setLineSpacing(label: label as? UILabel, info: info)
        }, store: store)
    }

    func setFontSize(label: UILabel?, info: [String: Any]) {
        guard let fontSize = info["size"] as? CGFloat else {
            return
        }
        if let font = label?.font.withSize(fontSize) {
            label?.font = font
        } else {
            label?.font = UIFont.systemFont(ofSize: fontSize)
        }
    }
    func setFontType(label: UILabel?, info: [String: Any]) {
        let fontSize = label?.font.pointSize ?? 17.0
        switch info["type"] as? String ?? "exception" {
        case "system":
            label?.font = UIFont.systemFont(ofSize: fontSize)
        case "boldSystem":
            label?.font = UIFont.boldSystemFont(ofSize: fontSize)
        case "italicSystem":
            label?.font = UIFont.italicSystemFont(ofSize: fontSize)
        default:
            break
        }
    }
    func setColor(label: UILabel?, info: [String: Any]) {
        let color = info["color"] as? String ?? "#000000"
        label?.textColor = UIColor.initWithHex(color)
    }
    func setNumberOfLines(label: UILabel?, info: [String: Any]) {
        let lines = info["numberOfLines"] as? Int ?? 1
        label?.numberOfLines = lines
    }
    func setTextAlignment(label: UILabel?, info: [String: Any]) {
        DispatchQueue.main.async {
            switch info["textAlignment"] as? String ?? "left" {
            case "left":
                label?.textAlignment = .left
            case "right":
                label?.textAlignment = .right
            case "center":
                label?.textAlignment = .center
            case "natural":
                label?.textAlignment = .natural
            case "justified":
                label?.textAlignment = .justified
            default:
                break
            }
        }
    }
    func setShadow(label: UILabel?, info: [String: Any]) {
        let color = info["color"] as? String ?? "#000000"
        let radius = info["radius"] as? CGFloat ?? 0.0
        let shadow = NSShadow()
        shadow.shadowBlurRadius = radius
        shadow.shadowColor = UIColor.initWithHex(color)
        let attributed: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.shadow: shadow
        ]
        let willSetAttributedKeys = [NSAttributedString.Key.shadow]
        if let attributedString = label?.attributedText, let string = label?.attributedText?.string {
            let willSetAttributedString = NSMutableAttributedString(string: string, attributes: attributed)
            let mutableAttributedString = NSMutableAttributedString(attributedString: attributedString)
            mutableAttributedString.enumerateAttributes(in: NSRange(location: 0, length: string.count)) { (attributedResults, range, _) in
                willSetAttributedString.addAttributes(attributedResults.filter({ !willSetAttributedKeys.contains($0.key) }), range: range)
            }
            label?.attributedText = willSetAttributedString
        }
    }
    func setLineSpacing(label: UILabel?, info: [String: Any]) {
        let spacing = info["spacing"] as? CGFloat ?? 0.0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        paragraphStyle.lineBreakMode = label?.lineBreakMode ?? .byWordWrapping
        let attributed: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ]
        let willSetAttributedKeys = [NSAttributedString.Key.paragraphStyle]
        if let attributedString = label?.attributedText, let string = label?.attributedText?.string {
            let willSetAttributedString = NSMutableAttributedString(string: string, attributes: attributed)
            let mutableAttributedString = NSMutableAttributedString(attributedString: attributedString)
            mutableAttributedString.enumerateAttributes(in: NSRange(location: 0, length: string.count)) { (attributedResults, range, _) in
                willSetAttributedString.addAttributes(attributedResults.filter({ !willSetAttributedKeys.contains($0.key) }), range: range)
            }
            label?.attributedText = willSetAttributedString
        }
    }
}

