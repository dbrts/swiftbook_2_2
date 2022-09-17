//
//  ViewController.swift
//  swiftbook_2_2
//
//  Created by dobrets on 17.09.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    @IBOutlet var actionButton: UIButton!
    
    private var startButtonIsPressed = false
    private var trafficLightState = -1
    
    enum TrafficLight {
        case red, yellow, green, off
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actionButton.setTitle("START", for: .normal)
        setTrafficLight(for: .off)
        
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.width / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.width / 2
        
        actionButton.layer.cornerRadius = 5
    }

    @IBAction func clickedButton() {
        if !startButtonIsPressed {
            actionButton.setTitle("NEXT", for: .normal)
            startButtonIsPressed = true
        }
        trafficLightState = (trafficLightState + 1) % 3
        updateStatus(using: trafficLightState)
    }
    
    private func updateStatus(using state: Int) {
        switch state {
        case 0:
            setTrafficLight(for: .red)
        case 1:
            setTrafficLight(for: .yellow)
        case 2:
            setTrafficLight(for: .green)
        default:
            setTrafficLight(for: .off)
        }
    }
    
    private func setTrafficLight(for state: TrafficLight) {
        switch state {
        case .red:
            redLightView.alpha = 1
            yellowLightView.alpha = 0.3
            greenLightView.alpha = 0.3
        case .yellow:
            redLightView.alpha = 0.3
            yellowLightView.alpha = 1
            greenLightView.alpha = 0.3
        case .green:
            redLightView.alpha = 0.3
            yellowLightView.alpha = 0.3
            greenLightView.alpha = 1
        case .off:
            redLightView.alpha = 0.3
            yellowLightView.alpha = 0.3
            greenLightView.alpha = 0.3
        }
    }
}

