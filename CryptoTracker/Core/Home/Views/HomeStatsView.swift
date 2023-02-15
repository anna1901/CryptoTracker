//
//  HomeStatsView.swift
//  CryptoTracker
//
//  Created by Anna Olak on 15/02/2023.
//

import SwiftUI

struct HomeStatsView: View {
    
    let statistics: [StatisticModel] = [
        StatisticModel(title: "Title", value: "Value", percentageChange: 1),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value", percentageChange: -15)
    ]
    
    var body: some View {
        HStack {
            ForEach(statistics) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatsView()
    }
}
