//
// FilterView.swift
// FindMed
//
// Created by Mohamed Bilal on 14/04/25
//

import SwiftUI
import MultiSlider

struct FilterView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var roleInput = ""
    @State private var hospitalInput = ""
    @State private var placeInput = ""
    @State private var shiftTimeInputFrom: Date = Date()
    @State private var shiftTimeInputTo: Date = Date()
    @State private var shiftTimeArray: [CGFloat] = [9, 18]

    @State private var payScaleInput = 0.0
    @State private var payScaleArray: [CGFloat] = [700, 7000]
    
    var payScaleSlider: some View {
        MultiValueSlider(
            value: $payScaleArray,
            minimumValue: 100,
            maximumValue: 10000,
            snapStepSize: 100,
            valueLabelPosition: .top,
            orientation: .horizontal,
            outerTrackColor: .iceBlue,
            trackWidth: 4
        )
            .valueLabelFont(UIFont(name: Fonts.Inter.Bold, size: 12))
            .valueLabelColor(UIColor(named: "Cool Gray"))
            .thumbTintColor(.coolGray)
            .showsThumbImageShadow(false)
            .tint(.coolGray)
            .frame(height: 50)
    }
    
    var shiftTimeSlider: some View {
        MultiValueSlider(
            value: $shiftTimeArray,
            minimumValue: 0,
            maximumValue: 24,
            snapStepSize: 1,
            valueLabelPosition: .top,
            orientation: .horizontal,
            outerTrackColor: .iceBlue,
            trackWidth: 4
        )
            .valueLabelFont(UIFont(name: Fonts.Inter.Bold, size: 12))
            .valueLabelColor(UIColor(named: "Cool Gray"))
            .thumbTintColor(.coolGray)
            .showsThumbImageShadow(false)
            .tint(.coolGray)
            .frame(height: 50)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Filter")
                .font(.semiBold(size: 20))
            
            BorderLabelTextField(
                text: $roleInput,
                placeHolder: "Role"
            )
            
            BorderLabelTextField(
                text: $hospitalInput,
                placeHolder: "Hospital"
            )
            
            BorderLabelTextField(
                text: $placeInput,
                placeHolder: "Place"
            )
            
//            BorderLabelTextField(
//                text: $shiftTimeInput,
//                placeHolder: "Shift timing"
//            )
            
//            DatePicker(
//                "Shift timing From",
//                selection: $shiftTimeInputFrom,
//                displayedComponents: .hourAndMinute
//            )
//            .foregroundStyle(.beetleGreen)
//            
//            DatePicker(
//                "Shift timing To",
//                selection: $shiftTimeInputTo,
//                displayedComponents: .hourAndMinute
//            )
//            .foregroundStyle(.beetleGreen)
            
            
            Text("Shift Time")
                .font(.semiBold(size: 14))
                .foregroundStyle(.beetleGreen)

            shiftTimeSlider
            
            Text("Pay scale (per hour)")
                .font(.semiBold(size: 14))
                .foregroundStyle(.beetleGreen)
            
            payScaleSlider
            
            Spacer()
            
            HStack(spacing: 24) {
                ButtonView(title: "Cancel", titleColor: .mediumGray, outlineColor: .coolGray) {
                    dismiss()
                }
                
                ButtonView(title: "Apply", titleColor: .white, fillColor: .beetleGreen) {
                    
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

#Preview {
    FilterView()
}
