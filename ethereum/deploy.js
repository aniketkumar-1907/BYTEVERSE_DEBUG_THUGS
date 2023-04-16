const HDWalletProvider = require('@truffle/hdwallet-provider');
const Web3 = require('web3');
const {interface,bytecode} = require('./build/ElectionFactory.json');

provider = new HDWalletProvider(
  'limb trick hybrid recycle creek genius abstract put arch average brick submit',
    'https://goerli.infura.io/v3/173bc0954c4f4c498bcbc8f8523858f3'
);
 
const web3 = new Web3(provider);

const deploy = async () => {
  const accounts = await web3.eth.getAccounts();

  console.log('Attempting to deploy from account', accounts[0]);

  const result = await new web3.eth
    .Contract(JSON.parse(interface))
    .deploy({ data: bytecode })
    .send({ gas: '3000000', from: accounts[0] });

  console.log('Contract deployed to', result.options.address);
  provider.engine.stop();
};
deploy();


