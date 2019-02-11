const chalk = require( 'chalk' );
const clear = require( 'clear' );
const figlet = require( 'figlet' );
const inquirer = require( 'inquirer' )

const pull_backup_ui = require( './ui_modules/pull_backup_ui.js' ) 

clear();
console.log(
        chalk.green(
                figlet.textSync( 'dotfile-installer-kit', { horizontalLayout: 'full' } )
        )
)

inquirer.prompt(
        [
                {
                        type: 'list',
                        name: 'feature',
                        message: 'Select a function',
                        choices: [ 
                                {
                                        name: 'Pull backup',
                                },
                                {
                                        name: 'Restore backup',
                                },
                                {
                                        name: 'Pull dotfile',
                                },
                                {
                                        name: 'Restore dotfile',
                                },
                                {
                                        name: 'Run installation guide',
                                },
                                {
                                        name: 'Exit',
                                },
                        ],
                                        
                }
        ]  
).then( answers => {
        switch( answers.feature ){
                case 'Pull backup':
                        pull_backup_ui.run();
                        break;
        }
} )
