;; Error codes
(define-constant ERR_UNAUTHORIZED (err u0))
(define-constant ERR_INVALID_PAYMENT (err u1))
(define-constant ERR_PAYMENT_NOT_DUE (err u2))
(define-constant ERR_PAYMENT_PLAN_NOT_FOUND (err u3))
(define-constant ERR_TOKEN_TRANSFER_FAILED (err u1001))

;; Data vars
(define-data-var latest-plan-id uint u0)

;; Payment plans map
(define-map payment-plans
    uint ;; plan id
    {
        user-id: uint,
        total-purchase-amount: uint,
        down-payment: uint,
        number-of-instalments: uint,
        instalment-amount: uint,
        remaining-balance: uint,
        next-due-block: uint,
        instalments-paid: uint,
        penalties: uint,
        blocks-per-instalment: uint
    }
)

;; Initialize a new payment plan
(define-public (initiate-payment-plan
    (user-id uint)
    (total-purchase-amount uint)
    (down-payment uint)
    (number-of-instalments uint)
    (instalment-amount uint)
    (blocks-per-instalment uint)
)
    (let (
        (plan-id (var-get latest-plan-id))
        (initial-remaining-balance (- total-purchase-amount down-payment))
        (initial-next-due-block (+ block-height blocks-per-instalment))
    )
        ;; Attempt to transfer the down-payment using the .sbtc token
        (try! (contract-call? .sbtc transfer down-payment tx-sender (as-contract tx-sender) none))
        (map-set payment-plans
            plan-id
            {
                user-id: user-id,
                total-purchase-amount: total-purchase-amount,
                down-payment: down-payment,
                number-of-instalments: number-of-instalments,
                instalment-amount: instalment-amount,
                remaining-balance: initial-remaining-balance,
                next-due-block: initial-next-due-block,
                instalments-paid: u0,
                penalties: u0,
                blocks-per-instalment: blocks-per-instalment
            }
        )
        (var-set latest-plan-id (+ plan-id u1))
        (ok plan-id)
    )
)

;; Function to receive payments
(define-public (make-payment
    (plan-id uint)
    (amount uint)
)
    (let (
        (plan (unwrap! (map-get? payment-plans plan-id) ERR_PAYMENT_PLAN_NOT_FOUND))
    )
        (asserts! (>= block-height (get next-due-block plan)) ERR_PAYMENT_NOT_DUE)
        (try! (contract-call? .sbtc transfer amount tx-sender (as-contract tx-sender) none))
        (let (
            (new-instalments-paid (if (>= amount (get instalment-amount plan))
                                        (+ (get instalments-paid plan) u1)
                                        (get instalments-paid plan)
                                  ))
            (new-balance (if (>= amount (get instalment-amount plan))
                                (- (get remaining-balance plan) amount)
                                (get remaining-balance plan)
                            ))
            (new-next-due-block (if (>= amount (get instalment-amount plan))
                                        (+ block-height (get blocks-per-instalment plan))
                                        (get next-due-block plan)
                                  ))
        )
            (map-set payment-plans
                plan-id
                (merge plan {
                    remaining-balance: new-balance,
                    instalments-paid: new-instalments-paid,
                    next-due-block: new-next-due-block
                })
            )
            (ok new-balance)
        )
    )
)
