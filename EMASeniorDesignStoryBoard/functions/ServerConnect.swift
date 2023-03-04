//
//  ServerConnect.swift
//  EMASeniorDesignStoryBoard
//
//  Created by gwimer on 2/13/23.
//

import Foundation

class ServerConnect{
    let Port_number = 0
    
    let Password = ""
    let Username = ""
    
    func Sign_in(password:String,username:String) ->Bool {
        if(username == Username &&  password == Password){
            return true
        }
        else{
            return false
        }
        
        
        
    }
    func receiveSurvey(){
		var tempArray = [Question]()
        guard let url = URL(string:"https://psubehrendema.org/getSurvey_iPhone.php") else{
            return
        }
		let task: Void = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
				if let Q = try? JSONDecoder().decode([Question].self, from: data) {
					SurveyArray.allQuestions = Q
					print(SurveyArray.allQuestions)
				} else {
                    print("Error!")
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
			print(SurveyArray.allQuestions.count)
        }
            .resume()
		
    }
    
	func fetchSurvey() async throws -> [Question] {
		guard let url = URL(string:"https://psubehrendema.org/getSurvey_iPhone.php") else{
			fatalError("Check url")
		}
	  let (data, response) = try await URLSession.shared.data(from: url)

	  guard let httpResponse = response as? HTTPURLResponse,
			httpResponse.statusCode == 200 else {
		throw fatalError("cannot connect to server")
	  }
		let decoder = JSONDecoder()
		guard let loadedData = try? decoder.decode([Question].self, from: data) else {
			fatalError("Could not decode JSON")
		}
		return loadedData
	}
	
}
    
    

