//
//  InfoButton.swift
//  businessCardSeonguk
//
//  Created by Seonguk Jeong on 18/06/2020.
//  Copyright © 2020 Seonguk Jeong. All rights reserved.
//

import SwiftUI

struct InfoButton: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 40)
            .padding(.horizontal)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                        .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                    Text(text)
                        .foregroundColor(.black)
            })
    }
}

struct InfoButton_Previews: PreviewProvider {
    static var previews: some View {
        InfoButton(text: "Hello", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}

