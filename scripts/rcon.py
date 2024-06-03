import asyncio
import argparse
from aiomcrcon import Client

ap = argparse.ArgumentParser()
ap.add_argument('-p', '--port', type=int, default=9461, help='指定端口，默认端口为 9461，可选端口为 9463 9465 9467 9469')
ap.add_argument('foobar', help='必须指定要检索的对象，自动通配符检索')
args = vars(ap.parse_args())

def color(text: str = '', color: int = 2) -> str:
    '''
    返回对应的控制台 ANSI 颜色
    '''
    color_table = {
        0: '{}',                    # 无色
        1: '\033[1;30m{}\033[0m',   # 黑色加粗
        2: '\033[1;31m{}\033[0m',   # 红色加粗
        3: '\033[1;32m{}\033[0m',   # 绿色加粗
        4: '\033[1;33m{}\033[0m',   # 黄色加粗
        5: '\033[1;34m{}\033[0m',   # 蓝色加粗
        6: '\033[1;35m{}\033[0m',   # 紫色加粗
        7: '\033[1;36m{}\033[0m',   # 青色加粗
        8: '\033[1;37m{}\033[0m',   # 白色加粗
    }
    return color_table[color].format(text)

async def main(foobar = args['foobar'], port = args['port']):
    password = r"dMvJDx3IkmYEXSdYxoUCkKQqRlmEUfhs"
    try:
        client = Client("127.0.0.1", port, password)    # 9461 9463 9465 9467 9469
        await client.connect()

        response = await client.send_cmd(foobar)
        await client.close()
        return str(response[0].strip())
    except:
        return f"port: {port} doesn't work."
        

if __name__ == "__main__":
    if args['foobar'] == 'list':
        ports = {
            '9460': '9461',
            '9462': '9463',
            '9464': '9465',
            '9566': '9467',
            '9468': '9469'
        }
        for port in ports.items():
            print(f"game port: {color(port[0], 3)}" + 
                  f" - rcon port: {color(port[1], 3)}" + 
                  f" - command: {color(args['foobar'], 3)};\n" + 
                  f"{color(asyncio.run(main()), 4)}\n" + 
                  f"-" * 40)
    else:
        print(f"game port: {color(str(int(args['port']) - 1), 3)}" + 
                f" - rcon port: {color(args['port'], 3)}" + 
                f" - command: {color(args['foobar'], 3)};\n" + 
                f"{color(asyncio.run(main()), 4)}\n" + 
                f"-" * 40)
