	�C�H���?�C�H���?!�C�H���?	��ŌJ@��ŌJ@!��ŌJ@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$�C�H���?
e��k]�?A$bJ$���?Y�)����?*	��Mb�@2U
Iterator::Model::ParallelMapV2j����]�?!FV���G@)j����]�?1FV���G@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap��&7��?!�KO`�E@)��d�<�?1Ѥ��wME@:Preprocessing2F
Iterator::Model�����]�?!t_0l�_J@)���=�?1pI�0>q@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeatz�΅��?!׿ڟ�6@)Է�鲈?1?��Ԧ�@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Ziph	2*�?!��ϓ�G@)*���Ou?1np�PM�?:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice%Ί��>o?!�7!��?)%Ί��>o?1�7!��?:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor���pzg?!aro+[��?)���pzg?1aro+[��?:Preprocessing:�
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
�Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
�Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
�Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
�Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)�
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis�
host�Your program is HIGHLY input-bound because 53.0% of the total step time sampled is waiting for input. Therefore, you should first focus on reducing the input time.no*moderate2s6.5 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9��ŌJ@I)4:s��G@Zno>Look at Section 3 for the breakdown of input time on the host.B�
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown�
	
e��k]�?
e��k]�?!
e��k]�?      ��!       "      ��!       *      ��!       2	$bJ$���?$bJ$���?!$bJ$���?:      ��!       B      ��!       J	�)����?�)����?!�)����?R      ��!       Z	�)����?�)����?!�)����?b      ��!       JCPU_ONLYY��ŌJ@b q)4:s��G@