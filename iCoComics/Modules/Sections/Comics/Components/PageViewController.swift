//
//  PageViewController.swift
//  iCoComics
//
//  Created by Andres Felipe Ocampo Eljaiek on 30/03/2021.
//

import Foundation
import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    
    var pages: [Page]
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // Crea la vista para SwiftUI lo invoque en el ciclo de vida de SwiftUI
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageVC.dataSource = context.coordinator
        pageVC.delegate = context.coordinator
        return pageVC
    }
    
    // Crea la actualizacion lo que hace que esto se muy eficiente
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[0]], direction: .forward, animated: true
        )
        
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
        var parent : PageViewController
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0)}
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
    
}

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        
        control.addTarget(
                    context.coordinator,
                    action: #selector(Coordinator.updateCurrentPage(sender:)),
                    for: .valueChanged)

        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}


struct PageView<Page: View>: View {
    
    let pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                           .frame(width: CGFloat(pages.count * 18))
                           .padding(.horizontal, 20)
        }
    }
}

struct FeatureCard: View {

    var character: ResultCharacter
    @ObservedObject var viewModel = ComicsPresenter()

    init(character: ResultCharacter) {
        self.character = character
        self.viewModel.getImageFromUrl(character.thumbnail?.pathURL ?? "")
    }

    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.8), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .top)
    }

    var body: some View {
            ZStack(alignment: .bottomLeading) {
                Image(uiImage: ((self.viewModel.data.isEmpty) ? UIImage(named: "placeholder") : UIImage(data: self.viewModel.data))!)
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 280)
                    .cornerRadius(15)
                    .padding(.horizontal)

                Rectangle().fill(gradient)
                VStack(alignment: .leading) {
                    Text(character.name ?? "")
                        .font(.title)
                        .bold()
                        .padding(.leading, 20)
                }
                .padding()
            }
            .foregroundColor(.white)
        }
}

struct FavoriteBackdropCard: View {
    
    var comic: ResultComics
    @ObservedObject var viewModel = ComicsPresenter()
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.8), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .top)
    }
    
    init(comic: ResultComics) {
        self.comic = comic
        self.viewModel.getImageFromUrl(comic.thumbnail?.pathURL ?? "")
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            Image(uiImage: ((self.viewModel.data.isEmpty) ? UIImage(named: "placeholder") : UIImage(data: self.viewModel.data))!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
                .cornerRadius(8)
                .shadow(radius: 4)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
            Rectangle().fill(gradient)
            Button {
                //
            } label: {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                    .padding(.all, 10)
                    .background(Color.white)
                    .clipShape(Circle())
            }
            .padding(.all, 20)
        }
        .padding(5)
        
    }
}
