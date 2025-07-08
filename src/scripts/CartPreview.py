from robot.libraries.BuiltIn import BuiltIn

# info("run")


class CartPreview(object):
    items = "//li[@class='list-item']"

    def __init__(self):
        # console("init")
        self.sel = BuiltIn().get_library_instance('SeleniumLibrary')

    def get_items_count(self):
        return int(self.sel.get_element_count(self.items))

    def get_total_price(self):
        total_locator = "//div[contains(@class, 'pay-container') and contains(@class, 'pay')]"
        total_text = self.sel.get_text(total_locator)
        return float(total_text.replace('$', ''))
