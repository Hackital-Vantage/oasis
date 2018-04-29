const express = require('express');

// set up express app
const app = express();

app.use(express.static('public'));



app.listen(process.env.port || 4000, function(){
  console.log("now listen");
});
