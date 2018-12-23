let fs = require('fs');
let solc = require('solc')
let Web3 = require('web3');

let contract = compileContract();
let web3 = createWeb3();
let sender = '0x1543156c63d708983e701bebfca20e52622a9ae4';

function compileContract() {
    let compilerInput = {
        'Voter': fs.readFileSync('voter.sol', 'utf8')
    };

    console.log('Compiling the contract')
    // Compile and optimize the contract
    let compiledContract = solc.compile({sources: compilerInput}, 1);
    // Get compiled contract
    let contract = compiledContract.contracts['Voter:Voter']

    // Save contract's ABI
    let abi = contract.interface;
    fs.writeFileSync('abi.json', abi);

    return contract;
}
