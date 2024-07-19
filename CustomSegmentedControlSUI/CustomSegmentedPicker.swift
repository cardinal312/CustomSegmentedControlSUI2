//
//  CustomSegmentedPicker.swift
//  CustomSegmentedControlSUI
//
//  Created by Macbook on 19/7/24.
//

import SwiftUI

struct CustomSegmentedPicker: View {
    
    @State private var selection: Int = 0
    @State private var frames = Array<CGRect>(repeating: .zero, count: 20)
    @State private var views: Array<any View> = [ExploreView(), StoriesOfSuccessView()]
    
    private let titles: [String]
    
    private let selectedItemColor: Color
    private let backgroundColor: Color
    private let selectedItemFontColor: Color
    private let defaultItemFontColor: Color
    
    init(titles: [String], selectedItemColor: Color, backgroundColor: Color, selectedItemFontColor: Color, defaultItemFontColor: Color) {
        self.titles = titles
        self.selectedItemColor = selectedItemColor
        self.backgroundColor = backgroundColor
        self.selectedItemFontColor = selectedItemFontColor
        self.defaultItemFontColor = defaultItemFontColor
    }
    
    var body: some View {
        VStack {
            ZStack {
                HStack(spacing: 10) {
                    ForEach(titles.indices, id: \.self) { index in
                        Text(titles[index])
                            .foregroundStyle(selection == index ? selectedItemFontColor : defaultItemFontColor)
                            .onTapGesture {
                                selection = index
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background {
                                GeometryReader { proxy in
                                    Color.clear.onAppear {
                                        self.setFrame(index: index, frame: proxy.frame(in: .global))
                                    }
                                }
                            }
                    }
                }
                .background(alignment: .leading) {
                    Capsule()
                        .fill(selectedItemColor)
                        .frame(width: frames[selection].width, height: 54)
                        .offset(x: self.frames[selection].minX - frames[0].minX)
                }
                .padding(5)
            }
            .background(backgroundColor)
            .animation(.spring, value: selection)
            
            //Text(titles[selection])
            
            
                
        }
        .cornerRadius(100)
        .padding()
        
//        views.indices = selection
      
        if selection == 0 {
            ExploreView()
        } else {
            StoriesOfSuccessView()
        }
        
    }
    
    private func setFrame(index: Int, frame: CGRect) {
        DispatchQueue.main.async {
            self.frames[index] = frame
        }
    }
    
//    @ViewBuilder
//    func showViews() -> some View {
//        ScrollView(.vertical, showsIndicators: false) {
//            ForEach(views.indices) { index in
//                selection == index
//            }
//            //Text(titles[selection])
//        }
//    }
}

//#Preview {
//    CustomSegmentedPicker()
//}


//struct SelectionView: View {
//    
//    @State var view: any View as? View
//    
//    var body: some View {
//        VStack {
//            view
//        }
//        .edgesIgnoringSafeArea(.all)
//    }
//}
