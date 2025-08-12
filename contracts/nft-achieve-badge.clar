;; NFT Achievement Badge Contract
;; Awards NFT badges for completing milestones

;; SIP-009 NFT Trait
(define-non-fungible-token achievement-badge uint)

;; Constants
(define-constant err-owner-only u100)
(define-constant err-already-awarded u101)
(define-constant err-invalid-milestone u102)
(define-constant err-not-owner u103)

;; Contract Owner (set to deployer address at deployment)
(define-constant contract-owner tx-sender)

;; Milestone Registry
(define-map milestone-completions {user: principal, milestone-id: uint} bool)

;; Badge Metadata
(define-map badge-metadata uint {name: (string-ascii 32), description: (string-ascii 100)})

;; Track total badges issued
(define-data-var total-badges uint u0)

;; Award a badge for completing a milestone
(define-public (award-badge (milestone-id uint) (recipient principal) (name (string-ascii 32)) (description (string-ascii 100)))
  (begin
    ;; Only contract owner can award
    (asserts! (is-eq tx-sender contract-owner) (err err-owner-only))
    ;; Check if milestone already awarded to this recipient
    (asserts! (not (default-to false (map-get? milestone-completions {user: recipient, milestone-id: milestone-id}))) (err err-already-awarded))
    ;; Increment badge ID
    (let ((badge-id (+ (var-get total-badges) u1)))
      ;; Mint NFT
      (try! (nft-mint? achievement-badge badge-id recipient))
      ;; Record milestone completion
      (map-set milestone-completions {user: recipient, milestone-id: milestone-id} true)
      ;; Store metadata
      (map-set badge-metadata badge-id {name: name, description: description})
      ;; Update total badge count
      (var-set total-badges badge-id)
      (ok badge-id))))

;; Read-only: Check if user completed a milestone
(define-read-only (has-completed (user principal) (milestone-id uint))
  (ok (default-to false (map-get? milestone-completions {user: user, milestone-id: milestone-id}))))

;; Read-only: Get badge metadata
(define-read-only (get-badge-info (badge-id uint))
  (match (map-get? badge-metadata badge-id)
    meta (ok meta)
    (err err-invalid-milestone)))

;; Burn a badge (only owner of badge can burn)
(define-public (burn-badge (badge-id uint))
  (match (nft-get-owner? achievement-badge badge-id)
    owner (begin
            (asserts! (is-eq owner tx-sender) (err err-not-owner))
            (try! (nft-burn? achievement-badge badge-id tx-sender))
            (ok true))
    ;; If 'none', the badge doesn't exist, so no one is the owner.
    (err err-not-owner)))
