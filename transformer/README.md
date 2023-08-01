# GPT 概述

## 软件要求

### BERT and FinBERT
- MATLAB R2021a或以上
- 深度学习工具箱
- 文本分析工具箱

### GPT
MATLAB R2020a或以上
深度学习工具箱

## Getting Started
Download or [clone](https://www.mathworks.com/help/matlab/matlab_prog/use-source-control-with-projects.html#mw_4cc18625-9e78-4586-9cc4-66e191ae1c2c) this repository to your machine and open it in MATLAB. 

## Functions
### bert
`mdl = bert` loads a pretrained BERT transformer model and if necessary, downloads the model weights. The output `mdl` is structure with fields `Tokenizer` and `Parameters` that contain the BERT tokenizer and the model parameters, respectively.

`mdl = bert("Model",modelName)` specifies which BERT model variant to use:
- `"base"` (default) - A 12 layer model with hidden size 768.
- `"multilingual-cased"` - A 12 layer model with hidden size 768. The tokenizer is case-sensitive. This model was trained on multi-lingual data.
- `"medium"` - An 8 layer model with hidden size 512. 
- `"small"` - A 4 layer model with hidden size 512.
- `"mini"` - A 4 layer model with hidden size 256.
- `"tiny"` - A 2 layer model with hidden size 128.

### bert.model
`Z = bert.model(X,parameters)` performs inference with a BERT model on the input `1`-by-`numInputTokens`-by-`numObservations` array of encoded tokens with the specified parameters. The output `Z` is an array of size (`NumHeads*HeadSize`)-by-`numInputTokens`-by-`numObservations`. The element `Z(:,i,j)` corresponds to the BERT embedding of input token `X(1,i,j)`.

`Z = bert.model(X,parameters,Name,Value)` specifies additional options using one or more name-value pairs:
- `"PaddingCode"` - Positive integer corresponding to the padding token. The default is `1`.
- `"InputMask"` - Mask indicating which elements to include for computation, specified as a logical array the same size as `X` or as an empty array. The mask must be false at indices positions corresponds to padding, and true elsewhere. If the mask is `[]`, then the function determines padding according to the `PaddingCode` name-value pair. The default is `[]`.
- `"DropoutProb"` - Probability of dropout for the output activation. The default is `0`.
- `"AttentionDropoutProb"` - Probability of dropout used in the attention layer. The default is `0`.
- `"Outputs"` - Indices of the layers to return outputs from, specified as a vector of positive integers, or `"last"`. If `"Outputs"` is `"last"`, then the function returns outputs from the final encoder layer only. The default is `"last"`.
- `"SeparatorCode"` - Separator token specified as a positive integer. The default is `103`.

### finbert
`mdl = finbert` loads a pretrained BERT transformer model for sentiment analysis of financial text. The output `mdl` is structure with fields `Tokenizer` and `Parameters` that contain the BERT tokenizer and the model parameters, respectively.

`mdl = finbert("Model",modelName)` specifies which FinBERT model variant to use:
- `"sentiment-model"` (default) - The fine-tuned sentiment classifier model.
- `"language-model"` - The FinBERT pretrained language model, which uses a BERT-Base architecture.

### finbert.sentimentModel
`sentiment = finbert.sentimentModel(X,parameters)` classifies the sentiment of the input `1`-by-`numInputTokens`-by-`numObservations` array of encoded tokens with the specified parameters. The output sentiment is a categorical array with categories `"positive"`, `"neutral"`, or `"negative"`.

`[sentiment, scores] = finbert.sentimentModel(X,parameters)` also returns the corresponding sentiment scores in the range `[-1 1]`.

### gpt2
`mdl = gpt2` loads a pretrained GPT-2 transformer model and if necessary, downloads the model weights.

### generateSummary
`summary = generateSummary(mdl,text)` generates a summary of the string or `char` array `text` using the transformer model `mdl`. The output summary is a char array.

`summary = generateSummary(mdl,text,Name,Value)` specifies additional options using one or more name-value pairs.

* `"MaxSummaryLength"` - The maximum number of tokens in the generated summary. The default is 50.
* `"TopK"` - The number of tokens to sample from when generating the summary. The default is 2.
* `"Temperature"` - Temperature applied to the GPT-2 output probability distribution. The default is 1.
* `"StopCharacter"` - Character to indicate that the summary is complete. The default is `"."`.

## Example: Classify Text Data Using BERT
The simplest use of a pretrained BERT model is to use it as a feature extractor. In particular, you can use the BERT model to convert documents to feature vectors which you can then use as inputs to train a deep learning classification network.

The example [`ClassifyTextDataUsingBERT.m`](./ClassifyTextDataUsingBERT.m) shows how to use a pretrained BERT model to classify failure events given a data set of factory reports.

## Example: Fine-Tune Pretrained BERT Model
To get the most out of a pretrained BERT model, you can retrain and fine tune the BERT parameters weights for your task.

The example [`FineTuneBERT.m`](./FineTuneBERT.m) shows how to fine-tune a pretrained BERT model to classify failure events given a data set of factory reports.

## Example: Analyze Sentiment with FinBERT
FinBERT is a sentiment analysis model trained on financial text data and fine-tuned for sentiment analysis.

The example [`SentimentAnalysisWithFinBERT.m`](./SentimentAnalysisWithFinBERT.m) shows how to classify the sentiment of financial news reports using a pretrained FinBERT model.

## Example: Predict Masked Tokens Using BERT and FinBERT
BERT models are trained to perform various tasks. One of the tasks is known as masked language modeling which is the task of predicting tokens in text that have been replaced by a mask value.

The example [`PredictMaskedTokensUsingBERT.m`](./PredictMaskedTokensUsingBERT.m) shows how to predict masked tokens and calculate the token probabilities using a pretrained BERT model.

The example [`PredictMaskedTokensUsingFinBERT.m`](./PredictMaskedTokensUsingFinBERT.m) shows how to predict masked tokens for financial text using and calculate the token probabilities using a pretrained FinBERT model.

### transformer
使用 GPT 总结文本
GPT 等 Transformer 网络可用于总结一段文本。
经过训练的 GPT 转换器可以在给定初始单词序列作为输入的情况下生成文本。
该模型根据各种网页和互联网论坛上留下的评论进行训练。

由于许多这些注释本身包含由语句“TL;DR”（太长，没读）指示的摘要，因此您可以使用转换器模型通过将“TL;DR”附加到输入文本来生成摘要。
该generateSummary函数接受输入文本，自动附加字符串"TL;DR"并生成摘要。

该示例`transformer/SummarizeTextUsingTransformersExample.m`展示了如何使用 GPT 总结成一个交通场景编辑指令（一段文本）。


##  参考
[参考](https://github.com/matlab-deep-learning/transformer-models)