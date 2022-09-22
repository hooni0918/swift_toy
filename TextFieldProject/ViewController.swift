//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 이지훈 on 2022/09/21.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        setup()
    }

    func setup() {
    view.backgroundColor = UIColor.gray
        
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        //textfield.resignFirstRespond() 와 거의 유사함 차이점은 << 는 text에서만 위에는 view 전체에서
    }
    
    // 텍스트필드의 입력을 시작할 때 호출 (시작할지 말지의 여부 허락하는것
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function) //test용인데, 실행해서 해당 함수의 이름을 출력하는것
        return true
    }
    
    //텍스트필드의 시점
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트필드의 입력을 시작했다") //text대신 애니메이션같은거 넣을떄 주로 이용
    }
    
    //텍스트필드 글자 내용이 (한글자 한글자당) 입력되거나 지워질 떄, 호출이 됨( 허락)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print(string)
//        print(#function)
        //10글자 이상 입력이 되지 않도록 막아주는 코드
        let maxLength = 10
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString

        return newString.length <= maxLength
    }
    
    // 텍스트필드의 엔터키가 눌러지면 다음 동작을 허락할것인지 말것인지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }

    //텍스트필드의 입력이 끝날 떄 호출(끝날지 말지를 허락)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    //텍스트필드의 입력이 실제 끝났을 때 호출(시점)
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트필드의 이릅름 끝냇다")
    }
    

    @IBAction func doneBtnTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
    }
    
}

