//
// CustomAlertView.swift
// FindMed
//
// Created by Mohamed Bilal on 23/04/25
//

import SwiftUI

struct CustomAlertView<Content: View>: View {
    private let animationDuration = 0.33
    var content: (_ onDismiss: @escaping () -> Void) -> Content
    
    @State private var isAnimating = false
    @Binding var isPresented: Bool
    
    init(isPresented: Binding<Bool>, content: @escaping (_ onDismiss: @escaping () -> Void) -> Content) {
        self._isPresented = isPresented
        self.content = content
    }
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
                .opacity(isAnimating ? 0.5 : 0)
                .zIndex(1)
            
            if isAnimating {
                content {
                    dismiss()
                }
                .transition(.move(edge: .bottom).combined(with: .opacity))
                .zIndex(2)
            }
        }
        .onAppear {
            show()
        }
    }
    
    private func show() {
        withAnimation(.easeInOut(duration: animationDuration)) {
            isAnimating = true
        }
    }
    
    private func dismiss() {
        if #available(iOS 17.0, *) {
            withAnimation(.easeInOut(duration: animationDuration)) {
                isAnimating = false
            } completion: {
                isPresented = false
            }
        } else {
            withAnimation(.easeInOut(duration: animationDuration)) {
                isAnimating = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                isPresented = false
            }
        }
    }
}

struct ClearBackgroundView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return InnerView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
    private class InnerView: UIView {
        override func didMoveToWindow() {
            super.didMoveToWindow()
            superview?.superview?.backgroundColor = .clear
        }
    }
}

extension View {
    func customAlert<Content: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping (_ onDismiss: @escaping () -> Void) -> Content
    ) -> some View where Content : View {
        fullScreenCover(isPresented: isPresented) {
            if #available(iOS 16.4, *) {
                CustomAlertView(isPresented: isPresented, content: content)
                    .presentationBackground(.clear)
            } else {
                CustomAlertView(isPresented: isPresented, content: content)
                    .background(ClearBackgroundView())
            }
        }
        .transaction { transaction in
            if isPresented.wrappedValue {
                transaction.disablesAnimations = true
            }
        }
    }
}
