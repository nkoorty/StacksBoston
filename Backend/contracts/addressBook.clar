(define-constant err-unknown-address (err u100))
(define-constant err-not-the-maker (err u101))

(define-map address-book
    {name: (string-ascii 50)}
    {address: principal}
)

(define-read-only (get-address (name (string-ascii 50)))
    (unwrap-panic (map-get? address-book {name: name})
))

(define-public (add-address (name (string-ascii 50)) (address principal))
    (ok (map-insert address-book {name: name} {address: address}))
)

(define-public (update-address (name (string-ascii 50)) (new-address principal))
    (let
        ((address-entry (get-address name)))
        (asserts! (is-eq tx-sender (get address address-entry)) err-not-the-maker)
        (map-set address-book {name: name} (merge address-entry {address: new-address}))
        (ok true)
    )
)



;; https://book.clarity-lang.org/ch06-03-unwrap-flavours.html