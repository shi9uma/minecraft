import asyncio
import argparse
from aiomcrcon import Client

ap = argparse.ArgumentParser()
ap.add_argument('-b', '--bot', default=False, action='store_true', help='启用 bot 访问')
ap.add_argument('foobar', help='必须指定要检索的对象，自动通配符检索')
args = vars(ap.parse_args())


async def main(foobar = args['foobar'], bot = args['bot']):
    password = r"dMvJDx3IkmYEXSdYxoUCkKQqRlmEUfhs"

    client = Client("127.0.0.1", 9461, password)
    await client.connect()

    response = await client.send_cmd(foobar)
    print(response)
    await client.close()

if __name__ == "__main__":
    asyncio.run(main())
