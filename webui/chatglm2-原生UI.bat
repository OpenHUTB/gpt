python\python.exe -m pip config set global.index-url https://mirrors.cloud.tencent.com/pypi/simple
python\python.exe -m pip config set global.trusted-host mirrors.cloud.tencent.com
python\python.exe -m pip install mdtex2html
python\python.exe chatglm2-webui.py
pause