//
//  ContentView.swift
//  cats
//
//  Created by Veronica Tellez on 17/11/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var network: Network
    
    var body: some View {
        ScrollView {
            VStack{
                Spacer()
                Spacer()
                Text("Catbreeds")
                    .font(.title2)
                    .bold()
                VStack(alignment: .leading) {
                    ForEach(network.cats) { cat in
                        VStack {
                            VStack(alignment: .leading) {
                                Text("Raza: " + cat.name)
                                    .bold()
                                
                                AsyncImage(url: URL(string: cat.image?.url! ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Black_Paw.svg/1093px-Black_Paw.svg.png") , content: { image in
                                    image.resizable()
                                         .aspectRatio(contentMode: .fit)
                                         .frame(maxWidth: 300, maxHeight: 300)
                                }, placeholder: {ProgressView()})
                                
                                HStack{
                                    Text("País de origen: " + cat.origin!)
                                        .bold()
                                    Spacer()
                                    Text("Inteligencia: " + String(cat.intelligence!))
                                        .bold()
                                }
                            }
                        }
                        .frame(width: 300, alignment: .leading)
                        .padding()
                        .border(Color.black)
                    }
                }
                .padding()

            }
            .border(Color.black)
            

            
        }
        .padding(.vertical)
        .onAppear {
            network.getCats()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}
