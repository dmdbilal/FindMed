//
// MyHistoryView.swift
// FindMed
//
// Created by Mohamed Bilal on 20/04/25
//

import SwiftUI

struct MyHistoryView: View {
    @State private var showPopup = false
    @State private var pageTitle = "My Application"
    @State private var showFilterView = false
    @State private var title = 0
    var titles = ["My Application", "Post History"]
    
    @State private var applications = Application.mock
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                pageTitleMenu
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // TODO: Search actions
                SearchBar(.constant(""), showFilter: true) {
                    showFilterView.toggle()
                }
                .padding(.top, 8)
                
                VStack(spacing: 16) {
                    ForEach(applications, id:\.id) { application in
                        HistoryCard(data: application) {
                            // CTA
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(.horizontal, 16)
        .sheet(isPresented: $showFilterView) {
            FilterView()
                .presentationDragIndicator(.visible)
        }
    }
}

// MARK: View Builders
private extension MyHistoryView {
    var pageTitleMenu: some View {
        Menu {
            ForEach(0...1, id:\.self) { index in
                Button {
                    title = index
                } label: {
                    Text(titles[index])
                        .foregroundStyle(.mediumGray)
                        .font(.semiBold(size: 20))
                        .tag(index)
                }
            }
        } label: {
            HStack {
                Text(titles[title])
                    .font(.semiBold(size: 20))
                
                Image(systemName: "chevron.down")
                    .fontWeight(.semibold)
            }
            .foregroundStyle(.beetleGreen)
        }
    }
}

#Preview {
    MyHistoryView()
}
