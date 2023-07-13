//
//  ContentView.swift
//  Password Checker
//
//  Created by admin on 25/5/2023.
//

import SwiftUI

struct ContentView: View {
    @State var password : String = ""
    @State var passwordStrength : Int = 0
    
    
    func passwordChecker(_ password: String) -> Int{
        let passwordLength = password.count
        var containsSymbol = false
        var containsUppercase = false
        
        for character in password{
            if "ABCDEFGHIJKLMNOPQRSTUVWXYZ".contains(character){
                containsUppercase = true
            }
            if "~`!@#$%^&*()_-+={}[]|:;'<>.,?/'".contains(character){
                containsSymbol = true
            }
        }
        if passwordLength > 8 && containsSymbol && containsUppercase{
            return 1
        }else{
            return 0
        }
    }
    
    
    var body: some View {
        VStack {
            Text("How strong is your password?")
                .padding()
            TextField("Enter password:", text: $password).textFieldStyle(.roundedBorder).frame (width: 250)
            if passwordChecker(password) == 0{
                Text("WEAK").foregroundColor(.red).font(.system(size: 30))
            }else{
                Text("Strong").foregroundColor(.green).font(.system(size: 30))
                
            }
        }
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
