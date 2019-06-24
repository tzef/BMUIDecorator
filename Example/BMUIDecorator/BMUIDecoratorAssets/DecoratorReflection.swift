//
//  DecoratorReflection.swift
//  BMUIDecorator_Example
//
//  Created by LEE ZHE YU on 2019/6/23.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import BMUIDecorator

extension BMUIDecorative {
    func decoratorActive<T>(uiTags: [T]) {
        self.decoratorActive(decoratorInfos: uiTags.map({ $0 as? BMUIDecoratorInfoName }).compactMap({ $0 }))
    }
}

enum UITags {
    enum UIView {
        enum Border: BMUIDecoratorInfoName {
            case Main
            case Sub
            func tagName() -> String {
                switch self {
                case .Main:
                    return "MainBorder"
                case .Sub:
                    return "SubBorder"
                }
            }
            func storeName() -> String {
                return AppDelegate.main.appStyle.getViewStoreName()
            }
        }
        enum Corner: BMUIDecoratorInfoName {
            case Large
            case Little
            func tagName() -> String {
                switch self {
                case .Large:
                    return "LargeCorner"
                case .Little:
                    return "LittleCorner"
                }
            }
            func storeName() -> String {
                return AppDelegate.main.appStyle.getViewStoreName()
            }
        }
    }
    enum UILabel: BMUIDecoratorInfoName {
        case MainTitle
        case SubTitle
        func tagName() -> String {
            switch self {
            case .MainTitle:
                return "MainTitle"
            case .SubTitle:
                return "SubTitle"
            }
        }
        func storeName() -> String {
            return AppDelegate.main.appStyle.getLabelStoreName()
        }
    }
    enum UIButton: BMUIDecoratorInfoName {
        case Main
        case Sub
        func tagName() -> String {
            switch self {
            case .Main:
                return "MainButton"
            case .Sub:
                return "SubButton"
            }
        }
        func storeName() -> String {
            return AppDelegate.main.appStyle.getButtonStoreName()
        }
    }
}
