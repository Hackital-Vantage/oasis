var ipfsAPI = require('ipfs-api');
var Buffer = require('buffer/').Buffer;
var data = new Buffer("does this work? --Alan", "utf-8")
var ipfs = ipfsAPI('ipfs.infura.io', '5001', {protocol: 'https'});

console.log("connected to the ipfs daemon");

const files = [
  {
    path: './ioi.txt',
    //content: data
  }
]

ipfs.util.addFromFs ("./key.mp4", function (err, files) {
  // 'files' will be an array of objects containing paths and the multihashes of the files added
        if(err){
         return console.log(err);
        }
        // ipfs.files.cat("QmbdQuGbRFZdeqmK3PJyLV3m4p2KDELKRS4GfaXyehz672", (err, res) =>{
        //   console.log(err, res.toString());
        // })
        console.log(files);
});



console.log('program ended');
