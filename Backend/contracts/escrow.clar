;; Contract principal addresses
(define-constant contract-owner tx-sender)
(define-data-var buyer (optional principal) none)
(define-data-var seller (optional principal) none)
(define-data-var authorized-contract (optional principal) none) ;; Authorized contract to call reject-payment and settle
(define-data-var collateral uint u0)

;; Error constants
(define-constant err-not-authorized (err u403))
(define-constant err-no-collateral (err u404))
(define-constant err-transfer-failed (err u500))


(define-public (load-collateral (amount uint))
    (begin
        (try! (contract-call? .sbtc transfer amount tx-sender (as-contract tx-sender) none))
        (var-set collateral (+ (var-get collateral) amount))
        (var-set buyer (some tx-sender))
        (ok true)
    )
)


(define-public (reject-payment)
    (begin
        (if (is-eq (some tx-sender) (var-get authorized-contract))
            (let ((collateral-amount (var-get collateral)))
                (var-set collateral u0) ;; Reset the collateral after transfer
                (ok (contract-call? .sbtc transfer collateral-amount (as-contract tx-sender) (unwrap-panic (var-get seller)) none))
            )
            (err err-not-authorized)
        )
    )
)


(define-public (settle)
    (begin
        (if (is-eq (some tx-sender) (var-get authorized-contract))
            (let ((collateral-amount (var-get collateral)))
                (var-set collateral u0) ;; Reset the collateral after transfer
                (ok (contract-call? .sbtc transfer collateral-amount (as-contract tx-sender) (unwrap-panic (var-get buyer)) none))
            )
            (err err-not-authorized)
        )
    )
)


(define-public (set-authorized-contract (contract-principal principal))
    (begin
        (asserts! (is-eq tx-sender contract-owner) err-not-authorized)
        (var-set authorized-contract (some contract-principal))
        (ok true)
    )
)

(define-public (set-seller (seller-principal principal))
    (begin
        (asserts! (is-eq tx-sender contract-owner) err-not-authorized)
        (var-set seller (some seller-principal))
        (ok true)
    )
)
