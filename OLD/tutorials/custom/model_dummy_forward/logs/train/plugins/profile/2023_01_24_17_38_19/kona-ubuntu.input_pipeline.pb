	K�����?K�����?!K�����?	X7
t�7@X7
t�7@!X7
t�7@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$K�����?��ʡE��?A.s�,&6�?Y�n�EE��?*	Q��n7c@2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMapC p��s�?!>a��g+@@)���`ũ�?1R ���<@:Preprocessing2U
Iterator::Model::ParallelMapV2��L���?!�V1-74:@)��L���?1�V1-74:@:Preprocessing2F
Iterator::Model��j,a�?!�N��F@)*�n�EE�?1pF� ��1@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat���R�1�?!o̓+�3@)�i���?1y]��$$@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor��}�[��?!e;g�}#@)��}�[��?1e;g�}#@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::ZipE� ��?!T��X	�K@)�B�_�+w?1��qºp@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlicev�A]�Pv?!Vi?HZ@)v�A]�Pv?1Vi?HZ@:Preprocessing:�
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
�Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
�Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
�Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
�Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)�
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis�
host�Your program is HIGHLY input-bound because 23.8% of the total step time sampled is waiting for input. Therefore, you should first focus on reducing the input time.no*moderate2t10.4 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9X7
t�7@I*r�"�
S@Zno>Look at Section 3 for the breakdown of input time on the host.B�
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown�
	��ʡE��?��ʡE��?!��ʡE��?      ��!       "      ��!       *      ��!       2	.s�,&6�?.s�,&6�?!.s�,&6�?:      ��!       B      ��!       J	�n�EE��?�n�EE��?!�n�EE��?R      ��!       Z	�n�EE��?�n�EE��?!�n�EE��?b      ��!       JCPU_ONLYYX7
t�7@b q*r�"�
S@