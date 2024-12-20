# Project Name
WEB Test Template with [Robot framework](https://robotframework.org/). The web page used in this project is [QualityToolsAutomation](https://qualitytoolsautomation.com.br/).

## Dependencies
- [RobotFramework](https://github.com/robotframework/robotframework/)
- [robotframework-seleniumlibrary](https://github.com/robotframework/SeleniumLibrary/)

## Installation
To create a virtual environment, activate the virtual environment and install the project dependencies, run the following commands:

```sh
python3 -m venv web-template
source web-template/bin/activate
pip3 install -r requirements.txt
```

## Execution
To run the tests, run the following commands:

```sh
robot --outputdir report tests
```

## Plugins
- [Robot Framework Language Server](https://marketplace.visualstudio.com/items?itemName=robocorp.robotframework-lsp)
