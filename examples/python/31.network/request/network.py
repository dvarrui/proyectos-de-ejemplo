import requests
import time
import user_agent
from selenium.webdriver import Firefox
from selenium.webdriver.firefox.options import Options
import pdb

class Network:
    print("Loading Network class...")
    timestamp = time.time()

    @staticmethod
    def get_user_agent_header():
        return {'User-Agent': user_agent.generate_user_agent()}

    @staticmethod
    def make_request(
            url,
            method='get',
            include_user_agent=True,
            timeout=20,
            num_retries=3,
            req_delay=3,
            ):
        print(f'Requesting {url}')

        req = getattr(requests, method)
        retry = 0
        while True:
            try:
                if include_user_agent:
                    headers = Network.get_user_agent_header()
                else:
                    headers = {}

                response = req(url, headers=headers, timeout=timeout)
            except requests.exceptions.ReadTimeout as err:
                print(err)
            else:
                print(f'Response status code: {response.status_code}')
                if response.status_code // 100 == 2:  # 2XX
                    return response
            print(f'Request delay: {req_delay} seconds')
            time.sleep(req_delay)
            if retry >= num_retries:
                break
            retry += 1
            print(f'Network retry {retry}')

    @staticmethod
    def read_content(url):
        time1 = 5
        time2 = 8
        time.sleep(time1)

        try:
            content = str(Network.make_request(url).content.decode("utf-8"))
            return content
        except Exception as TooManyRedirects:
            print('Segundo intento...')
            time.sleep(time2)

        try:
            content = str(Network.make_request(url).content.decode("utf-8"))
        except Exception as ex:
            print(f'URL: {url}')
            print(f'Exception: {ex}')
            content = ""
        return content

    @staticmethod
    def setup_webdriver():
        options = Options()
        if settings.get("network")["selenium_headless"]:
            options.add_argument('-headless')
        return Firefox(options=options)
