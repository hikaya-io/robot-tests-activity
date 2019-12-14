""" Admin Cleaning Script
    Defines keyword that are used for data cleaning purposes
    through Django Activity Admin.

"""
from selenium.webdriver import Firefox
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.common.keys import Keys
import Credentials as cred

# Data
admin_url = 'https://activity-dev.hikaya.app/admin'
username = cred.ADMIN_USERNAME
password = cred.ADMIN_PASSWORD


def get_browser():
    opts = Options()
    opts.set_headless()
    assert opts.headless
    browser = Firefox(options=opts)
    browser.implicitly_wait(20)
    return browser


def login_ACT_administration(browser):
    browser.get(admin_url)
    tb_username = browser.find_element_by_id('id_username')
    tb_passowrd = browser.find_element_by_id('id_password')
    btn_login = browser.find_element_by_xpath('//input[@value="Log in"]')

    tb_username.send_keys(username)
    tb_passowrd.send_keys(password)
    btn_login.click()


def admin_delete_item(item_name, item):
    browser = get_browser()

    login_ACT_administration(browser)

    hl_users = browser.find_element_by_xpath('//a[./text()="' + item + 's"]')
    hl_users.click()

    hl_delete_user = browser.find_element_by_xpath(
        '//a[./text()="' + item_name + '"]')
    hl_delete_user.click()

    btn_delete = browser.find_element_by_xpath('//a[@class="deletelink"]')
    btn_delete.click()

    btn_confirm_delete = browser.find_element_by_xpath(
        '//input[@value="Yes, I\'m sure"]')
    btn_confirm_delete.click()

    lbl_success = browser.find_element_by_xpath(
        '//ul[@class="messagelist"]/li')
    txt_success = lbl_success.text

    browser.quit()

    return(txt_success == 'The ' + item.lower() + ' "' +
           item_name + '" was deleted successfully.')
