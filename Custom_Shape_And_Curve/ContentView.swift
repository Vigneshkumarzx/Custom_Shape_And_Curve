//
//  ContentView.swift
//  Custom_Shape_And_Curve
//
//  Created by vignesh kumar c on 03/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

#Preview {
    ContentView()
}
 
struct Home: View {
    
    @State private var width = UIScreen.main.bounds.width
    
    @State var data = [
        
        DataType(name: "Breaking Banana", price: "Rs.40 per kg", content: "Bananas are primarily composed of carbohydrates, mainly natural sugars (glucose, fructose, and sucrose) and dietary fiber.", calories: "89", expand: ["0.3 g", "23 g", "1.1 g"], color: Color("ban"), image: "ban"),
        DataType(name: "Amazing Avacoda", price: "Rs.80 per kg", content: "Avocados are known for their high content of healthy monounsaturated fats, primarily oleic acid.", calories: "160", expand: ["15 g", "9 g", "2 g"], color: Color("ava"), image: "ava"),
        DataType(name: "seductive stawberry", price: "Rs.100 per kg", content: "Strawberries are a popular and delicious fruit that are not only flavorful but also packed with nutrients", calories: "33", expand: ["0.3 g", "8 g", "2 g"], color: Color("sta"), image: "sta")
     ]

    @State var index = 0
    
    var body: some View {
        
        ZStack(alignment: .top) {
            VStack {
                HStack {
                    Button(action: {}, label: {
                        HStack(spacing: 20) {
                            
                            Image("back")
                                .renderingMode(.original)
                            Text("Back")
                                .fontWeight(.bold)
                        }
                    })
                    .padding(.leading,8)
                     Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "handbag.fill")
                            .renderingMode(.original)
                    }
                }
                .padding()
                
                HStack(spacing: 20) {
                    Button {
                        if self.index != 0 {
                            self.index -= 1
                        }
                        
                    } label: {
                        Image(systemName: "arrowshape.turn.up.left.fill")
                            .renderingMode(.original)
                            .foregroundStyle(.black)
                    }
                    .opacity(self.index != 0 ? 1 : 0.5)
                    .disabled(self.index != 0 ? false : true)
                    Image(self.data[self.index].image)
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    Button {
                        
                        if self.index != self.data.count - 1 {
                            self.index += 1
                        }
                        
                    } label: {
                        Image(systemName: "arrowshape.turn.up.right.fill")
                            .renderingMode(.original)
                            .foregroundStyle(.black)
                    }
                    .opacity(self.index != self.data.count - 1 ? 1 : 0.5)
                    .disabled(self.index != self.data.count - 1 ? false : true)
                }
                .padding(.top, 50)
                
                VStack(spacing: 20) {
                    
                    Text(self.data[self.index].name)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(self.data[self.index].price)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(self.data[self.index].content)                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                    Text("Nutrition value")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    HStack {
                        Image(systemName: "flame.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 35)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(self.data[self.index].calories)
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                            Text("Calories")
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                        }
                        .padding(.leading, 20)
                    }
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(10)
                    
                    HStack {
                        VStack(alignment: .center, spacing: 10) {
                            
                            Text(self.data[self.index].expand[0])
                                .fontWeight(.bold)
                            Text("Fat")
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                        VStack(alignment: .center, spacing: 10) {
                            
                            Text(self.data[self.index].expand[1])
                                .fontWeight(.bold)
                            Text("Carbohydrates")
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                        VStack(alignment: .center, spacing: 10) {
                            
                            Text(self.data[self.index].expand[2])
                                .fontWeight(.bold)
                            Text("Protien")
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Add to cart")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: self.width - 50)
                        .background(Color.purple)
                        .clipShape(Capsule())
                }
                .padding(.bottom, 20)

            }
            .zIndex(1)
            Circle()
                .fill(Color(self.data[self.index].color))
                .frame(width: self.width + 200, height: self.width + 200)
                .padding(.horizontal, -100)
                .offset(y: -self.width)
        }
        .animation(.default)
    }
}

struct DataType {
    var name: String
    var price: String
    var content: String
    var calories: String
    var expand: [String]
    var color: Color
    var image: String
}

