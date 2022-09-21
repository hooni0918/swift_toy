//
import Foundation

var computerChoice = Int.random(in: 1...100)

var myChoice: Int = 0

while true{
    
    var userInput = readLine()
    
    if let input = userInput{
        
        if let number = Int(input) {
            myChoice = number
        }
        
    }
    //print(myChoice)
    
    if computerChoice > myChoice {
        print("up")
    } else if computerChoice < myChoice {
        print("down")
    } else {
        print("Bingo")
        break //반복문 종료
    }
    
    
    
    //for문은 주어진 조건의 횟수가 정해져있을때만 사용해야함 따라서 조건에 따라서 미정일떄는 while문을 활용함
}
//readLine을 사용하면 while을 사용하면 break가 나올때 까지 반복문 사용가능(살짝 트릭임)
