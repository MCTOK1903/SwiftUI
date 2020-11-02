//
//  Login.swift
//  LoginViewDesing
//
//  Created by MCT on 2.11.2020.
//

import SwiftUI

struct Login: View {
    
    @State var password = ""
    var social = ["twitter", "facebook","google"]
    
    var body: some View {
        
        VStack {
            
            HStack{
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("Hello Again!").fontWeight(.bold)
                    Text("Jose").font(.title).fontWeight(.bold)
                    
                    Button(action: {})  {
                        
                        Text("Log In With Different Account").font(.system(size: 14))
                            .fontWeight(.bold).foregroundColor(Color("Color1"))
                        
                    }
                }
                Spacer(minLength: 0)
                
                Image("KisiProfil1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 85, height: 84, alignment: .center)
                    .clipShape(Circle())
                
            }.padding(.horizontal,24).padding(.top, 24)
            
            VStack(alignment:.leading, spacing: 15 ){
                Text("Password").font(.caption).fontWeight(.bold).foregroundColor(.gray)
                
                TextField("Password", text: $password).padding()
                    .background(Color.white).cornerRadius(5)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
                
                Button(action: {}){
                    Text("Forget Password").font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color1"))
                }.padding(.top,8)
            }.padding(.horizontal, 24).padding(.top,24)
            
            
            //Log in button
            
            Button(action: {}, label: {
                Text("Log in").font(.system(size: 20))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 48)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("Color1"), Color("Color2")]), startPoint: .topLeading, endPoint: .bottomTrailing))
            }).cornerRadius(10).padding(.horizontal,24).padding(.top,16)
            
            //FaceId button
            
            Button(action: {}, label: {
                HStack(spacing:32){
                    Image(systemName: "faceid").font(.system(size: 26)).foregroundColor(Color("Color1"))
                    
                    Text("Login With FaceID").font(.system(size: 20)).fontWeight(.bold).foregroundColor(Color("Color1"))
                }.padding().frame(width: UIScreen.main.bounds.width - 48 ).background(RoundedRectangle(cornerRadius: 20).stroke(Color("Color1"),lineWidth: 1))
            }).padding(.top, 32)
            
            //Social icons
            
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

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
