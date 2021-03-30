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
    @State var index = 0
    
    var body: some View {
        
        List{
            Group{
                if !self.viewModel.charectersList.isEmpty{
                    
                    PageView(pages: self.viewModel.charectersList.map { FeatureCard(character: $0) })
                        .aspectRatio(16 / 9, contentMode: .fit)
                        .listRowInsets(EdgeInsets())
                }
            }
            
            Group{
                Text("Comics")
                    .font(.title2)
                    .fontWeight(.bold)
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                    ForEach(self.viewModel.comicsList) { comic in
                        //NavigationLink(destination: TelevisionDetailView(movieId: favorite.id)){
                            FavoriteBackdropCard(comic: comic)
                        //}
                        //.buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }.onAppear(perform: {
            self.viewModel.viewDidLoad()
        })
        .navigationBarTitle("Comics by Marvel")
        
//        List{
////            Group{
////                TabBarCustomView(selection: self.$index, arrayData: self.viewModel.charectersList)
////            }.listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
//
//            Group{
//                ComicPosterCarouselView(title: "Comics", comics: self.viewModel.comicsList)
//            }.listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))
//
////            Group{
////                SeriesPosterCarouselView(title: "Series", series: self.viewModel.seriesList)
////            }.listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))
//
////            Group{
////                StoriesPosterCarouselView(title: "Stories", stories: self.viewModel.storiesList)
////            }.listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))
//
////            Group{
////                EventsPosterCarouselView(title: "Events", events: self.viewModel.eventsList)
////            }.listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))
//        }
//        .navigationBarTitle("Comics by Marvel")
//        .onAppear(perform: {
//            self.viewModel.viewDidLoad()
//        })
    }
}

struct Comics_Previews: PreviewProvider {
    static var previews: some View {
        ComicsView()
    }
}

// MARK: - MovieBackdropCarouselView
//struct ComicPosterCarouselView: View {
//
//    let title: String
//    let comics: [ResultComics]
//    //private let imageLoader = ImageLoader()
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 0, content: {
//            HStack{
//                Text(title).font(.title).fontWeight(.bold).padding(.horizontal)
//                Rectangle()
//                    .fill(Color(UIColor.red).opacity(0.3))
//                    .frame(width: 50, height: 5)
//            }.padding(.bottom, 10)
//
//
//            ScrollView(.horizontal, showsIndicators: false, content: {
//                HStack(alignment: .top, spacing: 16, content: {
//                    ForEach(self.comics){ comic in
//                        NavigationLink(destination: Text("AQUI ANDRES DETALLE")){
//                            ComicPosterCard(comic: comic)
//                        }
//                        .buttonStyle(PlainButtonStyle())
//                        //.padding(.leading, comic.id == self.comics.first!.id ? 16 : 0)
//                        //.padding(.trailing, comic.id == self.comics.last!.id ? 16 : 0)
//                    }
//                })
//            })
//        })
//    }
//}

// MARK: - MovieBackdropCard
//struct ComicPosterCard: View {
//
//    let comic: ResultComics
//    @ObservedObject var imageLoader = ImageLoader()
//    @State private var gradientA: [Color] = [Color.red, Color.clear]
//
//    var body: some View {
//        ZStack{
//            if self.imageLoader.image != nil {
//                Image(uiImage: self.imageLoader.image!)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .cornerRadius(8)
//                    .shadow(radius: 4)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 8)
//                            .stroke(Color.gray, lineWidth: 1)
//                    )
//
//            } else {
//                Rectangle()
//                    .fill(LinearGradient(gradient: Gradient(colors: self.gradientA), startPoint: .bottom, endPoint: .top))
//                    .cornerRadius(8)
//                    .shadow(radius: 4)
//
//                Text(comic.title ?? "")
//                    .multilineTextAlignment(.center)
//            }
//        }
//        .frame(width: 240, height: 306)
//        .onAppear(perform: {
//            self.imageLoader.loadImage(whit: (self.comic.thumbnail?.pathURL)!)
//        })
//    }
//}

// MARK: - SeriesPosterCarouselView
//struct SeriesPosterCarouselView: View {
//
//    let title: String
//    let series: [ResultSeries]
//    //private let imageLoader = ImageLoader()
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 0, content: {
//            HStack{
//                Text(title).font(.title).fontWeight(.bold).padding(.horizontal)
//                Rectangle()
//                    .fill(Color(UIColor.red).opacity(0.3))
//                    .frame(width: 50, height: 5)
//            }.padding(.bottom, 10)
//
//
//            ScrollView(.horizontal, showsIndicators: false, content: {
//                HStack(alignment: .top, spacing: 16, content: {
//                    ForEach(self.series){ serie in
//                        NavigationLink(destination: Text("AQUI ANDRES DETALLE")){
//                            SeriePosterCard(serie: serie)
//                        }
//                        .buttonStyle(PlainButtonStyle())
//                        .padding(.leading, serie.id == self.series.first!.id ? 16 : 0)
//                        .padding(.trailing, serie.id == self.series.last!.id ? 16 : 0)
//                    }
//                })
//            })
//        })
//    }
//}


// MARK: - SeriePosterCard
//struct SeriePosterCard: View {
//
//    let serie: ResultSeries
//    @ObservedObject var imageLoader = ImageLoader()
//    @State private var gradientA: [Color] = [Color.red, Color.clear]
//
//    var body: some View {
//        ZStack{
//            if self.imageLoader.image != nil {
//                Image(uiImage: self.imageLoader.image!)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .cornerRadius(8)
//                    .shadow(radius: 4)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 8)
//                            .stroke(Color.gray, lineWidth: 1)
//                    )
//
//            } else {
//                Rectangle()
//                    .fill(LinearGradient(gradient: Gradient(colors: self.gradientA), startPoint: .bottom, endPoint: .top))
//                    .cornerRadius(8)
//                    .shadow(radius: 4)
//
//                Text(serie.title ?? "")
//                    .multilineTextAlignment(.center)
//            }
//        }
//        .frame(width: 240, height: 240)
//        .onAppear(perform: {
//            self.imageLoader.loadImage(whit: (self.serie.thumbnail?.pathURL)!)
//        })
//    }
//}
//
//// MARK: - StoriesPosterCarouselView
//struct StoriesPosterCarouselView: View {
//
//    let title: String
//    let stories: [ResultStories]
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 0, content: {
//            HStack{
//                Text(title).font(.title).fontWeight(.bold).padding(.horizontal)
//                Rectangle()
//                    .fill(Color(UIColor.red).opacity(0.3))
//                    .frame(width: 50, height: 5)
//            }.padding(.bottom, 10)
//
//
//            ScrollView(.horizontal, showsIndicators: false, content: {
//                HStack(alignment: .top, spacing: 16, content: {
//                    ForEach(self.stories){ storie in
//                        NavigationLink(destination: Text("AQUI ANDRES DETALLE")){
//                            StoriePosterCard(storie: storie)
//                        }
//                        .buttonStyle(PlainButtonStyle())
//                        .padding(.leading, storie.id == self.stories.first!.id ? 16 : 0)
//                        .padding(.trailing, storie.id == self.stories.last!.id ? 16 : 0)
//                    }
//                })
//            })
//        })
//    }
//}
//
//
//// MARK: - SeriePosterCard
//struct StoriePosterCard: View {
//
//    let storie: ResultStories
//    @ObservedObject var imageLoader = ImageLoader()
//    @State private var gradientA: [Color] = [Color.red, Color.clear]
//
//    var body: some View {
//        ZStack(alignment:.bottomLeading){
//            if self.imageLoader.image != nil {
//                Image(uiImage: self.imageLoader.image!)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .cornerRadius(8)
//                    .shadow(radius: 4)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 8)
//                            .stroke(Color.gray, lineWidth: 1)
//                    )
//
//            } else {
//                Rectangle()
//                    .fill(LinearGradient(gradient: Gradient(colors: self.gradientA), startPoint: .bottom, endPoint: .top))
//                    .cornerRadius(8)
//                    .shadow(radius: 4)
//
//                VStack(alignment: .leading){
//                    Text(storie.title ?? "")
//                        .multilineTextAlignment(.leading)
//                    Text(storie.type ?? "")
//                        .font(.headline)
//                }.padding()
//            }
//        }
//
//        .frame(width: 240, height: 240)
//        .onAppear(perform: {
//            //self.imageLoader.loadImage(whit: (self.storie.thumbnail?.pathURL)!)
//        })
//    }
//}
//
//
//// MARK: - EventsPosterCarouselView
//struct EventsPosterCarouselView: View {
//
//    let title: String
//    let events: [ResultEvents]
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 0, content: {
//            HStack{
//                Text(title).font(.title).fontWeight(.bold).padding(.horizontal)
//                Rectangle()
//                    .fill(Color(UIColor.red).opacity(0.3))
//                    .frame(width: 50, height: 5)
//            }.padding(.bottom, 10)
//
//
//            ScrollView(.horizontal, showsIndicators: false, content: {
//                HStack(alignment: .top, spacing: 16, content: {
//                    ForEach(self.events){ event in
//                        NavigationLink(destination: Text("AQUI ANDRES DETALLE")){
//                            EventPosterCard(event: event)
//                        }
//                        .buttonStyle(PlainButtonStyle())
//                        .padding(.leading, event.id == self.events.first!.id ? 16 : 0)
//                        .padding(.trailing, event.id == self.events.last!.id ? 16 : 0)
//                    }
//                })
//            })
//        })
//    }
//}
//
//
//// MARK: - SeriePosterCard
//struct EventPosterCard: View {
//
//    let event: ResultEvents
//    @ObservedObject var imageLoader = ImageLoader()
//    @State private var gradientA: [Color] = [Color.red, Color.clear]
//
//    var body: some View {
//        ZStack(alignment:.bottomLeading){
//            if self.imageLoader.image != nil {
//                Image(uiImage: self.imageLoader.image!)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .cornerRadius(8)
//                    .shadow(radius: 4)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 8)
//                            .stroke(Color.gray, lineWidth: 1)
//                    )
//
//            } else {
//                Rectangle()
//                    .fill(LinearGradient(gradient: Gradient(colors: self.gradientA), startPoint: .bottom, endPoint: .top))
//                    .cornerRadius(8)
//                    .shadow(radius: 4)
//                Text(event.title ?? "")
//                    .multilineTextAlignment(.leading)
//            }
//        }
//
//        .frame(width: 240, height: 240)
//        .onAppear(perform: {
//            self.imageLoader.loadImage(whit: (self.event.thumbnail?.pathURL)!)
//        })
//    }
//}
