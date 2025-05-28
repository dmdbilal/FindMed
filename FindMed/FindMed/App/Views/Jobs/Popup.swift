//
// Popup.swift
// FindMed
//
// Created by Mohamed Bilal on 20/04/25
//

import SwiftUI

/// Reference: https://medium.com/geekculture/swiftui-tutorial-a-simple-interactive-popup-6b9a91c3d057
// TODO: Make it generic for any view

protocol PopupViewProtocol {
    var dismissView: () -> Void { get set }
}

struct Popup<PopupView: View & PopupViewProtocol>: ViewModifier {
    /// The rect of the hosting controller
    @State private var presenterContentRect: CGRect = .zero
    
    /// The rect of popup content
    @State private var sheetContentRect: CGRect = .zero
    
    /// Controls if the sheet should be presented or not
    @Binding var isPresented: Bool
    
    /// The content to present
    var view: () -> PopupView
    
    init(
        isPresented: Binding<Bool>,
        view: @escaping () -> PopupView
    ) {
        self._isPresented = isPresented
        self.view = view
    }
}

// MARK: - Private Properties
extension Popup {
    /// The offset when the popup is displayed
    private var displayedOffset: CGFloat {
        -presenterContentRect.midY + screenHeight/2
    }
    
    /// The offset when the popup is hidden
    private var hiddenOffset: CGFloat {
        if presenterContentRect.isEmpty {
            return 1000
        }
        return screenHeight - presenterContentRect.midY + sheetContentRect.height/2 + 5
    }
    
    /// The current offset, based on the "presented" property
    private var currentOffset: CGFloat {
        return isPresented ? displayedOffset : hiddenOffset
    }
    
    private var screenWidth: CGFloat {
        UIScreen.main.bounds.size.width
    }
    
    private var screenHeight: CGFloat {
        UIScreen.main.bounds.size.height
    }
}

// MARK: - Content Builders
extension Popup {
    public func body(content: Content) -> some View {
        ZStack {
            content
                .frameGetter($presenterContentRect)
        }
        .overlay(sheet())
    }
    
    func sheet() -> some View {
        ZStack {
            self.view()
//                .simultaneousGesture(
//                    TapGesture().onEnded {
//                        dismiss()
//                    })
                .frameGetter($sheetContentRect)
                .frame(width: screenWidth)
                .offset(x: 0, y: currentOffset)
                .animation(Animation.bouncy(duration: 0.3), value: currentOffset)
        }
    }
    
    private func dismiss() {
        isPresented = false
    }
}

struct FrameGetter: ViewModifier {
    @Binding var frame: CGRect
    
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy -> AnyView in
                    let rect = proxy.frame(in: .global)
                    // This avoids an infinite layout loop
                    if rect.integral != self.frame.integral {
                        DispatchQueue.main.async {
                            self.frame = rect
                        }
                    }
                    return AnyView(EmptyView())
                }
            )
    }
}

extension View {
    func frameGetter(_ frame: Binding<CGRect>) -> some View {
        modifier(FrameGetter(frame: frame))
    }
}

// MARK: Popup modifier
extension View {
    func popup<PopupView: View & PopupViewProtocol>(
        isPresented: Binding<Bool>,
        view: @escaping () -> PopupView
    ) -> some View {
        self.modifier(
            Popup(
                isPresented: isPresented,
                view: view
            )
        )
    }
}
