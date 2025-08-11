;; NFT Achievement Badge Contract
;; Awards NFT badges for completing milestones

;; SIP-009 NFT Trait
(define-non-fungible-token achievement-badge uint)

;; Constants
(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-already-awarded (err u101))
(define-constant err-invalid-milestone (err u102))
(define-constant err-not-owner (err u103))

;; Milestone Registry
(define-map milestone-completions {user: principal, milestone-id: uint} bool)

;; Badge Metadata
(define-map badge-metadata uint {name: (string-ascii 32), description: (string-ascii 100)})

;; Track total badges issued
(define-data-var total-badges uint u0)

;; Award a badge for completing a milestone
(define-public (award-badge (milestone-id uint) (recipient principal) (name (string-ascii 32)) (description (string-ascii 100)))
  (begin
    (asserts! (is-eq tx-sender contract-owner) err-owner-only)
    (asserts! (not (default-to false (map-get? milestone-completions {user: recipient, milestone-id: milestone-id}))) err-already-awarded)
    (let ((badge-id (+ (var-get total-badges) u1)))
      (try! (nft-mint? achievement-badge badge-id recipient))
      (map-set milestone-completions {user: recipient, milestone-id: milestone-id} true)
      (map-set badge-metadata badge-id {name: name, description: description})
      (var-set total-badges badge-id)
      (ok badge-id))))

;; Read-only: Check if user completed a milestone
(define-read-only (has-completed (user principal) (milestone-id uint))
  (ok (default-to false (map-get? milestone-completions {user: user, milestone-id: milestone-id}))))

;; Read-only: Get badge metadata
(define-read-only (get-badge-info (badge-id uint))
  (match (map-get? badge-metadata badge-id)
    meta (ok meta)
    none err-invalid-milestone))

;; Burn a badge (only owner of badge)
(define-public (burn-badge (badge-id uint))
  (begin
    (asserts! (is-eq (nft-get-owner? achievement-badge badge-id) tx-sender) err-not-owner)
    (try! (nft-burn? achievement-badge badge-id))
    (ok true)))