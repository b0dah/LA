//
//  Shrek.swift
//  LoginAndRegistration
//
//  Created by Иван Романов on 24.10.2019.
//  Copyright © 2019 Dimka Novikov. All rights reserved.
//

import UIKit

let signInUrl = "http://localhost:8080/SignIn"

class Shrek: UIViewController {
    
    @IBOutlet var shrek: [UITextField]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.shrek[0].delegate = self
        self.shrek[1].delegate = self
    }
    
    @IBAction func signInTouchUp(_ sender: Any) {
        
        // POST запрос
        guard let url = URL(string: signInUrl) else {
            return
        }
        
        let parameters = ["login": self.shrek[0].text!,
                          "password": self.shrek[1].text!]
        
        let newUrl = url.withQueries(parameters)
        
        var request = URLRequest(url: newUrl!)
        request.httpMethod = "GET"

//        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }

//        request.httpBody = httpBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            do {
              let json = try JSONSerialization.jsonObject(with: data, options: [])
             print(json)
        
                let fetchedData: UserModel = try JSONDecoder().decode(UserModel.self, from: data)
                
                print(fetchedData.login.value)
                
            } catch {
                print(error)
            }
            
        }.resume()
    }
}
    
    
    
extension Shrek: UITextFieldDelegate {

}

