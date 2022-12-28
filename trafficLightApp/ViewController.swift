//
//  ViewController.swift
//  trafficLightApp
//
//  Created by serg on 27.12.2022.
//

import UIKit

class ViewController: UIViewController {
    enum TrafficState {
        case red
        case yellow
        case green
        case off
    }
    var trafficLightState = TrafficState.off
    
    @IBOutlet weak var redLight: UIView!
    @IBOutlet weak var yellowLight: UIView!
    @IBOutlet weak var greenLight: UIView!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.cornerRadius = 10
        
        toggleLigth(view: redLight)
        toggleLigth(view: yellowLight)
        toggleLigth(view: greenLight)
    }
    
    override func viewWillLayoutSubviews() {
        // in this func we know real size of frames
        redLight.layer.cornerRadius = redLight.frame.height / 2
        yellowLight.layer.cornerRadius = yellowLight.frame.height / 2
        greenLight.layer.cornerRadius = greenLight.frame.height / 2
    }
    
    private func toggleLigth(view: UIView) {
        if view.alpha == 1.0 {
            view.alpha = 0.2
        } else {
            view.alpha = 1.0
        }
    }

    @IBAction func actionButton() {
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

