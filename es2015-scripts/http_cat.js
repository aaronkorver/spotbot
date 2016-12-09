// Description:
//   Show cute pictures of cats for HTTP status codes
//
// Dependencies:
//   None
//
// Configuration:
//   None
//
// Commands:
//   http status code ###
//   http error code ###
//   http code ###
//
//   Displays a picture of a cute cat associated with the http status code
//   or a 404 cat if the site doesn't support it.
//
//   For more information, see https://http.cat/
//
// Author:
//   Stephen.Radachy

let threshold = 1.0;

export default (robot) => {
    robot.hear(/http(?:\sstatus|\serror)? code ([0-9]{3})/i, (message) => {
        let random = Math.random();
        let roomThreshold = robot.thresholdStorage.getThreshold(message, "http_cat", threshold);

        if (random < roomThreshold){
            message.send(`https://http.cat/${message.match[1]}.jpg`);
        }
    });
};
