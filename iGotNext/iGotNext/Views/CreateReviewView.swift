//
//  UserInfo.swift
//  Assignment1
//
//  Created by Michael Wright on 2021-09-15.
//

import SwiftUI

struct CreateReviewView: View {
    
    @State private var contents = ""
    @State private var rating : Double = 0

    @ObservedObject private var reviewViewModel = ReviewViewModel()

    
    var body: some View {
             
        
            Text("Write a review:")
                .font(.system(size: 35, weight: .medium))
        
            TextEditor(text: $contents)
                .frame(width: UIScreen.main.bounds.size.width - 40, height: 155)
                //.padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 3, y: 1)
                .padding(6)
                .foregroundColor(Color.black)
                
        
            Text("\(rating, specifier: "%.f")")
                .foregroundColor(Color.yellow)
                .font(.system(size: 35, weight: .medium))
    
        
            Slider(value: $rating, in: 0...5)
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                .accentColor(Color.yellow)
        
            Button(action:{
                reviewViewModel.addData(reviewContent: contents, user: "EJ1zfM5i7pXpTv1eSUdxkCSd7G82", rating: String(round(rating)))
            }){
                ZStack{
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.size.width - 40, height: 70)
                        .cornerRadius(10)
                        .shadow(radius: 3, y: 1)
                    Text("Submit")
                      .foregroundColor(Color.white)
                }
            }
        }
}

struct CreateReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
