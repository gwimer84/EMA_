//
//  HomeView.swift
//  EMASeniorDesignStoryBoard
//
//  Created by Ryan Pape on 2/20/23.
//

import UIKit
var check = false
let checkButton = UIButton(frame:CGRect(x:125,y:400,width:150, height: 50))
class HomeView: UIViewController {
    let noQuestion = UILabel(frame:CGRect(x: 50, y: 100, width: 300.00, height: 300.00))
    override func viewDidLoad() {
		self.view.backgroundColor = .white
        super.viewDidLoad()
        noQuestion.text = "No Surveys please check back later"
        noQuestion.textColor = UIColor.systemBlue
        self.view.addSubview(noQuestion)
        navigationItem.hidesBackButton = true
        setupButton()
    }
    
    @objc func check_Survey(input:Bool){
        check = input;
    }
    func setupButton() {
        view.addSubview(checkButton)
        checkButton.configuration = .filled()
        checkButton.configuration?.baseBackgroundColor = .systemBlue
        checkButton.configuration?.title = "Load Survey"
        checkButton.center.x = self.view.center.x
        checkButton.center.y = self.view.center.y + 100
        checkButton.addTarget(self, action: #selector(checkSurvey), for: .touchUpInside)
        
    }
    
    
    @objc func checkSurvey() {
        
        serverCon.Recieve_Survey(completion : check_Survey)
        Thread.sleep(forTimeInterval: 1)
    
       
            if (check == true){
                navigationController?.pushViewController(SurveyManager.Survey.firstQuestion(), animated: true)
            }
        
        
    }
}
