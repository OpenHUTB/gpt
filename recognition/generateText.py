from paddlespeech.cli.asr.infer import ASRExecutor
import sys
import os
import importlib
importlib.reload(sys)

curPath = os.path.abspath(os.path.dirname(__file__))
rootPath = os.path.split(curPath)[0]
sys.path.append(rootPath)

#语音识别
asr = ASRExecutor()
result = asr(audio_file=sys.argv[1],force_yes=True)
print(result)

