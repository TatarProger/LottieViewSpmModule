// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import Lottie

public struct LottieView: UIViewRepresentable {
    let name: String
    var loopMode: LottieLoopMode = .playOnce
    var onAnimationCompleted: (() -> Void)? = nil
    
    public func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        let animationView = LottieAnimationView(name: name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        
        animationView.play { finished in
            if finished {
                onAnimationCompleted?()
            }
        }
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        return view
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) {}
}

public struct SplashView: View {
    @Binding public var isActive: Bool
    
    public init(isActive: Binding<Bool>) {
        self._isActive = isActive
    }
    
    public var body: some View {
        LottieView(name: "animation") {
            withAnimation {
                isActive = false
            }
        }
        .ignoresSafeArea()
        .background(Color.white)
    }
}
