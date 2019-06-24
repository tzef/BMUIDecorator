//
//  ViewController.swift
//  BMUIDecorator
//
//  Created by LEE ZHE YU on 06/23/2019.
//  Copyright (c) 2019 LEE ZHE YU. All rights reserved.
//

import UIKit
import BMUIDecorator

extension UILabel: BMUIDecorative {}
extension UIButton: BMUIDecorative {}
class ViewController: UIViewController {
    @IBOutlet weak var styleReadme1: UITextView!
    @IBOutlet weak var styleReadme2: UITextView!
    @IBOutlet weak var view1: DecorativeView!
    @IBOutlet weak var view2: DecorativeView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Style1"

        label1.text = "LabelStyle1\nLabelStyle1"
        label2.text = "LabelStyle2\nLabelStyle2"

        styleReadme1.text = """
        Style1 ReadMe
        --------------------
        Button
        TextSize: 16

        TextColor
        Normal: Black
        HighLighted: Grey

        BackgroundColor
        Normal: Grey
        HighLighted: Black
        --------------------
        Label
        FontTye: Bold
        TextSize: 18
        TextColor: White
        TextAlignment: Center
        NumberOfLines: 1
        ShadowColor: Black
        ShadowRadius: 5
        --------------------
        View
        BorderWidth: 5
        BorderColor: Red
        CornerRadius: 20
        """

        styleReadme2.text = """
        Style2 ReadMe
        --------------------
        Button
        TextSize: 12

        TextColor
        Normal: Red
        HighLighted: Black

        BackgroundColor
        Normal: Blue
        HighLighted: Red
        --------------------
        Label
        FontTye: System
        TextSize: 12
        TextColor: Red
        TextAlignment: Left
        NumberOfLines: 0
        ShadowColor: Yellow
        ShadowRadius: 2
        --------------------
        View
        BorderWidth: 1
        BorderColor: Green
        CornerRadius: 5
        """

        setupStyle()
    }

    // MARK: - Private
    func setupStyle() {
        view1.decoratorActive(uiTags: [UITags.UIView.Border.Main, UITags.UIView.Corner.Large])
        view2.decoratorActive(uiTags: [UITags.UIView.Border.Sub, UITags.UIView.Corner.Little])

        label1.decoratorActive(uiTags: [UITags.UILabel.MainTitle])
        label2.decoratorActive(uiTags: [UITags.UILabel.SubTitle])

        button1.decoratorActive(uiTags: [UITags.UIButton.Main])
        button2.decoratorActive(uiTags: [UITags.UIButton.Sub])
    }

    // MARK: - IBAction
    @IBAction func setStyle1(_ sender: Any) {
        AppDelegate.main.appStyle = AppStyleAdaptor.style1
        self.navigationItem.title = "Style1"
        setupStyle()
    }
    @IBAction func setStyle2(_ sender: Any) {
        AppDelegate.main.appStyle = AppStyleAdaptor.style2
        self.navigationItem.title = "Style2"
        setupStyle()
    }
}

