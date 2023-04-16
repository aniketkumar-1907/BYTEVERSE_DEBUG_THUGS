import Web3 from "web3";
 
let web3;
 
if (typeof window !== "undefined" && typeof window.web3 !== "undefined") {
  web3 = new Web3(window.ethereum);
} else {
  const provider = new Web3.providers.HttpProvider(
    "https://goerli.infura.io/v3/173bc0954c4f4c498bcbc8f8523858f3"
  );
  web3 = new Web3(provider);
}
 
export default web3;