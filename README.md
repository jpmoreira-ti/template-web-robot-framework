# Project Name
WEB test template with [Robot framework](https://robotframework.org/). The WEB Page used in this project is from [QualityToolsAutomation](https://qualitytoolsautomation.com.br/).

## Dependencies
- [RobotFramework](https://github.com/robotframework/robotframework/)
- [robotframework-seleniumlibrary](https://github.com/robotframework/SeleniumLibrary/)

## Installation
To create a virtual environment and install the project dependencies, run the following commands:

```sh
python3 -m venv web-template
source web-template/bin/activate
pip3 install -r requirements.txt
```

## Execution
To run the tests, first activate the virtual environment and then execute the tests from the web-template folder:

```sh
robot --outputdir output tests
```

## Plugins
- [Robot Framework Language Server](https://marketplace.visualstudio.com/items?itemName=robocorp.robotframework-lsp)
