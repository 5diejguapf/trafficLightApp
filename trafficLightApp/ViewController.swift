//
//  ViewController.swift
//  trafficLightApp
//
//  Created by serg on 27.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redLight: UIView!
    @IBOutlet weak var yellowLight: UIView!
    @IBOutlet weak var greenLight: UIView!
    
    @IBOutlet weak var button: UIButton!
    
    enum TrafficState {
        case red
        case yellow
        case green
        case off
    }
    
    var trafficLightState = TrafficState.off
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareView(view: redLight)
        prepareView(view: yellowLight)
        prepareView(view: greenLight)
        
        button.configuration = setupButton()
    }
    
    private func prepareView(view: UIView) {
        view.layer.cornerRadius = view.frame.height / 2.0
        toggleLigth(view: view)
    }
    
    private func setupButton() -> UIButton.Configuration {
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.title = "START"
        return buttonConfig
    }
    
    private func toggleLigth(view: UIView) {
        if view.alpha == 1.0 {
            view.alpha = 0.2
        } else {
            view.alpha = 1.0
        }
    }

    @IBAction func actionButton(_ sender: Any) {
        switch trafficLightState {
        case .red:
            toggleLigth(view: redLight)
            toggleLigth(view: yellowLight)
            trafficLightState = .yellow
        case .yellow:
            toggleLigth(view: yellowLight)
            toggleLigth(view: greenLight)
            trafficLightState = .green
        case .green:
            toggleLigth(view: greenLight)
            toggleLigth(view: redLight)
            trafficLightState = .red
        case .off:
            toggleLigth(view: redLight)
            trafficLightState = .red
            button.setTitle("NEXT", for: .normal)
        }
    }
    
}

