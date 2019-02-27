var crypto_rwa = artifacts.require("./crypto_rwa.sol");

module.exports = function(deployer) {
 deployer.deploy(crypto_rwa, 10000000).then(function() {
    var tokenPrice = 10000000000000000;
    
  });
};

















