// to make Git not to track this file anymore
// git update-index --assume-unchanged generate.js
// recover
// git update-index --no-assume-unchanged generate.js

const superagent = require("superagent");
const cheerio = require("cheerio");
const fs = require("fs");
const eventproxy = require('eventproxy');

let CONFIG = {
  // cookie from -> https://leetcode.com/api/problems/algorithms/
  cookie: '',
  baseLocalSrc: '.',
  markdownFileSrc: 'info.md',
  baseNetSrc: 'https://github.com/wild-flame/leetcode-solutions/blob/master/,
  api: 'https://leetcode.com/api/problems/algorithms/',
  ua: 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36'
};

function makeMarkdownFile(data) {
  let {problems, num_total, num_solved, num_locked} = data;

  // use ES6 template string
  let tpl =
`# Leetcode Solutions with JavaScript
Update time: ${new Date}
I have solved **${num_solved} / ${num_total}** problems while **${num_locked}** problems are still locked.
(Notes: :blue_book: means you need to buy a book from Leetcode)
| # | Title | Source Code | Explanation | Difficulty |
|:---:|:---:|:---:|:---:|:---:|
`
  // sort by the problemId desc
  problems.sort((a, b) => b.problemId - a.problemId);

  problems.forEach((item) => {
    let {problemId, title, url, languages, sourceCodes, explanation, difficulty, isSolved, isLocked} = item;
    tpl += `| ${problemId} | [${title}](${url}) `;

    if (isLocked)
      tpl += ':blue_book: ';

    if (isSolved) {
        tpl += '| '
      languages.forEach((language, index) => {
          tpl += ` [${language}](${sourceCodes[index]}) `;
      })
    } else {
      tpl += '| ';
    }

    if (explanation)
      tpl += `| [Explanation](${explanation}) `;
    else {
      tpl += '| ';
    }

    tpl += `| ${difficulty} |`;
    tpl += '\n';
  })

  return new Promise((resolve, reject) => {
    fs.writeFile(CONFIG.markdownFileSrc, tpl, () => {
      resolve("saved!");
    });
  });
}


function dealWithFile(data) {
    return new Promise((resolve, reject) => {
        let ep = new eventproxy();
        let baseNetSrc = CONFIG.baseNetSrc;

        console.log(data.num_solved)

        data.problems.forEach((p) => {

            if (p.isSolved) {
                const languages = ['ruby','javascript','go']
                p.languages = []
                p.sourceCodes = []

                languages.forEach((language) => {
                    let fileSrc = CONFIG.baseLocalSrc + '/' + language + "/" + "Q" +p.problemId;
                    let files = null
                    try {
                        files = fs.readdirSync(fileSrc)
                    } catch(e) {
                        // console.log("no file")
                        files = null
                    } 
                    const regstr = new RegExp("Q" + p.problemId + "\\..{2}\$")
                    if (files != null) {
                        files.forEach((fileName) => {
                            if (fileName.match(regstr) != null) {
                                p.languages.push(language)
                                p.sourceCodes.push(encodeURI(baseNetSrc +  '/' + fileName));
                            }
                        });
                    }
                });

                resolve(data);
            }
        });
    });
}

function makeRequest() {
  return new Promise((resolve, reject) => {
    console.log(CONFIG.cookie)
    superagent
      .get(CONFIG.api)
      .set("Cookie", CONFIG.cookie)  // login in
      .set("User-Agent", CONFIG.ua)
      .withCredentials()
      .end((err, res) => {
        let {stat_status_pairs, num_total, num_solved} = JSON.parse(res.text);
        let num_locked = 0;
        let problems = stat_status_pairs.map((item) => {
          let obj = {
            isSolved: item.status === "ac",
            problemId: item.stat.question_id,
            title: item.stat.question__title,
            url: "https://leetcode.com/problems/" + item.stat.question__title_slug + '/',
            isLocked: item.paid_only === true,
            difficulty: ['', 'Easy', 'Medium', 'Hard'][item.difficulty.level],
          };

          obj.isLocked && num_locked++;
          return obj;
        });

        resolve({problems, num_total, num_solved, num_locked});
      });
  });
}

// Promise
makeRequest().then((data) => {
  return dealWithFile(data);
}).then((data) => {
  return makeMarkdownFile(data);
}).then((msg) => {
  console.log(msg);
});

