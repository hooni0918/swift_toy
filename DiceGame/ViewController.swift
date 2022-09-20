
import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageVIew: UIImageView!
    

    var DiceArray: [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2") , #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5") , #imageLiteral(resourceName: "black6")]
    //#imageLiteral( 을 사용하였습니다. Assets에 미리 담아두었습니다.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func rollbtntapped(_ sender: UIButton) {
        //첫번째 이미지뷰의 이미지를 랜덤으로 변경
        firstImageView.image = DiceArray.randomElement()
        
        //두번째 이미지뷰의 이미지를 랜덤으로 변경
        secondImageVIew.image = DiceArray.randomElement()
        
    
    
    }
    
}

