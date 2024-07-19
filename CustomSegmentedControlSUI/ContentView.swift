//
//  ContentView.swift
//  CustomSegmentedControlSUI
//
//  Created by Macbook on 19/7/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            CustomSegmentedPicker(titles: ["Explore", "StoriesOfSuccess"], selectedItemColor: .white, backgroundColor: .gray, selectedItemFontColor: .red, defaultItemFontColor: .gray)
        }
    }
}

#Preview {
    ContentView()
}//ExploreView(), StoriesOfSuccessView()
