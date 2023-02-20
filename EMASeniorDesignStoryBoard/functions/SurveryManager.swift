//
//  SurveryManager.swift
//  EMASeniorDesignStoryBoard
//
//  Created by gwimer on 2/13/23.
//

import Foundation
import UIKit

class SurveyManager{
    private var question: [Question] = Survery.allQuestions
    public static let Survey = SurveyManager()
    private var counter: Int = 0
    
    func getCurrentQuestion() -> String{
        let q = question[counter].text
        return q
    }
    
    func getQuestionType() -> String{
        let q = question[counter].type
        return q
    }
    
    func getQuestionLowerBound() -> Int{
        let q = question[counter].lowerBound
        return q
    }
    
    func getQuestionUpperBound() -> Int{
        let q = question[counter].upperBound
        return q
    }
    
    func getlbDesc() -> String{
        let q = question[counter].lbDesc
        return q
    }
    
    func getubDesc() -> String{
        let q = question[counter].ubDesc
        return q
    }
    
    func incementCounter(){
        counter+=1
        print("increment: ", counter)
    }
    
    func decrementCounter(){
        counter-=1
        print("decrement: ", counter)
    }
    
    func returnView() -> UIViewController {
            switch question[counter].type{
            case "Scaled":
                return (ScaledView())
            default:
                return (HomeView())
            }
        }
    
    func nextQuestion() -> UIViewController {
            if (counter < question.endIndex-1){
                incementCounter()
                print(question[counter].text)
            }
            
            return returnView()
        }
        
        func previousQuestion() -> UIViewController {
            if (counter > question.startIndex){
                decrementCounter()
            }
            return returnView()
        }
 
}
