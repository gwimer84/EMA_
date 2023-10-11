//
//  SurveyManager.swift
//  EMASeniorDesignStoryBoard
//
//  Created by grw5132 on 3/26/23.

import Foundation
import UIKit

class SurveyManager{
    private var question: [Question] = SurveyArray.allQuestions
    private var max = SurveyArray.allQuestions.count
    public static let Survey = SurveyManager()
    private var counter: Int = 0

    func resetCounter(){
        counter = 0
        
    }
    func resetSurvey(){
        question.removeAll()
    }
    func setSurvey(input:[Question]){
        question = input
        max = question.count
        print(max);
        
    }
    func getQuestionID() -> Int{
        let q = question[counter].id
        return q
    }
    
    func getCurrentQuestion() -> String{
        let q = question[counter].text
        return q
    }
    
    func getFirstQuestion() -> String{
        let q = question[0].text
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
        print("Question Index: ", counter)
    }
    
    func decrementCounter(){
        counter-=1
        print("Question Index: ", counter)
    }
    
    func returnView() -> UIViewController {
            switch question[counter].type{
            case "Scaled":
                return (ScaledView())
            case "Open-Ended":
                return (OpenEndedView())
            case "Time":
                return (TimedView())
            default:
                return (HomeView())
            }
        
        }
    
    func firstQuestion() -> UIViewController{
        print("Question Index: ", counter)
        return returnView()
    }
    
    func nextQuestion() -> UIViewController {
        if (counter == question.endIndex-1){
            print(JSONEncoding.encoderJSON.encodeArray())
            return HomeView()
        }
        if (counter < question.endIndex){
                incementCounter()
        }
            
        return returnView()
    }
        
        func previousQuestion() -> UIViewController {
            if (counter > question.startIndex){
                decrementCounter()
                JSONEncoding.encoderJSON.deleteLastAnswerFromArray()
            }
            return returnView()
        }
    
    func returnFirstQuestion() ->UIViewController{
        returnView()
    }
    func returnMaxQuestion() -> Int{
        
        return max;
    }
    func getCounter() ->Int{
        return counter;
        
    }
	
//	func logout() -> UIViewController{
//		return LoginScreen()
//	}
    func logout() -> UIViewController {
        if let navigationController = UIApplication.shared.windows.first?.rootViewController as? UINavigationController {
            navigationController.popToRootViewController(animated: true)
        }
        return UIViewController()
    }
 
}
