
const BIATimeLock = artifacts.require("BIATimeLock");

module.exports = function (deployer) {
  deployer.deploy(
      BIATimeLock, 
      "0x5BB72DCCDc5489F22CB8ED1cddc113e12e8FcdDa",
      "0xD4551a4800dC9E5752ADC872d16984aC760e6d70");

 };