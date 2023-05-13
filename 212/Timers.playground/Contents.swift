import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

enum PaymentStatus {
    case inProgress
    case completed
    case failed
}

var paymentStatus: PaymentStatus = .inProgress

DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(.random(in: 3...9))) {
    paymentStatus = Bool.random() ? .completed : .failed
}

func checkPaymentStatus() {
    print("PyamentStatus: \(paymentStatus)")

    if paymentStatus == .inProgress {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
            checkPaymentStatus()
        }
    }
}

//checkPaymentStatus()

let timer = Timer
    .scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
        checkPaymentStatusButWithTimer()
    }

func checkPaymentStatusButWithTimer() {
    print("PyamentStatus: \(paymentStatus)")

    if paymentStatus != .inProgress {
        timer.invalidate()
    }
}

func close() {
    timer.invalidate()
}

DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    close()
}
