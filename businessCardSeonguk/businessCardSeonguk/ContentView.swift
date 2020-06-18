//
//  ContentView.swift
//  businessCardSeonguk
//
//  Created by Seonguk Jeong on 17/06/2020.
//  Copyright © 2020 Seonguk Jeong. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 0.12, green: 0.12, blue: 0.12)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("seonguk_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 220)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 2)
                )
                
                Text("Seonguk Jeong")
                    .font(.custom("Sniglet-Regular", size: 40))
                Text("iOS Developer")
                    .font(.custom("Cabin-Regular", size: 25))
                
                Button(action: {
                    //To call with guard statement
                    let phoneNumber = "tel://+441111111111"
                    guard let call = URL(string: phoneNumber) else { return }
                    UIApplication.shared.open(call)}) {
                        InfoButton(text: "+44 1111 111111", imageName: "phone.fill")
                }
                
                Button(action: {
                    //To send Email
                    if let email = URL(string: "mailto:anonymous@anonymous.com") {
                        UIApplication.shared.open(email)
                    } else {
                        print("error")
                    }
                }) {
                    InfoButton(text: "anonymous@anonymous.com", imageName: "envelope.fill")
                    
                }
                
                Button(action: {
                    //To open Github page
                    if let github = URL(string: "https://github.com/devSeonguk") {
                        UIApplication.shared.open(github)
                    } else {
                        print("error")
                    }
                }) {
                    HStack {
                        Image("github_white")
                        Text("Github.com/devSeonguk")
                    }
                }
            }.foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



