/**
 * Created by liu on 17-3-8.
 */
const util = require("util"),
    latex = require("gammalatex"),
    fs = require("fs");

console.log('Reading Tex Files ...');
let string = fs.readFileSync('lecture/lecture.tex', 'utf-8');

console.log('Compiling into pdf ...');

latex.parse(string, function (err, readStream) {
    if (err) throw err;
    //console.log(readStream);
    const writeStream = fs.createWriteStream("lecture.pdf");
    readStream.pipe(writeStream);
    console.log('pdf file generated.');
});
