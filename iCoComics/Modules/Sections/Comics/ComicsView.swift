//
//  Created on 24/03/2021.
// subfolder/Filename.swift - Very brief description
//
// This source file is part of the everis open source project in iOS Desktop
//
// Copyright (c) 2020 EVERIS Sl. and the Swift project authors iOS Desktop
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://steps.everis.com/git/MOVILIDAD/architecture-swiftui-ios/-/blob/master/README.md for text information
//
// -----------------------------------------------------------------------------
///
/// This file contains stuff that I am describing here in the header and will
/// be sure to keep up to date.
///
// -----------------------------------------------------------------------------

import SwiftUI

struct ComicsView: View {
    
    // MARK: ObservedObject -> MVVM Dependencies
    @ObservedObject var viewModel = ComicsPresenter()
    
    var body: some View {
        List{
            Group{
                ComicPosterCarouselView(title: "Comics", comics: self.viewModel.comicsList)
            }
        }.onAppear(perform: {
            self.viewModel.viewDidLoad()
            /* self.nowPlayingState.loadMovies(whit: .nowPlaying, type: .movie)
            self.upcomingState.loadMovies(whit: .upcoming, type: .movie)
            self.topRatedState.loadMovies(whit: .topRated, type: .movie)
            self.popularState.loadMovies(whit: .popular, type: .movie)*/
        })
    }
}

struct Comics_Previews: PreviewProvider {
    static var previews: some View {
        ComicsView()
    }
}


// MARK: - MovieBackdropCarouselView
struct ComicPosterCarouselView: View {
    
    let title: String
    let comics: [ResultComics]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            HStack{
                Text(title).font(.title).fontWeight(.bold).padding(.horizontal)
                Rectangle()
                    .fill(Color(UIColor.red).opacity(0.3))
                    .frame(width: 50, height: 5)
            }.padding(.bottom, 10)
            
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(alignment: .top, spacing: 16, content: {
                    ForEach(self.comics){ comic in
                        NavigationLink(destination: Text("AQUI ANDRES DETALLE")){
                            ComicPosterCard(comic: comic)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.leading, comic.id == self.comics.first!.id ? 16 : 0)
                        .padding(.trailing, comic.id == self.comics.last!.id ? 16 : 0)
                    }
                })
            })
        })
    }
}

// MARK: - MovieBackdropCard
struct ComicPosterCard: View {
    
    let comic: ResultComics
    @ObservedObject var imageLoader = ImageLoader()
    @State private var gradientA: [Color] = [Color.black, Color.clear]
    
    var body: some View {
        ZStack{
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                    .shadow(radius: 4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                
            } else {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: self.gradientA), startPoint: .bottom, endPoint: .top))
                    .cornerRadius(8)
                    .shadow(radius: 4)
                
                Text(comic.title ?? "")
                    .multilineTextAlignment(.center)
            }
        }
        .frame(width: 240, height: 306)
        .onAppear(perform: {
            self.imageLoader.loadImage(whit: (self.comic.thumbnail?.pathURL)!)
        })
    }
}

