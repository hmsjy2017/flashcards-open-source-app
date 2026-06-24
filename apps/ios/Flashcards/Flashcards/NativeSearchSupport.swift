import SwiftUI

extension View {
    @ViewBuilder
    func nativeBottomAccessory<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        if #available(iOS 26.0, *) {
            self.safeAreaBar(edge: .bottom, spacing: 0) {
                content()
            }
        } else {
            self.safeAreaInset(edge: .bottom, spacing: 0) {
                content()
            }
        }
    }

    @ViewBuilder
    func nativeSearchToolbarBehavior(horizontalSizeClass: UserInterfaceSizeClass?) -> some View {
        if #available(iOS 26.0, *) {
            self.searchToolbarBehavior(preferredNativeSearchToolbarBehavior(horizontalSizeClass: horizontalSizeClass))
        } else {
            self
        }
    }
}

@available(iOS 26.0, *)
private func preferredNativeSearchToolbarBehavior(horizontalSizeClass: UserInterfaceSizeClass?) -> SearchToolbarBehavior {
    if horizontalSizeClass == .compact {
        return .minimize
    }

    return .automatic
}
