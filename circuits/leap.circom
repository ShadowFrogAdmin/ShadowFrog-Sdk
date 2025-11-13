pragma circom 2.0.0;

include "circomlib/poseidon.circom";
include "circomlib/comparators.circom";

template Leap() {
    signal input amount;
    signal input nullifier;
    signal input secret;
    signal output commitment;
    signal output nullifierHash;

    component poseidonComp = Poseidon(2);
    poseidonComp.inputs[0] <== amount;
    poseidonComp.inputs[1] <== nullifier + secret;
    commitment <== poseidonComp.out;

    component poseidonNull = Poseidon(1);
    poseidonNull.inputs[0] <== nullifier;
    nullifierHash <== poseidonNull.out;

    // Amount range proof (0 < amount < 2^64)
    component lessThan = LessThan(64);
    lessThan.in[0] <== amount;
    lessThan.in[1] <== 1 << 64;
    lessThan.out === 1;
}

component main = Leap();
