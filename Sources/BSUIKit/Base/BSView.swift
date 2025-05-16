//
//  BSView.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//

#if os(iOS)
import UIKit

/// `BaseView` is a base class for custom views that simplifies the process of creating and customizing a user interface.
/// This class sets up common methods for initializing the UI, setting constraints, and adding listeners.
public class BSView: UIView {

    // MARK: - Initialization

    /// Initional
    /// - Parameters:
    ///  - frame: Frame
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
        initConstraints()
        initListeners()
    }

    // Initialization from the interface file is not available
    @available(*, unavailable)
    override required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Setup Methods
    /// Method for initializing the user interface. Overridden in subclasses.
    open func initUI() {
    }

    /// Method for adding interface restrictions. Overridden in subclasses.
    open func initConstraints() {
    }

    /// Method for adding event listeners (handlers). Overridden in subclasses.
    open func initListeners() {
    }
}
#endif
