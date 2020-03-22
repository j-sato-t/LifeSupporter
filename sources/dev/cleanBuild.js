var fs = require("fs-extra");

// 引数チェック
var arg = process.argv[2];
if(arg == null)
{
	console.log("no arg!");
	return;
}

// 削除
fs.remove(arg, (err) => {
	if(err) throw err;
	else console.log("deleted dir");
	return;
});