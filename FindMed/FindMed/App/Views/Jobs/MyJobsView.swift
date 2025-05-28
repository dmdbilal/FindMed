//
// MyJobsView.swift
// FindMed
//
// Created by Mohamed Bilal on 14/04/25
//

import SwiftUI

struct MyJobsView: View {
    @EnvironmentObject var viewModel: MyJobsViewModel

    @State private var shouldShowFilterView = false
    @State private var shouldShowJobDescriptionView = false
    @State var isPresenting = false
    @State var showCreatePostScreen = false

    var body: some View {
        NavigationStack {
            ZStack {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Open positions")
                        .font(.semiBold(size: 20))
                    
                    SearchBar(.constant(""), showFilter: true) {
                        shouldShowFilterView = true
                    }
                    
                    ScrollView {
                        ForEach(viewModel.jobs, id: \.self) { job in
                            NavigationLink(value: job) {
                                JobView(data: job) {
                                    isPresenting = true
                                    viewModel.currentJob = job
                                }
                            }
                        }
                    }
                }
                
                if viewModel.isAdmin {
                    Button {
                        showCreatePostScreen.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "plus")
                                .font(.bold(size: 16))
                            Text("Create post")
                                .font(.semiBold(size: 16))
                        }
                        .foregroundStyle(.white)
                    }
                    .padding()
                    .background(.beetleGreen)
                    .cornerRadius(8)
                    .frame(width: 160, height: 50)
                    .offset(x: 105, y: 325)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    .navigationDestination(isPresented: $showCreatePostScreen) {
                        CreatePostView()
                            .navigationBarBackButtonHidden()
                            .environmentObject(viewModel)
                    }
                    
                }
            }
            .padding(.horizontal, 16)
            .navigationDestination(isPresented: $isPresenting) {
                JobDescriptionView(data: viewModel.currentJob)
                    .presentationCompactAdaptation(.fullScreenCover)
            }
            .scrollIndicators(ScrollIndicatorVisibility.hidden)
            .sheet(isPresented: $shouldShowFilterView) {
                FilterView()
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

#Preview {
    MyJobsView()
}
