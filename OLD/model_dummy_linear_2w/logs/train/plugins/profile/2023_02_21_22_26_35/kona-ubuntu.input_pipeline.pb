	c�tv2��?c�tv2��?!c�tv2��?	�vjc<.@�vjc<.@!�vjc<.@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$c�tv2��?�
~b��?A�G�Ȱ��?Yf���8�?*	�O��nZ@2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap
�_�͠?!:�6x?@)`��-ʜ?17�A��:@:Preprocessing2F
Iterator::Modelmo�$�?!�#B�5I@)�FN���?1�� ���9@:Preprocessing2U
Iterator::Model::ParallelMapV2J�i�WV�?!�2'ח�8@)J�i�WV�?1�2'ח�8@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat�	0,�?!I�Ut��,@)�!yv�?1;�$Q��'@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice��b�Ds?!Z��
@)��b�Ds?1Z��
@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip\�v5y�?!�ܽ=�H@)�|	^p?1�q/�P�@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor\Y���"d?!8�Ì �@)\Y���"d?18�Ì �@:Preprocessing:�
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
�Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
�Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
�Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
�Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)�
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis�
both�Your program is MODERATELY input-bound because 15.1% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.no*moderate2s8.5 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9�vjc<.@I.Q��s8U@Zno>Look at Section 3 for the breakdown of input time on the host.B�
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown�
	�
~b��?�
~b��?!�
~b��?      ��!       "      ��!       *      ��!       2	�G�Ȱ��?�G�Ȱ��?!�G�Ȱ��?:      ��!       B      ��!       J	f���8�?f���8�?!f���8�?R      ��!       Z	f���8�?f���8�?!f���8�?b      ��!       JCPU_ONLYY�vjc<.@b q.Q��s8U@