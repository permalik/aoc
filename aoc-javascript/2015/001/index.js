import fs from "fs";

function one() {
    console.log("Starting one..");
    return new Promise((res, rej) => {
        fs.readFile("/home/parallels/Docs/Git/adventofcode/aoc/aoc-javascript/aoc/2015/001/input.txt", "utf8", (err, contents) => {
            if (err) {
                rej(err);
                return;
            }

            let chars = contents.split("");

            let floor = 0;
            for (const char of chars) {
                if (char === "(") {
                    floor++;
                } else if (char === ")") {
                    floor--;
                }
            }
            console.log(`Santa is on floor ${floor}\n`);
            res();
        })
    })
}

function two() {
    console.log("Starting two..");
    return new Promise((res, rej) => {
        fs.readFile("/home/parallels/Docs/Git/adventofcode/aoc/aoc-javascript/aoc/2015/001/input.txt", "utf8", (err, contents) => {
            if (err) {
                rej(err);
                return;
            }

            let chars = contents.split("");

            let floor = 0;
            let index = 0;
            for (const char of chars) {
                if (floor === -1) {
                    console.log(`Santa is on basement floor ${floor} at position ${index}`);
                    break;
                }
                if (char === "(") {
                    floor++;
                    index++;
                } else if (char === ")") {
                    floor--;
                    index++;
                }
            }
            res();
        })
    })
}

async function main() {
    await one();
    await two();
}

main().catch(console.error)
