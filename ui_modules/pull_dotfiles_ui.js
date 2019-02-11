const clear = require('clear');
const chalk = require('chalk');
const inquirer = require('inquirer');
const CLI = require('clui');
const spinner = CLI.Spinner;

const find_external_devices_utils = require('../utils/find_external_devices_utils');

module.exports = {
	run: async () => {
		inquirer
			.prompt([
				{
					type: 'checkbox',
					name: 'dotFileList',
					message: 'Select the dotfile catagories to copy',
					choices: [
						{
							name: 'I3WM ( .config/i3 .config/i3blocks .i3scripts )',
						},
						{
							name: 'Shell ( .bashrc .zshrc )',
						},
						{
							name: 'Vim ( .vim .vimrc )',
						},
						{
							name: 'Gitconfig ( .gitconfig )',
						},
						{
							name: 'Fonts ( .fonts )',
						},
						{
							name: 'Rofi ( ./config/rofi )',
						},
						{
							name: 'Vis ( ./config/vis )'
						}
					],
					validate: answer => {
						if (answer.length < 1) {
							return 'You must choose at least one option';
						}
						return true;
					},
				},
			])
			.then(answers => {
				const { dotFileList } = answers;
			});
	},
};
