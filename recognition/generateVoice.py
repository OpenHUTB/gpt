from paddlespeech.cli.tts.infer import TTSExecutor
import sys
import os
import importlib
importlib.reload(sys)

curPath = os.path.abspath(os.path.dirname(__file__))
rootPath = os.path.split(curPath)[0]
sys.path.append(rootPath)

#语音合成
tts = TTSExecutor()
tts(text=sys.argv[1], output=sys.argv[2])