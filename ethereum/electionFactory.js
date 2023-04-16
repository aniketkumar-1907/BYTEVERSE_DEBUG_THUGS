import web3 from './web3';
import ElectionFactory from './build/ElectionFactory.json';

const instance = new web3.eth.Contract(
  JSON.parse(ElectionFactory.interface),
  "0xC9cC40A3bcefe176F2Fba4090cf8215bDc242EdC"
);

export default instance;
