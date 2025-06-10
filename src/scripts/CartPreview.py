from robot.libraries.BuiltIn import BuiltIn
from robot.api.logger import info, debug, trace, console
from selenium.webdriver.common.by import By


class CartPreview(object):
    ROBOT_LIBRARY_SCOPE = 'SUITE'
    items = "//*[@id='app']/div[2]/div[1]/ul/li"
    item_xpath = "//*[@id='app']/div[2]/div[1]/ul/li[{}]/div[1]/span[1]"

    def __init__(self):
        self.sel = BuiltIn().get_library_instance('SeleniumLibrary')

    def get_items_count(self):
        return str(self.sel.get_element_count(self.items))

    def get_pay_coffe_list(self):
        l = []
        for i in range(1, len(self.sel.get_webelements(self.items))+1):
            element = self.sel.get_webelement(self.item_xpath.format(i))
            l.append(element.get_attribute('innerHTML'))
        return l
