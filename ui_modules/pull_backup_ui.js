const clear = require('clear');
const chalk = require('chalk');
const inquirer = require('inquirer');
const CLI = require('clui');
const spinner = CLI.Spinner;

const find_external_devices_utils = require('../utils/find_external_devices_utils');

module.exports = {
	run: async () => {
		let dirs = [];
		let destination = '';
		let devices = await find_external_devices_utils.list_devices();

		if (devices.length === 0) {
			console.log(chalk.red('No mounted external device found! Please try again.'));
			process.exit();
		}

		inquirer
			.prompt([
				{
					type: 'checkbox',
					name: 'directoryList',
					message: 'Select the folders to copy',
					choices: [
						{
							name: 'Downloads',
						},
						{
							name: 'Projects',
						},
						{
							name: 'Music',
						},
						{
							name: 'Videos',
						},
						{
							name: 'Pictures',
						},
						{
							name: 'Desktop',
						},
					],
					validate: answer => {
						if (answer.length < 1) {
							return 'You must choose at least one option';
						}
						return true;
					},
				},
				{
					type: 'list',
					name: 'destination',
					message: 'Choose an external drive for backup',
					choices: [
						...devices.map(item => {
							const { mountpoint, size } = item;
							return {
								name: `Mounted at: ${mountpoint} ( Size: ${size} )`,
							};
						}),
					],
				},
				{
					type: 'input',
					name: 'directoryName',
					default: 'backup',
					message: 'Name of the backup directory',
					validate: (answer) => {
						return answer ? true: 'Please enter a valid name';
					},
				},
			])
			.then(answers => {
				const { destination, directoryList, directoryName } = answers;
			});
	},
};
