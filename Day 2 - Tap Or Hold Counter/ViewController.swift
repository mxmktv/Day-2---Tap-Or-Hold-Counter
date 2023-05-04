//
//  ViewController.swift
//  Day 1 - Tap Counter
//
//  Created by Eastwood on 29.04.2023.
//

import UIKit

class ViewController: UIViewController {
    var counter = 0
    var timer: Timer?

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var longPressGesture: UILongPressGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.button.addGestureRecognizer(longPressGesture)
    }

    @IBAction func longPressGestureAction(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            updateCounter()
            timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { [weak self] _ in
                            self?.updateCounter()
            }
        } else if sender.state == .ended {
            timer?.invalidate()
            timer = nil
        }
    }

    @IBAction func tapButton(_ sender: UIButton) {
        updateCounter()
    }

    @IBAction func resetBarItem(_ sender: UIBarButtonItem) {
        counter = 0
        counterLabel.text = String(counter)
    }

    func updateCounter() {
        counter += 1
        counterLabel.text = String(counter)
    }
}

