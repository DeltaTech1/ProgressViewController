//
//  ViewController.swift
//  ProgressViewController
//
//  Created by Fidel Gonzalez on 3/28/16.
//  Copyright © 2016 Fidel Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {
    var progressView: UIProgressView?
    var progressLabel: UILabel?
    var timer: NSTimer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addControls()
        addGestures()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func addControls() {
        progressView = UIProgressView(progressViewStyle: UIProgressViewStyle.Default)
        progressView?.center = self.view.center
        
        view.addSubview(progressView!)
        
        progressLabel = UILabel()
        let frame = CGRectMake(view.center.x - 25, view.center.y - 100, 100, 50)
        progressLabel?.frame = frame
        
        view.addSubview(progressLabel!)
    }
    
    func addGestures() {
        let tap = UITapGestureRecognizer(target: self, action: "handleTap:")
        tap.numberOfTapsRequired = 1
        
        let doubleTap = UITapGestureRecognizer(target: self, action: "handleDoubleTap:")
        doubleTap.numberOfTapsRequired = 2
        
        view.addGestureRecognizer(tap)
        view.addGestureRecognizer(doubleTap)
        tap.requireGestureRecognizerToFail(doubleTap)
    }
    
    func handleTap(sender: UITapGestureRecognizer) {
        if sender.state == .Ended {
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector:"updateProgress", userInfo: nil, repeats: true)
        }
    }
    func handleDoubleTap(sender: UITapGestureRecognizer) {
        if sender.state == .Ended {
            progressView?.progress = 0.0
            progressLabel?.text = "0 %"
            timer?.invalidate()
        }
    }

    func updateProgress() {
        progressView?.progress += 0.05
        
        let progressValue = self.progressView?.progress
        progressLabel?.text = "\(progressValue! * 100) %"
    }
}

