//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Justin Owens on 11/9/15.
//  Copyright © 2015 Justin Owens. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var audioPlayer:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
            var filePathUrl = NSURL.fileURLWithPath(filePath)
            audioPlayer = try!
                AVAudioPlayer(contentsOfURL: filePathUrl)
            audioPlayer.enableRate = true
        } else {
            print("Error finding movie_quote.mp3")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func playSlowAudio(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.rate = 0.5
        audioPlayer.play()
    }
    @IBAction func playFastAudio(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.rate = 1.5
        audioPlayer.play()
    }
    @IBAction func stopAudio(sender: UIButton) {
        audioPlayer.stop()
    }
    @IBAction func audioRestart(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }

}
