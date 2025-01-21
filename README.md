# Project Name
La calle group challenge [Robot framework](https://robotframework.org/). The web page used in this project is [saucedemo](https://www.saucedemo.com/).
In the project I used [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) and [POM](https://martinfowler.com/bliki/PageObject.html).

## Dependencies
- [RobotFramework](https://github.com/robotframework/robotframework/)
- [Browser Library](https://marketsquare.github.io/robotframework-browser/Browser.html)

## Installation
To create a virtual environment, activate the virtual environment and install the project dependencies, run the following commands:

```sh
python3 -m venv template-web-env
source template-web-env/bin/activate
pip3 install -r requirements.txt
```

To download all browsers supported by Playwright, run the following command:
```sh
rfbrowser init
```

## Execution
To run the tests, run the following commands:

```sh
robot --outputdir reports tests
```

```sh
robot --outputdir reports -v BROWSER:webkit  tests
```

```sh
robot --outputdir reports -v BROWSER:firefox  -i purchase_flow  tests
```

## Plugins
- [Robot Framework Language Server](https://marketplace.visualstudio.com/items?itemName=robocorp.robotframework-lsp)

## Reports
Report is saved in reports folder on root path