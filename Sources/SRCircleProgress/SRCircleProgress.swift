#if !os(macOS)
import UIKit

@IBDesignable
open class SRCircleProgress: UIView {
    /**
     ProgressAngle is an enumerated type that specifies the angle at which the progress view begins and ends.


     To customize the angle more, assign arbitrary values to the startAngle and endAngle properties of SRCircleProgress
     */
    public enum ProgressAngle {
        case topToTop, bottomToBottom, lowerLeftToLowerRight, leftToRight

        fileprivate var startAngle: CGFloat {
            switch self {
            case .topToTop:
                return CGFloat(-Double.pi / 2)
            case .bottomToBottom:
                return CGFloat(Double.pi / 2)
            case .lowerLeftToLowerRight:
                return CGFloat(3 * Double.pi / 4)
            case .leftToRight:
                return CGFloat(Double.pi)
            }
        }

        fileprivate var endAngle: CGFloat {
            switch self {
            case .topToTop:
                return CGFloat(3 * Double.pi / 2)
            case .bottomToBottom:
                return CGFloat(5 * Double.pi / 2)
            case .lowerLeftToLowerRight:
                return CGFloat(Double.pi / 4)
            case .leftToRight:
                return 0
            }
        }
    }

    // MARK: Public Properties
    /**
     The current progress shown by the receiver.

     The current progress is represented by a floating-point value between 0.0 and 1.0, inclusive, where 1.0 indicates the completion of the task. The default value is 0.0. Values less than 0.0 and greater than 1.0 are pinned to those limits.
     */
    open var progress: Float {
        get { Float(progressLineLayer.strokeEnd) }
        set {
            disableAnimation {
                progressLineLayer.strokeEnd = CGFloat(newValue)
            }
        }
    }
    
    /**
     The current percent shown by the receiver.
     
     
     The current progress is represented by a integert value between 0 and 100, inclusive, where 100 indicates the completion of the task. The default value is 0. Values less than 0 and greater than 100 are pinned to those limits.
     */
    @IBInspectable
    open var percent: Int {
        get { Int(progress * 100) }
        set { progress = Float(newValue) / 100 }
    }

    /**
     The color shown for the portion of the progress view that is filled.


     The default is UIColor.systemBlue
     */
    @IBInspectable
    public var progressLineColor: UIColor = .systemBlue {
        didSet {
            progressLineLayer.strokeColor = progressLineColor.cgColor
        }
    }

    /**
     Color of the view displayed behind the progress view

     The default is UIColor.systemBackground
     */
    @IBInspectable
    public var backgroundLineColor: UIColor = .lightGray {
        didSet {
            backgroundLineLayer.strokeColor = backgroundLineColor.cgColor
        }
    }

    /**
     Specifies the line width of the progress view.


     The default is 6.
     */
    @IBInspectable
    public var progressLineWidth: Float = 12 {
        didSet {
            progressLineLayer.lineWidth = CGFloat(progressLineWidth)
        }
    }

    /**
     Specifies the line width of the view behind the progress view.


     The default is 12.
     */
    @IBInspectable
    public var backgroundLineWidth: Float = 5 {
        didSet {
            backgroundLineLayer.lineWidth = CGFloat(backgroundLineWidth)
        }
    }

    /**
     Specifies the duration of the animation when setProgress(_:animated:) is executed
     */
    public var animationDuration: TimeInterval = 0.2

    /**
     Specifies the angle at which the progress view begins and ends.


     To customize the angle more, assign arbitrary values to the startAngle and endAngle properties of SRCircleProgress
     */
    public var progressAngle: ProgressAngle? {
        didSet {
            guard let progressAngle = progressAngle else { return }

            self.startAngle = progressAngle.startAngle
            self.endAngle = progressAngle.endAngle
        }
    }

    /**
     Specifies the angle at which the progress view starts


     To more easily specify the beginning and end angles of a progress view, use the progressAngle property
     */
    public var startAngle = CGFloat(-Double.pi / 2)

    /**
     Specifies the angle at which the progress view ends


     To more easily specify the beginning and end angles of a progress view, use the progressAngle property
     */
    public var endAngle = CGFloat(3 * Double.pi / 2)

    // MARK: Private Properties
    private let backgroundLineLayer = CAShapeLayer()
    
    private let progressLineLayer = CAShapeLayer()
    
    private var circlePath: UIBezierPath {
        let offset = backgroundLineWidth > progressLineWidth ? backgroundLineWidth : progressLineWidth
        return UIBezierPath(
            arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0),
            radius: frame.size.width / 2 - CGFloat(offset),
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true
        )
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        addLayer()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        addLayer()
    }

    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }

    override open func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    /// Adjusts the current progress shown by the receiver, optionally animating the change.
    ///
    ///
    /// The current progress is represented by a floating-point value between 0.0 and 1.0, inclusive, where 1.0 indicates the completion of the task. The default value is 0.0. Values less than 0.0 and greater than 1.0 are pinned to those limits.
    /// - Parameters:
    ///   - progress: The new progress value.
    ///   - animated: true if the change should be animated, false if the change should happen immediately.
    open func setProgress(_ progress: Float, animated: Bool) {
        if animated {
            let progressAnimation = CABasicAnimation(keyPath: "strokeEnd")
            progressAnimation.duration = animationDuration
            progressAnimation.fillMode = .forwards
            progressAnimation.fromValue = 0
            progressAnimation.toValue = CGFloat(progress)
            progressAnimation.isRemovedOnCompletion = false
            progressLineLayer.add(progressAnimation, forKey: "progress")
        } else {
            self.progress = progress
        }
    }

    private func addLayer() {
        layer.addSublayer(backgroundLineLayer)
        layer.addSublayer(progressLineLayer)
    }
    
    private func disableAnimation(_ block: () -> ()) {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        block()
        CATransaction.commit()
    }

    private func setup() {
        let circlePath = self.circlePath

        backgroundLineLayer.lineCap = .round
        backgroundLineLayer.path = circlePath.cgPath
        backgroundLineLayer.fillColor = UIColor.clear.cgColor
        backgroundLineLayer.lineWidth = CGFloat(backgroundLineWidth)
        backgroundLineLayer.strokeColor = backgroundLineColor.cgColor
        backgroundLineLayer.strokeEnd = 1.0

        progressLineLayer.lineCap = .round
        progressLineLayer.path = circlePath.cgPath
        progressLineLayer.fillColor = UIColor.clear.cgColor
        progressLineLayer.lineWidth = CGFloat(progressLineWidth)
        progressLineLayer.strokeEnd = 0
        progressLineLayer.strokeColor = progressLineColor.cgColor
    }

}

#endif
