/**
 * Created by liu on 17-3-23.
 */
const QRCode = require('qrcode');

QRCode.save(
    './qrcode.png',
    'https://github.com/SJTU-UMJI-Tech/LaTeX/blob/master/lecture.pdf',
    () => {
        console.log('success');
    }
);

