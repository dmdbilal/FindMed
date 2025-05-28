//
// SearchBar.swift
// FindMed
//
// Created by Mohamed Bilal on 14/04/25
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    let showFilter: Bool
    var onFilterTap: () -> Void
    
    init(
        _ searchText: Binding<String>,
        showFilter: Bool = false,
        onFilterTap: @escaping () -> Void = {}
    ) {
        self._searchText = searchText
        self.showFilter = showFilter
        self.onFilterTap = onFilterTap
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 24) {
                HStack {
                    Image("ic_search")
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.coolGray)
                    
                    TextField("Search", text: $searchText)
                        .font(.medium(size: 16))
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }
                .padding(8)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundStyle(.mistGray)
                }
                
                if showFilter {
                    Button {
                        onFilterTap()
                    } label: {
                        Image("ic_filter")
                            .foregroundStyle(.coolGray)
                    }
                }
            }
            
            // TODO: count the number of results
            if showFilter {
                Text("123 results")
                    .font(.semiBold(size: 12))
                    .foregroundStyle(.coolGray)
                    .padding(.leading, 8)
            }
        }
    }
}

#Preview {
    SearchBar(.constant("")) {}
}
