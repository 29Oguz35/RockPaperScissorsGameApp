
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rpsImageView: UIImageView!
    @IBOutlet weak var rockImageView: UIImageView!
    @IBOutlet weak var paperImageView: UIImageView!
    @IBOutlet weak var scissorsImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    let ımageArray = ["rock","paper","scissors"]
    var pcSelected = "rock"
    override func viewDidLoad() {
        super.viewDidLoad()
       
        rockImageView.isUserInteractionEnabled = true
        paperImageView.isUserInteractionEnabled = true
        scissorsImageView.isUserInteractionEnabled = true
        
        let recognizerRock = UITapGestureRecognizer(target: self, action: #selector(rockImageClicked))
        let recognizerPaper = UITapGestureRecognizer(target: self, action: #selector(paperImageClicked))
        let recognizerScissors = UITapGestureRecognizer(target: self, action: #selector(scissorsImageClicked))
        
        rockImageView.addGestureRecognizer(recognizerRock)
        paperImageView.addGestureRecognizer(recognizerPaper)
        scissorsImageView.addGestureRecognizer(recognizerScissors)
    }
    @objc func selectImage()
    {
        let randomSelected = Int(arc4random_uniform(3))
        pcSelected = ımageArray[randomSelected]
        rpsImageView.image = UIImage(named: pcSelected)
    }
    @objc func scissorsImageClicked()
    {
       selectImage()
        if pcSelected == "scissors"
        {
            resultLabel.text = "Draw"
            infoLabel.text = "Please Again"
        }else if pcSelected == "rock"
            {
            resultLabel.text = "Lose The Game"
            infoLabel.text = "Rock Break Scissors"
        }else
        {
            resultLabel.text = "Congratulations"
            infoLabel.text = "Scissors Cuts Paper"
        }
    }
    @objc func paperImageClicked()
    {  selectImage()
        if pcSelected == "paper"
        {
            resultLabel.text = "Draw"
            infoLabel.text = "Please Again"
        }else if pcSelected == "scissors"
        {
           
        }else
        {
            resultLabel.text = "Congratulations"
            infoLabel.text = "Scissors Cuts Paper"
        }
    }
    @objc func rockImageClicked()
    {  selectImage()
        if pcSelected == "rock"
        {
            resultLabel.text = "Draw"
            infoLabel.text = "Please Again"
        }else if pcSelected == "paper"
        {
            resultLabel.text = "Lose The Game"
            infoLabel.text = "Paper Wraps Rock"
        }else
        {
            resultLabel.text = "Congratulations"
            infoLabel.text = "Rock Breaks Scissors"
        }
    }
    @IBAction func exitButtonClicked(_ sender: Any)
    {
        UIControl().sendAction(#selector(NSXPCConnection.suspend), to: UIApplication.shared, for: nil)
    }
}

