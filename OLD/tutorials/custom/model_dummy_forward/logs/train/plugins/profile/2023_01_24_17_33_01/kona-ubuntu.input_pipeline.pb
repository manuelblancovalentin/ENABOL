	:;%��?:;%��?!:;%��?	���M'@���M'@!���M'@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$:;%��?$�`S�Q�?A^�)ʥ��?Y��<��?*	��S�kP@2F
Iterator::Model�(�A&�?!�um�kI@)(���?1e�	{��:@:Preprocessing2U
Iterator::Model::ParallelMapV2F�n�1�?!�Q�_T�7@)F�n�1�?1�Q�_T�7@:Preprocessing2w
@Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[10]::Concatenate����Y��?!C]$��;@)��ND�?1�Qgj>7@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat��"��?!7���*],@)Ow�x��?1���|��'@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip�,�뇠?!m��	�H@);ŪAh?1OYGG@:Preprocessing2�
PIterator::Model::ParallelMapV2::Zip[0]::FlatMap[10]::Concatenate[0]::TensorSlice�L/1��g?! &M���@)�L/1��g?1 &M���@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap��=z�}�?!��w�kw>@)�<,Ԛ�]?1Ƴ��r:@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor76;R}�W?!�U�=�@)76;R}�W?1�U�=�@:Preprocessing:�
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
�Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
�Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
�Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
�Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)�
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis�
both�Your program is MODERATELY input-bound because 11.7% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.no*moderate2s7.1 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9���M'@I�=JV@Zno>Look at Section 3 for the breakdown of input time on the host.B�
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown�
	$�`S�Q�?$�`S�Q�?!$�`S�Q�?      ��!       "      ��!       *      ��!       2	^�)ʥ��?^�)ʥ��?!^�)ʥ��?:      ��!       B      ��!       J	��<��?��<��?!��<��?R      ��!       Z	��<��?��<��?!��<��?b      ��!       JCPU_ONLYY���M'@b q�=JV@