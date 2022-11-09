const chromeLaucher = require('chrome-launcher')

async function main(){
	const chrome = await chromeLaucher.launch({
		chromeFlags: [
			'--window-size=1200,800',
			'--user-data-dir=/tmp/chrome-testing',
			'--auto-open-devtools-for-tabs'
		]
	})
}

main()