# -*- coding: utf-8 -*-
"""
@author:XuMing(xuming624@qq.com)
@description:
"""
import argparse
import sys

from codeassist import WizardCoder

sys.path.append('..')



# 执行训练：
# --do_train --model_name C:\Buffer\gpt\gpt-main\webui\models\WizardCoder-15B-V1.0 --train_file C:\Buffer\gpt\gpt-main\webui\data\scenario_generation.json --valid_file C:\Buffer\gpt\gpt-main\webui\data\scenario_generation.json
# 一秒钟更新一次GPU信息：nvidia-smi -l 1

# 不支持执行量化模型（TheBloke/WizardCoder-15B-1.0-GPTQ）的预测

# 执行推断：
# --do_predict --model_name C:\Buffer\gpt\gpt-main\webui\models\WizardCoder-15B-V1.0 --prompt  创建一个驾驶场景对象scenario，并在场景中创建了一个车辆对象v1。  --output_dir C:\\Buffer\\gpt\\gpt-main\\webui\\outputs-finetuned-wizardcoder\\
# 需要将某次模型训练的检查点文件复制到./outputs-finetuned-wizardcoder/目录下，否则出现
# Can't find 'adapter_config.json' at './outputs-finetuned-wizardcoder/'

# 加载的本地模型文件位于：
# C:\Users\Administrator\.cache\huggingface\hub\models--WizardLM--WizardCoder-15B-V1.0\snapshots\926ca1b215c4631bc5f8c3e47173381452c23e5c

# 必须指定绝对路径，否则报错：FileNotFoundError: Unable to find 'D:\work\workspace\gpt\webui\data/code_alpaca_20k_50.jsonl' at D:\work\workspace\gpt\webui

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--model_name", type=str, default="WizardLM/WizardCoder-15B-V1.0",
                        help="Model arch, gpt2, gpt2-medium, distilgpt2 or WizardLM/WizardCoder-15B-V1.0")
    parser.add_argument("--train_file", type=str, default="data/code_alpaca_20k_50.jsonl", help="Train file path")
    parser.add_argument("--valid_file", type=str, default="data/code_alpaca_20k_50.jsonl", help="Valid file path")
    parser.add_argument("--do_train", action="store_true", help="Whether to run training.")
    parser.add_argument("--do_predict", action="store_true", help="Whether to run predict.")
    parser.add_argument("--output_dir", type=str, default="./outputs-finetuned-wizardcoder/", help="output dir")
    parser.add_argument("--num_epochs", type=int, default=5, help="Num of training epochs")
    parser.add_argument("--batch_size", type=int, default=2, help="Batch size")

    parser.add_argument("--prompt", type=str, default="写个matlab的冒泡排序算法", help="generate code prompt")

    args = parser.parse_args()
    print(args)

    if args.do_train:
        model = WizardCoder(model_name_or_path=args.model_name)
        model.train_model(
            args.train_file,
            args.output_dir,
            eval_file=args.valid_file,
            num_epochs=args.num_epochs,
            batch_size=args.batch_size
        )
        print(f"model saved to {args.output_dir}")

    if args.do_predict:
        model = WizardCoder(model_name_or_path=args.model_name, peft_name=args.output_dir)

        outputs = model.generate(args.prompt)
        print(outputs[0])

        # prompts = [
        #     "def load_csv_file(file_path):",
        #     "write a C++ code to sum 1 to 12.",
        #     "写个python的快排算法",
        #     "生成4到400之间的随机数，用java和python写代码",
        # ]
        # for prompt in prompts:
        #     outputs = model.generate(prompt)
        #     print("Input :", prompt)
        #     print("Output:", outputs[0])
        #     print("=" * 20)
