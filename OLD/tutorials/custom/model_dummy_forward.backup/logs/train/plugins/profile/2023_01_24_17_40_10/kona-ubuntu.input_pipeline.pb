	�o'�_�?�o'�_�?!�o'�_�?	h�db+1@h�db+1@!h�db+1@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$�o'�_�?�s)�*��?A�2�,%�?Y|��l;m�?*	��K7y[@2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap()� ��?!���
[YB@)������?1i�"H��@@:Preprocessing2U
Iterator::Model::ParallelMapV2��t��?!�<!v��9@)��t��?1�<!v��9@:Preprocessing2F
Iterator::Model���
�?!��� 5H@)�P�,�?1����^6@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat`���?!��W�'@)G�?1�9b�#@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip��P��9�?!	q~���I@)e�fb�p?1)P����@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice���g�n?!��*<@)���g�n?1��*<@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor7��-_?!1r�<��?)7��-_?11r�<��?:Preprocessing:�
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
�Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
�Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
�Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
�Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)�
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis�
both�Your program is MODERATELY input-bound because 17.2% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.no*moderate2t11.3 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9h�db+1@I�%�f'�T@Zno>Look at Section 3 for the breakdown of input time on the host.B�
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown�
	�s)�*��?�s)�*��?!�s)�*��?      ��!       "      ��!       *      ��!       2	�2�,%�?�2�,%�?!�2�,%�?:      ��!       B      ��!       J	|��l;m�?|��l;m�?!|��l;m�?R      ��!       Z	|��l;m�?|��l;m�?!|��l;m�?b      ��!       JCPU_ONLYYh�db+1@b q�%�f'�T@