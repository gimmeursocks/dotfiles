from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import requests

requests.packages.urllib3.disable_warnings()
data = {
    'username' : 'admin',
    'userpassword' : '09045312'
}

chrome_options = Options()
chrome_options.add_argument('--ignore-certificate-errors')

driver = webdriver.Chrome(options=chrome_options)

def login():
    driver.get("https://192.168.1.1/login")

    username = WebDriverWait(driver, 10).until(
        EC.presence_of_element_located((By.ID, "username"))
    )
    username.send_keys(data['username'])

    userpassword = driver.find_element(By.ID, 'userpassword')
    userpassword.send_keys(data['userpassword'])

    button_login = driver.find_element(By.ID, 'loginBtn')
    button_login.click()

def reboot_router():  
    button_reboot = WebDriverWait(driver, 10).until(
        EC.element_to_be_clickable((By.ID, "navbar_reboot"))
    )
    button_reboot.click()

    button_confirm = driver.find_elements(By.CLASS_NAME, 'normalbtn.active')[1]
    button_confirm.click()

    driver.quit()

def main():
    login()
    reboot_router()

if __name__ == '__main__':
    main()