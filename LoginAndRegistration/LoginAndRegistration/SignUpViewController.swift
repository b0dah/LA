//
//  SignUpViewController.swift
//  LoginAndRegistration
//
//  Created by Иван Романов on 25.10.2019.
//  Copyright © 2019 Dimka Novikov. All rights reserved.
//

import UIKit

let signUpUrl = "http://localhost:8080/SignUp"

class SignUpViewController: UIViewController {

    @IBOutlet var textFields: [UITextField]!
    
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        
        let url = URL(string: signUpUrl)!
        
        let parameters = ["name": textFields[0].text!,
                          "surname": textFields[1].text!,
                          "nickname" : textFields[2].text!,
                          "password": textFields[3].text!,
                          "phone": textFields[4].text!]
        
        let newUrl = url.withQueries(parameters)
        
        var request = URLRequest(url: newUrl!)
        request.httpMethod = "GET"
        
        //guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        //request.httpBody = httpBody
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            do {
                let serverResponse = try JSONDecoder().decode(String.self, from: data)
                print(serverResponse)
            } catch {
                print(error)
            }
            
        }.resume()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for field in textFields {
            field.text = "bodah"
        }
    }
    

}
