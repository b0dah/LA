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
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
                
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            
            let serverResponse = String(decoding: data, as: UTF8.self)
            print(serverResponse)
            
        }.resume()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.textFields[0].text = "Ivan"
        self.textFields[1].text = "Romanov"
        self.textFields[2].text = "Bodah"
        self.textFields[3].text = "qwerty"
        self.textFields[4].text = "8800"
        

    }
    

}
