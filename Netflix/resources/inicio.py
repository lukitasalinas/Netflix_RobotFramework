from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time

def main() -> int:
    option = webdriver.ChromeOptions()
    #option.add_argument("start-maximized")
    driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()),options=option)
    driver.implicitly_wait(30) # seconds
    driver.get('https://www.netflix.com')
    time.sleep(5)
    #Maximizar la ventana del navegador
    driver.maximize_window()
    
    title = driver.title
    url = driver.current_url
    print("titulo de la pagina: "+title)
    print("url de la pagina: "+url)
    time.sleep(5)

    driver.quit()

if __name__ == '__main__':
    main()

