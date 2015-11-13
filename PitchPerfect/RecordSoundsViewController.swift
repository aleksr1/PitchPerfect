//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Justin Owens on 11/7/15.
//  Copyright © 2015 Justin Owens. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    
    @IBOutlet weak var lblRecord: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordButton: UIButton!
    @IBOutlet var pauseRecordingButton: UIButton!
    
    var audioRecorder:AVAudioRecorder!
    var recordedAudio:RecordedAudio!
    var pausedTime:Double = 0.0
    
    override func viewWillAppear(animated: Bool) {
        stopRecordButton.hidden = true
        stopRecordButton.enabled = false
        pauseRecordingButton.hidden = true
        pauseRecordingButton.enabled = false
        
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        let alertView = UIAlertController(title: "Error", message: "Recording was not successful", preferredStyle: .Alert)
        
        alertView.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        
        if (flag) {
            recordedAudio = RecordedAudio(filePathUrl: recorder.url, title: recorder.url.lastPathComponent!)
            
            self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)

        } else {
            self.presentViewController(alertView, animated: true, completion: nil)
            recordButton.enabled = true
            recordButton.hidden = false
            stopRecordButton.enabled = false
            stopRecordButton.hidden = true
            lblRecord.hidden = true
            pauseRecordingButton.hidden = true
            pauseRecordingButton.enabled = false
        }
    }
    
    @IBAction func recordAudio(sender: UIButton) {
        lblRecord.text = "Recording"
        recordButton.hidden = true
        recordButton.enabled = false
        stopRecordButton.hidden = false
        stopRecordButton.enabled = true
        pauseRecordingButton.hidden = false
        pauseRecordingButton.enabled = true
        pauseRecordingButton.setTitle("Pause", forState: .Normal)
        
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let recordingName = "my_audio.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }
    
    @IBAction func stopRecordingAudio(sender: UIButton) {
        lblRecord.text = "Tap to record"
        recordButton.hidden = false
        recordButton.enabled = true
        stopRecordButton.hidden = true
        stopRecordButton.enabled = false
        pauseRecordingButton.hidden = true
        pauseRecordingButton.enabled = false
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    @IBAction func pauseRecordingAudio(sender: UIButton) {
        
        
        
        
        
        print("pause pressed")
        if pauseRecordingButton.titleLabel?.text == "Pause" {
            print("text == pause")
            pauseRecordingButton.setTitle("Unpaused", forState: .Normal)
            print(pauseRecordingButton.titleLabel?.text)
            audioRecorder.pause()
            pausedTime = audioRecorder.currentTime
        }else {
            print("else")
            pauseRecordingButton.setTitle("Pause", forState: .Normal)
            audioRecorder.recordAtTime(pausedTime)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "stopRecording") {
            let playSoundsVC:PlaySoundsViewController = segue.destinationViewController as! PlaySoundsViewController
            
            let data = sender as! RecordedAudio
            playSoundsVC.receivedAudio = data
        }
    }

}

