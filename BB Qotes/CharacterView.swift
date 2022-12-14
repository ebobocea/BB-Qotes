//
//  CharacterView.swift
//  BB Qotes
//
//  Created by Elisei Bobocea on 29/06/2022.
//

import SwiftUI

struct CharacterView: View {
    let show: String
    let character: Character
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    Image(show.lowercased().filter {$0 != " "})
                        .resizable()
                        .scaledToFit()
                    Spacer()
                }
                VStack {
                    AsyncImage(url: character.image) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(25)
                            .frame(width: UIScreen.main.bounds.width/1.1, height: UIScreen.main.bounds.height/2)
                            .padding(.top, 50)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    VStack(alignment: .leading){
                        Text(character.name)
                            .font(.largeTitle)
                        
                        Text("Portrayed by: \(character.portrayedBy)")
                            .font(.subheadline)
                        
                        Text("\(character.name) Character Info")
                            .font(.title2)
                            .padding(.top, 7)
                        
                        Text("Born: \(character.birthday)")
                        Text("Occupation: \(character.occupation.joined(separator: ", "))")
                        Text("Nikname: \(character.nickname)")
                    }
                    .padding()
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(show: "breakingbad", character: Character(name: "Elisei", birthday: "20.05.1993", occupation: ["cool guy"], img: URL(string: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg")!, nickname: "syper", portrayed: "gica hagi"))
            .preferredColorScheme(.dark)
    }
}
