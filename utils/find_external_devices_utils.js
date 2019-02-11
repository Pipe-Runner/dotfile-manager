const shell = require('shelljs');

module.exports = {
	list_devices: () =>
		new Promise((resolve, reject) => {
			let devices = [];
			shell.exec('lsblk -nJ', { silent: true }, (code, stdout, stderr) => {
				const { blockdevices } = JSON.parse(stdout);
				const rawDevices = blockdevices.filter((item, index) => {
					return item.type === 'disk';
                                });
                                rawDevices.forEach(item => {
                                        if( item.children.length === 1 && item.children[0].mountpoint !== null ){
                                                const { size, mountpoint } = item.children[0];
                                                devices = [ ...devices, { size, mountpoint } ];
                                        }
                                });
				resolve(devices);
			});
		}),
};
