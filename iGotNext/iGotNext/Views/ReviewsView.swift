//
//  ViewReviews.swift
//  iGotNext
//
//  Created by Michael Wright on 2021-11-18.
//

import SwiftUI


struct Review: Identifiable{
    let id = UUID()
    var contents : String?
}

struct ReviewsView: View {
    
    @State var listOfReviews = [
        Review(contents: "James was really fun to play with, he is really good at basketball but he will not go too hard on you if you are not at the same skill level. James was really fun to play with, he is really good at basketball but he will not go too hard on you if you are not at the same skill level."),
        Review(contents: "James was really fun to play with, he is really good at basketball but he will not go too hard on you if you are not at the same skill level. James was really fun to play with, he is really good at basketball but he will not go too hard on you if you are not at the same skill level."),
        Review(contents: "James was really fun to play with, he is really good at basketball but he will not go too hard on you if you are not at the same skill level. James was really fun to play with, he is really good at basketball but he will not go too hard on you if you are not at the same skill level."),
        Review(contents: "James was really fun to play with, he is really good at basketball but he will not go too hard on you if you are not at the same skill level. James was really fun to play with, he is really good at basketball but he will not go too hard on you if you are not at the same skill level.")
    ]
    
    var body: some View {
        
        VStack{
            HStack{
                Image("basketball")
                    .resizable()
                    .clipShape(Circle())
                    .scaledToFit()
                    .shadow(radius: 10)
                    .overlay(Circle().stroke(Color.white, lineWidth: 3))
                    .frame(width: 80, alignment: .leading)
                Text("James")
            }
            .frame(width: UIScreen.main.bounds.size.width, alignment: .leading)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
        
        
            Text("Reviews")
                .font(.system(size: 16, weight: .bold))
                .frame(width:  UIScreen.main.bounds.size.width - 40, alignment: .leading)
            
            ScrollView(showsIndicators: false){
                    ForEach(0..<listOfReviews.count) { i in
                        Button(action:{
                        }){
                            ZStack{
                                Rectangle()
                                    .fill(Color.white)
                                    //.frame(width: UIScreen.main.bounds.size.width - 40, height: 70)
                                    .cornerRadius(10)
                                    .shadow(radius: 3, y: 1)
                                HStack{
                                    Image("basketball")
                                        .resizable()
                                        .clipShape(Circle())
                                        .scaledToFit()
                                        .shadow(radius: 10)
                                        .overlay(Circle().stroke(Color.white, lineWidth: 3))
                                        .frame(width: 80, height: 260, alignment: .bottomLeading)
                                    Text(listOfReviews[i].contents!)
    //                                    .frame(width:  UIScreen.main.bounds.size.width - 70, alignment: .leading)
                                }
                            }
                            .frame(width: UIScreen.main.bounds.size.width - 40, height: CGFloat(300))
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 20, trailing: 20))
                        }
                    }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
            }
        }
        .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 100, alignment: .top)
    }
}

struct ReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsView()
    }
}

