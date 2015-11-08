//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Justin Owens on 11/7/15.
//  Copyright © 2015 Justin Owens. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblRecord: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(sender: UIButton) {
        self.lblRecord.hidden = false
        self.recordButton.hidden = true
        self.recordButton.enabled = false
        self.stopRecordButton.hidden = false
        self.stopRecordButton.enabled = true
        
    }
    
    @IBAction func stopRecordingAudio(sender: UIButton) {
        self.lblRecord.hidden = true
        self.recordButton.hidden = false
        self.recordButton.enabled = true
        self.stopRecordButton.hidden = true
        self.stopRecordButton.enabled = false
    }

}

