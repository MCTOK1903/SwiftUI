//
//  SignUp.swift
//  LoginViewDesing
//
//  Created by MCT on 2.11.2020.
//

import SwiftUI

struct SignUp: View {
    
    @State var username = ""
    @State var password = ""
    var social = ["twitter", "facebook","google"]
    
    var body: some View {

        VStack{
            
            HStack{
                Text("Create Account").font(.title).fontWeight(.bold)
                Spacer()
            }.padding(.horizontal, 24).padding(.top, 24)
             
            // user info text field
            
            VStack(alignment: .leading, spacing: 15, content: {
                Text("Username").font(.caption).fontWeight(.bold).foregroundColor(.gray)
                TextField("Email Adress",text: $username).padding().background(Color.white).cornerRadius(5)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
                
                Text("Password").font(.caption).fontWeight(.bold).foregroundColor(.gray)
                TextField("Password",text: $username).padding().background(Color.white).cornerRadius(5)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
            }).padding(.horizontal, 24).padding(.top, 24)
            
            // sign up button
            
            Button(action: {}, label: {
                Text("Sign Up").font(.system(size: 20))
                    .foregroundColor(.white)
                    .fontWeight(.bold).padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 48)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("Color1"), Color("Color2")]), startPoint: .topLeading, endPoint: .bottomTrailing))
            }).cornerRadius(10).padding(.top,16)
            
            // SignUp With faceID button
            
            Button(action: {}, label: {
                HStack(spacing: 32){
                    Image(systemName: "faceid").font(.system(size: 26)).foregroundColor(Color("Color1"))
                    
                    Text("Sign Up With FaceID").font(.system(size: 20)).fontWeight(.bold).foregroundColor(Color("Color1"))
                }.padding().frame(width: UIScreen.main.bounds.width - 48).background(RoundedRectangle(cornerRadius: 20).stroke(Color("Color1"),lineWidth: 1))
            }).padding(.top,32)
            
            //social icons
            HStack(spacing: 32) {
                
                ForEach(social, id: \.self){ iconName in
                    Button(action: {}, label: {
                        Image(iconName).renderingMode(.original)
                    })
                }
            }.padding(.top, 16)
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
