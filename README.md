# Installation using virtualenv
If you already have [Python](https://www.python.org) with [pip](http://pip-installer.org) installed,
you can simply run below command to Install virtualenv

```bash
$ pip install virtualenv
```

## Create Virtualenv
```bash
$ virtualenv --no-site-packages venv
```
* use no site packages to prevent virtualenv from seeing your global packages
* `. venv/bin/activate` allows us to just use pip from command line by adding to the path rather then full path

## Activate Virtualenv
```bash
$ source venv/bin/activate
```

## Install Requirements
```bash
$ pip install -r requirements.txt
```

## Browser Dirvers
In order to run the test you will need a driver to interface with the chosen browser.
Click [here](https://selenium.dev/selenium/docs/api/py/index.html#drivers) for more drivers details.

## Test Execution
1. **`cd`** into the root directory of the ATCs; **`Activity-ATC`**.
2. **_Execution step_**: **`robot -T -d Results Tests`**
3. When it's done, you'll see the report (timestamped) in the `Results` directory; double-click the **`report-`_YYYYMMDD_`-`_HHMMSS_`.html`** (where **_YYYYMMDD_** is the year, month, date and **_HHMMSS_** is the hour, minute, and seconds - e.g, **`report-20191214-124528.html`**).

### Quick Explanation execution options used
* **`-T`** - Short for **`--timestampoutputs`**. Creates reports, logs, etc. with the current timestamp so we don't overwrite existing ones upon execution.
* **`-d`** - Short for **`--outputdir`**. Tells the framework where to create the report files.

Note to maintainers and developers: read the code documenation sections and also document new/updated code

### Locator Variables Naming Convention
    For readerbilty and smooth collaboration the following naming convention should be follwed when defining locators variables:

        `[UI/CONTROLER TYPE ABBR]_[UI ELEMENT FUNCTINALITY]`

    Control Types abbreviations and their corresponding CamelCased control names
    +-----------------------+-----------+-------------------------+
    |   UI/CONTROLER TYPE   |   ABBR    |       Example           |
    +-----------------------+-----------+-------------------------+
    |   Button              |   btn     |   btn_login             |
    |   CheckBox            |   cb      |                         |
    |   CheckBoxList        |   cbl     |                         |
    |   DropDownList        |   dd      |   dd_template_tags      |
    |   Hyperlink           |   hl      |   hl_edit_profile       |
    |   Image               |   img     |   img_login_logo        |
    |   ImageButton         |   ib      |                         |
    |   Label               |   lbl     |   lbl_login_title       |
    |   LinkButton          |   lbtn    |                         |
    |   ListBox             |   lb      |                         |
    |   ListBoxItem         |   lbi     |                         |
    |   Modal               |   mdl     |   mdl_invite            |
    |   Panel               |   pnl     |   pnl_sidebar           |
    |   RadioButton         |   rb      |                         |
    |   RadioButtonList     |   rbl     |                         |
    |   Text                |   txt     |   txt_login_title       |
    |   Textbox             |   tb      |   tb_login_email        |
    +-----------------------+-----------+-------------------------+
    