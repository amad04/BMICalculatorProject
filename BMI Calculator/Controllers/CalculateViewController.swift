import UIKit

class CalculateViewController: UIViewController {

    var calculaterBrain = CalculaterBrain()
    
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    } 

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String (format: "%.2f", sender.value)
        heightLabel.text = " \(height) m"
    }
    
    @IBAction func weigtSliderChaged(_ sender: UISlider) {
        let weight = String (format: "%.0f", sender.value)
        weightLabel.text =  " \(weight) kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculaterBrain.calculateBMI (height : height, weight : weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult") {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculaterBrain.getBMIValue()
            destinationVC.advice = calculaterBrain.getAdvice()
            destinationVC.color = calculaterBrain.getColor()
        }
    }
    
}

