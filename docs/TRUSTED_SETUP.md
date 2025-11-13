# ShadowFrog Trusted Setup

For Groth16 powers-of-tau: Secure MPC ceremony needed for leap proofs.

1. Phase 1: `snarkjs powersoftau new bn128 14 powersoftau.key` (powers of tau).
2. Contribute: Run ceremony with trusted parties (TBD: community + multisig).
3. Phase 2: `snarkjs powersoftau contribute ...` → Final .ptau.
4. Verify: `snarkjs zkey verify leap.r1cs final.ptau leap_final.zkey`.

Alpha: Using public params for dev. Full ceremony post-audit. No toxic waste—promise.
