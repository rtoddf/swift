import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    var audioPlayer:AVAudioPlayer?
    let soundArray:[String] = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
//        let note = Int(sender.tag)
        let selectedSoundFileName:String = soundArray[sender.tag - 1]
        
        playSound(selectedSoundFileName)
    }
    
    func playSound(_ file:String) {
        /* RECIPE:
         1 - import AVFoundation
         2 - add AVAudioPlayerDelegate to the ViewController
         3 - add a var for audioPlayer
         4 - add var for soundurl
         5 - do-catch block to play sound or send error
         6 - play the sound
         */
        
        let soundUrl = Bundle.main.url(forResource: file, withExtension: "wav")!
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl)
        } catch {
            print(error)
        }
        
        audioPlayer?.play()
    }
    
  

}

